Return-Path: <sboyd@codeaurora.org>
Date: Thu, 27 Oct 2016 18:59:55 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [RESEND/PATCH v6 2/3] clk: qcom: Add regmap mux-div clocks
 support
Message-ID: <20161028015955.GH16026@codeaurora.org>
References: <20161019132816.31073-1-georgi.djakov@linaro.org>
 <20161019132816.31073-3-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20161019132816.31073-3-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 10/19, Georgi Djakov wrote:
> diff --git a/drivers/clk/qcom/clk-regmap-mux-div.c b/drivers/clk/qcom/clk-regmap-mux-div.c
> new file mode 100644
> index 000000000000..ec87f496606a
> --- /dev/null
> +++ b/drivers/clk/qcom/clk-regmap-mux-div.c
> @@ -0,0 +1,254 @@
> +/*
> + * Copyright (c) 2015, Linaro Limited
> + * Copyright (c) 2014, The Linux Foundation. All rights reserved.
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/delay.h>
> +#include <linux/export.h>

Are symbols exported. They probably should be for modules.

> +#include <linux/kernel.h>
> +#include <linux/regmap.h>
> +
> +#include "clk-regmap-mux-div.h"
> +
> +#define CMD_RCGR			0x0
> +#define CMD_RCGR_UPDATE			BIT(0)
> +#define CMD_RCGR_DIRTY_CFG		BIT(4)
> +#define CMD_RCGR_ROOT_OFF		BIT(31)
> +#define CFG_RCGR			0x4
> +
> +#define to_clk_regmap_mux_div(_hw) \
> +	container_of(to_clk_regmap(_hw), struct clk_regmap_mux_div, clkr)
> +
> +int __mux_div_set_src_div(struct clk_regmap_mux_div *md, u32 src, u32 div)
> +{
> +	int ret, count;
> +	u32 val, mask;
> +	const char *name = clk_hw_get_name(&md->clkr.hw);
> +
> +	val = (div << md->hid_shift) | (src << md->src_shift);
> +	mask = ((BIT(md->hid_width) - 1) << md->hid_shift) |
> +	       ((BIT(md->src_width) - 1) << md->src_shift);
> +
> +	ret = regmap_update_bits(md->clkr.regmap, CFG_RCGR + md->reg_offset,
> +				 mask, val);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(md->clkr.regmap, CMD_RCGR + md->reg_offset,
> +				 CMD_RCGR_UPDATE, CMD_RCGR_UPDATE);
> +	if (ret)
> +		return ret;
> +
> +	/* Wait for update to take effect */
> +	for (count = 500; count > 0; count--) {
> +		ret = regmap_read(md->clkr.regmap, CMD_RCGR + md->reg_offset,
> +				  &val);
> +		if (ret)
> +			return ret;
> +		if (!(val & CMD_RCGR_UPDATE))
> +			return 0;
> +		udelay(1);
> +	}
> +
> +	pr_err("%s: RCG did not update its configuration", name);
> +	return -EBUSY;
> +}
> +
> +static void __mux_div_get_src_div(struct clk_regmap_mux_div *md, u32 *src,
> +				  u32 *div)
> +{
> +	u32 val, __div, __src;

Perhaps just use d and s.

> +	const char *name = clk_hw_get_name(&md->clkr.hw);
> +
> +	regmap_read(md->clkr.regmap, CMD_RCGR + md->reg_offset, &val);
> +
> +	if (val & CMD_RCGR_DIRTY_CFG) {
> +		pr_err("%s: RCG configuration is pending\n", name);
> +		return;
> +	}
> +
> +	regmap_read(md->clkr.regmap, CFG_RCGR + md->reg_offset, &val);
> +	__src = (val >> md->src_shift);
> +	__src &= BIT(md->src_width) - 1;
> +	*src = __src;
> +
> +	__div = (val >> md->hid_shift);
> +	__div &= BIT(md->hid_width) - 1;
> +	*div = __div;
> +}
> +
> +static unsigned long mux_div_recalc_rate(struct clk_hw *hw, unsigned long prate)
> +{
> +	struct clk_regmap_mux_div *md = to_clk_regmap_mux_div(hw);
> +	u32 div, src;
> +	int i, num_parents = clk_hw_get_num_parents(hw);
> +	const char *name = clk_hw_get_name(hw);
> +
> +	__mux_div_get_src_div(md, &src, &div);
> +	for (i = 0; i < num_parents; i++)
> +		if (src == md->parent_map[i].cfg) {
> +			struct clk_hw *p = clk_hw_get_parent_by_index(hw, i);
> +			unsigned long parent_rate = clk_hw_get_rate(p);
> +
> +			return mult_frac(parent_rate, 2, div + 1);
> +		}
> +
> +	pr_err("%s: Can't find parent %d\n", name, src);
> +	return 0;
> +}
> +
> +static void mux_div_disable(struct clk_hw *hw)
> +{
> +	struct clk_regmap_mux_div *md = to_clk_regmap_mux_div(hw);
> +
> +	__mux_div_set_src_div(md, md->safe_src, md->safe_div);

Ah this is to do magic tricks with cpuidle. In the android tree
they call clk_disable() on the CPU clks from the idle path and
that switches us over to the safe source and turns off the A53
PLL while the CPU is not powered. That's all sort of sneaky and
we're not doing that yet here so let's leave that until later.
Please remove the enable/disable stuff.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

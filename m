Return-Path: <sboyd@codeaurora.org>
Date: Tue, 21 Jul 2015 11:42:31 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: mturquette@linaro.org, linux-clk@vger.kernel.org, shawn.guo@linaro.org,
	jason.liu@linaro.org, wan.zhijun@zte.com.cn
Subject: Re: [PATCH 1/2] clk: zx: Add audio div clock method for zx296702
Message-ID: <20150721184231.GA3738@codeaurora.org>
References: <1436349493-5453-1-git-send-email-jun.nie@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1436349493-5453-1-git-send-email-jun.nie@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 07/08, Jun Nie wrote:
> diff --git a/drivers/clk/zte/clk-pll.c b/drivers/clk/zte/clk-pll.c
> index c3b221a..63f8852 100644
> --- a/drivers/clk/zte/clk-pll.c
> +++ b/drivers/clk/zte/clk-pll.c
> @@ -13,10 +13,12 @@
>  #include <linux/iopoll.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> +#include <asm/div64.h>
>  
>  #include "clk.h"
>  
>  #define to_clk_zx_pll(_hw) container_of(_hw, struct clk_zx_pll, hw)
> +#define to_clk_zx_audio(_hw) container_of(_hw, struct clk_zx_audio, hw)
>  
>  #define CFG0_CFG1_OFFSET 4
>  #define LOCK_FLAG BIT(30)
> @@ -170,3 +172,114 @@ struct clk *clk_register_zx_pll(const char *name, const char *parent_name,
>  
>  	return clk;
>  }
> +
> +#define BPAR 1000000
> +static unsigned long zx_audio_recalc_rate(struct clk_hw *hw,

This doesn't look to be a PLL. So please make a new file or
rename this file to something more generic.

> +		unsigned long parent_rate)
> +{
> +	struct clk_zx_audio *zx_audio = to_clk_zx_audio(hw);
> +	u32 sel, integ, fra_div, tmp;
> +	u64 tmp64 = (u64)parent_rate * BPAR;
> +
> +	tmp = readl_relaxed(zx_audio->reg_base);
> +	sel = (tmp >> 24) & BIT(0);
> +	integ = (tmp >> 16) & 0xff;
> +	fra_div = tmp & 0xff;
> +
> +	tmp = fra_div * BPAR;
> +	tmp = tmp / 0x255;
> +	tmp += sel * BPAR;
> +	tmp += 2 * integ * BPAR;
> +	do_div(tmp64, tmp);
> +
> +	return (u32)tmp64;
> +}
> +
> +static long zx_audio_round_rate(struct clk_hw *hw, unsigned long rate,
> +			      unsigned long *prate)
> +{
> +	return rate;
> +}

This doesn't seem to match the zx_audio_recalc_rate()
implementation. This function needs to tell us what the rate of
the clock is going to be if we call zx_audio_set_rate() with the
same arguments.

> +
> +static int zx_audio_set_rate(struct clk_hw *hw, unsigned long rate,
> +			   unsigned long parent_rate)
> +{
> +	struct clk_zx_audio *zx_audio = to_clk_zx_audio(hw);
> +	u32 sel, integ, fra_div, tmp;
> +	u64 tmp64 = (u64)parent_rate * BPAR;
> +
> +	do_div(tmp64, rate);
> +	integ = (u32)tmp64 / BPAR;
> +
> +	tmp = (u32)tmp64 % BPAR;
> +	tmp = tmp * 2;
> +	sel = tmp / BPAR;
> +
> +	tmp = tmp % BPAR;
> +	fra_div = tmp * 0xff / BPAR;
> +	tmp = (sel << 24) | (integ << 16) | (0xff << 8) | fra_div;
> +
> +	/* Set I2S integer divider as 1. This bit is reserved for SPDIF
> +	 * and do no harm.
> +	 */
> +	tmp |= BIT(28);
> +	writel_relaxed(tmp, zx_audio->reg_base);
> +
> +	return 0;
> +}
[...]
> +
> +static const struct clk_ops zx_audio_ops = {
> +	.recalc_rate = zx_audio_recalc_rate,
> +	.round_rate = zx_audio_round_rate,
> +	.set_rate = zx_audio_set_rate,
> +	.enable = zx_audio_enable,
> +	.disable = zx_audio_disable,
> +};
> +
> +struct clk *clk_register_zx_audio(const char *name, const char *parent_name,

Can this be const char * const parent_name?

> +	unsigned long flags, void __iomem *reg_base)
> +{
> +	struct clk_zx_audio *zx_audio;
> +	struct clk *clk;
> +	struct clk_init_data init;
> +
> +	zx_audio = kzalloc(sizeof(*zx_audio), GFP_KERNEL);
> +	if (!zx_audio)
> +		return ERR_PTR(-ENOMEM);
> +
> +	init.name = name;
> +	init.ops = &zx_audio_ops;
> +	init.flags = flags;
> +	init.parent_names = parent_name ? &parent_name : NULL;
> +	init.num_parents = parent_name ? 1 : 0;
> +
> +	zx_audio->reg_base = reg_base;
> +	zx_audio->hw.init = &init;
> +
> +	clk = clk_register(NULL, &zx_audio->hw);
> +

Nitpick: Remove this newline

> +	if (IS_ERR(clk))
> +		kfree(zx_audio);
> +
> +	return clk;
> +}

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

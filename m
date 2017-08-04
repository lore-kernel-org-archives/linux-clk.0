Return-Path: <sboyd@codeaurora.org>
Date: Thu, 3 Aug 2017 18:53:51 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] ARC: clk: introduce HSDKv1 pll driver
Message-ID: <20170804015351.GW2146@codeaurora.org>
References: <20170714153128.8945-1-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170714153128.8945-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/14, Eugeniy Paltsev wrote:
> HSDKv1 boards manages it's clocks using various PLLs. These PLL has same

s/it's/its/

s/has/have/

> dividers and corresponding control registers mapped to different addresses.
> So we add one common driver for such PLLs.
> 
> Each PLL on HSDK board consist of three dividers: IDIV, FBDIV and
> ODIV. Output clock value is managed using these dividers.
> 
> We add pre-defined tables with supported rate values and appropriate
> configurations of IDIV, FBDIV and ODIV for each value.
> 
> As of today we add support for PLLs that generate clock for the
> HSDKv1 arc cpus, system, ddr, AXI tunnel and hdmi.
> 
> By this patch we add support for several plls (arc cpus pll and others),
> so we had to use two different init types: CLK_OF_DECLARE for arc cpus pll
> and regular probing for others plls.

Ok. This should be put into comment form above the
CLK_OF_DECLARE() macro in the driver. Like "CPU PLL needed early
for XYZ thing that is used early".

> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 68ca2d9..198fc14 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -219,6 +219,13 @@ config COMMON_CLK_VC5
>  	  This driver supports the IDT VersaClock5 programmable clock
>  	  generator.
>  
> +config CLK_HSDK_V1
> +	bool "PLL Driver for HSDKv1 platform"
> +	depends on OF || COMPILE_TEST
> +	---help---
> +	  This driver supports the HSDKv1 core, system, ddr, tunnel and hdmi PLLs
> +	  control.
> +

Are we keeping this file sorted? Not really, but please put this
somewhere semi-sorted instead of at the end of the file. I'll go
and sort this Kconfig file later.

> diff --git a/drivers/clk/clk-hsdk-pll.c b/drivers/clk/clk-hsdk-pll.c
> new file mode 100644
> index 0000000..4e58e55
> --- /dev/null
> +++ b/drivers/clk/clk-hsdk-pll.c
> @@ -0,0 +1,346 @@
> +/*
> + * Synopsys HSDKv1 SDP Generic PLL clock driver
> + *
> + * Copyright (C) 2017 Synopsys
> + *
> + * This file is licensed under the terms of the GNU General Public
> + * License version 2. This program is licensed "as is" without any
> + * warranty of any kind, whether express or implied.
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/module.h>

No need for this include.

> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/device.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/slab.h>
> +#include <linux/of.h>
> +
> +#define CGU_PLL_CTRL	0x000 /* ARC PLL control register */
> +#define CGU_PLL_STATUS	0x004 /* ARC PLL status register */
> +#define CGU_PLL_FMEAS	0x008 /* ARC PLL frequency measurement register */
> +#define CGU_PLL_MON	0x00C /* ARC PLL monitor register */
> +
> +#define CGU_PLL_CTRL_ODIV_SHIFT		2
> +#define CGU_PLL_CTRL_IDIV_SHIFT		4
> +#define CGU_PLL_CTRL_FBDIV_SHIFT	9
> +#define CGU_PLL_CTRL_BAND_SHIFT		20
> +
> +#define CGU_PLL_CTRL_ODIV_MASK		GENMASK(3, CGU_PLL_CTRL_ODIV_SHIFT)
> +#define CGU_PLL_CTRL_IDIV_MASK		GENMASK(8, CGU_PLL_CTRL_IDIV_SHIFT)
> +#define CGU_PLL_CTRL_FBDIV_MASK		GENMASK(15, CGU_PLL_CTRL_FBDIV_SHIFT)
> +
> +#define CGU_PLL_CTRL_PD			BIT(0)
> +#define CGU_PLL_CTRL_BYPASS		BIT(1)
> +
> +#define CGU_PLL_STATUS_LOCK		BIT(0)
> +#define CGU_PLL_STATUS_ERR		BIT(1)
> +
> +#define HSDK_PLL_MAX_LOCK_TIME		100 /* 100 us */
> +
> +struct hsdk_pll_cfg {
> +	u32 rate;
> +	u32 idiv;
> +	u32 fbdiv;
> +	u32 odiv;
> +	u32 band;
> +};
> +
> +static const struct hsdk_pll_cfg asdt_pll_cfg[] = {
> +	{ 100000000,  0, 11, 3, 0 },
> +	{ 133000000,  0, 15, 3, 0 },
> +	{ 200000000,  1, 47, 3, 0 },
> +	{ 233000000,  1, 27, 2, 0 },
> +	{ 300000000,  1, 35, 2, 0 },
> +	{ 333000000,  1, 39, 2, 0 },
> +	{ 400000000,  1, 47, 2, 0 },
> +	{ 500000000,  0, 14, 1, 0 },
> +	{ 600000000,  0, 17, 1, 0 },
> +	{ 700000000,  0, 20, 1, 0 },
> +	{ 800000000,  0, 23, 1, 0 },
> +	{ 900000000,  1, 26, 0, 0 },
> +	{ 1000000000, 1, 29, 0, 0 },
> +	{ 1100000000, 1, 32, 0, 0 },
> +	{ 1200000000, 1, 35, 0, 0 },
> +	{ 1300000000, 1, 38, 0, 0 },
> +	{ 1400000000, 1, 41, 0, 0 },
> +	{ 1500000000, 1, 44, 0, 0 },
> +	{ 1600000000, 1, 47, 0, 0 },
> +	{}
> +};
> +
> +static const struct hsdk_pll_cfg hdmi_pll_cfg[] = {
> +	{ 297000000,  0, 21, 2, 0 },
> +	{ 540000000,  0, 19, 1, 0 },
> +	{ 594000000,  0, 21, 1, 0 },
> +	{}
> +};
> +
> +struct hsdk_pll_clk {
> +	struct clk_hw hw;
> +	void __iomem *regs;
> +	const struct hsdk_pll_cfg *pll_cfg;
> +	struct device *dev;
> +};
> +
> +static inline void hsdk_pll_write(struct hsdk_pll_clk *clk, u32 reg, u32 val)
> +{
> +	iowrite32(val, clk->regs + reg);
> +}
> +
> +static inline u32 hsdk_pll_read(struct hsdk_pll_clk *clk, u32 reg)
> +{
> +	return ioread32(clk->regs + reg);
> +}
> +
> +static inline void hsdk_pll_set_cfg(struct hsdk_pll_clk *clk,
> +				    const struct hsdk_pll_cfg *cfg)
> +{
> +	u32 val = 0;
> +
> +	/* Powerdown and Bypass bits should be cleared */
> +	val |= cfg->idiv << CGU_PLL_CTRL_IDIV_SHIFT;
> +	val |= cfg->fbdiv << CGU_PLL_CTRL_FBDIV_SHIFT;
> +	val |= cfg->odiv << CGU_PLL_CTRL_ODIV_SHIFT;
> +	val |= cfg->band << CGU_PLL_CTRL_BAND_SHIFT;
> +
> +	dev_dbg(clk->dev, "write configurarion: 0x%x", val);

Or just use %#x to add the 0x part.

> +
> +	hsdk_pll_write(clk, CGU_PLL_CTRL, val);
> +}
> +
> +static inline bool hsdk_pll_is_locked(struct hsdk_pll_clk *clk)
> +{
> +	u32 val;
> +
> +	val = hsdk_pll_read(clk, CGU_PLL_STATUS);
> +
> +	return (val & CGU_PLL_STATUS_LOCK) == CGU_PLL_STATUS_LOCK;
> +}
> +
> +static inline bool hsdk_pll_is_err(struct hsdk_pll_clk *clk)
> +{
> +	u32 val;
> +
> +	val = ;
> +
> +	return (val & CGU_PLL_STATUS_ERR) == CGU_PLL_STATUS_ERR;

Above two could be simplified to one line functions?

	return hsdk_pll_read(clk, CGU_PLL_STATUS) & CGU_PLL_STATUS_ERR;

> +}
> +
> +static inline struct hsdk_pll_clk *to_hsdk_pll_clk(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct hsdk_pll_clk, hw);
> +}
> +
> +static unsigned long hsdk_pll_recalc_rate(struct clk_hw *hw,
> +					  unsigned long parent_rate)
> +{
> +	u32 val;
> +	u64 rate;
> +	u32 idiv, fbdiv, odiv;
> +	struct hsdk_pll_clk *clk = to_hsdk_pll_clk(hw);
> +
> +	val = hsdk_pll_read(clk, CGU_PLL_CTRL);
> +
> +	dev_dbg(clk->dev, "current configurarion: 0x%x", val);
> +
> +	/* Check if PLL is disabled */
> +	if ((val & CGU_PLL_CTRL_PD) == CGU_PLL_CTRL_PD)
> +		return 0;
> +
> +	/* Check if PLL is bypassed */
> +	if ((val & CGU_PLL_CTRL_BYPASS) == CGU_PLL_CTRL_BYPASS)

These are single bits. Do we really need to check for anything
besides the and operation returning a non-zero value?

> +		return parent_rate;
> +
> +	/* input devider = reg.idiv + 1 */

s/devider/divider/

Maybe just drop these comments. They're just repeating the code.

> +	idiv = 1 + ((val & CGU_PLL_CTRL_IDIV_MASK) >> CGU_PLL_CTRL_IDIV_SHIFT);
> +	/* fb devider = 2*(reg.fbdiv + 1) */

s/devider/divider/

> +	fbdiv = 2 * (1 + ((val & CGU_PLL_CTRL_FBDIV_MASK) >> CGU_PLL_CTRL_FBDIV_SHIFT));
> +	/* output devider = 2^(reg.odiv) */
> +	odiv = 1 << ((val & CGU_PLL_CTRL_ODIV_MASK) >> CGU_PLL_CTRL_ODIV_SHIFT);
> +
> +	rate = (u64)parent_rate * fbdiv;
> +	do_div(rate, idiv * odiv);
> +
> +	return rate;
> +}
> +
> +static long hsdk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> +				unsigned long *prate)
> +{
> +	int i;
> +	long best_rate;
> +	struct hsdk_pll_clk *clk = to_hsdk_pll_clk(hw);
> +	const struct hsdk_pll_cfg *pll_cfg = clk->pll_cfg;
> +
> +	if (pll_cfg[0].rate == 0)
> +		return -EINVAL;

This happens?

> +
> +	best_rate = pll_cfg[0].rate;
> +
> +	for (i = 1; pll_cfg[i].rate != 0; i++) {
> +		if (abs(rate - pll_cfg[i].rate) < abs(rate - best_rate))

Alright, rate is unsigned long, and best_rate is long. abs() does
the right thing here, but it makes me have to think twice if
best_rate can be negative and then this is a larger number, not a
smaller one. Can we make best_rate unsigned long in this
function?

> +			best_rate = pll_cfg[i].rate;
> +	}
> +
> +	dev_dbg(clk->dev, "chosen best rate: %lu", best_rate);
> +
> +	return best_rate;
> +}
[...]
> +
> +static void __init of_hsdk_pll_clk_setup(struct device_node *node)
> +{
> +	const char *parent_name;
> +	struct hsdk_pll_clk *pll_clk;
> +	struct clk_init_data init = { };
> +	int ret;
> +
> +	pll_clk = kzalloc(sizeof(*pll_clk), GFP_KERNEL);
> +	if (!pll_clk)
> +		return;
> +
> +	pll_clk->regs = of_iomap(node, 0);
> +	if (!pll_clk->regs) {
> +		pr_err("failed to map pll registers\n");
> +		goto err_free_pll_clk;
> +	}
> +
> +	init.name = node->name;
> +	init.ops = &hsdk_pll_ops;
> +	parent_name = of_clk_get_parent_name(node, 0);
> +	init.parent_names = &parent_name;
> +	init.num_parents = parent_name ? 1 : 0;

of_clk_parent_fill(node, &init.parent_names, 1)?

> +	pll_clk->hw.init = &init;
> +	pll_clk->pll_cfg = asdt_pll_cfg;
> +
> +	ret = clk_hw_register(NULL, &pll_clk->hw);
> +	if (ret) {
> +		pr_err("failed to register %s clock\n", node->name);
> +		goto err_unmap_regs;
> +	}
> +
> +	ret = of_clk_add_hw_provider(node, of_clk_hw_simple_get, &pll_clk->hw);
> +	if (ret) {
> +		pr_err("failed to add hw provider for %s clock\n", node->name);
> +		goto err_unmap_regs;
> +	}
> +
> +	return;
> +
> +err_unmap_regs:
> +	iounmap(pll_clk->regs);
> +err_free_pll_clk:
> +	kfree(pll_clk);
> +}

Can you add a comment why this can't be probed via driver paths
here?

> +CLK_OF_DECLARE(hsdk_pll_clock, "snps,hsdk-core-pll-clock",
> +of_hsdk_pll_clk_setup);
> +
> +static const struct of_device_id hsdk_pll_clk_id[] = {
> +	{ .compatible = "snps,hsdk-gp-pll-clock", .data = &asdt_pll_cfg},
> +	{ .compatible = "snps,hsdk-hdmi-pll-clock", .data = &hdmi_pll_cfg},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, hsdk_pll_clk_id);
> +
> +static struct platform_driver hsdk_pll_clk_driver = {
> +	.driver = {
> +		.name = "hsdk-gp-pll-clock",
> +		.of_match_table = hsdk_pll_clk_id,
> +	},
> +	.probe = hsdk_pll_clk_probe,
> +	.remove = hsdk_pll_clk_remove,
> +};
> +builtin_platform_driver(hsdk_pll_clk_driver);
> +
> +MODULE_AUTHOR("Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>");
> +MODULE_DESCRIPTION("Synopsys HSDKv1 SDP Generic PLL Clock Driver");
> +MODULE_LICENSE("GPL v2");

These three lines should be removed, or Paul G. will find them
and delete them because the driver is never a module. Same goes
for the MODULE_DEVICE_TABLE line.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

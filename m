Return-Path: <sboyd@codeaurora.org>
Date: Fri, 2 Jun 2017 10:42:14 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v3] clk/axs10x: introduce AXS10X pll driver
Message-ID: <20170602174214.GJ20170@codeaurora.org>
References: <1492775151-20059-1-git-send-email-vzakhar@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1492775151-20059-1-git-send-email-vzakhar@synopsys.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/21, Vlad Zakharov wrote:
> diff --git a/drivers/clk/axs10x/pll_clock.c b/drivers/clk/axs10x/pll_clock.c
> new file mode 100644
> index 0000000..e242df0
> --- /dev/null
> +++ b/drivers/clk/axs10x/pll_clock.c
> @@ -0,0 +1,334 @@
> +/*
> + * Synopsys AXS10X SDP Generic PLL clock driver
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
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/device.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/slab.h>
> +#include <linux/of.h>
> +
> +/* PLL registers addresses */
> +#define PLL_REG_IDIV	0x0
> +#define PLL_REG_FBDIV	0x4
> +#define PLL_REG_ODIV	0x8
> +
> +/*
> + * Bit fields of the PLL IDIV/FBDIV/ODIV registers:
> + *  ________________________________________________________________________
> + * |31                15|    14    |   13   |  12  |11         6|5         0|
> + * |-------RESRVED------|-NOUPDATE-|-BYPASS-|-EDGE-|--HIGHTIME--|--LOWTIME--|
> + * |____________________|__________|________|______|____________|___________|
> + *
> + * Following macros determine the way of access to these registers
> + * They should be set up only using the macros.
> + * reg should be an u32 variable.
> + */
> +
> +#define PLL_REG_GET_LOW(reg)			\
> +	(((reg) & (0x3F << 0)) >> 0)
> +#define PLL_REG_GET_HIGH(reg)			\
> +	(((reg) & (0x3F << 6)) >> 6)
> +#define PLL_REG_GET_EDGE(reg)			\
> +	(((reg) & (BIT(12))) ? 1 : 0)
> +#define PLL_REG_GET_BYPASS(reg)			\
> +	(((reg) & (BIT(13))) ? 1 : 0)
> +#define PLL_REG_GET_NOUPD(reg)			\
> +	(((reg) & (BIT(14))) ? 1 : 0)
> +#define PLL_REG_GET_PAD(reg)			\
> +	(((reg) & (0x1FFFF << 15)) >> 15)
> +
> +#define PLL_REG_SET_LOW(reg, value)		\
> +	{ reg |= (((value) & 0x3F) << 0); }
> +#define PLL_REG_SET_HIGH(reg, value)		\
> +	{ reg |= (((value) & 0x3F) << 6); }
> +#define PLL_REG_SET_EDGE(reg, value)		\
> +	{ reg |= (((value) & 0x01) << 12); }
> +#define PLL_REG_SET_BYPASS(reg, value)		\
> +	{ reg |= (((value) & 0x01) << 13); }
> +#define PLL_REG_SET_NOUPD(reg, value)		\
> +	{ reg |= (((value) & 0x01) << 14); }
> +#define PLL_REG_SET_PAD(reg, value)		\
> +	{ reg |= (((value) & 0x1FFFF) << 15); }
> +
> +#define PLL_LOCK	BIT(0)
> +#define PLL_ERROR	BIT(1)
> +#define PLL_MAX_LOCK_TIME 100 /* 100 us */
> +
> +struct pll_cfg {
> +	u32 rate;
> +	u32 idiv;
> +	u32 fbdiv;
> +	u32 odiv;
> +};
> +
> +static const struct pll_cfg arc_pll_cfg[] = {
> +	{ 33333333,  1, 1,  1 },
> +	{ 50000000,  1, 30, 20 },
> +	{ 75000000,  2, 45, 10 },
> +	{ 90000000,  2, 54, 10 },
> +	{ 100000000, 1, 30, 10 },
> +	{ 125000000, 2, 45, 6 },
> +	{},

Style nitpick, please leave off trailing commas on array
terminators so that we can't put more lines after them.

> +};
> +
> +static const struct pll_cfg pgu_pll_cfg[] = {
> +	{ 25200000, 1, 84, 90 },
> +	{ 50000000, 1, 100, 54 },
> +	{ 74250000, 1, 44, 16 },
> +	{},
> +};
> +
> +struct pll_clk {
> +	struct clk_hw hw;
> +	void __iomem *base;
> +	void __iomem *lock;
> +	const struct pll_cfg *pll_cfg;
> +	struct device *dev;
> +};
> +
> +static inline void pll_write(struct pll_clk *clk, unsigned int reg,
> +		unsigned int val)
> +{
> +	iowrite32(val, clk->base + reg);
> +}
> +
> +static inline u32 pll_read(struct pll_clk *clk, unsigned int reg)

axs10x_pll_read()?

> +{
> +	return ioread32(clk->base + reg);
> +}
> +
> +static inline struct pll_clk *to_pll_clk(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct pll_clk, hw);
> +}
> +
> +static inline u32 div_get_value(unsigned int reg)
> +{
> +	if (PLL_REG_GET_BYPASS(reg))
> +		return 1;
> +
> +	return PLL_REG_GET_HIGH(reg) + PLL_REG_GET_LOW(reg);
> +}
> +
> +static inline u32 encode_div(unsigned int id, int upd)
> +{
> +	u32 div = 0;
> +
> +	PLL_REG_SET_LOW(div, (id%2 == 0) ? id >> 1 : (id >> 1) + 1);

Please add space around id % 2.

> +	PLL_REG_SET_HIGH(div, id >> 1);
> +	PLL_REG_SET_EDGE(div, id%2);

ditto.

> +	PLL_REG_SET_BYPASS(div, id == 1 ? 1 : 0);
> +	PLL_REG_SET_NOUPD(div, !upd);
> +
> +	return div;
> +}
> +
> +static unsigned long pll_recalc_rate(struct clk_hw *hw,
> +		unsigned long parent_rate)
> +{
> +	u64 rate;
> +	u32 idiv, fbdiv, odiv;
> +	struct pll_clk *clk = to_pll_clk(hw);
> +
> +	idiv = div_get_value(pll_read(clk, PLL_REG_IDIV));
> +	fbdiv = div_get_value(pll_read(clk, PLL_REG_FBDIV));
> +	odiv = div_get_value(pll_read(clk, PLL_REG_ODIV));
> +
> +	rate = (u64)parent_rate * fbdiv;
> +	do_div(rate, idiv * odiv);
> +
> +	return rate;
> +}
> +
> +static long pll_round_rate(struct clk_hw *hw, unsigned long rate,
> +		unsigned long *prate)
> +{
> +	int i;
> +	long best_rate;
> +	struct pll_clk *clk = to_pll_clk(hw);
> +	const struct pll_cfg *pll_cfg = clk->pll_cfg;
> +
> +	if (pll_cfg[0].rate == 0)
> +		return -EINVAL;
> +
> +	best_rate = pll_cfg[0].rate;
> +
> +	for (i = 1; pll_cfg[i].rate != 0; i++) {
> +		if (abs(rate - pll_cfg[i].rate) < abs(rate - best_rate))
> +			best_rate = pll_cfg[i].rate;
> +	}

Nitpick: Drop braces on this for loop please.

> +
> +	return best_rate;
> +}
> +
> +static int pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +		unsigned long parent_rate)
> +{
> +	int i;
> +	struct pll_clk *clk = to_pll_clk(hw);
> +	const struct pll_cfg *pll_cfg = clk->pll_cfg;
> +
> +	for (i = 0; pll_cfg[i].rate != 0; i++) {
> +		if (pll_cfg[i].rate == rate) {
> +			pll_write(clk, PLL_REG_IDIV,
> +					encode_div(pll_cfg[i].idiv, 0));
> +			pll_write(clk, PLL_REG_FBDIV,
> +					encode_div(pll_cfg[i].fbdiv, 0));
> +			pll_write(clk, PLL_REG_ODIV,
> +					encode_div(pll_cfg[i].odiv, 1));

The next line should line up with the open parenthesis on the
previous line.

> +
> +			/*
> +			 * Wait until CGU relocks and check error status.
> +			 * If after timeout CGU is unlocked yet return error
> +			 */
> +			udelay(PLL_MAX_LOCK_TIME);
> +			if (!(ioread32(clk->lock) & PLL_LOCK))
> +				return -ETIMEDOUT;
> +
> +			if (ioread32(clk->lock) & PLL_ERROR)
> +				return -EINVAL;
> +
> +			return 0;
> +		}
> +	}
> +
> +	dev_err(clk->dev, "invalid rate=%ld, parent_rate=%ld\n", rate,
> +			parent_rate);
> +	return -EINVAL;
> +}
> +
> +static const struct clk_ops pll_ops = {
> +	.recalc_rate = pll_recalc_rate,
> +	.round_rate = pll_round_rate,
> +	.set_rate = pll_set_rate,
> +};
> +
> +static int pll_clk_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	const char *parent_name;
> +	struct pll_clk *pll_clk;
> +	struct resource *mem;
> +	struct clk_init_data init = { };
> +	int ret;
> +
> +	pll_clk = devm_kzalloc(dev, sizeof(*pll_clk), GFP_KERNEL);
> +	if (!pll_clk)
> +		return -ENOMEM;
> +
> +	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	pll_clk->base = devm_ioremap_resource(dev, mem);
> +	if (IS_ERR(pll_clk->base))
> +		return PTR_ERR(pll_clk->base);
> +
> +	mem = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +	pll_clk->lock = devm_ioremap_resource(dev, mem);
> +	if (IS_ERR(pll_clk->lock))
> +		return PTR_ERR(pll_clk->base);

return PTR_ERR(pll_clk->lock)?

> +
> +	init.name = dev->of_node->name;
> +	init.ops = &pll_ops;
> +	parent_name = of_clk_get_parent_name(dev->of_node, 0);
> +	init.parent_names = &parent_name;
> +	init.num_parents = 1;
> +	pll_clk->hw.init = &init;
> +	pll_clk->dev = dev;
> +	pll_clk->pll_cfg = of_device_get_match_data(dev);
> +
> +	if (!pll_clk->pll_cfg) {
> +		dev_err(dev, "No OF match data provided\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = devm_clk_hw_register(dev, &pll_clk->hw);
> +	if (ret) {
> +		dev_err(dev, "failed to register %s clock\n", init.name);
> +		return ret;
> +	}
> +
> +	return of_clk_add_hw_provider(dev->of_node, of_clk_hw_simple_get,
> +			&pll_clk->hw);
> +}
> +
> +static int pll_clk_remove(struct platform_device *pdev)
> +{
> +	of_clk_del_provider(pdev->dev.of_node);
> +	return 0;
> +}
> +
> +static void __init of_pll_clk_setup(struct device_node *node)
> +{
> +	const char *parent_name;
> +	struct pll_clk *pll_clk;
> +	struct clk_init_data init = { };
> +	int ret;
> +
> +	pll_clk = kzalloc(sizeof(*pll_clk), GFP_KERNEL);
> +	if (!pll_clk)
> +		return;
> +
> +	pll_clk->base = of_iomap(node, 0);
> +	if (!pll_clk->base) {
> +		pr_err("failed to map pll div registers\n");
> +		iounmap(pll_clk->base);

Remove?

> +		return;
> +	}
> +
> +	pll_clk->lock = of_iomap(node, 1);
> +	if (!pll_clk->lock) {
> +		pr_err("failed to map pll lock register\n");
> +		iounmap(pll_clk->lock);

iounmap(pll_clk->base) instead?

> +		return;
> +	}
> +
> +	init.name = node->name;
> +	init.ops = &pll_ops;
> +	parent_name = of_clk_get_parent_name(node, 0);
> +	init.parent_names = &parent_name;
> +	init.num_parents = parent_name ? 1 : 0;
> +	pll_clk->hw.init = &init;
> +	pll_clk->pll_cfg = arc_pll_cfg;
> +
> +	ret = clk_hw_register(NULL, &pll_clk->hw);
> +	if (ret) {
> +		pr_err("failed to register %s clock\n", node->name);
> +		kfree(pll_clk);

Missed iounmaps here.

> +		return;
> +	}
> +
> +	of_clk_add_hw_provider(node, of_clk_hw_simple_get, &pll_clk->hw);

Check return value of this function?

> +}
> +

Nitpick: Please put the CLK_OF_DECLARE() directly below the
closing brace of the function.

> +CLK_OF_DECLARE(axs10x_pll_clock, "snps,axs10x-arc-pll-clock", of_pll_clk_setup);

Do we need to use CLK_OF_DECLARE and platform driver? Why can't
we just use the platform driver? Please add a comment to this
effect above this function so we know why we have both.

> +
> +static const struct of_device_id pll_clk_id[] = {
> +	{ .compatible = "snps,axs10x-pgu-pll-clock", .data = &pgu_pll_cfg},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, pll_clk_id);
> +
> +static struct platform_driver pll_clk_driver = {

Please name it something like axs10x_pll_clk_driver and prepend
axs10x_ before most of the pll structure and functions in this
file. pll is too generic and tagging source code exploration
tools will suffer if everything that's a pll has the same name.

> +	.driver = {
> +		.name = "axs10x-pll-clock",
> +		.of_match_table = pll_clk_id,
> +	},
> +	.probe = pll_clk_probe,
> +	.remove = pll_clk_remove,
> +};
> +builtin_platform_driver(pll_clk_driver);
> +

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

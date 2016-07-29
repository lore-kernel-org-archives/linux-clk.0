Return-Path: <ray.jui@broadcom.com>
Return-Path: <ray.jui@broadcom.com>
Subject: Re: [PATCH] clk: bcm: Add driver for Northstar ILP clock
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
References: <1469797120-29298-1-git-send-email-zajec5@gmail.com>
Cc: linux-clk@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Jon Mason <jonmason@broadcom.com>, Eric Anholt <eric@anholt.net>,
 Stephen Warren <swarren@wwwdotorg.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
From: Ray Jui <ray.jui@broadcom.com>
Message-ID: <de0ba9d2-8b2b-b1e8-9235-1b402f0ffec0@broadcom.com>
Date: Fri, 29 Jul 2016 13:44:13 -0700
MIME-Version: 1.0
In-Reply-To: <1469797120-29298-1-git-send-email-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Rafal,

On 7/29/2016 5:58 AM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
>
> This clock is present on cheaper Northstar devices like BCM53573 or
> BCM47189 using Corex-A7. This driver uses PMU (Power Management Unit)
> to calculate clock rate and allows using it in a generic (clk_*) way.
>

I thought Northstar uses Cortex A9 instead of A7?

> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../devicetree/bindings/clock/brcm,ns-ilp.txt      |  28 ++++
>  drivers/clk/bcm/Makefile                           |   1 +
>  drivers/clk/bcm/clk-ns-ilp.c                       | 146 +++++++++++++++++++++
>  3 files changed, 175 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt
>  create mode 100644 drivers/clk/bcm/clk-ns-ilp.c
>
> diff --git a/Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt b/Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt
> new file mode 100644
> index 0000000..c4df38e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/brcm,ns-ilp.txt
> @@ -0,0 +1,28 @@
> +Broadcom Northstar ILP clock
> +============================
> +
> +This binding uses the common clock binding:
> +    Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +This binding is used for ILP clock on Broadcom Northstar devices using
> +Corex-A7 CPU. ILP clock depends on ALP one and has to be calculated on
> +runtime.
> +

Cortex-A9.

> +Required properties:
> +- compatible: "brcm,ns-ilp"
> +- reg: iomem address range of PMU (Power Management Unit)
> +- reg-names: "pmu", the only needed & supported reg right now
> +- clocks: should reference an ALP clock
> +- clock-names: "alp", the only needed & supported clock right now

clock-names must be "alp-clk"

> +- #clock-cells: should be <0>
> +
> +Example:
> +
> +ilp: ilp {
> +	compatible = "brcm,ns-ilp";
> +	reg = <0x18012000 0x1000>;
> +	reg-names = "pmu";
> +	clocks = <&alp>;
> +	clock-names = "alp-clk";
> +	#clock-cells = <0>;
> +};
> diff --git a/drivers/clk/bcm/Makefile b/drivers/clk/bcm/Makefile
> index 1d79bd2..1389379 100644
> --- a/drivers/clk/bcm/Makefile
> +++ b/drivers/clk/bcm/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_COMMON_CLK_IPROC)	+= clk-ns2.o
>  obj-$(CONFIG_ARCH_BCM_CYGNUS)	+= clk-cygnus.o
>  obj-$(CONFIG_ARCH_BCM_NSP)	+= clk-nsp.o
>  obj-$(CONFIG_ARCH_BCM_5301X)	+= clk-nsp.o
> +obj-$(CONFIG_ARCH_BCM_5301X)	+= clk-ns-ilp.o
> diff --git a/drivers/clk/bcm/clk-ns-ilp.c b/drivers/clk/bcm/clk-ns-ilp.c
> new file mode 100644
> index 0000000..230458e8
> --- /dev/null
> +++ b/drivers/clk/bcm/clk-ns-ilp.c
> @@ -0,0 +1,146 @@
> +/*
> + * Copyright (C) 2016 Rafał Miłecki <rafal@milecki.pl>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/slab.h>
> +
> +#define PMU_XTAL_FREQ_RATIO			0x66c
> +#define  XTAL_ALP_PER_4ILP			0x00001fff
> +#define  XTAL_CTL_EN				0x80000000
> +#define PMU_SLOW_CLK_PERIOD			0x6dc
> +
> +struct ns_ilp {
> +	struct clk *clk;
> +	struct clk_hw hw;
> +	struct clk *alp_clk;
> +	void __iomem *pmu;
> +};
> +
> +static int ns_ilp_enable(struct clk_hw *hw)
> +{
> +	struct ns_ilp *ilp = container_of(hw, struct ns_ilp, hw);
> +
> +	writel(0x10199, ilp->pmu + PMU_SLOW_CLK_PERIOD);
> +	writel(0x10000, ilp->pmu + 0x674);
> +
> +	return 0;
> +}
> +
> +static unsigned long ns_ilp_recalc_rate(struct clk_hw *hw,
> +					unsigned long parent_rate)
> +{
> +	struct ns_ilp *ilp = container_of(hw, struct ns_ilp, hw);
> +	void __iomem *pmu = ilp->pmu;
> +	u32 last_val, cur_val;
> +	u32 sum = 0, num = 0, loop_num = 0;
> +	u32 avg;
> +	int err;
> +
> +	err = clk_prepare_enable(ilp->alp_clk);
> +	if (err)
> +		return 0;
> +
> +	/* Enable */
> +	writel(XTAL_CTL_EN, pmu + PMU_XTAL_FREQ_RATIO);
> +
> +	/* Read initial value */
> +	last_val = readl(pmu + PMU_XTAL_FREQ_RATIO) & XTAL_ALP_PER_4ILP;
> +
> +	/* Try getting 20 different values for calculating average */
> +	while (num < 20) {
> +		cur_val = readl(pmu + PMU_XTAL_FREQ_RATIO) & XTAL_ALP_PER_4ILP;
> +
> +		if (cur_val != last_val) {
> +			/* Got different value, use it */
> +			sum += cur_val;
> +			num++;
> +			loop_num = 0;
> +			last_val = cur_val;
> +		} else if (++loop_num > 5000) {
> +			/* Same value over and over, give up */
> +			sum += cur_val;
> +			num++;
> +			break;
> +		}
> +	}
> +
> +	/* Disable */
> +	writel(0x0, pmu + PMU_XTAL_FREQ_RATIO);
> +
> +	avg = sum / num;
> +
> +	return clk_get_rate(ilp->alp_clk) * 4 / avg;
> +}
> +
> +const struct clk_ops ns_ilp_clk_ops = {

static

> +	.enable = ns_ilp_enable,
> +	.recalc_rate = ns_ilp_recalc_rate,
> +};
> +
> +static void ns_ilp_init(struct device_node *np)
> +{
> +	struct ns_ilp *ilp;
> +	struct resource res;
> +	struct clk_init_data init = { 0 };
> +	int index;
> +	int err;
> +
> +	ilp = kzalloc(sizeof(*ilp), GFP_KERNEL);
> +	if (!ilp)
> +		return;
> +
> +	index = of_property_match_string(np, "reg-names", "pmu");
> +	if (index < 0) {
> +		err = index;
> +		goto err_free_ilp;
> +	}
> +	err = of_address_to_resource(np, index, &res);
> +	if (err) {
> +		err = index;
> +		goto err_free_ilp;
> +	}
> +	ilp->pmu = ioremap_nocache(res.start, resource_size(&res));
> +	if (IS_ERR(ilp->pmu)) {
> +		err = PTR_ERR(ilp->pmu);
> +		goto err_free_ilp;
> +	}
> +
> +	ilp->alp_clk = of_clk_get_by_name(np, "alp-clk");
> +	if (IS_ERR(ilp->alp_clk)) {
> +		err = PTR_ERR(ilp->alp_clk);
> +		goto err_unmap_pmu;
> +	}
> +
> +	init.name = np->name;
> +	init.ops = &ns_ilp_clk_ops;
> +	init.flags = CLK_IS_ROOT;
> +
> +	ilp->hw.init = &init;
> +	ilp->clk = clk_register(NULL, &ilp->hw);
> +	if (WARN_ON(IS_ERR(ilp->clk)))
> +		goto err_put_alp_clk;
> +
> +	of_clk_add_provider(np, of_clk_src_simple_get, ilp->clk);

Check return value and handle error conditions

> +
> +	return;
> +
> +err_put_alp_clk:
> +	clk_put(ilp->alp_clk);
> +err_unmap_pmu:
> +	iounmap(ilp->pmu);
> +err_free_ilp:
> +	kfree(ilp);
> +	pr_err("Failed to init ILP clock: %d\n", err);
> +}
> +CLK_OF_DECLARE(ns_ilp_clk, "brcm,ns-ilp", ns_ilp_init);
>

Thanks,

Ray

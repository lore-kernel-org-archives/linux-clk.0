Return-Path: <sboyd@codeaurora.org>
Date: Wed, 9 Sep 2015 16:42:56 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 3/3] clk: qcom: Add A53 clock driver
Message-ID: <20150909234256.GY15099@codeaurora.org>
References: <1439387673-13015-1-git-send-email-georgi.djakov@linaro.org>
 <1439387673-13015-4-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1439387673-13015-4-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/12, Georgi Djakov wrote:
> Add a driver for the A53 subsystem PLL, so that we can provide higher

Seems to be more than just the PLL...

> frequency clocks for use by the system.
> 

> diff --git a/Documentation/devicetree/bindings/clock/qcom,a53cc b/Documentation/devicetree/bindings/clock/qcom,a53cc
> new file mode 100644
> index 000000000000..34f6cf8dd6ca
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,a53cc
> @@ -0,0 +1,25 @@
> +Qualcomm A53 Clock Controller Binding
> +------------------------------------------------
> +The A53 Clock Controller provides higher frequency clocks
> +and allows CPU frequency scaling on msm8916 based platforms.
> +
> +Required properties :
> +- compatible : shall contain:
> +			"qcom,a53cc"

This doesn't match the example.

> +- reg : shall contain base register location and length
> +	of the A53 PLL
> +- #clock-cells : shall contain 1
> +- qcom,apcs : phandle of apcs syscon node
> +
> +Example:
> +	apcs: syscon@b011000 {
> +		compatible = "syscon";
> +		reg = <0x0b011000 0x1000>;
> +	};
> +
> +	a53cc: clock-controller@0b016000 {
> +		compatible = "qcom,clock-a53-msm8916";
> +		reg = <0x0b016000 0x40>;
> +		#clock-cells = <1>;
> +		qcom,apcs = <&apcs>;

I don't get this part. "apcs" is a clock-controller too. This
node should be called something like

	compatible = "qcom,a53-pll"

and the driver should be a pure PLL driver. No regmap mux/divider
thing.

We should have another driver for the apcs node that does the
mux/divider clock control. If smd needs to use that as a syscon
that's fine, it should work if we have

	compatible = "qcom,a53cc", "syscon"

in there.

> +	};
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 59d16668bdf5..82a03260011e 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -97,3 +97,11 @@ config MSM_MMCC_8974
>  	  Support for the multimedia clock controller on msm8974 devices.
>  	  Say Y if you want to support multimedia devices such as display,
>  	  graphics, video encode/decode, camera, etc.
> +
> +config QCOM_A53

Please name this something like QCOM_A53PLL

> +	tristate "A53 Clock Controller"

And update this and the help text.

> +	depends on COMMON_CLK_QCOM
> +	help
> +	  Support for the A53 clock controller on Qualcomm devices.
> +	  Say Y if you want to support CPU frequency scaling on devices
> +	  such as MSM8916.
> diff --git a/drivers/clk/qcom/clk-a53.c b/drivers/clk/qcom/clk-a53.c
> new file mode 100644
> index 000000000000..9143470cbc2c
> --- /dev/null
> +++ b/drivers/clk/qcom/clk-a53.c
> @@ -0,0 +1,202 @@
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
> +#include <linux/clk.h>

clk-provider?

> +#include <linux/cpu.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include "clk-pll.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-mux-div.h"
> +
> +#define F_APCS_PLL(f, l, m, n) { (f), (l), (m), (n), 0 }

This macro seems useless, just have brackets

	{ 998400000, 52, 0, 1 }
	...

> +
> +static struct pll_freq_tbl apcs_pll_freq[] = {
> +	F_APCS_PLL(998400000, 52, 0x0, 0x1),
> +	F_APCS_PLL(1094400000, 57, 0x0, 0x1),
> +	F_APCS_PLL(1152000000, 62, 0x0, 0x1),
> +	F_APCS_PLL(1209600000, 65, 0x0, 0x1),
> +	F_APCS_PLL(1401600000, 73, 0x0, 0x1),
> +};
> +
> +static struct clk_pll a53sspll = {
> +	.l_reg = 0x04,
> +	.m_reg = 0x08,
> +	.n_reg = 0x0c,
> +	.config_reg = 0x14,
> +	.mode_reg = 0x00,
> +	.status_reg = 0x1c,
> +	.status_bit = 16,
> +	.freq_tbl = apcs_pll_freq,
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "a53sspll",
> +		.parent_names = (const char *[]){ "xo" },
> +		.num_parents = 1,
> +		.ops = &clk_pll_sr2_ops,
> +		.flags = CLK_GET_RATE_NOCACHE,

Why?

> +	},
> +};
> +
> +static const struct regmap_config a53sspll_regmap_config = {
> +	.reg_bits	= 32,
> +	.reg_stride	= 4,
> +	.val_bits	= 32,
> +	.max_register	= 0x40,
> +	.fast_io	= true,
> +};
> +
> +static struct clk *a53ss_add_pll(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	void __iomem *base;
> +	struct regmap *regmap;
> +	struct clk_pll *pll;
> +
> +	pll = devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
> +	if (!pll)
> +		return ERR_PTR(-ENOMEM);
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(base))
> +		return ERR_CAST(base);
> +
> +	pll = &a53sspll;

So we allocate pll and then leak the pointer? I'm lost.

> +
> +	regmap = devm_regmap_init_mmio(dev, base, &a53sspll_regmap_config);
> +	if (IS_ERR(regmap))
> +		return ERR_CAST(regmap);
> +
> +	return devm_clk_register_regmap(dev, &pll->clkr);
> +}
> +
> +enum {
> +	P_GPLL0,
> +	P_A53SSPLL,
> +};
> +
> +static const struct parent_map gpll0_a53sspll_map[] = {
> +	{ P_GPLL0, 4 },
> +	{ P_A53SSPLL, 5 },
> +};
> +
> +static const char * const gpll0_a53sspll[] = {
> +	"gpll0_vote",
> +	"a53sspll",
> +};
> +
> +static struct clk_regmap_mux_div a53ssmux = {
> +	.reg_offset = 0x50,
> +	.hid_width = 5,
> +	.hid_shift = 0,
> +	.src_width = 3,
> +	.src_shift = 8,
> +	.safe_src = 4,
> +	.safe_freq = 400000000,
> +	.parent_map = gpll0_a53sspll_map,
> +	.clkr.hw.init = &(struct clk_init_data){
> +		.name = "a53ssmux",
> +		.parent_names = gpll0_a53sspll,
> +		.num_parents = 2,
> +		.ops = &clk_regmap_mux_div_ops,
> +		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,

Why can't we cache the rate?

> +	},
> +};
> +
> +static struct clk *a53ss_add_mux(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct regmap *regmap;
> +	struct clk_regmap_mux_div *mux;
> +
> +	mux = devm_kzalloc(dev, sizeof(*mux), GFP_KERNEL);
> +	if (!mux)
> +		return ERR_PTR(-ENOMEM);
> +
> +	mux = &a53ssmux;

So we allocate mux and then leak the pointer? I'm lost again.

> +
> +	regmap = syscon_regmap_lookup_by_phandle(np, "qcom,apcs");
> +	if (IS_ERR(regmap))
> +		return ERR_CAST(regmap);
> +
> +	mux->clkr.regmap = regmap;
> +	return devm_clk_register(dev, &mux->clkr.hw);
> +}
> +
> +static const struct of_device_id qcom_a53_match_table[] = {
> +	{ .compatible = "qcom,clock-a53-msm8916" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, qcom_a53_match_table);
> +
> +static int qcom_a53_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct clk *clk_pll, *clk_mux;
> +	struct clk_onecell_data *data;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->clks = devm_kcalloc(dev, 2, sizeof(struct clk *), GFP_KERNEL);
> +	if (!data->clks)
> +		return -ENOMEM;
> +
> +	clk_pll = a53ss_add_pll(pdev);
> +	if (IS_ERR(clk_pll))
> +		return PTR_ERR(clk_pll);
> +
> +	clk_mux = a53ss_add_mux(pdev);
> +	if (IS_ERR(clk_mux))
> +		return PTR_ERR(clk_mux);

Please put this mux stuff into its own driver.

> +
> +	data->clks[0] = clk_pll;
> +	data->clks[1] = clk_mux;
> +	data->clk_num = 2;
> +
> +	clk_prepare_enable(clk_pll);

hm.. Is this so that it doesn't get turned off? Presumably it's
already on if the CPU is running off of it, so we can just mark
it as CLK_IGNORE_UNUSED for now until critical clocks land?

> +
> +	return of_clk_add_provider(dev->of_node, of_clk_src_onecell_get, data);
> +}
> +
> +static struct platform_driver qcom_a53_driver = {
> +	.probe = qcom_a53_probe,
> +	.driver = {
> +		.name = "qcom-a53",
> +		.of_match_table = qcom_a53_match_table,
> +	},
> +};
> +
> +static int __init qcom_a53_init(void)
> +{
> +	return platform_driver_register(&qcom_a53_driver);
> +}
> +arch_initcall(qcom_a53_init);
> +
> +static void __exit qcom_a53_exit(void)
> +{
> +	platform_driver_unregister(&qcom_a53_driver);
> +}
> +module_exit(qcom_a53_exit);

module_platform_driver?

> +
> +MODULE_DESCRIPTION("Qualcomm A53 Clock Driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:qcom-a53");

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

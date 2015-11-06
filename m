Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:51902 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965545AbbKFBPv (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 5 Nov 2015 20:15:51 -0500
Date: Thu, 5 Nov 2015 17:15:49 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Matthew McClintock <mmcclint@codeaurora.org>
Cc: Andy Gross <agross@codeaurora.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Varadarajan Narayanan <varada@codeaurora.org>,
	linux-kernel@vger.kernel.org,
	qca-upstream.external@qca.qualcomm.com,
	Pradeep Banavathi <pradeepb@codeaurora.org>,
	Senthilkumar N L <snlakshm@codeaurora.org>
Subject: Re: [PATCH 2/5] clk: qcom: Add IPQ4019 Global Clock Controller
 support
Message-ID: <20151106011549.GB26852@codeaurora.org>
References: <1446761276-9111-1-git-send-email-mmcclint@codeaurora.org>
 <1446761276-9111-3-git-send-email-mmcclint@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1446761276-9111-3-git-send-email-mmcclint@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 11/05, Matthew McClintock wrote:
> diff --git a/drivers/clk/qcom/gcc-ipq4019.c b/drivers/clk/qcom/gcc-ipq4019.c
> new file mode 100644
> index 0000000..3ed76bd
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-ipq4019.c
> @@ -0,0 +1,1680 @@
> +
> +#define SPARE_CLOCK_BRANCH_ENA_VOTE		0x0004
> +#define GCC_SPARE0_REG				0x0008
[...]
> +#define PLLTEST_PAD_CFG				0x210E0
> +#define SYSTEM_NOC_125M_BFDCD_CMD_RCGR		0x210E4
> +#define SYSTEM_NOC_125M_BFDCD_CFG_RCGR		0x210E8
> +#define SYS_NOC_125M_CBCR			0x210EC
> +#define GCC_SLEEP_CMD_RCGR			0x210F0
> +#define TCSR_BCR				0x22000
> +#define TCSR_AHB_CBCR				0x22004
> +#define MPM_BCR					0x24000
> +#define MPM_MISC				0x24004
> +#define MPM_AHB_CBCR				0x24008
> +#define MPM_SLEEP_CBCR				0x2400C
> +#define SPDM_BCR				0x25000
> +#define MDIO_AHB_CBCR				0x26000
> +

Drop all these #defines and put the raw value in the place that
they're used. The name of the clk structure is good enough to know
what the numbers are for.

> +static struct parent_map gcc_xo_ddr_500_200_map[] = {
> +	{ .src = P_XO, .cfg = 0, },
> +	{ .src = P_FEPLL200, .cfg = 3, },
> +	{ .src = P_FEPLL500, .cfg = 2, },
> +	{ .src = P_DDRPLLAPSS, .cfg = 1, },

Drop the .src and .cfg stuff and just say { P_DDRPLLAPSS, 1 }

> +};
> +
> +static const char * const gcc_xo_ddr_500_200[] = {
> +	"xo",
> +	"fepll200",
> +	"fepll500",
> +	"ddrpllapss",
> +};
> +
> +static int clk_dummy_is_enabled(struct clk_hw *hw)
> +{
> +	return 1;
> +};
> +
> +static int clk_dummy_enable(struct clk_hw *hw)
> +{
> +	return 0;
> +};
> +
> +static void clk_dummy_disable(struct clk_hw *hw)
> +{
> +	return;
> +};
> +
> +static u8 clk_dummy_get_parent(struct clk_hw *hw)
> +{
> +	return 0;
> +};
> +
> +static int clk_dummy_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	return 0;
> +};
> +
> +static int clk_dummy_set_rate(struct clk_hw *hw, unsigned long rate,
> +			      unsigned long parent_rate)
> +{
> +	return 0;
> +};
> +
> +static int clk_dummy_determine_rate(struct clk_hw *hw,
> +				     struct clk_rate_request *req)
> +{
> +	return req ? req->rate : 0;
> +};
> +
> +static unsigned long clk_dummy_recalc_rate(struct clk_hw *hw,
> +					   unsigned long parent_rate)
> +{
> +	return parent_rate;
> +};
> +
> +const struct clk_ops clk_ipq4019_dummy_ops = {
> +	.is_enabled = clk_dummy_is_enabled,
> +	.enable = clk_dummy_enable,
> +	.disable = clk_dummy_disable,
> +	.get_parent = clk_dummy_get_parent,
> +	.set_parent = clk_dummy_set_parent,
> +	.set_rate = clk_dummy_set_rate,
> +	.recalc_rate = clk_dummy_recalc_rate,
> +	.determine_rate = clk_dummy_determine_rate,
> +};
> +
> +static struct clk_regmap dummy = {
> +	.hw.init = &(struct clk_init_data){
> +		.name = "dummy_clk_src",
> +		.parent_names = (const char *[]){ "xo"},
> +		.num_parents = 1,
> +		.ops = &clk_ipq4019_dummy_ops,
> +	},
> +};
> +
> +static struct clk_regmap *gcc_ipq4019_clocks[] = {
> +	[GCC_DUMMY_CLK] = &dummy,

I highly doubt this is a real clock. Please remove it and all the
associated code.

> +	[AUDIO_CLK_SRC] = &audio_clk_src.clkr,
> +	[BLSP1_QUP1_I2C_APPS_CLK_SRC] = &blsp1_qup1_i2c_apps_clk_src.clkr,
[..]
> +
> +static const struct regmap_config gcc_ipq4019_regmap_config = {
> +	.reg_bits	= 32,
> +	.reg_stride	= 4,
> +	.val_bits	= 32,
> +	.max_register	= 0x2DFFF,

Lowercase hexadecimal please.

> +	.fast_io	= true,
> +};
> +
> +static const struct qcom_cc_desc gcc_ipq4019_desc = {
> +	.config = &gcc_ipq4019_regmap_config,
> +	.clks = gcc_ipq4019_clocks,
> +	.num_clks = ARRAY_SIZE(gcc_ipq4019_clocks),
> +	.resets = gcc_ipq4019_resets,
> +	.num_resets = ARRAY_SIZE(gcc_ipq4019_resets),
> +};
> +
> +static const struct of_device_id gcc_ipq4019_match_table[] = {
> +	{ .compatible = "qcom,gcc-ipq4019" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, gcc_ipq4019_match_table);
> +
> +static int gcc_ipq4019_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	const struct of_device_id *id;
> +
> +	id = of_match_device(gcc_ipq4019_match_table, dev);
> +	if (!id)
> +		return -ENODEV;

This is done by driver core. We don't need to do it again.

> +
> +	/* High speed external clock */
> +	clk_register_fixed_rate(dev, "xo", NULL,
> +					 CLK_IS_ROOT, 48000000);
> +	/* External sleep clock */
> +	clk_register_fixed_rate(dev, "gcc_sleep_clk_src", NULL,
> +					 CLK_IS_ROOT, 32768);

These should go into DT as xo_board and sleep_clk.

> +
> +	/* FE PLL post dividers */
> +	clk_register_fixed_rate(dev, "fepll500", NULL, CLK_IS_ROOT,
> +				      500000000);
> +	clk_register_fixed_rate(dev, "fepll200", NULL, CLK_IS_ROOT,
> +				      200000000);
> +	clk_register_fixed_rate(dev, "fepll125", NULL, CLK_IS_ROOT,
> +				      125000000);
> +	clk_register_fixed_rate(dev, "fepll125dly", NULL, CLK_IS_ROOT,
> +				      125000000);
> +	clk_register_fixed_rate(dev, "fepllwcss2g", NULL, CLK_IS_ROOT,
> +				      250000000);
> +	clk_register_fixed_rate(dev, "fepllwcss5g", NULL, CLK_IS_ROOT,
> +				      250000000);
> +
> +	/* DDR PLL post dividers */
> +	clk_register_fixed_rate(dev, "ddrpllsdcc1", NULL, CLK_IS_ROOT,
> +				      409800000);
> +	clk_register_fixed_rate(dev, "ddrpllapss", NULL, CLK_IS_ROOT,
> +				      626000000);
> +	clk_register_fixed_rate(dev, "pcnoc_clk_src", NULL, CLK_IS_ROOT,
> +				      100000000);
> +

I don't see why we wouldn't want to root the PLLs in the XO. The
PLLs aren't the root of the clock tree. I guess it's fine to make
them fixed rate clocks instead of implementing code to read the
frequencies at boot. It's not the most flexible design, but ok.

Also, it would be better to make structures for these fixed PLLs
and use devm_clk_register() so that this driver can be safely
probed and removed at will.

> +	return qcom_cc_probe(pdev, &gcc_ipq4019_desc);
> +}
> +
> +static int gcc_ipq4019_remove(struct platform_device *pdev)
> +{
> +	qcom_cc_remove(pdev);

This doesn't exist anymore.

> +	return 0;
> +}
> +
> +static struct platform_driver gcc_ipq4019_driver = {
> +	.probe		= gcc_ipq4019_probe,
> +	.remove		= gcc_ipq4019_remove,
> +	.driver		= {
> +		.name	= "qcom,gcc-ipq4019",
> +		.owner	= THIS_MODULE,
> +		.of_match_table = gcc_ipq4019_match_table,
> +	},
> +};
> +
> +static int __init gcc_ipq4019_init(void)
> +{
> +	return platform_driver_register(&gcc_ipq4019_driver);
> +}
> +core_initcall(gcc_ipq4019_init);
> +
> +static void __exit gcc_ipq4019_exit(void)
> +{
> +	platform_driver_unregister(&gcc_ipq4019_driver);
> +}
> +module_exit(gcc_ipq4019_exit);
> +
> +MODULE_ALIAS("platform:gcc-ipq4019.c");

Why the .c? Drop that.

> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("GCC Driver for ipq4019 driver");

Capitalize IPQ. "driver for soc driver" is not so good.

> diff --git a/include/dt-bindings/clock/qcom,gcc-ipq4019.h b/include/dt-bindings/clock/qcom,gcc-ipq4019.h
> new file mode 100644
> index 0000000..40fc405
> --- /dev/null
> +++ b/include/dt-bindings/clock/qcom,gcc-ipq4019.h
> @@ -0,0 +1,85 @@
> +/* Copyright (c) 2015 The Linux Foundation. All rights reserved.
> + *
> + * Permission to use, copy, modify, and/or distribute this software for any
> + * purpose with or without fee is hereby granted, provided that the above
> + * copyright notice and this permission notice appear in all copies.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
> + * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
> + * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
> + * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
> + * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
> + * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
> + * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
> + *
> + */
> +#ifndef __QCOM_CLK_IPQ4019_H__
> +#define __QCOM_CLK_IPQ4019_H__
> +
> +#define	GCC_DUMMY_CLK					0

Please drop the tab after #define.

> +#define	AUDIO_CLK_SRC					1
> +#define	BLSP1_QUP1_I2C_APPS_CLK_SRC			2
> +#define	BLSP1_QUP1_SPI_APPS_CLK_SRC			3
> +#define	BLSP1_QUP2_I2C_APPS_CLK_SRC			4
> +#define	BLSP1_QUP2_SPI_APPS_CLK_SRC			5
> +#define	BLSP1_UART1_APPS_CLK_SRC			6
> diff --git a/include/dt-bindings/reset/qcom,gcc-ipq4019.h b/include/dt-bindings/reset/qcom,gcc-ipq4019.h
> new file mode 100644
> index 0000000..2708ae3
> --- /dev/null
> +++ b/include/dt-bindings/reset/qcom,gcc-ipq4019.h

Please fold this file into the clock one. There's not really any
point to having two files.

> @@ -0,0 +1,90 @@
> +#define GCC_PCNOC_BUS_TIMEOUT6_BCR			64
> +#define GCC_PCNOC_BUS_TIMEOUT7_BCR			65
> +#define GCC_PCNOC_BUS_TIMEOUT8_BCR			66
> +#define GCC_PCNOC_BUS_TIMEOUT9_BCR			67
> +#define GCC_TCSR_BCR					68
> +#define GCC_QDSS_BCR					69
> +#define GCC_MPM_BCR					70
> +#define GCC_SPDM_BCR					71
> +#define AUDIO_BLK_ARES					GCC_AUDIO_BCR

Why have two names for the same thing?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

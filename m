Return-Path: <sboyd@codeaurora.org>
Date: Mon, 20 Jun 2016 18:21:35 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: mdm9615: Add support for MDM9615 Clock
 Controllers
Message-ID: <20160621012135.GQ1521@codeaurora.org>
References: <1466157875-14428-1-git-send-email-narmstrong@baylibre.com>
 <1466157875-14428-2-git-send-email-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1466157875-14428-2-git-send-email-narmstrong@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/17, Neil Armstrong wrote:
> In order to support the Qualcomm MDM9615 SoC, add support for
> the Global and LPASS Clock Controllers.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/qcom/Kconfig       |   17 +
>  drivers/clk/qcom/Makefile      |    2 +
>  drivers/clk/qcom/gcc-mdm9615.c | 1709 ++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/lcc-mdm9615.c |  580 ++++++++++++++
>  4 files changed, 2308 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-mdm9615.c
>  create mode 100644 drivers/clk/qcom/lcc-mdm9615.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 95e3b3e..1c05430 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -87,6 +87,23 @@ config MSM_LCC_8960
>  	  Say Y if you want to use audio devices such as i2s, pcm,
>  	  SLIMBus, etc.
>  
> +config MSM_GCC_9615

s/MSM/MDM/

> +	tristate "MDM9615 Global Clock Controller"
> +	depends on COMMON_CLK_QCOM
> +	help
> +	  Support for the global clock controller on mdm9615 devices.
> +	  Say Y if you want to use peripheral devices such as UART, SPI,
> +	  i2c, USB, SD/eMMC, etc.
> +
> +config MSM_LCC_9615

s/MSM/MDM/

> +	tristate "MDM9615 LPASS Clock Controller"
> +	select MSM_GCC_9615

s/MSM/MDM/

> +	depends on COMMON_CLK_QCOM
> +	help
> +	  Support for the LPASS clock controller on mdm9615 devices.
> +	  Say Y if you want to use audio devices such as i2s, pcm,
> +	  SLIMBus, etc.
> +
>  config MSM_MMCC_8960
>  	tristate "MSM8960 Multimedia Clock Controller"
>  	select MSM_GCC_8960
> diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm9615.c
> new file mode 100644
> index 0000000..3178f6a
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-mdm9615.c
> @@ -0,0 +1,1709 @@
> +
> +static const struct regmap_config gcc_mdm9615_regmap_config = {
> +	.reg_bits	= 32,
> +	.reg_stride	= 4,
> +	.val_bits	= 32,
> +	.max_register	= 0x3660,
> +	.fast_io	= true,
> +};
> +
> +static const struct qcom_cc_desc gcc_mdm9615_desc = {
> +	.config = &gcc_mdm9615_regmap_config,
> +	.clks = gcc_mdm9615_clks,
> +	.num_clks = ARRAY_SIZE(gcc_mdm9615_clks),
> +	.resets = gcc_mdm9615_resets,
> +	.num_resets = ARRAY_SIZE(gcc_mdm9615_resets),
> +};
> +
> +static const struct of_device_id gcc_mdm9615_match_table[] = {
> +	{ .compatible = "qcom,gcc-mdm9615", .data = &gcc_mdm9615_desc },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, gcc_mdm9615_match_table);
> +
> +static int gcc_mdm9615_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	const struct of_device_id *match;
> +	int ret;
> +
> +	match = of_match_device(gcc_mdm9615_match_table, &pdev->dev);
> +	if (!match)
> +		return -EINVAL;
> +
> +	ret = qcom_cc_register_board_clk(dev, "cxo_board", "cxo", 19200000);

This API is there to workaround failures to put the cxo_board clk
in DT to begin with. Please just have cxo_board in the DT and
then register a fixed factor of 1 clk here that we can swap out
for an RPM clk later when RPM clks appear. See msm8996 for more
details.

> +	if (ret)
> +		return ret;
> +
> +	return qcom_cc_probe(pdev, match->data);
> +}
> +
> +static struct platform_driver gcc_mdm9615_driver = {
> +	.probe		= gcc_mdm9615_probe,
> +	.driver		= {
> +		.name	= "gcc-mdm9615",
> +		.of_match_table = gcc_mdm9615_match_table,
> +	},
> +};
> +
> +static int __init gcc_mdm9615_init(void)
> +{
> +	return platform_driver_register(&gcc_mdm9615_driver);
> +}
> +core_initcall(gcc_mdm9615_init);
> +
> +static void __exit gcc_mdm9615_exit(void)
> +{
> +	platform_driver_unregister(&gcc_mdm9615_driver);
> +}
> +module_exit(gcc_mdm9615_exit);
> +
> +MODULE_DESCRIPTION("QCOM GCC MDM9615 Driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_ALIAS("platform:gcc-mdm9615");

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

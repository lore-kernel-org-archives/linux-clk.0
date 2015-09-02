Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 2 Sep 2015 16:55:57 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: qcom: Add MSM8916 RPM clock driver
Message-ID: <20150902235557.GB15099@codeaurora.org>
References: <1438620489-32515-1-git-send-email-georgi.djakov@linaro.org>
 <1438620489-32515-3-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1438620489-32515-3-git-send-email-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 08/03, Georgi Djakov wrote:
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> new file mode 100644
> index 000000000000..bd0fd0cd50dc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt

Binding looks good.

> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index e347b97aa9c7..edffb57a3aff 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -52,6 +52,7 @@ config MSM_GCC_8660
>  
>  config MSM_GCC_8916
>  	tristate "MSM8916 Global Clock Controller"
> +	select QCOM_CLK_SMD_RPM

This will probably introduce some sort of build failure if the
RPM SMD driver is not compiled in?

>  	depends on COMMON_CLK_QCOM
>  	help
>  	  Support for the global clock controller on msm8916 devices.
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 33adf1d97da3..985c794608a7 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_IPQ_GCC_806X) += gcc-ipq806x.o
>  obj-$(CONFIG_IPQ_LCC_806X) += lcc-ipq806x.o
>  obj-$(CONFIG_MSM_GCC_8660) += gcc-msm8660.o
>  obj-$(CONFIG_MSM_GCC_8916) += gcc-msm8916.o
> +obj-$(CONFIG_MSM_GCC_8916) += rpmcc-msm8916.o

Bad config. Also, perhaps we can try to make it generic across
all SMD RPM based platforms? I don't think much changes between
chips to warrant a new driver every time for the RPMCC.

>  obj-$(CONFIG_MSM_GCC_8960) += gcc-msm8960.o
>  obj-$(CONFIG_MSM_LCC_8960) += lcc-msm8960.o
>  obj-$(CONFIG_MSM_GCC_8974) += gcc-msm8974.o
> diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
> index 3bf4fb3deef6..28ef2c771157 100644
> --- a/drivers/clk/qcom/gcc-msm8916.c
> +++ b/drivers/clk/qcom/gcc-msm8916.c
> @@ -2820,19 +2820,6 @@ MODULE_DEVICE_TABLE(of, gcc_msm8916_match_table);
>  
>  static int gcc_msm8916_probe(struct platform_device *pdev)
>  {
> -	struct clk *clk;
> -	struct device *dev = &pdev->dev;
> -
> -	/* Temporary until RPM clocks supported */
> -	clk = clk_register_fixed_rate(dev, "xo", NULL, CLK_IS_ROOT, 19200000);
> -	if (IS_ERR(clk))
> -		return PTR_ERR(clk);

Hmm.. this problem. With this change we're going to make the gcc
driver depend on the RPM driver (and if we continue along this
path we should make the Kconfig reflect that).

I wonder if we could do something like this instead:

 1) Introduce a fixed rate 'xo_board' clock into DT that has the rate of
 the XO resource.

 2) If the RPM clock driver isn't enabled, register a dummy pass
 through clock (fixed factor of 1 perhaps?) called 'xo' in the gcc
 driver.

 3) If the RPM clock driver is enabled, we won't register the 
 clock above and we'll make sure to set the parent of the xo
 clock in the RPM clock driver to xo_board.

The benefit of this complicated scheme is that the rate of the XO
clock is not hard-coded in the RPM driver or gcc driver (it comes
from the board layout anyway so it should be in DT), and we also
work seamlessly in the case where the RPM clock driver isn't
enabled. This makes for a smooth transition.

If we were to apply this patch right now, 8916 would stop booting
until the RPM clock driver was enabled. What a mess!

> -
> -	clk = clk_register_fixed_rate(dev, "sleep_clk_src", NULL,
> -				      CLK_IS_ROOT, 32768);
> -	if (IS_ERR(clk))
> -		return PTR_ERR(clk);
> -
>  	return qcom_cc_probe(pdev, &gcc_msm8916_desc);
>  }
>  
> diff --git a/drivers/clk/qcom/rpmcc-msm8916.c b/drivers/clk/qcom/rpmcc-msm8916.c
> new file mode 100644
> index 000000000000..60b2292dcd45
> --- /dev/null
> +++ b/drivers/clk/qcom/rpmcc-msm8916.c
> @@ -0,0 +1,196 @@
> +
> +static int rpmcc_msm8916_probe(struct platform_device *pdev)
> +{
> +	struct clk **clks;
> +	struct clk *clk;
> +	struct rpm_cc *rcc;
> +	struct qcom_smd_rpm *rpm;
> +	struct clk_onecell_data *data;
> +	int num_clks = ARRAY_SIZE(rpmcc_msm8916_clks);
> +	int ret, i;
> +
> +	if (!pdev->dev.of_node)
> +		return -ENODEV;

This never happens. Please remove.

> +
> +	rpm = dev_get_drvdata(pdev->dev.parent);
> +	if (!rpm) {
> +		dev_err(&pdev->dev, "Unable to retrieve handle to RPM\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = clk_smd_rpm_enable_scaling(rpm);
> +	if (ret)
> +		return ret;
> +
> +	rcc = devm_kzalloc(&pdev->dev, sizeof(*rcc) + sizeof(*clks) * num_clks,
> +			   GFP_KERNEL);
> +	if (!rcc)
> +		return -ENOMEM;

Maybe we should do this before we enable RPM scaling.

> +
> +	clks = rcc->clks;
> +	data = &rcc->data;
> +	data->clks = clks;
> +	data->clk_num = num_clks;
> +
> +	clk = clk_register_fixed_rate(&pdev->dev, "sleep_clk_src", NULL,
> +				      CLK_IS_ROOT, 32768);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);

We should move the sleep_clk_src to DT. No need to register it
here. Please make that a separate patch. I imagine we'll need to
make it so that registering the sleep_clk_src doesn't fail the
gcc probe, add the DT clock entry, and then remove the fixed rate
clock registration from the gcc probe after that.

> +
> +	for (i = 0; i < num_clks; i++) {
> +		if (!rpmcc_msm8916_clks[i]) {
> +			clks[i] = ERR_PTR(-ENOENT);
> +			continue;
> +		}
> +
> +		rpmcc_msm8916_clks[i]->rpm = rpm;
> +		clk = devm_clk_register(&pdev->dev, &rpmcc_msm8916_clks[i]->hw);
> +		if (IS_ERR(clk))
> +			return PTR_ERR(clk);
> +
> +		clks[i] = clk;
> +	}
> +
> +	ret = of_clk_add_provider(pdev->dev.of_node, of_clk_src_onecell_get,
> +				  data);
> +	if (ret)
> +		return ret;
> +
> +	/* Hold a vote for max rates */
> +	clk_set_rate(bimc_a_clk.hw.clk, INT_MAX);
> +	clk_prepare_enable(bimc_a_clk.hw.clk);
> +	clk_set_rate(bimc_clk.hw.clk, INT_MAX);
> +	clk_prepare_enable(bimc_clk.hw.clk);
> +	clk_set_rate(snoc_clk.hw.clk, INT_MAX);
> +	clk_prepare_enable(snoc_clk.hw.clk);
> +	clk_prepare_enable(xo.hw.clk);

This is a combination of critical clocks and assigned-rates.
Critical clocks aren't here yet, hopefully soon. Assigned-rates
are here though, so can we use those to set these clocks to some
max speed?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

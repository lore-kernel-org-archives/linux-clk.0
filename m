Return-Path: <sboyd@codeaurora.org>
Date: Wed, 20 May 2015 16:43:11 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: linux-kernel@vger.kernel.org, Liviu Dudau <Liviu.Dudau@arm.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	"Jon Medhurst (Tixy)" <tixy@linaro.org>,
	Mike Turquette <mturquette@linaro.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: add support for clocks provided by SCP(System
 Control Processor)
Message-ID: <20150520234311.GA31753@codeaurora.org>
References: <1430134846-24320-1-git-send-email-sudeep.holla@arm.com>
 <1430134846-24320-3-git-send-email-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1430134846-24320-3-git-send-email-sudeep.holla@arm.com>
List-ID: <linux-clk.vger.kernel.org>

On 04/27, Sudeep Holla wrote:
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 9897f353bf1a..906bf7dd72a2 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -59,6 +59,16 @@ config COMMON_CLK_RK808
>  	  clocked at 32KHz each. Clkout1 is always on, Clkout2 can off
>  	  by control register.
>  
> +config COMMON_CLK_SCPI
> +        tristate "Clock driver controlled via SCPI interface"
> +        depends on ARM_SCPI_PROTOCOL

|| COMPILE_TEST ?

> +        ---help---
> +          This driver provides support for clocks that are controlled
> +          by firmware that implements the SCPI interface.
> +
> +	  This driver uses SCPI Message Protocol to interact with the
> +	  firware providing all the clock controls.
> +
>  config COMMON_CLK_SI5351
>  	tristate "Clock driver for SiLabs 5351A/B/C"
>  	depends on I2C
> diff --git a/drivers/clk/clk-scpi.c b/drivers/clk/clk-scpi.c
> new file mode 100644
> index 000000000000..70a2d57da32d
> --- /dev/null
> +++ b/drivers/clk/clk-scpi.c
> @@ -0,0 +1,344 @@
> +#include <linux/clkdev.h>

Is clkdev used here?

> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/of.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/scpi_protocol.h>
> +
[...]
> +
> +static int scpi_dvfs_set_rate(struct clk_hw *hw, unsigned long rate,
> +			      unsigned long parent_rate)
> +{
> +	struct scpi_clk *clk = to_scpi_clk(hw);
> +	int ret = __scpi_find_dvfs_index(clk, rate);
> +
> +	if (ret < 0)
> +		return ret;
> +	return scpi_ops->dvfs_set_idx(clk->id, (u8)ret);
> +}
> +
> +static struct clk_ops scpi_dvfs_ops = {

const?

> +	.recalc_rate = scpi_dvfs_recalc_rate,
> +	.round_rate = scpi_dvfs_round_rate,
> +	.set_rate = scpi_dvfs_set_rate,
> +};
> +
> +static struct clk *
> +scpi_dvfs_ops_init(struct device *dev, struct device_node *np,
> +		   struct scpi_clk *sclk)
> +{
> +	struct clk_init_data init;
> +	struct scpi_dvfs_info *info;
> +
> +	init.name = sclk->name;
> +	init.flags = CLK_IS_ROOT;
> +	init.num_parents = 0;
> +	init.ops = &scpi_dvfs_ops;
> +	sclk->hw.init = &init;
> +
> +	info = scpi_ops->dvfs_get_info(sclk->id);
> +	if (IS_ERR(info))
> +		return (struct clk *)info;

return ERR_CAST(info)?

> +
> +	sclk->info = info;
> +
> +	return devm_clk_register(dev, &sclk->hw);
> +}
> +
> +
[...]
> +static int scpi_clk_probe(struct platform_device *pdev)
> +{
> +	struct clk **clks;
> +	int idx, count;
> +	struct clk_onecell_data *clk_data;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct clk *(*clk_ops_init)(struct device *, struct device_node *,
> +				    struct scpi_clk *);
> +
> +	if (!of_device_is_available(np))
> +		return -ENODEV;

Is this because of_platform_populate() populates disabled nodes?

> +
> +	clk_ops_init = of_match_node(scpi_clk_match, np)->data;
> +	if (!clk_ops_init)
> +		return -ENODEV;
> +
> +	count = of_property_count_strings(np, "clock-output-names");
> +	if (count < 0) {
> +		dev_err(dev, "%s: invalid clock output count\n", np->name);
> +		return -EINVAL;
> +	}
> +
> +	clk_data = devm_kmalloc(dev, sizeof(*clk_data), GFP_KERNEL);
> +	if (!clk_data) {
> +		dev_err(dev, "failed to allocate clock provider data\n");
> +		return -ENOMEM;
> +	}
> +
> +	clks = devm_kmalloc(dev, count * sizeof(*clks), GFP_KERNEL);

devm_kcalloc()?

> +	if (!clks) {
> +		dev_err(dev, "failed to allocate clock providers\n");

Error messages on allocation failures are useless. Please remove.

> +		return -ENOMEM;
> +	}
> +
> +	for (idx = 0; idx < count; idx++) {
> +		struct scpi_clk *sclk;
[...]
> +static int scpi_clk_remove(struct platform_device *pdev)
> +{
> +	of_clk_del_provider(pdev->dev.of_node);
> +	platform_set_drvdata(pdev, NULL);

We don't need to set platform_drvdata to NULL here.

> +	return 0;
> +}
> +

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

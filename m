Return-Path: <sboyd@codeaurora.org>
Date: Fri, 7 Apr 2017 09:48:51 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: mturquette@baylibre.com, lee.jones@linaro.org,
	linux-kernel@vger.kernel.org, guodong.xu@linaro.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: hi6220: Add the hi655x's pmic clock
Message-ID: <20170407164851.GU7065@codeaurora.org>
References: <1489737531-3036-1-git-send-email-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1489737531-3036-1-git-send-email-daniel.lezcano@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 03/17, Daniel Lezcano wrote:
> The hi655x multi function device is a PMIC providing regulators.
> 
> The PMIC also provides a clock for the WiFi and the Bluetooth, let's implement
> this clock in order to add it in the hi655x MFD and allow proper wireless
> initialization.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Is there a binding patch for the PMIC?

> ---
>  drivers/clk/Kconfig      |   8 +++
>  drivers/clk/Makefile     |   1 +
>  drivers/clk/clk-hi655x.c | 145 +++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 154 insertions(+)
>  create mode 100644 drivers/clk/clk-hi655x.c
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 9356ab4..471a433 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -47,6 +47,14 @@ config COMMON_CLK_RK808
>  	  clocked at 32KHz each. Clkout1 is always on, Clkout2 can off
>  	  by control register.
>  
> +config COMMON_CLK_HI655X
> +	tristate "Clock driver for Hi655x"
> +	depends on MFD_HI655X_PMIC

Plus an || COMPILE_TEST? Or would it not compile without some
sort of PMIC define?

> +	---help---
> +	  This driver supports the hi655x PMIC clock. This
> +	  multi-function device has one fixed-rate oscillator, clocked
> +	  at 32KHz.
> +
>  config COMMON_CLK_SCPI
>  	tristate "Clock driver controlled via SCPI interface"
>  	depends on ARM_SCPI_PROTOCOL || COMPILE_TEST
> diff --git a/drivers/clk/clk-hi655x.c b/drivers/clk/clk-hi655x.c
> new file mode 100644
> index 0000000..f827d76
> --- /dev/null
> +++ b/drivers/clk/clk-hi655x.c
> @@ -0,0 +1,145 @@
> +/* Clock driver for Hi655x
> + *
> + * Copyright (c) 2016, Linaro Ltd.
> + *
> + * Author: Daniel Lezcano <daniel.lezcano@linaro.org>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/clkdev.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/hi655x-pmic.h>
> +
> +#define HI655X_CLK_BASE	HI655X_BUS_ADDR(0x1c)
> +#define HI655X_CLK_SET	BIT(6)
> +
> +struct hi655x_clk {
> +	struct hi655x_pmic *hi655x;
> +	struct clk_hw       clk_hw;
> +};
> +
> +static unsigned long hi655x_clk_recalc_rate(struct clk_hw *hw,
> +					    unsigned long parent_rate)
> +{
> +	return 32768;
> +}
> +
> +static int hi655x_clk_enable(struct clk_hw *hw, bool enable)
> +{
> +	struct hi655x_clk *hi655x_clk =
> +		container_of(hw, struct hi655x_clk, clk_hw);
> +
> +	struct hi655x_pmic *hi655x = hi655x_clk->hi655x;
> +
> +	return regmap_update_bits(hi655x->regmap, HI655X_CLK_BASE,
> +				  HI655X_CLK_SET, enable ? HI655X_CLK_SET : 0);
> +}
> +
> +static int hi655x_clk_prepare(struct clk_hw *hw)
> +{
> +	return hi655x_clk_enable(hw, true);
> +}
> +
> +static void hi655x_clk_unprepare(struct clk_hw *hw)
> +{
> +	hi655x_clk_enable(hw, false);
> +}
> +
> +static int hi655x_clk_is_prepared(struct clk_hw *hw)
> +{
> +	struct hi655x_clk *hi655x_clk =
> +		container_of(hw, struct hi655x_clk, clk_hw);
> +	struct hi655x_pmic *hi655x = hi655x_clk->hi655x;
> +	int ret;
> +	uint32_t val;
> +
> +	ret = regmap_read(hi655x->regmap, HI655X_CLK_BASE, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	return (val & HI655X_CLK_BASE);

Useless parenthesis.

> +}
> +
> +static const struct clk_ops hi655x_clk_ops = {
> +	.prepare     = hi655x_clk_prepare,
> +	.unprepare   = hi655x_clk_unprepare,
> +	.is_prepared = hi655x_clk_is_prepared,
> +	.recalc_rate = hi655x_clk_recalc_rate,
> +};
> +
> +static struct clk_hw *of_clk_hi655x_get(struct of_phandle_args *clkspec,
> +					void *data)
> +{
> +	struct hi655x_clk *hi655x_clk = data;
> +
> +	return &hi655x_clk->clk_hw;
> +}

Just use of_clk_hw_simple_get()?

> +
> +static int hi655x_clk_probe(struct platform_device *pdev)
> +{
> +	struct device *parent = pdev->dev.parent;
> +	struct hi655x_pmic *hi655x = dev_get_drvdata(parent);
> +	struct clk_init_data *hi655x_clk_init;
> +	struct hi655x_clk *hi655x_clk;
> +	const char *clk_name = "hi655x-clk";

Why do we set it and then overwrite it?

> +	int ret;
> +
> +	hi655x_clk = devm_kzalloc(&pdev->dev, sizeof(*hi655x_clk), GFP_KERNEL);
> +	if (!hi655x_clk)
> +		return -ENOMEM;
> +
> +	hi655x_clk_init = devm_kzalloc(&pdev->dev, sizeof(*hi655x_clk_init), GFP_KERNEL);
> +	if (!hi655x_clk_init)
> +		return -ENOMEM;
> +
> +	ret = of_property_read_string_index(parent->of_node, "clock-output-names",
> +					    0, &clk_name);
> +	if (ret)
> +		return ret;
> +
> +	hi655x_clk_init->name	= clk_name;
> +	hi655x_clk_init->ops	= &hi655x_clk_ops;
> +
> +	hi655x_clk->clk_hw.init	= hi655x_clk_init;
> +	hi655x_clk->hi655x	= hi655x;
> +
> +	platform_set_drvdata(pdev, hi655x_clk);
> +
> +	ret = devm_clk_hw_register(&pdev->dev, &hi655x_clk->clk_hw);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_hw_register_clkdev(&hi655x_clk->clk_hw, clk_name, NULL);
> +	if (ret)
> +		return ret;
> +
> +	return of_clk_add_hw_provider(parent->of_node,
> +				      of_clk_hi655x_get, hi655x_clk);

We forgot to drop the clkdev here if this fails.

> +}
> +
> +static struct platform_driver hi655x_clk_driver = {
> +	.probe =  hi655x_clk_probe,
> +	.driver		= {
> +		.name	= "hi655x-clk",
> +	},
> +};

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

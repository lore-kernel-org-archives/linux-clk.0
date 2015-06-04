Return-Path: <sboyd@codeaurora.org>
Date: Thu, 4 Jun 2015 14:46:16 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sergej Sawazki <ce3a@gmx.de>
Cc: mturquette@linaro.org, jsarha@ti.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2] clk: add gpio controlled clock multiplexer
Message-ID: <20150604214616.GS676@codeaurora.org>
References: <1432458082-18299-1-git-send-email-ce3a@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1432458082-18299-1-git-send-email-ce3a@gmx.de>
List-ID: <linux-clk.vger.kernel.org>

On 05/24, Sergej Sawazki wrote:
> diff --git a/drivers/clk/clk-gpio-mux.c b/drivers/clk/clk-gpio-mux.c
> new file mode 100644
> index 0000000..8a91d42
> --- /dev/null
> +++ b/drivers/clk/clk-gpio-mux.c
> @@ -0,0 +1,227 @@
> +/*
> + * Author: Sergej Sawazki <ce3a@gmx.de>
> + * Based on clk-gpio-gate.c by Jyri Sarha and ti/mux.c by Tero Kristo
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * Gpio controlled clock multiplexer implementation
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>

What's module.h used for? We need export.h for the
EXPORT_SYMBOL_GPL usage though.

> +#include <linux/slab.h>
> +#include <linux/gpio.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/of_gpio.h>

Do we need the of_gpio include? We can't get everything we need
from gpio/consumer.h?

> +#include <linux/err.h>
> +#include <linux/device.h>
> +
[...]
> +/**
> + * clk_register_gpio_mux - register a gpio clock mux with the clock framework
> + * @dev: device that is registering this clock
> + * @name: name of this clock
> + * @parent_names: names of this clock's parents
> + * @num_parents: number of parents listed in @parent_names
> + * @gpiod: gpio descriptor to select the parent of this clock multiplexer
> + * @clk_flags: optional flags for basic clock
> + */
> +struct clk *clk_register_gpio_mux(struct device *dev, const char *name,
> +		const char **parent_names, u8 num_parents,
> +		struct gpio_desc *gpiod, unsigned long clk_flags)
> +{
> +	struct clk_gpio_mux *clk_gpio_mux;
> +	struct clk *clk;
> +	struct clk_init_data init = { NULL };

	struct clk_init_data init = { }

is preferred style.

> +	unsigned long gpio_flags;
> +	int err;
> +
> +	if (dev)
> +		clk_gpio_mux = devm_kzalloc(dev, sizeof(struct clk_gpio_mux),

	sizeof(*clk_gpio_mux)

is preferred style

> +				GFP_KERNEL);
> +	else
> +		clk_gpio_mux = kzalloc(sizeof(struct clk_gpio_mux), GFP_KERNEL);
> +

ditto.

> +	if (!clk_gpio_mux)
> +		return ERR_PTR(-ENOMEM);
> +
> +}
[...]
> +
> +struct clk_gpio_mux_delayed_register_data {
> +	struct device_node *node;
> +	struct mutex lock;
> +	struct clk *clk;
> +};
> +
> +static struct clk *of_clk_gpio_mux_delayed_register_get(
> +		struct of_phandle_args *clkspec,
> +		void *_data)
> +{
> +	struct clk_gpio_mux_delayed_register_data *data = _data;
> +	struct clk *clk;
> +	const char *clk_name = data->node->name;
> +	int i, num_parents;
> +	const char **parent_names;
> +	struct gpio_desc *gpiod;
> +	int gpio;
> +
> +	mutex_lock(&data->lock);
> +
> +	if (data->clk) {
> +		mutex_unlock(&data->lock);
> +		return data->clk;
> +	}
> +
> +	gpio = of_get_named_gpio_flags(data->node, "select-gpios", 0, NULL);
> +	if (!gpio_is_valid(gpio))
> +		goto err_gpio;
> +	gpiod = gpio_to_desc(gpio);
> +
> +	num_parents = of_clk_get_parent_count(data->node);
> +	if (num_parents != 2) {
> +		pr_err("mux-clock %s must have 2 parents\n", data->node->name);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	parent_names = kcalloc(num_parents, sizeof(char *), GFP_KERNEL);
> +	if (!parent_names) {
> +		kfree(parent_names);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	for (i = 0; i < num_parents; i++)
> +		parent_names[i] = of_clk_get_parent_name(data->node, i);
> +
> +	clk = clk_register_gpio_mux(NULL, clk_name, parent_names, num_parents,
> +			gpiod, 0);
> +	if (IS_ERR(clk)) {
> +		mutex_unlock(&data->lock);
> +		return clk;
> +	}
> +
> +	data->clk = clk;
> +	mutex_unlock(&data->lock);
> +
> +	return clk;
> +
> +err_gpio:
> +	mutex_unlock(&data->lock);
> +	if (gpio == -EPROBE_DEFER)
> +		pr_debug("%s: %s: GPIOs not yet available, retry later\n",
> +				clk_name, __func__);
> +	else
> +		pr_err("%s: %s: Can't get GPIOs\n",
> +				clk_name, __func__);
> +
> +	return ERR_PTR(gpio);
> +}
> +
> +/**
> + * of_gpio_mux_clk_setup() - Setup function for gpio controlled clock mux
> + */
> +void __init of_gpio_mux_clk_setup(struct device_node *node)
> +{
> +	struct clk_gpio_mux_delayed_register_data *data;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return;
> +
> +	data->node = node;
> +	mutex_init(&data->lock);
> +
> +	of_clk_add_provider(node, of_clk_gpio_mux_delayed_register_get, data);
> +}
> +EXPORT_SYMBOL_GPL(of_gpio_mux_clk_setup);
> +CLK_OF_DECLARE(gpio_mux_clk, "gpio-mux-clock", of_gpio_mux_clk_setup);

Please find a way to share most of this code with the other gpio
based clock provider. Putting the two types of gpio clocks into the
same file would probably work.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

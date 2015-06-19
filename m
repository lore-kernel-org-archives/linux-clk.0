Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:47300 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752261AbbFSATT (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Thu, 18 Jun 2015 20:19:19 -0400
Date: Thu, 18 Jun 2015 17:19:16 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sergej Sawazki <ce3a@gmx.de>
Cc: mturquette@linaro.org, jsarha@ti.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3] clk: add gpio controlled clock multiplexer
Message-ID: <20150619001916.GB22132@codeaurora.org>
References: <1433706264-30008-1-git-send-email-ce3a@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1433706264-30008-1-git-send-email-ce3a@gmx.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 06/07, Sergej Sawazki wrote:
> 
>  .../devicetree/bindings/clock/gpio-mux-clock.txt   |  19 ++
>  drivers/clk/Makefile                               |   2 +-
>  drivers/clk/clk-gpio-gate.c                        | 207 -------------
>  drivers/clk/clk-gpio.c                             | 332 +++++++++++++++++++++

Please don't rename the file in the same commit. First, rename
the file to clk-gpio.c in one patch, and then add the code for
the gate in another patch. I applied this patch and undid the
file rename so I could actually review the changes...

> diff --git a/drivers/clk/clk-gpio-gate.c b/drivers/clk/clk-gpio-gate.c
> index f564e624fb93..f2bd61015f13 100644
> --- a/drivers/clk/clk-gpio-gate.c
> +++ b/drivers/clk/clk-gpio-gate.c
> @@ -1,19 +1,20 @@
>  /*
>   * Copyright (C) 2013 - 2014 Texas Instruments Incorporated - http://www.ti.com
> - * Author: Jyri Sarha <jsarha@ti.com>
> + *
> + * Authors:
> + *    Jyri Sarha <jsarha@ti.com>
> + *    Sergej Sawazki <ce3a@gmx.de>
>   *
>   * This program is free software; you can redistribute it and/or modify
>   * it under the terms of the GNU General Public License version 2 as
>   * published by the Free Software Foundation.
>   *
> - * Gpio gated clock implementation
> + * Gpio controlled clock implementation
>   */
>  
>  #include <linux/clk-provider.h>
> -#include <linux/module.h>
> +#include <linux/export.h>
>  #include <linux/slab.h>
> -#include <linux/gpio.h>
> -#include <linux/gpio/consumer.h>

Seems like an odd removal. Aren't we a gpio consumer?

>  #include <linux/of_gpio.h>
>  #include <linux/err.h>
>  #include <linux/device.h>
> @@ -35,6 +36,7 @@ static int clk_gpio_gate_enable(struct clk_hw *hw)
>  	struct clk_gpio *clk = to_clk_gpio(hw);
>  
>  	gpiod_set_value(clk->gpiod, 1);
> +	pr_debug("%s: %s\n", __clk_get_name(hw->clk), __func__);

Looks like debugging noise, please remove.

>  
>  	return 0;
>  }
> @@ -44,6 +46,7 @@ static void clk_gpio_gate_disable(struct clk_hw *hw)
>  	struct clk_gpio *clk = to_clk_gpio(hw);
>  
>  	gpiod_set_value(clk->gpiod, 0);
> +	pr_debug("%s: %s\n", __clk_get_name(hw->clk), __func__);

Ditto.

>  }
>  
>  static int clk_gpio_gate_is_enabled(struct clk_hw *hw)
> @@ -61,24 +64,61 @@ const struct clk_ops clk_gpio_gate_ops = {
>  EXPORT_SYMBOL_GPL(clk_gpio_gate_ops);
>  
>  /**
> - * clk_register_gpio - register a gpip clock with the clock framework
> - * @dev: device that is registering this clock
> - * @name: name of this clock
> - * @parent_name: name of this clock's parent
> - * @gpio: gpio number to gate this clock
> - * @active_low: true if gpio should be set to 0 to enable clock
> - * @flags: clock flags
> + * DOC: basic clock multiplexer which can be controlled with a gpio output
> + * Traits of this clock:
> + * prepare - clk_prepare only ensures that parents are prepared
> + * rate - rate is only affected by parent switching.  No clk_set_rate support
> + * parent - parent is adjustable through clk_set_parent
>   */
> -struct clk *clk_register_gpio_gate(struct device *dev, const char *name,
> -		const char *parent_name, unsigned gpio, bool active_low,
> -		unsigned long flags)
> +
> +static u8 clk_gpio_mux_get_parent(struct clk_hw *hw)
> +{
> +	struct clk_gpio *clk = to_clk_gpio(hw);
> +
> +	return gpiod_get_value(clk->gpiod);
> +}
> +
> +static int clk_gpio_mux_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct clk_gpio *clk = to_clk_gpio(hw);
> +
> +	gpiod_set_value(clk->gpiod, index);
> +	pr_debug("%s: %s: index = %d\n",
> +			__clk_get_name(hw->clk), __func__, index);
> +

More debug noise? Please remove.

> +	return 0;
> +}
> +
> +const struct clk_ops clk_gpio_mux_ops = {
> +	.get_parent = clk_gpio_mux_get_parent,
> +	.set_parent = clk_gpio_mux_set_parent,
> +	.determine_rate = __clk_mux_determine_rate,
> +};
> +EXPORT_SYMBOL_GPL(clk_gpio_mux_ops);
> +
> +/**
> + * Register functions for gpio controlled clocks
> + */

This is not kernel-doc. Just lose the comment.

> +
> +static struct clk *clk_register_gpio(struct device *dev, const char *name,
> +		const char **parent_names, u8 num_parents, unsigned gpio,
> +		bool active_low, unsigned long flags,
> +		const struct clk_ops *clk_gpio_ops)
>  {
> -	struct clk_gpio *clk_gpio = NULL;
> -	struct clk *clk = ERR_PTR(-EINVAL);
> -	struct clk_init_data init = { NULL };
> +	struct clk_gpio *clk_gpio;
> +	struct clk *clk;
> +	struct clk_init_data init = {};
>  	unsigned long gpio_flags;
>  	int err;
>  
> +	if (dev)
> +		clk_gpio = devm_kzalloc(dev, sizeof(*clk_gpio),	GFP_KERNEL);
> +	else
> +		clk_gpio = kzalloc(sizeof(*clk_gpio), GFP_KERNEL);
> +
> +	if (!clk_gpio)
> +		return ERR_PTR(-ENOMEM);
> +
>  	if (active_low)
>  		gpio_flags = GPIOF_ACTIVE_LOW | GPIOF_OUT_INIT_HIGH;
>  	else
> @@ -88,69 +128,107 @@ struct clk *clk_register_gpio_gate(struct device *dev, const char *name,
>  		err = devm_gpio_request_one(dev, gpio, gpio_flags, name);
>  	else
>  		err = gpio_request_one(gpio, gpio_flags, name);
> -
>  	if (err) {
> -		pr_err("%s: %s: Error requesting clock control gpio %u\n",
> -		       __func__, name, gpio);
> +		if (err != -EPROBE_DEFER)
> +			pr_err("%s: %s: Error requesting GPIO %u\n",
> +					name, __func__, gpio);

These sorts of cleanups could be another patch too after or
before the file is renamed.

>  		return ERR_PTR(err);
>  	}
>  
> -	if (dev)
> -		clk_gpio = devm_kzalloc(dev, sizeof(struct clk_gpio),
> -					GFP_KERNEL);
> -	else
> -		clk_gpio = kzalloc(sizeof(struct clk_gpio), GFP_KERNEL);
> -
> -	if (!clk_gpio) {
> -		clk = ERR_PTR(-ENOMEM);
> -		goto clk_register_gpio_gate_err;
> -	}
> -
>  	init.name = name;
> -	init.ops = &clk_gpio_gate_ops;
> +	init.ops = clk_gpio_ops;
>  	init.flags = flags | CLK_IS_BASIC;
> -	init.parent_names = (parent_name ? &parent_name : NULL);
> -	init.num_parents = (parent_name ? 1 : 0);
> +	init.parent_names = parent_names;
> +	init.num_parents = num_parents;
>  
>  	clk_gpio->gpiod = gpio_to_desc(gpio);
>  	clk_gpio->hw.init = &init;
>  
> -	clk = clk_register(dev, &clk_gpio->hw);
> +	if (dev)
> +		clk = devm_clk_register(dev, &clk_gpio->hw);
> +	else
> +		clk = clk_register(NULL, &clk_gpio->hw);
>  
> -	if (!IS_ERR(clk))
> +	if (!IS_ERR(clk)) {
> +		pr_debug("%s: %s: Successful registration\n", name, __func__);

More noise. Please remove.

>  		return clk;
> +	}
>  
> -	if (!dev)
> +	if (!dev) {
>  		kfree(clk_gpio);
> -
> -clk_register_gpio_gate_err:
> -	if (!dev)
> -		gpio_free(gpio);
> +		gpiod_put(clk_gpio->gpiod);
> +	}
>  
>  	return clk;
>  }
> +
> +/**
> + * clk_register_gpio - register a gpip clock with the clock framework

s/gpip/gpio/

Needs a () after function name?

> + * @dev: device that is registering this clock
> + * @name: name of this clock
> + * @parent_name: name of this clock's parent
> + * @gpio: gpio number to gate this clock
> + * @active_low: true if gpio should be set to 0 to enable clock
> + * @flags: clock flags
> + */
> +struct clk *clk_register_gpio_gate(struct device *dev, const char *name,
> +		const char *parent_name, unsigned gpio, bool active_low,
> +		unsigned long flags)
> +{
> +	return clk_register_gpio(dev, name,
> +			(parent_name ? &parent_name : NULL),
> +			(parent_name ? 1 : 0), gpio, active_low, flags,
> +			&clk_gpio_gate_ops);
> +}
>  EXPORT_SYMBOL_GPL(clk_register_gpio_gate);
>  
> +/**
> + * clk_register_gpio_mux - register a gpio clock mux with the clock framework

Needs a () after function name?

> +
>  #ifdef CONFIG_OF
>  /**
> - * The clk_register_gpio_gate has to be delayed, because the EPROBE_DEFER
> + * clk_register_get has to be delayed, because -EPROBE_DEFER
>   * can not be handled properly at of_clk_init() call time.
>   */
>  
> -struct clk_gpio_gate_delayed_register_data {
> +struct clk_gpio_delayed_register_data {
> +	const char *gpio_name;
>  	struct device_node *node;
>  	struct mutex lock;
>  	struct clk *clk;
> +	struct clk *(*clk_register_get)(const char *name,
> +			const char **parent_names, u8 num_parents,
> +			unsigned gpio, bool active_low);
>  };
>  
> -static struct clk *of_clk_gpio_gate_delayed_register_get(
> -		struct of_phandle_args *clkspec,
> -		void *_data)
> +static struct clk *of_clk_gpio_delayed_register_get(
> +		struct of_phandle_args *clkspec, void *_data)
>  {
> -	struct clk_gpio_gate_delayed_register_data *data = _data;
> +	struct clk_gpio_delayed_register_data *data = _data;
>  	struct clk *clk;
> -	const char *clk_name = data->node->name;
> -	const char *parent_name;
> +	const char **parent_names;
> +	int i, num_parents;
>  	int gpio;
>  	enum of_gpio_flags of_flags;
>  
> @@ -161,20 +239,33 @@ static struct clk *of_clk_gpio_gate_delayed_register_get(
>  		return data->clk;
>  	}
>  
> -	gpio = of_get_named_gpio_flags(data->node, "enable-gpios", 0,
> -						&of_flags);
> +	gpio = of_get_named_gpio_flags(data->node, data->gpio_name, 0,
> +			&of_flags);
>  	if (gpio < 0) {
>  		mutex_unlock(&data->lock);
> -		if (gpio != -EPROBE_DEFER)
> -			pr_err("%s: %s: Can't get 'enable-gpios' DT property\n",
> -			       __func__, clk_name);
> +		if (gpio == -EPROBE_DEFER)
> +			pr_debug("%s: %s: GPIOs not yet available, retry later\n",
> +					data->node->name, __func__);
> +		else
> +			pr_err("%s: %s: Can't get '%s' DT property\n",
> +					data->node->name, __func__,
> +					data->gpio_name);
>  		return ERR_PTR(gpio);
>  	}
>  
> -	parent_name = of_clk_get_parent_name(data->node, 0);
> +	num_parents = of_clk_get_parent_count(data->node);
>  
> -	clk = clk_register_gpio_gate(NULL, clk_name, parent_name, gpio,
> -					of_flags & OF_GPIO_ACTIVE_LOW, 0);
> +	parent_names = kcalloc(num_parents, sizeof(char *), GFP_KERNEL);
> +	if (!parent_names) {
> +		kfree(parent_names);

Huh? Didn't alloc just fail?

> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	for (i = 0; i < num_parents; i++)
> +		parent_names[i] = of_clk_get_parent_name(data->node, i);
> +
> +	clk = data->clk_register_get(data->node->name, parent_names,
> +			num_parents, gpio, of_flags & OF_GPIO_ACTIVE_LOW);
>  	if (IS_ERR(clk)) {
>  		mutex_unlock(&data->lock);
>  		return clk;
> @@ -186,22 +277,56 @@ static struct clk *of_clk_gpio_gate_delayed_register_get(
>  	return clk;
>  }
>  
> +static struct clk *of_clk_gpio_gate_delayed_register_get(const char *name,
> +		const char **parent_names, u8 num_parents,
> +		unsigned gpio, bool active_low)
> +{
> +	return clk_register_gpio_gate(NULL, name, parent_names[0],
> +			gpio, active_low, 0);
> +}
> +
> +static struct clk *of_clk_gpio_mux_delayed_register_get(const char *name,
> +		const char **parent_names, u8 num_parents, unsigned gpio,
> +		bool active_low)
> +{
> +	return clk_register_gpio_mux(NULL, name, parent_names, num_parents,
> +			gpio, active_low, 0);
> +}
> +
>  /**
> - * of_gpio_gate_clk_setup() - Setup function for gpio controlled clock
> + * Setup functions for gpio controlled clocks

Maybe drop this comment too.

>   */
> -static void __init of_gpio_gate_clk_setup(struct device_node *node)
> +static void __init of_gpio_clk_setup(struct device_node *node,
> +		const char *gpio_name,
> +		struct clk *(*clk_register_get)(const char *name,
> +				const char **parent_names, u8 num_parents,
> +				unsigned gpio, bool active_low))
>  {
> -	struct clk_gpio_gate_delayed_register_data *data;
> +	struct clk_gpio_delayed_register_data *data;
>  
> -	data = kzalloc(sizeof(struct clk_gpio_gate_delayed_register_data),
> -		       GFP_KERNEL);
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
>  	if (!data)
>  		return;
>  
>  	data->node = node;
> +	data->gpio_name = gpio_name;
> +	data->clk_register_get = clk_register_get;
>  	mutex_init(&data->lock);
>  
> -	of_clk_add_provider(node, of_clk_gpio_gate_delayed_register_get, data);
> +	of_clk_add_provider(node, of_clk_gpio_delayed_register_get, data);
> +}
> +
> +static void __init of_gpio_gate_clk_setup(struct device_node *node)
> +{
> +	of_gpio_clk_setup(node, "enable-gpios",
> +		of_clk_gpio_gate_delayed_register_get);
>  }
>  CLK_OF_DECLARE(gpio_gate_clk, "gpio-gate-clock", of_gpio_gate_clk_setup);
> +
> +void __init of_gpio_mux_clk_setup(struct device_node *node)
> +{
> +	of_gpio_clk_setup(node, "select-gpios",
> +		of_clk_gpio_mux_delayed_register_get);
> +}
> +CLK_OF_DECLARE(gpio_mux_clk, "gpio-mux-clock", of_gpio_mux_clk_setup);
>  #endif

Actually I really hate this whole probe defer workaround that we
have here. It seems like it would be a better approach to turn
this file into a platform driver that has the two compatibles
"gpio-gate-clock" and "gpio-mux-clock". Then we can defer probe
of the driver until the gpio provider is available. It would also
require us to fix the framework to properly support probe defer
though, so we shouldn't do this right now. Instead we should do
it after we fix the framework.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

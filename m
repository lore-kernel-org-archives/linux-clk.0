Return-Path: <sboyd@codeaurora.org>
Date: Thu, 21 May 2015 12:31:42 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Sergej Sawazki <ce3a@gmx.de>
Cc: mturquette@linaro.org, jsarha@ti.com, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH RFC v1] clk: add gpio controlled clock multiplexer
Message-ID: <20150521193142.GD21195@codeaurora.org>
References: <1431596413-20917-1-git-send-email-ce3a@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1431596413-20917-1-git-send-email-ce3a@gmx.de>
List-ID: <linux-clk.vger.kernel.org>

On 05/14, Sergej Sawazki wrote:
> diff --git a/drivers/clk/clk-gpio-mux.c b/drivers/clk/clk-gpio-mux.c
> new file mode 100644
> index 0000000..9e41e92
> --- /dev/null
> +++ b/drivers/clk/clk-gpio-mux.c
[..]
> +static int clk_gpio_mux_enable(struct clk_hw *hw)
> +{
> +	struct clk_gpio_mux *clk = to_clk_gpio_mux(hw);
> +
> +	if (!clk->gpiod_ena) {
> +		pr_err("%s: %s: DT property 'enable-gpios' not defined\n",
> +				__func__, __clk_get_name(hw->clk));
> +		return -ENOENT;
> +	}

It would be better to have separate clk_ops for the case where
there isn't a gpiod_ena gpio. Also, this driver isn't DT
specific, so the error message is misleading.

> +
> +	gpiod_set_value(clk->gpiod_ena, 1);
> +
> +	return 0;
> +}
> +
> +static int clk_gpio_mux_is_enabled(struct clk_hw *hw)
> +{
> +	struct clk_gpio_mux *clk = to_clk_gpio_mux(hw);
> +
> +	if (!clk->gpiod_ena) {
> +		pr_err("%s: %s: DT property 'enable-gpios' not defined\n",
> +				__func__, __clk_get_name(hw->clk));
> +		return -EINVAL;
> +	}
> +
> +	return gpiod_get_value(clk->gpiod_ena);
> +}
> +
> +static u8 clk_gpio_mux_get_parent(struct clk_hw *hw)
> +{
> +	struct clk_gpio_mux *clk = to_clk_gpio_mux(hw);
> +
> +	return gpiod_get_value(clk->gpiod_sel);
> +}
> +
> +static int clk_gpio_mux_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct clk_gpio_mux *clk = to_clk_gpio_mux(hw);
> +
> +	if (index > 1)
> +		return -EINVAL;

Doesn't seem possible if num_parents is correct. Please drop.

> +
> +	gpiod_set_value(clk->gpiod_sel, index);
> +
> +	return 0;
> +}
> +
[...]
> +/**
> + * clk_register_gpio_mux - register a gpio clock mux with the clock framework
> + * @dev: device that is registering this clock
> + * @name: name of this clock
> + * @parent_names: names of this clock's parents
> + * @num_parents: number of parents listed in @parent_names
> + * @gpiod_sel: gpio descriptor to select the parent of this clock multiplexer
> + * @gpiod_ena: gpio descriptor to enable the output of this clock multiplexer
> + * @clk_flags: optional flags for basic clock
> + */
> +struct clk *clk_register_gpio_mux(struct device *dev, const char *name,
> +		const char **parent_names, u8 num_parents,
> +		struct gpio_desc *gpiod_sel, struct gpio_desc *gpiod_ena,
> +		unsigned long clk_flags)
> +{
> +	struct clk_gpio_mux *clk_gpio_mux = NULL;
> +	struct clk *clk = ERR_PTR(-EINVAL);
> +	struct clk_init_data init = { NULL };
> +	unsigned long gpio_sel_flags, gpio_ena_flags;
> +	int err;
> +
> +	if (dev)
> +		clk_gpio_mux = devm_kzalloc(dev, sizeof(struct clk_gpio_mux),
> +				GFP_KERNEL);
> +	else
> +		clk_gpio_mux = kzalloc(sizeof(struct clk_gpio_mux), GFP_KERNEL);
> +
> +	if (!clk_gpio_mux)
> +		return ERR_PTR(-ENOMEM);
> +
> +	if (gpiod_is_active_low(gpiod_sel))
> +		gpio_sel_flags = GPIOF_OUT_INIT_HIGH;
> +	else
> +		gpio_sel_flags = GPIOF_OUT_INIT_LOW;
> +
> +	if (dev)
> +		err = devm_gpio_request_one(dev, desc_to_gpio(gpiod_sel),
> +				gpio_sel_flags, name);
> +	else
> +		err = gpio_request_one(desc_to_gpio(gpiod_sel),
> +				gpio_sel_flags, name);
> +
> +	if (err) {
> +		pr_err("%s: %s: Error requesting gpio %u\n",
> +				__func__, name, desc_to_gpio(gpiod_sel));

What if the error is probe defer? We should be silent in such a
situation. I see this is mostly copy/paste from gpio-gate.c so
perhaps we should fix that one too.

> +		return ERR_PTR(err);
> +	}
> +	clk_gpio_mux->gpiod_sel = gpiod_sel;
> +
> +	if (gpiod_ena != NULL) {

Style nitpick:

	if (gpiod_ena) {

is preferred.

> +		if (gpiod_is_active_low(gpiod_ena))
> +			gpio_ena_flags = GPIOF_OUT_INIT_HIGH;
> +		else
> +			gpio_ena_flags = GPIOF_OUT_INIT_LOW;
> +
> +		if (dev)
> +			err = devm_gpio_request_one(dev,
> +					desc_to_gpio(gpiod_ena),
> +					gpio_ena_flags, name);
> +		else
> +			err = gpio_request_one(desc_to_gpio(gpiod_ena),
> +					gpio_ena_flags, name);
> +
> +		if (err) {
> +			pr_err("%s: %s: Error requesting gpio %u\n",
> +					__func__, name,
> +					desc_to_gpio(gpiod_ena));
> +			return ERR_PTR(err);
> +		}
> +		clk_gpio_mux->gpiod_ena = gpiod_ena;
> +	}
> +
> +	init.name = name;
> +	init.ops = &clk_gpio_mux_ops;
> +	init.flags = clk_flags | CLK_IS_BASIC;
> +	init.parent_names = parent_names;
> +	init.num_parents = num_parents;

Should we make sure num_parents is 2?

> +
> +	clk_gpio_mux->hw.init = &init;
> +
> +	clk = clk_register(dev, &clk_gpio_mux->hw);

But no if (dev) devm_*() trick here?

> +
> +	if (!IS_ERR(clk))
> +		return clk;
> +
> +	if (!dev) {
> +		kfree(clk_gpio_mux);
> +		gpiod_put(gpiod_ena);

Isn't gpiod_ena optional? And so calling gpiod_put() here might
cause a warning?

Actually I wonder why we wouldn't just make this a gpio-mux
without enable/disable support? If we want to do enable/disable,
we can parent the gpio gate to this mux. Alternatively, we could
combine the gpio-gate file and this new mux file into one file
and support both compatible strings. There's quite a bit of
duplicated code so this may be a better approach.

> +		gpiod_put(gpiod_sel);
> +	}
> +
> +	return clk;
> +}
> +EXPORT_SYMBOL_GPL(clk_register_gpio_mux);
> +
> +#ifdef CONFIG_OF
> +/**
> + * The clk_register_gpio_mux has to be delayed, because the EPROBE_DEFER
> + * can not be handled properly at of_clk_init() call time.
> + */
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
> +	struct clk *clk = ERR_PTR(-EINVAL);
> +	const char *clk_name = data->node->name;
> +	int i, num_parents;
> +	const char **parent_names;
> +	struct gpio_desc *gpiod_sel, *gpiod_ena;
> +	int gpio;
> +	u32 flags = 0;

This is only used on place and never assigned otherwise, why not
just use 0 in place of flags?

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
> +	gpiod_sel = gpio_to_desc(gpio);
> +
> +	gpio = of_get_named_gpio_flags(data->node, "enable-gpios", 0, NULL);
> +	if (!gpio_is_valid(gpio)) {
> +		if (gpio != -ENOENT)
> +			goto err_gpio;
> +		else
> +			gpiod_ena = NULL;
> +	} else {
> +		gpiod_ena = gpio_to_desc(gpio);
> +	}
> +
> +	num_parents = of_clk_get_parent_count(data->node);
> +	if (num_parents < 2) {

Should that be num_parents != 2?

> +		pr_err("mux-clock %s must have 2 parents\n", data->node->name);
> +		return clk;
> +	}
> +
> +	parent_names = kzalloc((sizeof(char *) * num_parents), GFP_KERNEL);

kcalloc() please.

> +	if (!parent_names) {
> +		kfree(parent_names);
> +		return clk;
> +	}
> +
> +	for (i = 0; i < num_parents; i++)
> +		parent_names[i] = of_clk_get_parent_name(data->node, i);
> +
> +	clk = clk_register_gpio_mux(NULL, clk_name, parent_names, num_parents,
> +			gpiod_sel, gpiod_ena, flags);
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
> +		pr_warn("%s: %s: GPIOs not yet available, retry later\n",
> +				__func__, clk_name);

pr_debug

> +	else
> +		pr_err("%s: %s: Can't get GPIOs\n",
> +				__func__, clk_name);
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
> +	data = kzalloc(sizeof(struct clk_gpio_mux_delayed_register_data),

please use kzalloc(sizeof(*data), GFP_KERNEL); style

> +			GFP_KERNEL);
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
> +#endif

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

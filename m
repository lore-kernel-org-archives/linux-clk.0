Return-Path: <ce3a@gmx.de>
Message-ID: <5560D553.70809@gmx.de>
Date: Sat, 23 May 2015 21:30:27 +0200
From: Sergej Sawazki <ce3a@gmx.de>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: mturquette@linaro.org, jsarha@ti.com, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH RFC v1] clk: add gpio controlled clock multiplexer
References: <1431596413-20917-1-git-send-email-ce3a@gmx.de> <20150521193142.GD21195@codeaurora.org>
In-Reply-To: <20150521193142.GD21195@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Stephen, thanks for the review...

On 21.05.2015 at 21:31 Stephen Boyd wrote:
>> +static int clk_gpio_mux_set_parent(struct clk_hw *hw, u8 index)
>> +{
>> +	struct clk_gpio_mux *clk = to_clk_gpio_mux(hw);
>> +
>> +	if (index > 1)
>> +		return -EINVAL;
>
> Doesn't seem possible if num_parents is correct. Please drop.
>

Right, thanks.

>> +	if (err) {
>> +		pr_err("%s: %s: Error requesting gpio %u\n",
>> +				__func__, name, desc_to_gpio(gpiod_sel));
>
> What if the error is probe defer? We should be silent in such a
> situation. I see this is mostly copy/paste from gpio-gate.c so
> perhaps we should fix that one too.
>

Agreed.

>> +		return ERR_PTR(err);
>> +	}
>> +	clk_gpio_mux->gpiod_sel = gpiod_sel;
>> +
>> +	if (gpiod_ena != NULL) {
>
> Style nitpick:
>
> 	if (gpiod_ena) {
>
> is preferred.
>

Agreed.

>> +			return ERR_PTR(err);
>> +		}
>> +		clk_gpio_mux->gpiod_ena = gpiod_ena;
>> +	}
>> +
>> +	init.name = name;
>> +	init.ops = &clk_gpio_mux_ops;
>> +	init.flags = clk_flags | CLK_IS_BASIC;
>> +	init.parent_names = parent_names;
>> +	init.num_parents = num_parents;
>
> Should we make sure num_parents is 2?
>

You are probably right.

>> +
>> +	clk_gpio_mux->hw.init = &init;
>> +
>> +	clk = clk_register(dev, &clk_gpio_mux->hw);
>
> But no if (dev) devm_*() trick here?
>

Oh, right.

>> +
>> +	if (!IS_ERR(clk))
>> +		return clk;
>> +
>> +	if (!dev) {
>> +		kfree(clk_gpio_mux);
>> +		gpiod_put(gpiod_ena);
>
> Isn't gpiod_ena optional? And so calling gpiod_put() here might
> cause a warning?
>

Oops, right.

> Actually I wonder why we wouldn't just make this a gpio-mux
> without enable/disable support? If we want to do enable/disable,
> we can parent the gpio gate to this mux. Alternatively, we could
> combine the gpio-gate file and this new mux file into one file
> and support both compatible strings. There's quite a bit of
> duplicated code so this may be a better approach.
>

I agree, I am going to remove the enable/disable support.

>> +static struct clk *of_clk_gpio_mux_delayed_register_get(
>> +		struct of_phandle_args *clkspec,
>> +		void *_data)
>> +{
>> +	struct clk_gpio_mux_delayed_register_data *data = _data;
>> +	struct clk *clk = ERR_PTR(-EINVAL);
>> +	const char *clk_name = data->node->name;
>> +	int i, num_parents;
>> +	const char **parent_names;
>> +	struct gpio_desc *gpiod_sel, *gpiod_ena;
>> +	int gpio;
>> +	u32 flags = 0;
>
> This is only used on place and never assigned otherwise, why not
> just use 0 in place of flags?
>

Well, you are probably right, I thought it is better to define it here,
than to use a magic number in clk_register_gpio_mux().

>> +
>> +	num_parents = of_clk_get_parent_count(data->node);
>> +	if (num_parents < 2) {
>
> Should that be num_parents != 2?
>

Oops, right.

>> +		pr_err("mux-clock %s must have 2 parents\n", data->node->name);
>> +		return clk;
>> +	}
>> +
>> +	parent_names = kzalloc((sizeof(char *) * num_parents), GFP_KERNEL);
>
> kcalloc() please.
>

OK.

>> +err_gpio:
>> +	mutex_unlock(&data->lock);
>> +	if (gpio == -EPROBE_DEFER)
>> +		pr_warn("%s: %s: GPIOs not yet available, retry later\n",
>> +				__func__, clk_name);
>
> pr_debug
>

OK.

>> +	else
>> +		pr_err("%s: %s: Can't get GPIOs\n",
>> +				__func__, clk_name);
>> +	return ERR_PTR(gpio);
>> +}
>> +
>> +/**
>> + * of_gpio_mux_clk_setup() - Setup function for gpio controlled clock mux
>> + */
>> +void __init of_gpio_mux_clk_setup(struct device_node *node)
>> +{
>> +	struct clk_gpio_mux_delayed_register_data *data;
>> +
>> +	data = kzalloc(sizeof(struct clk_gpio_mux_delayed_register_data),
>
> please use kzalloc(sizeof(*data), GFP_KERNEL); style
>

OK.

Best regards,
Sergej

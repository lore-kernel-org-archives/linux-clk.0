Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <CALcgO_7+iDr6FvaUjXdRWXpTpHu8shVKS6nqQ6i9gC=9TmfBGw@mail.gmail.com>
References: <CALcgO_7+iDr6FvaUjXdRWXpTpHu8shVKS6nqQ6i9gC=9TmfBGw@mail.gmail.com>
Date: Tue, 8 Sep 2015 10:41:26 +0200
Message-ID: <CACRpkdae38kNCPD8ZtOak5=37ZEpWS=fNKU1kq0WJ2M2k5J6tw@mail.gmail.com>
Subject: Re: [RFC] Allow for gate and mux control using non-atomic GPIO
From: Linus Walleij <linus.walleij@linaro.org>
To: Michael Allwright <michael.allwright@upb.de>
Cc: Jyri Sarha <jsarha@ti.com>, ce3a@gmx.de, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Tue, Aug 18, 2015 at 5:40 PM, Michael Allwright
<michael.allwright@upb.de> wrote:

> The current implementation of clk-gpio completely ignores the use case
> where GPIO pins may be accessed over a message based bus like SPI or
> I2C. To fix this, and following the comments in clk.h, we should use
> the prepare/unprepare methods to do the work where the GPIO operation
> would be non-atomic. I propose the following UNTESTED patch (should
> apply cleanly over linux-next).
>
> From 7a21c155e561d84741ce11f0cc4c1f8c5b97d7dc Mon Sep 17 00:00:00 2001
> From: Michael Allwright <allsey87@gmail.com>
> Date: Tue, 18 Aug 2015 17:26:34 +0200
> Subject: [PATCH] Allow non-atomic GPIO ops to control gates and muxes.
>  Following the comments in clk.h, use prepare/unprepare methods to do the GPIO
>  work in cases where the specified pin can sleep

Don't put the entire commit description in the subject.

One line subject, like:

clk: gpio: handle non-atomic GPIO access
<blank line>
Detailed commit message.

> +static int clk_gpio_gate_prepare(struct clk_hw *hw)
> +{
> +    struct clk_gpio *clk = to_clk_gpio(hw);
> +
> +    gpiod_set_value_cansleep(clk->gpiod, 1);
> +
> +    return 0;
> +}
> +
> +static void clk_gpio_gate_unprepare(struct clk_hw *hw)
> +{
> +    struct clk_gpio *clk = to_clk_gpio(hw);
> +
> +    gpiod_set_value_cansleep(clk->gpiod, 0);
> +}
> +
> +static int clk_gpio_gate_is_prepared(struct clk_hw *hw)
> +{
> +    struct clk_gpio *clk = to_clk_gpio(hw);
> +
> +    return gpiod_get_value_cansleep(clk->gpiod);
> +}

Looks correct.

>  const struct clk_ops clk_gpio_gate_ops = {
>      .enable = clk_gpio_gate_enable,
>      .disable = clk_gpio_gate_disable,
> @@ -63,6 +86,14 @@ const struct clk_ops clk_gpio_gate_ops = {
>  };
>  EXPORT_SYMBOL_GPL(clk_gpio_gate_ops);
>
> +const struct clk_ops clk_sleepable_gpio_gate_ops = {
> +    .enable = clk_gpio_gate_prepare,
> +    .disable = clk_gpio_gate_unprepare,
> +    .is_enabled = clk_gpio_gate_is_prepared,
> +};
> +EXPORT_SYMBOL_GPL(clk_sleepable_gpio_gate_ops);

Does any of these really need to be exported?
If not, just remove the export, mark static  and make the other one
static too.

> @@ -75,14 +106,14 @@ static u8 clk_gpio_mux_get_parent(struct clk_hw *hw)
>  {
>      struct clk_gpio *clk = to_clk_gpio(hw);
>
> -    return gpiod_get_value(clk->gpiod);
> +    return gpiod_get_value_cansleep(clk->gpiod);
>  }
>
>  static int clk_gpio_mux_set_parent(struct clk_hw *hw, u8 index)
>  {
>      struct clk_gpio *clk = to_clk_gpio(hw);
>
> -    gpiod_set_value(clk->gpiod, index);
> +    gpiod_set_value_cansleep(clk->gpiod, index);

Are these muxing calls always done in sleepable context?
(Just checking...)

> +    if(gpio_cansleep(gpio))

Space after if()

> +        return clk_register_gpio(dev, name,
> +                (parent_name ? &parent_name : NULL),
> +                (parent_name ? 1 : 0), gpio, active_low, flags,
> +                &clk_sleepable_gpio_gate_ops);
> +    else
> +        return clk_register_gpio(dev, name,

Something weird about indentation. Did you run checkpatch?

> +                (parent_name ? &parent_name : NULL),
> +                (parent_name ? 1 : 0), gpio, active_low, flags,
> +                &clk_gpio_gate_ops);
> +

Apart from that it looks good.

Yours,
Linus Walleij

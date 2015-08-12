Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:35034 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750735AbbHLMUi (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 12 Aug 2015 08:20:38 -0400
Received: by obbop1 with SMTP id op1so11117040obb.2
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2015 05:20:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALcgO_49YPGoCOv23Vz9vbnq9+AN3WqvYyg9_TtvsQcz8ia2Hw@mail.gmail.com>
References: <CALcgO_49YPGoCOv23Vz9vbnq9+AN3WqvYyg9_TtvsQcz8ia2Hw@mail.gmail.com>
Date: Wed, 12 Aug 2015 14:20:37 +0200
Message-ID: <CACRpkdYWD-XGqeZ_66i_AtG7h1M8JcbWHy-bLwjZNRSZqQmT=Q@mail.gmail.com>
Subject: Re: [PATCH RFC] clk-gpio-gate: use prepare/unprepare to do the GPIO work
From: Linus Walleij <linus.walleij@linaro.org>
To: Michael Allwright <michael.allwright@upb.de>
Cc: Jyri Sarha <jsarha@ti.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Aug 10, 2015 at 4:50 PM, Michael Allwright
<michael.allwright@upb.de> wrote:

> From 19512587a6799c3cb96dc3f95d989b7c778a6f8c Mon Sep 17 00:00:00 2001
> From: Michael Allwright <allsey87@gmail.com>
> Date: Mon, 10 Aug 2015 16:44:05 +0200
> Subject: [PATCH] clk-gpio-gate: use prepare/unprepare ops to control clock
>  enabling via gpiod_set_value_cansleep. This allows for GPIO expanders on I2C
>  and SPI buses

Wut, the whole commit message in subject?

Did you forget to add a newline XD

>  static int clk_gpio_gate_enable(struct clk_hw *hw)
>  {
> +    return 0;
> +}
> +
> +static void clk_gpio_gate_disable(struct clk_hw *hw)
> +{
> +}
> +
> +static int clk_gpio_gate_is_enabled(struct clk_hw *hw)
> +{
> +    return 0;
> +}
> +
> +static int clk_gpio_gate_prepare(struct clk_hw *hw)
> +{
>      struct clk_gpio *clk = to_clk_gpio(hw);
>
> -    gpiod_set_value(clk->gpiod, 1);
> +    gpiod_set_value_cansleep(clk->gpiod, 1);
>
>      return 0;
>  }
>
> -static void clk_gpio_gate_disable(struct clk_hw *hw)
> +static void clk_gpio_gate_unprepare(struct clk_hw *hw)
>  {
>      struct clk_gpio *clk = to_clk_gpio(hw);
>
> -    gpiod_set_value(clk->gpiod, 0);
> +    gpiod_set_value_cansleep(clk->gpiod, 0);
>  }
>
> -static int clk_gpio_gate_is_enabled(struct clk_hw *hw)
> +static int clk_gpio_gate_is_prepared(struct clk_hw *hw)
>  {
>      struct clk_gpio *clk = to_clk_gpio(hw);
>
> -    return gpiod_get_value(clk->gpiod);
> +    return gpiod_get_value_cansleep(clk->gpiod);
>  }

Naaaaaahh that is a too boring solution.

I would prefer it to be smart like this, keep the original function
names then in clk_register_gpio_gate():

const struct clk_ops clk_gpio_fastpath_gate_ops = {
        .enable = clk_gpio_gate_enable,
        .disable = clk_gpio_gate_disable,
        .is_enabled = clk_gpio_gate_is_enabled,
};

const struct clk_ops clk_gpio_sleep_gate_ops = {
        .prepare = clk_gpio_gate_enable,
        .unprepare = clk_gpio_gate_disable,
        .is_enabled = clk_gpio_gate_is_enabled,
};

....
if (gpiod_cansleep(clk_gpio->gpiod))
    init.ops = &clk_gpio_sleep_gate_ops;
else
    init.ops = &clk_gpio_fastpath_gate_ops;

If you think it's confusing to have functions ending with
_enbable and _disable in the .prepare/.unprepare callbacks,
rename them ungate/gate or something.

Extra bonus if you can make an additional cleanup patch that rids the
need to have GPIO numbers in this driver and just get GPIO
descriptors directly from DT or whatever instead.

Yours,
Linus Walleij

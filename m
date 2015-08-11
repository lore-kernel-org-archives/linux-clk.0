Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from arroyo.ext.ti.com ([192.94.94.40]:52854 "EHLO arroyo.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752173AbbHKHZF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Tue, 11 Aug 2015 03:25:05 -0400
Message-ID: <55C9A349.8080807@ti.com>
Date: Tue, 11 Aug 2015 10:24:57 +0300
From: Jyri Sarha <jsarha@ti.com>
MIME-Version: 1.0
To: Michael Allwright <michael.allwright@upb.de>,
	<linux-clk@vger.kernel.org>
Subject: Re: [PATCH RFC] clk-gpio-gate: use prepare/unprepare to do the GPIO
 work
References: <CALcgO_49YPGoCOv23Vz9vbnq9+AN3WqvYyg9_TtvsQcz8ia2Hw@mail.gmail.com>
In-Reply-To: <CALcgO_49YPGoCOv23Vz9vbnq9+AN3WqvYyg9_TtvsQcz8ia2Hw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 08/10/15 17:50, Michael Allwright wrote:
>  From 19512587a6799c3cb96dc3f95d989b7c778a6f8c Mon Sep 17 00:00:00 2001
> From: Michael Allwright <allsey87@gmail.com>
> Date: Mon, 10 Aug 2015 16:44:05 +0200
> Subject: [PATCH] clk-gpio-gate: use prepare/unprepare ops to control clock
>   enabling via gpiod_set_value_cansleep. This allows for GPIO expanders on I2C
>   and SPI buses
>

Hi,
I sounds a bit weird if a clock gets turned on already at the prepare 
state, but I can see that this is the simples solution to your problem. 
Anyway, at least this should not be the default behavior. If this is 
really widely needed then adding a flag to device tree binding for 
changing the behavior would sound more feasible, but then again I am no 
common clock framework expert. Better to turn to CCF maintainers for that.

BTW, if you propose some clk-gpio-gate changes to mainline, you should 
know that the clk-gpio-gate.c was replaced with clk-gpio.c in 
linux-next. The new file contains both gpio-gate and gpio-mux 
functionality. I think this is the patch set was applied:
http://www.spinics.net/lists/linux-clk/msg01280.html

Best regards,
Jyri

> ---
>   drivers/clk/clk-gpio-gate.c | 31 ++++++++++++++++++++++++-------
>   1 file changed, 24 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/clk/clk-gpio-gate.c b/drivers/clk/clk-gpio-gate.c
> index a71cabe..432edd9 100644
> --- a/drivers/clk/clk-gpio-gate.c
> +++ b/drivers/clk/clk-gpio-gate.c
> @@ -22,8 +22,8 @@
>    * DOC: basic gpio gated clock which can be enabled and disabled
>    *      with gpio output
>    * Traits of this clock:
> - * prepare - clk_(un)prepare only ensures parent is (un)prepared
> - * enable - clk_enable and clk_disable are functional & control gpio
> + * prepare - clk_(un)prepare ensures parent is (un)prepared and control gpio
> + * enable - clk_enable and clk_disable only ensures parent is enabled/disabled
>    * rate - inherits rate from parent.  No clk_set_rate support
>    * parent - fixed parent.  No clk_set_parent support
>    */
> @@ -32,28 +32,45 @@
>
>   static int clk_gpio_gate_enable(struct clk_hw *hw)
>   {
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
>       struct clk_gpio *clk = to_clk_gpio(hw);
>
> -    gpiod_set_value(clk->gpiod, 1);
> +    gpiod_set_value_cansleep(clk->gpiod, 1);
>
>       return 0;
>   }
>
> -static void clk_gpio_gate_disable(struct clk_hw *hw)
> +static void clk_gpio_gate_unprepare(struct clk_hw *hw)
>   {
>       struct clk_gpio *clk = to_clk_gpio(hw);
>
> -    gpiod_set_value(clk->gpiod, 0);
> +    gpiod_set_value_cansleep(clk->gpiod, 0);
>   }
>
> -static int clk_gpio_gate_is_enabled(struct clk_hw *hw)
> +static int clk_gpio_gate_is_prepared(struct clk_hw *hw)
>   {
>       struct clk_gpio *clk = to_clk_gpio(hw);
>
> -    return gpiod_get_value(clk->gpiod);
> +    return gpiod_get_value_cansleep(clk->gpiod);
>   }
>
>   const struct clk_ops clk_gpio_gate_ops = {
> +    .prepare = clk_gpio_gate_prepare,
> +    .unprepare = clk_gpio_gate_unprepare,
> +    .is_prepared = clk_gpio_gate_is_prepared,
>       .enable = clk_gpio_gate_enable,
>       .disable = clk_gpio_gate_disable,
>       .is_enabled = clk_gpio_gate_is_enabled,
>


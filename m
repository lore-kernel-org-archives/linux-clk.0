Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.uni-paderborn.de ([131.234.142.9]:50644 "EHLO
	mail.uni-paderborn.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753129AbbHLOyO (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 12 Aug 2015 10:54:14 -0400
MIME-Version: 1.0
In-Reply-To: <CACRpkdYdgGYBRqeO4b0H17X5KE_qHrNtvZq-Y5TFqMzk8dPW+Q@mail.gmail.com>
References: <CALcgO_49YPGoCOv23Vz9vbnq9+AN3WqvYyg9_TtvsQcz8ia2Hw@mail.gmail.com>
	<CACRpkdYWD-XGqeZ_66i_AtG7h1M8JcbWHy-bLwjZNRSZqQmT=Q@mail.gmail.com>
	<CACRpkdYdgGYBRqeO4b0H17X5KE_qHrNtvZq-Y5TFqMzk8dPW+Q@mail.gmail.com>
Date: Wed, 12 Aug 2015 16:54:07 +0200
Message-ID: <CALcgO_7Oe6EzNimSMm2K4jX_+bh9Du5adGKMDGs4Lz5wo1r18g@mail.gmail.com>
Subject: Re: [PATCH RFC] clk-gpio-gate: use prepare/unprepare to do the GPIO work
From: Michael Allwright <michael.allwright@upb.de>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jyri Sarha <jsarha@ti.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 12 August 2015 at 14:23, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Aug 12, 2015 at 2:20 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>
>> I would prefer it to be smart like this, keep the original function
>> names then in clk_register_gpio_gate():
>>
>> const struct clk_ops clk_gpio_fastpath_gate_ops = {
>>         .enable = clk_gpio_gate_enable,
>>         .disable = clk_gpio_gate_disable,
>>         .is_enabled = clk_gpio_gate_is_enabled,
>> };
>>
>> const struct clk_ops clk_gpio_sleep_gate_ops = {
>>         .prepare = clk_gpio_gate_enable,
>>         .unprepare = clk_gpio_gate_disable,
>>         .is_enabled = clk_gpio_gate_is_enabled,
>> };
>>
>> ....
>> if (gpiod_cansleep(clk_gpio->gpiod))
>>     init.ops = &clk_gpio_sleep_gate_ops;
>> else
>>     init.ops = &clk_gpio_fastpath_gate_ops;
>>
>> If you think it's confusing to have functions ending with
>> _enbable and _disable in the .prepare/.unprepare callbacks,
>> rename them ungate/gate or something.
>
> Or well, since you use the *_cansleep() versions in the
> prepare/unprepare calls, maybe you need a double set
> of functions anyway. Mea culpa.
>
> But certainly it should register different callbacks
> depending on whether the pin may actually sleep
> or not, since we have this knowledge inside the GPIO
> library.
>
> Yours,
> Linus Walleij

That's a nice clean solution - I like it. I was considering using the
can sleep function of the GPIO subsystem to do this on the fly, but
didn't consider using two structs like that.

I need to take a look over at that has been done in linux-next with
clk-gpio and see if this selecting between gpio_set_value and
gpio_set_value_cansleep can be generalised to the gpio mux clock that
has been implemented...

Cheers,


Michael Allwright

PhD Student
Paderborn Institute for Advanced Studies in Computer Science and Engineering

University of Paderborn
Office-number 02-10
Zukunftsmeile 1
33102 Paderborn
Germany

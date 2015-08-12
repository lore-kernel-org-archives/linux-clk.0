Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:34889 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753321AbbHLMX0 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 12 Aug 2015 08:23:26 -0400
Received: by obbop1 with SMTP id op1so11166753obb.2
        for <linux-clk@vger.kernel.org>; Wed, 12 Aug 2015 05:23:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACRpkdYWD-XGqeZ_66i_AtG7h1M8JcbWHy-bLwjZNRSZqQmT=Q@mail.gmail.com>
References: <CALcgO_49YPGoCOv23Vz9vbnq9+AN3WqvYyg9_TtvsQcz8ia2Hw@mail.gmail.com>
	<CACRpkdYWD-XGqeZ_66i_AtG7h1M8JcbWHy-bLwjZNRSZqQmT=Q@mail.gmail.com>
Date: Wed, 12 Aug 2015 14:23:25 +0200
Message-ID: <CACRpkdYdgGYBRqeO4b0H17X5KE_qHrNtvZq-Y5TFqMzk8dPW+Q@mail.gmail.com>
Subject: Re: [PATCH RFC] clk-gpio-gate: use prepare/unprepare to do the GPIO work
From: Linus Walleij <linus.walleij@linaro.org>
To: Michael Allwright <michael.allwright@upb.de>
Cc: Jyri Sarha <jsarha@ti.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Aug 12, 2015 at 2:20 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

> I would prefer it to be smart like this, keep the original function
> names then in clk_register_gpio_gate():
>
> const struct clk_ops clk_gpio_fastpath_gate_ops = {
>         .enable = clk_gpio_gate_enable,
>         .disable = clk_gpio_gate_disable,
>         .is_enabled = clk_gpio_gate_is_enabled,
> };
>
> const struct clk_ops clk_gpio_sleep_gate_ops = {
>         .prepare = clk_gpio_gate_enable,
>         .unprepare = clk_gpio_gate_disable,
>         .is_enabled = clk_gpio_gate_is_enabled,
> };
>
> ....
> if (gpiod_cansleep(clk_gpio->gpiod))
>     init.ops = &clk_gpio_sleep_gate_ops;
> else
>     init.ops = &clk_gpio_fastpath_gate_ops;
>
> If you think it's confusing to have functions ending with
> _enbable and _disable in the .prepare/.unprepare callbacks,
> rename them ungate/gate or something.

Or well, since you use the *_cansleep() versions in the
prepare/unprepare calls, maybe you need a double set
of functions anyway. Mea culpa.

But certainly it should register different callbacks
depending on whether the pin may actually sleep
or not, since we have this knowledge inside the GPIO
library.

Yours,
Linus Walleij

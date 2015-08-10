Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20150803215129.GD21068@codeaurora.org>
References: <1438262352-29118-1-git-send-email-linus.walleij@linaro.org>
	<20150803215129.GD21068@codeaurora.org>
Date: Mon, 10 Aug 2015 10:46:02 +0200
Message-ID: <CACRpkdYdFAjRGMfsG4Kx=xNBACofcjFR3U1+P4U3yBmgQcFATQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk/ARM: delete the non-DT U8500 clock implementation
From: Linus Walleij <linus.walleij@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, Aug 3, 2015 at 11:51 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 07/30, Linus Walleij wrote:
>> This code is unused and not coming back. Let's kill it off.
>>
>> Cc: Ulf Hansson <ulf.hansson@linaro.org>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>> Mike/Ulf: please ACK this so I can take this in through ARM
>> SoC.
>> ---
>>  drivers/clk/ux500/Makefile              |   1 -
>>  drivers/clk/ux500/u8500_clk.c           | 526 --------------------------------
>
> There's a patch in -next against this file.
>
> commit a162ca912cf792073b0b2450377fd1cd5d5c6cb5
> Author: Stephen Boyd <sboyd@codeaurora.org>
> Date:   Fri Jun 19 15:00:46 2015 -0700
>
>     clk: ux500: Remove clk.h and clkdev.h includes
>
> so I wonder why we need to take this patch through arm-soc? Would
> an immutable branch from the clk tree work as well?

No you can actually apply it in isolation. I was just collecting
them in one spot for testing.

Can you please apply this directly to the clk tree and
fix any clashes?

Yours,
Linus Walleij

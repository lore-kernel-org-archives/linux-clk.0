Return-Path: <linus.walleij@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20150731065008.GU3159@codeaurora.org>
References: <1438172615-11276-1-git-send-email-linus.walleij@linaro.org>
	<20150731065008.GU3159@codeaurora.org>
Date: Fri, 31 Jul 2015 12:26:14 +0200
Message-ID: <CACRpkdbaGU8jMQY=WpkV0ZF_KfFCq167kWCD_CropJM10RC9QQ@mail.gmail.com>
Subject: Re: [PATCH] clk: versatile/impd1: switch order of CLCD clocks
From: Linus Walleij <linus.walleij@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jul 31, 2015 at 8:50 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> On 07/29, Linus Walleij wrote:
>> The CLCD clocks are registered in the wrong order: first the
>> APB clock, then the pixelclock. This should be the other way
>> around so the driver gets the pixelclock, not the APB clock,
>> when it asks for the first clock for the block.
>>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> ---
>
> Is this because the consumer driver is calling clk_get() with a
> NULL connection id for the pixelclock and then a more specific
> connection id for the apb clk?

Yes. Like most PrimeCells do.

> Where's the consumer driver?

The NULL (pixel) clock is taken by:
drivers/video/fbdev/amba-clcd.c

The APB "apb_pclk" clock is taken by:
drivers/amba/bus.c

Yours,
Linus Walleij

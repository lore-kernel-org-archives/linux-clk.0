Return-Path: <sboyd@codeaurora.org>
Date: Tue, 11 Aug 2015 18:25:30 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: versatile/impd1: switch order of CLCD clocks
Message-ID: <20150812012530.GJ26614@codeaurora.org>
References: <1438172615-11276-1-git-send-email-linus.walleij@linaro.org>
 <20150731065008.GU3159@codeaurora.org>
 <CACRpkdbaGU8jMQY=WpkV0ZF_KfFCq167kWCD_CropJM10RC9QQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CACRpkdbaGU8jMQY=WpkV0ZF_KfFCq167kWCD_CropJM10RC9QQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/31, Linus Walleij wrote:
> On Fri, Jul 31, 2015 at 8:50 AM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> > On 07/29, Linus Walleij wrote:
> >> The CLCD clocks are registered in the wrong order: first the
> >> APB clock, then the pixelclock. This should be the other way
> >> around so the driver gets the pixelclock, not the APB clock,
> >> when it asks for the first clock for the block.
> >>
> >> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> >> ---
> >
> > Is this because the consumer driver is calling clk_get() with a
> > NULL connection id for the pixelclock and then a more specific
> > connection id for the apb clk?
> 
> Yes. Like most PrimeCells do.
> 
> > Where's the consumer driver?
> 
> The NULL (pixel) clock is taken by:
> drivers/video/fbdev/amba-clcd.c
> 
> The APB "apb_pclk" clock is taken by:
> drivers/amba/bus.c
> 

Ok. I'm still confused and concerned that putting the clocks into
the list in a certain order fixes anything. I thought the purpose
of a NULL clkdev connection ID was to make it so that we didn't
match the apb_pclk lookup. Instead we find the second lookup for
the device with the wildcard connection id and use that. 

If this fix is valid, did you want a fixes tag on this so it goes
back to stable?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

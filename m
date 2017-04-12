Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-io0-f176.google.com ([209.85.223.176]:33960 "EHLO
        mail-io0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753209AbdDLHkk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Apr 2017 03:40:40 -0400
Received: by mail-io0-f176.google.com with SMTP id a103so31629537ioj.1
        for <linux-clk@vger.kernel.org>; Wed, 12 Apr 2017 00:40:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87lgr6ego2.fsf@eliezer.anholt.net>
References: <20170411011801.15788-1-eric@anholt.net> <CACRpkdacg9tR3n3V2cZ=S9yv-xb+rxLRv8mE8nXQLoja6zXd0g@mail.gmail.com>
 <87lgr6ego2.fsf@eliezer.anholt.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 12 Apr 2017 09:40:38 +0200
Message-ID: <CACRpkdZOY5jNB6UqwAufadE-FCRY2cyS1sU6UYMH9iFdSd7Lvw@mail.gmail.com>
Subject: Re: [PATCH v5] drm/pl111: Initial drm/kms driver for pl111
To: Eric Anholt <eric@anholt.net>,
        linux-clk <linux-clk@vger.kernel.org>
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Tom Cooksey <tom.cooksey@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mike Turquette <mturquette@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Apr 12, 2017 at 12:13 AM, Eric Anholt <eric@anholt.net> wrote:

> Oh, one last thing I think we need to figure out: I'm using TIM2_CLKSEL,
> which seems to be necessary on this platform.  My understanding is that
> this means that the pixel clock is divided from clcdclk instead of
> apb_pclk.  Do you agree?

Yes the pixed clock is always derived from clcdclk.

In most older ARM reference designs this is a VCO so that
is why there is a clk_set_rate() on this in the fbdev code.
(On some platforms that even has no effect I guess.)

> The fbdev driver is using
> clk_get(&fb->dev->dev, NULL) and not TIM2_CLKSEL, which I'm surprised by
> because I would have thought that would give us the first clock from the
> DT node (also clcdclk).

So that thing is a 1-bit line that can select one of two clocks
to be muxed into the PL111/CLCD.

I guess that up until now all platforms just left that line dangling in
the silicon. Congratulations, you came here first ;)

Though when I look at the Nomadik it seems that it might be muxing
the clock between 48 and 72 MHz, and I've been using 48MHz
all along ooopsie.

The current assumption in the bindings is that we have only
one clock and TIM2_CLKSEL is N/A.

If we want proper clcdclk handling with CLKSEL you should
probably add some code to implement a real mux clock for
this using <linux/clock-provider.h> and drivers/clk/clk-mux.c
with select COMMON_CLK
so that the driver still only sees clcdclk but that in turn is a
mux that can select one of two sources and will react to
the clk_set_rate() call by selecting the clock which is
closest in frequency to what you want.

This needs a small patch to alter the bindings too I guess.
A small clock node inside the CLCD, just like PCI bridges have
irqchips inside them etc:

clcd@10120000 {
        compatible = "arm,pl110", "arm,primecell";
        reg = <0x10120000 0x1000>;
        (...)
        clocks = <&clcdclk>, <&foo>;
        clock-names = "clcdclk", "apb_pclk";

        clcdclk: clock-controller@0 {
                compatible = "arm,pl11x-clock-mux";
                clocks = <&source_a>, <&source_b>;
        };
};

This can be set up easily in the OF probe path since that
is what we're doing: just look for this subnode, if it is there
create the clock controller.

I do not think the clk maintainers would mind a small mux
clock controller inside the CLCD driver to handle this mux
if we need it.

It would *maybe* also be possible to add a second "clcdclk2"
to the block and make an educated decision on which clock
to use in the driver but that is not as elegant as using the
clock framework mux clock I think.

Yours,
Linus Walleij

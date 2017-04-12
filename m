Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:49538 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752544AbdDLXNV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Apr 2017 19:13:21 -0400
Date: Thu, 13 Apr 2017 00:13:11 +0100
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Eric Anholt <eric@anholt.net>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Tom Cooksey <tom.cooksey@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mike Turquette <mturquette@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH v5] drm/pl111: Initial drm/kms driver for pl111
Message-ID: <20170412231311.GD17774@n2100.armlinux.org.uk>
References: <20170411011801.15788-1-eric@anholt.net>
 <CACRpkdacg9tR3n3V2cZ=S9yv-xb+rxLRv8mE8nXQLoja6zXd0g@mail.gmail.com>
 <87lgr6ego2.fsf@eliezer.anholt.net>
 <CACRpkdZOY5jNB6UqwAufadE-FCRY2cyS1sU6UYMH9iFdSd7Lvw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CACRpkdZOY5jNB6UqwAufadE-FCRY2cyS1sU6UYMH9iFdSd7Lvw@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Apr 12, 2017 at 09:40:38AM +0200, Linus Walleij wrote:
> On Wed, Apr 12, 2017 at 12:13 AM, Eric Anholt <eric@anholt.net> wrote:
> > Oh, one last thing I think we need to figure out: I'm using TIM2_CLKSEL,
> > which seems to be necessary on this platform.  My understanding is that
> > this means that the pixel clock is divided from clcdclk instead of
> > apb_pclk.  Do you agree?
> 
> Yes the pixed clock is always derived from clcdclk.
> 
> In most older ARM reference designs this is a VCO so that
> is why there is a clk_set_rate() on this in the fbdev code.
> (On some platforms that even has no effect I guess.)
> 
> > The fbdev driver is using
> > clk_get(&fb->dev->dev, NULL) and not TIM2_CLKSEL, which I'm surprised by
> > because I would have thought that would give us the first clock from the
> > DT node (also clcdclk).
> 
> So that thing is a 1-bit line that can select one of two clocks
> to be muxed into the PL111/CLCD.
> 
> I guess that up until now all platforms just left that line dangling in
> the silicon. Congratulations, you came here first ;)
> 
> Though when I look at the Nomadik it seems that it might be muxing
> the clock between 48 and 72 MHz, and I've been using 48MHz
> all along ooopsie.
> 
> The current assumption in the bindings is that we have only
> one clock and TIM2_CLKSEL is N/A.
> 
> If we want proper clcdclk handling with CLKSEL you should
> probably add some code to implement a real mux clock for
> this using <linux/clock-provider.h> and drivers/clk/clk-mux.c
> with select COMMON_CLK
> so that the driver still only sees clcdclk but that in turn is a
> mux that can select one of two sources and will react to
> the clk_set_rate() call by selecting the clock which is
> closest in frequency to what you want.
> 
> This needs a small patch to alter the bindings too I guess.
> A small clock node inside the CLCD, just like PCI bridges have
> irqchips inside them etc:
> 
> clcd@10120000 {
>         compatible = "arm,pl110", "arm,primecell";
>         reg = <0x10120000 0x1000>;
>         (...)
>         clocks = <&clcdclk>, <&foo>;
>         clock-names = "clcdclk", "apb_pclk";
> 
>         clcdclk: clock-controller@0 {
>                 compatible = "arm,pl11x-clock-mux";
>                 clocks = <&source_a>, <&source_b>;
>         };
> };
> 
> This can be set up easily in the OF probe path since that
> is what we're doing: just look for this subnode, if it is there
> create the clock controller.
> 
> I do not think the clk maintainers would mind a small mux
> clock controller inside the CLCD driver to handle this mux
> if we need it.
> 
> It would *maybe* also be possible to add a second "clcdclk2"
> to the block and make an educated decision on which clock
> to use in the driver but that is not as elegant as using the
> clock framework mux clock I think.

We've had drivers (like imx-drm) embedding clk stuff within itself
in a similar manner to what you're suggesting, and it ended up
being a problem when it came to working out which is the correct
clock to use.  That stuff got ripped out of imx-drm and replaced
with a saner solution (that doesn't use CCF) before imx-drm moved
out of staging.  The reason for this was to get a saner solution to
"I want a clock running at X MHz, which clock gives me the closest
to the requested rate" without using the problematical fractional
divider^w^wfrequency modulator that severely upsets HDMI.

What I think you need to ask here is not how you should be modelling
it in DT, but how you're going to control it in the driver.  Under
what circumstance will you select one CLKSEL state or the other?

There's also consideration of the effect CLKSEL has - it's effectively
a GPIO output from the module that is available for the system
integrator to do whatever they choose with.  It just happens to have
the name "CLKSEL" - but it doesn't have to select a clock.

So, I don't think it's clear cut whether it should be exposed as a
GPIO and the GPIO based clk-mux used with it, or whether we should
update the binding to allow a second clock to be specified, giving
the driver the ability to make its own choice about which clock
should be selected.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.

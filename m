Return-Path: <boris.brezillon@bootlin.com>
Date: Thu, 22 Mar 2018 10:13:34 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Stefan Wahren
 <stefan.wahren@i2se.com>, Lee Jones <lee@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, Mike Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
 linux-clk@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: bcm2835: Make sure the PLL is gated before
 changing its rate
Message-ID: <20180322101334.6705ab22@bbrezillon>
In-Reply-To: <152088968272.205167.14856461616755294568@swboyd.mtv.corp.google.com>
References: <20180208134338.24590-1-boris.brezillon@bootlin.com>
	<20180208134338.24590-4-boris.brezillon@bootlin.com>
	<87mv0j5wzz.fsf@anholt.net>
	<20180208185619.667a4daf@bbrezillon>
	<87vaf6v77r.fsf@anholt.net>
	<20180212102752.21e22328@bbrezillon>
	<152088968272.205167.14856461616755294568@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Mon, 12 Mar 2018 14:21:22 -0700
Stephen Boyd <sboyd@kernel.org> wrote:

> Quoting Boris Brezillon (2018-02-12 01:27:52)
> > -Stephen Warren
> > +Stefan Wahren
> > 
> > On Fri, 09 Feb 2018 09:32:40 +0000
> > Eric Anholt <eric@anholt.net> wrote:
> >   
> > > Boris Brezillon <boris.brezillon@bootlin.com> writes:
> > >   
> > > > On Thu, 08 Feb 2018 15:20:16 +0000
> > > > Eric Anholt <eric@anholt.net> wrote:
> > > >    
> > > >> Boris Brezillon <boris.brezillon@bootlin.com> writes:
> > > >>     
> > > >> > All bcm2835 PLLs should be gated before their rate can be changed.
> > > >> > Setting CLK_SET_RATE_GATE will let the core enforce that, but this is
> > > >> > not enough to make the code work in all situations. Indeed, the
> > > >> > CLK_SET_RATE_GATE flag prevents a user from changing the rate while
> > > >> > the clock is enabled, but this check only guarantees there's no Linux
> > > >> > users. In our case, the clock might have been enabled by the
> > > >> > bootloader/FW, and, because we have CLK_IGNORE_UNUSED set, Linux never
> > > >> > disables the PLL. So we have to make sure the PLL is actually disabled
> > > >> > before changing the rate.
> > > >> >
> > > >> > Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming the audio domain clocks")
> > > >> > Cc: <stable@vger.kernel.org>
> > > >> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > > >> > ---
> > > >> >  drivers/clk/bcm/clk-bcm2835.c | 14 +++++++++++++-
> > > >> >  1 file changed, 13 insertions(+), 1 deletion(-)
> > > >> >
> > > >> > diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> > > >> > index 6c5d4a8e426c..051ce769c109 100644
> > > >> > --- a/drivers/clk/bcm/clk-bcm2835.c
> > > >> > +++ b/drivers/clk/bcm/clk-bcm2835.c
> > > >> > @@ -678,6 +678,18 @@ static int bcm2835_pll_set_rate(struct clk_hw *hw,
> > > >> >          u32 ana[4];
> > > >> >          int i;
> > > >> >  
> > > >> > +        /*
> > > >> > +         * Normally, the CLK_SET_RATE_GATE flag prevents a user from changing
> > > >> > +         * the rate while the clock is enabled, but this check only makes sure
> > > >> > +         * there's no Linux users.
> > > >> > +         * In our case, the clock might have been enabled by the bootloader/FW,
> > > >> > +         * and, since CLK_IGNORE_UNUSED flag is set, Linux never disables it.
> > > >> > +         * So we have to make sure the clk is actually disabled before changing
> > > >> > +         * the rate.
> > > >> > +         */
> > > >> > +        if (bcm2835_pll_is_on(hw))
> > > >> > +                bcm2835_pll_off(hw);
> > > >> > +      
> > > >> 
> > > >> I'm not sure this improves the situation.  If the PLL was on, then
> > > >> presumably there's a divider using it and a CM clock using that, so
> > > >> we'll probably end up driving some glitches on them.    
> > > >
> > > > Hm, yes, but if someone is trying to change the rate of the PLL, and the
> > > > core doesn't know other clks depend on this PLL (which is the case if
> > > > we reach this point), we're already in big trouble.
> > > >    
> > > >> 
> > > >> Does the common clk framework have a way to disable unused clocks from
> > > >> the leaf clocks up to this root, before the general
> > > >> disable-unused-clocks path happens late in the boot process?    
> > > >
> > > > Not that I know of. What do you have in mind?     
> > > 
> > > I was hoping that Stephen Boyd or Mike might have an answer for this
> > > problem.  
> > 
> > Having a generic solution for this sort of issue is definitely the
> > way to go, but I think this temporary hack is needed to make HDMI/SDTV
> > work properly. If we don't have it and the FW configures and enables
> > PLLH with a rate that is different from the one the HDMI or SDTV
> > encoder tries to set, we're screwed, because I doubt the CPRMAN block
> > allows you to change the rate of the PLL when it's not gated. Which
> > means the new rate is not applied and the clk user has no way of
> > knowing that, which in turn means the display output is likely to not
> > work properly the first time it's enabled.
> > 
> > Of course, this all goes away the second time the HDMI/SDTV encoder is
> > enabled, because then clk_disable_unprepare() is called which has the
> > effect of disabling the PLL.
> >   
> 
> There isn't any sort of API to disable unused clks from a leaf up to a
> particular point in the tree. Actually, the disabling of unused clks
> during late init makes the framework harder to maintain so expanding on
> it is not high on the list of things to do.
> 
> What exactly is going on here? It sounds like the framework isn't aware
> of the 'on/off' boot state of certain clks (a known problem) and that's
> causing some sort of problem when changing rates? This usually happens
> with PLLs that are enabled at boot time and can't support their rate
> changing when they're enabled. We really should start reading on/off
> state and "hand off" that enabled state to something in the framework so
> we at least know if a clk is enabled or not out of boot.

Okay.

> There was some
> work on clk handoff done a while ago by Mike that never landed which may
> be useful to finish this off.

Can you point me to the initial work done by Mike? Are you referring to
[1]?

> Maybe we can pass that enabled state off
> to the clk we always create for a clk_hw structure at registration time

Actually, we already have a way to retrieve the HW state:
->is_prepared()/->is_enabled().

> and then have clk_disable_unused operate on that clk pointer at late
> init.

That won't solve the problem we have here, because the HDMI encoder
driver might try to change the clk rate before late init, and we must
disable the pll before changing its rate. And there's more than that:
the HDMI encoder manipulates a leaf clk and is not aware of the PLL
used as a source for this hdmi clk, so we can't even consider doing
something like that:

	if (clk_is_enabled(hdmi_clk))
		clk_disable_unprepare(hdmi_clk);
	
	clk_set_rate(hdmi_clk, xxx);
	clk_prepare_enable(hdmi_clk);

We need the framework to figure this out on his own and let him decide
to disable the clk before setting the pll rate.
This being said, I'm not sure we want to apply this behavior to
everyone. You may have setups where some clks initialized/enabled by
the FW/bootloader may rely on the PLL and its pre-configured rate and
you don't want another clk user from messing up with the PLL.

I'm not against discussing a generic solution to solve this problem
but I think it's not as easy as it seems and IMO it's worth
having the current hack for the bcm2835 driver (I can restrict it to
PLLH if you prefer).

[1]https://lwn.net/Articles/675658/

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

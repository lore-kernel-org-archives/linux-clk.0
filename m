Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@bootlin.com>, Eric Anholt <eric@anholt.net>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180212102752.21e22328@bbrezillon>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com,
 Stefan Wahren <stefan.wahren@i2se.com>, Lee Jones <lee@kernel.org>,
 linux-rpi-kernel@lists.infradead.org,
 Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 stable@vger.kernel.org
References: <20180208134338.24590-1-boris.brezillon@bootlin.com>
 <20180208134338.24590-4-boris.brezillon@bootlin.com>
 <87mv0j5wzz.fsf@anholt.net> <20180208185619.667a4daf@bbrezillon>
 <87vaf6v77r.fsf@anholt.net> <20180212102752.21e22328@bbrezillon>
Message-ID: <152088968272.205167.14856461616755294568@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 4/4] clk: bcm2835: Make sure the PLL is gated before changing its
 rate
Date: Mon, 12 Mar 2018 14:21:22 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Boris Brezillon (2018-02-12 01:27:52)
> -Stephen Warren
> +Stefan Wahren
> =

> On Fri, 09 Feb 2018 09:32:40 +0000
> Eric Anholt <eric@anholt.net> wrote:
> =

> > Boris Brezillon <boris.brezillon@bootlin.com> writes:
> > =

> > > On Thu, 08 Feb 2018 15:20:16 +0000
> > > Eric Anholt <eric@anholt.net> wrote:
> > >  =

> > >> Boris Brezillon <boris.brezillon@bootlin.com> writes:
> > >>   =

> > >> > All bcm2835 PLLs should be gated before their rate can be changed.
> > >> > Setting CLK_SET_RATE_GATE will let the core enforce that, but this=
 is
> > >> > not enough to make the code work in all situations. Indeed, the
> > >> > CLK_SET_RATE_GATE flag prevents a user from changing the rate while
> > >> > the clock is enabled, but this check only guarantees there's no Li=
nux
> > >> > users. In our case, the clock might have been enabled by the
> > >> > bootloader/FW, and, because we have CLK_IGNORE_UNUSED set, Linux n=
ever
> > >> > disables the PLL. So we have to make sure the PLL is actually disa=
bled
> > >> > before changing the rate.
> > >> >
> > >> > Fixes: 41691b8862e2 ("clk: bcm2835: Add support for programming th=
e audio domain clocks")
> > >> > Cc: <stable@vger.kernel.org>
> > >> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> > >> > ---
> > >> >  drivers/clk/bcm/clk-bcm2835.c | 14 +++++++++++++-
> > >> >  1 file changed, 13 insertions(+), 1 deletion(-)
> > >> >
> > >> > diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-b=
cm2835.c
> > >> > index 6c5d4a8e426c..051ce769c109 100644
> > >> > --- a/drivers/clk/bcm/clk-bcm2835.c
> > >> > +++ b/drivers/clk/bcm/clk-bcm2835.c
> > >> > @@ -678,6 +678,18 @@ static int bcm2835_pll_set_rate(struct clk_hw=
 *hw,
> > >> >          u32 ana[4];
> > >> >          int i;
> > >> >  =

> > >> > +        /*
> > >> > +         * Normally, the CLK_SET_RATE_GATE flag prevents a user f=
rom changing
> > >> > +         * the rate while the clock is enabled, but this check on=
ly makes sure
> > >> > +         * there's no Linux users.
> > >> > +         * In our case, the clock might have been enabled by the =
bootloader/FW,
> > >> > +         * and, since CLK_IGNORE_UNUSED flag is set, Linux never =
disables it.
> > >> > +         * So we have to make sure the clk is actually disabled b=
efore changing
> > >> > +         * the rate.
> > >> > +         */
> > >> > +        if (bcm2835_pll_is_on(hw))
> > >> > +                bcm2835_pll_off(hw);
> > >> > +    =

> > >> =

> > >> I'm not sure this improves the situation.  If the PLL was on, then
> > >> presumably there's a divider using it and a CM clock using that, so
> > >> we'll probably end up driving some glitches on them.  =

> > >
> > > Hm, yes, but if someone is trying to change the rate of the PLL, and =
the
> > > core doesn't know other clks depend on this PLL (which is the case if
> > > we reach this point), we're already in big trouble.
> > >  =

> > >> =

> > >> Does the common clk framework have a way to disable unused clocks fr=
om
> > >> the leaf clocks up to this root, before the general
> > >> disable-unused-clocks path happens late in the boot process?  =

> > >
> > > Not that I know of. What do you have in mind?   =

> > =

> > I was hoping that Stephen Boyd or Mike might have an answer for this
> > problem.
> =

> Having a generic solution for this sort of issue is definitely the
> way to go, but I think this temporary hack is needed to make HDMI/SDTV
> work properly. If we don't have it and the FW configures and enables
> PLLH with a rate that is different from the one the HDMI or SDTV
> encoder tries to set, we're screwed, because I doubt the CPRMAN block
> allows you to change the rate of the PLL when it's not gated. Which
> means the new rate is not applied and the clk user has no way of
> knowing that, which in turn means the display output is likely to not
> work properly the first time it's enabled.
> =

> Of course, this all goes away the second time the HDMI/SDTV encoder is
> enabled, because then clk_disable_unprepare() is called which has the
> effect of disabling the PLL.
> =


There isn't any sort of API to disable unused clks from a leaf up to a
particular point in the tree. Actually, the disabling of unused clks
during late init makes the framework harder to maintain so expanding on
it is not high on the list of things to do.

What exactly is going on here? It sounds like the framework isn't aware
of the 'on/off' boot state of certain clks (a known problem) and that's
causing some sort of problem when changing rates? This usually happens
with PLLs that are enabled at boot time and can't support their rate
changing when they're enabled. We really should start reading on/off
state and "hand off" that enabled state to something in the framework so
we at least know if a clk is enabled or not out of boot. There was some
work on clk handoff done a while ago by Mike that never landed which may
be useful to finish this off. Maybe we can pass that enabled state off
to the clk we always create for a clk_hw structure at registration time
and then have clk_disable_unused operate on that clk pointer at late
init.

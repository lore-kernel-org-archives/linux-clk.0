Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>, "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1489256303.3094.1.camel@baylibre.com>
Cc: linux-clk@vger.kernel.org, "Kevin Hilman" <khilman@baylibre.com>,
 "Neil Armstrong" <narmstrong@baylibre.com>
References: <20170302173835.18313-1-jbrunet@baylibre.com>
 <20170307143823.GD10239@codeaurora.org>
 <1488902436.28627.2.camel@baylibre.com>
 <148909819219.16808.4472770855979808703@resonance>
 <1489256303.3094.1.camel@baylibre.com>
Message-ID: <148942423440.82235.17188153691656009029@resonance>
Subject: Re: [RFC 0/2] CLK_SET_RATE_GATE and protection against changes
Date: Mon, 13 Mar 2017 09:57:14 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Jerome Brunet (2017-03-11 10:18:23)
> On Thu, 2017-03-09 at 14:23 -0800, Michael Turquette wrote:
> =

> [...]
> > =

> > Adding a new flag is safer, but we might start accruing more and more
> > technical debt with deprecated flags versus the new ones. We have some
> > of this already with .round_rate vs .determine_rate and some other
> > stuff.
> > =

> > Since -rc1 juuuuust came out, maybe we could try merging it and see what
> > happens?
> > =

> > Also, if we can come up with a better solution that covers all the use
> > cases, I would be fine to delete the flag altogether and cover the
> > existing users. I count only a handful:
> > =

> > wm831x, qcom, at91, sirf, acpi-lpss, axi-clkgen, cs2000, bcm, stm32,
> > h8300, imx, microchip, ux500, and the mediatek drm drivers.
> > =

> > OK, maybe more than handful ;-)
> > =

> =

> What would be the actual effect of deleting the flag altogether ? I see 2=
 cases:
> 1) Clock rate set through the "CLK_RATE_PARENT" mechanism: For these one,
> removing the flag changes absolutely nothing.
> 2) Clock which are the initial clock of the clk_set_rate call: with the f=
lag,
> and w/o being unprepared first, the call would fail. Since this is the cl=
ock
> directly targeted, there is good chance all consumer explicitly call unpr=
epare.
> The flag only act a reminder to the developer while writing the code.

I'm not sure about 2). It's possible that some consumer drivers do not
realize that the clock they consume has this flag set. The flag is a
property of the clock provider, and the consumer driver may or may not
know about it.

Also the purpose of the flag is ambiguous. Are we trying to prevent
downstream peripheral devices from glitching? If so the new
clk_rate_{un}lock() api is better for that and can replace such usage. I
think this is 80% of current users*.

If we're trying to prevent a problem with the clock controller itself
(e.g. some clock controller hardware requires gating clocks to change
the rate) then this flag still makes sense. This is 20% of the current
users.*

* Statistics are fictitious and are a bad application of the Pareto
  Principle

> =

> If we remove this flag, the greatest risk I see here with clocks really n=
eeding
> this, is more about future development and the lack of warning.
> =

> > > =

> > > > > =

> > > > > Suppose that I start both playbacks at the same time, i2s sets its
> > > > > rate but
> > > > > get descheduled before enabling the clock. Then spdif get
> > > > > scheduled, set
> > > > > the rate on the same pll (it can as the prepare/enable count is
> > > > > still 0)
> > > > > and enables the clock.=C2=A0=C2=A0Finally, i2s gets scheduled aga=
in, enables
> > > > > its
> > > > > clock but the rate of the selected parent has changed behind our
> > > > > back.=C2=A0=C2=A0I
> > > > > don't really know how to solve this one. I was thinking of another
> > > > > counter
> > > > > (like owner_count) but we already have 2 of those, there must be
> > > > > something
> > > > > smarter we can do about it... I guess.
> > > > =

> > > > Solving this problem is never fun. One "solution" is to use clk
> > > > notifiers to block rate changes that are undesirable. Overall,
> > > > that isn't really great though because we are using notifiers,
> > > > and it doesn't allow us to resolve what the rate changes should
> > > > do. Instead, we can just say yes or no.
> > > =

> > > Wouldn't it be too late anyway ? The goal would be to force the second
> > =

> > It's too late to select another parent, but not too late for any
> > affected drivers to clean up their work and pause operations while the
> > clock rate change happens.
> > =

> > > consumer to switch a better suited parent. if we just notify "no" whi=
le
> > > changing the rate, set_rate will return a error I suppose ? Even if
> > > could have chosen another parent and be successful ? Something needs =
to
> > > happen in round_rate/determine_rate, doesn't it ?
> > =

> > If the goal of the notifiers was to select a different parent, then
> > you'd be correct. However the goal of the notifiers is to allow
> > downstream drivers a chance to survive an otherwise catastrophic clock
> > rate change. Imagine a system with only a single PLL that clocks
> > everything and you'll see why I designed them this way.
> > =

> > On the other hand we could just fail the second clk_set_rate operation
> > but that's not very nice is it? ;-)
> =

> Sure we could try to be smart and find the best solution for all consumer.
> That's a classic ressource allocation problem i suppose. For the moment I=
'd like
> to be *sure* to have satisfied one... and try make the best out of what's
> available for the other.
> =

> Let's make it safer, then make it smarter :) =

> =

> > =

> > > =

> > > > =

> > > > Do the hardware designers have a frequency plan in mind when
> > > > designing the hardware so that we would know the PLLs they
> > > > planned to use for particular clks? Or is the whole thing
> > > > completely open ended and they expect software to figure out the
> > > > configuration of the clk tree at runtime based on what
> > > > frequencies are required on the different leaf clks (i2s/spdif).
> > =

> > Maybe they have a plan. If so they haven't told us yet ;-)
> > =

> > Are you thinking about the ccr stuff here for discrete clock
> > plan/operating points?
> > =

> > > > =

> > > > It may also work to use clk_set_rate_range() to "lock" the rate
> > > > of a clk to specifically what frequency you want.
> > > =

> > > Would any other driver be prevented from calling clk_set_rate_range as
> > > well, if you have the kind race condition I mentioned ?
> > =

> > Ranges are tracked on a per-consumer basis and all consumers are taken
> > into account when rates are being changed. The he-who-writes-last-wins
> > problem doesn't exist with rate ranges.
> > =

> Ohh, thanks for the explanation. =

> =

> > > =

> > > > =C2=A0I haven't
> > > > thought that through completely, but it may work enough to make
> > > > sure the rate can't change while still allowing other clks to get
> > > > rates they want by searching the tree for another source.
> > > =

> > > For this use case, I have to admit I was probably abusing the
> > > CLK_SET_RATE_GATE to fit my use case ;)
> > > =

> > > The clock does not need to be gated for the rate to change, but the
> > > rate can't change if a consumer depends on it.
> > > =

> > > Here another idea: yet another flag (CLK_SET_RATE_PROTECT).
> > > It would require the clock to be prepared to be allowed to set the
> > > rate. if prepare_count > 1, it would return the current rate, acting =
as
> > > fixed clock. This allows determine_rate to switch to better parent if
> > > available, or try to make the best out of what is available.
> > =

> > So I think this idea is getting somewhere, but it should not be a flag.
> > Instead we could have a clk_lock_rate() and clk_unlock_rate() function,
> > and even a nice helper named clk_set_rate_lock() that wraps
> > clk_set_rate() and clk_lock_rate().
> > =

> Even better
> =

> > In order to make it easy to track whether parents of a clock are allowed
> > to be changed by a sibling we should introduce a rate_lock_count member=
 to
> > struct clk_core and incremented it up the parent chain exactly how we do
> > already for prepare_count and enable_count. Any time rate_lock_count > 0
> > then we cannot change that clock rate.
> > =

> > I admit that clk_lock_rate() could be satisfied by using a range where
> > min =3D=3D max, but the problem there is that we do not propagate rate
> > clocks up the parent chain to make it easy to figure out of rate changes
> > are acceptable.
> > =

> > Additionally the "range" semantics say nothing about whether a
> > downstream peripheral will glitch during a clock rate change during an
> > operation, which was the idea behind CLK_SET_RATE_GATE, but that flag
> > doesn't handle the sibling-blows-up-everything corner case.
> > =

> > So I propose the following:
> > =

> > 0) introduce clk_lock_rate() and clk_unlock_rate() along with struct
> > =C2=A0=C2=A0=C2=A0clk_core->rate_lock_count. Add clk_set_rate_lock() he=
lper
> > 1) Repeal and replace CLK_SET_RATE_GATE users with clk_set_rate_lock()
> > =

> Sounds like a plan ;)
> Stephen and you probably know the framework better than anyone but if you=
 are to
> busy, I could have go at 0) and make an RFC later on ?

Go for it! I'm happy to review your implementation.

Best regards,
Mike

> =

> > The range stuff still makes sense and there are valid use cases where we
> > would want to specify a range as well as lock the frequency (e.g. a
> > glitchy downstream peripheral that tolerates a frequency band).
> > =

> > We'll have to take care to migrate the rate_lock_count in .set_parent,
> > but this should be easier versus the enable_count stuff that requires
> > holding both the spinlock and the mutex.
> > =

> > Thoughts?
> > =

> > Regards,
> > Mike
> > =

> > > =

> > > The problem I see with this approach is the case where 2 consumers
> > > prepare the clock w/o being able to set the rate =3D> no consumer is
> > > satisfied by the clock is locked. Could it be solved by adding a
> > > "prepare_set_rate" to the CCF api ?
> > > =

> > > > =

> > > > [1] https://patchwork.kernel.org/patch/9222903/
> > > > [2] https://patchwork.kernel.org/patch/9295171/
> > > >=20

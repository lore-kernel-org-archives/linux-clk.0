Return-Path: <sboyd@codeaurora.org>
Date: Mon, 13 Mar 2017 18:19:28 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC 0/2] CLK_SET_RATE_GATE and protection against changes
Message-ID: <20170314011928.GG10239@codeaurora.org>
References: <20170302173835.18313-1-jbrunet@baylibre.com>
 <20170307143823.GD10239@codeaurora.org>
 <1488902436.28627.2.camel@baylibre.com>
 <148909819219.16808.4472770855979808703@resonance>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <148909819219.16808.4472770855979808703@resonance>
List-ID: <linux-clk.vger.kernel.org>

On 03/09, Michael Turquette wrote:
> Quoting Jerome Brunet (2017-03-07 08:00:36)
> > On Tue, 2017-03-07 at 06:38 -0800, Stephen Boyd wrote:
> > > On 03/02, Jerome Brunet wrote:
> > > > 
> > > > I tried to understand what happened but my understanding of CCF is
> > > > limited,
> > > > if the following is complete nonsense, feel free to (gently) mock
> > > > me.
> > > > CLK_SET_RATE_GATE only prevent rate change when the clock is busy
> > > > and we
> > > > through clk_core_set_rate_nolock. So if we call clk_set_rate
> > > > directly on
> > > > clock with CLK_SET_RATE_GATE, while another clock uses it, it shall
> > > > fail. However if we reach this clock by walking up the clock tree,
> > > > everything seems to be as if this flag did not exist. I think this
> > > > explains
> > > > why mpll0 was selected has best parent and updated.
> > > 
> > > Right. My understanding is that this is the desired behavior of
> > > this flag. At least, this is what I recall when speaking with
> > > Mike about this a year or two ago.
> > > 
> > > A few months ago, Jiada Wang reported a similar problem[1] and
> > > I've never merged it because of the concern it will break
> > > something due to the flag behavior changing. Perhaps the way
> > > forward here is to add a new flag for this different behavior and
> > > let drivers opt-in to it.
> > > 
> > 
> > In this previous thread, you mentioned the idea of deleting the flag.
> > While a bit radical, I kind of like it. The name, as it is, is
> > misleading. The flag does not really enforce gating the clock to change
> > the rate.
> > Changing the behavior of the flag is also too agressive I guess.
> > 
> > What about renaming the current flag to CLK_SET_RATE_GATE_LEAF (or
> > anything else) and clearly mark it as obsolete in the header with a bit
> > of explanation ?
> > 
> > We could keep that old behavior around while providers ask themself
> > whether they really need to gate to change rate or not.
> 
> Adding a new flag is safer, but we might start accruing more and more
> technical debt with deprecated flags versus the new ones. We have some
> of this already with .round_rate vs .determine_rate and some other
> stuff.
> 
> Since -rc1 juuuuust came out, maybe we could try merging it and see what
> happens?
> 
> Also, if we can come up with a better solution that covers all the use
> cases, I would be fine to delete the flag altogether and cover the
> existing users. I count only a handful:
> 
> wm831x, qcom, at91, sirf, acpi-lpss, axi-clkgen, cs2000, bcm, stm32,
> h8300, imx, microchip, ux500, and the mediatek drm drivers.
> 
> OK, maybe more than handful ;-)

I know for sure that qcom uses this flag incorrectly because I
added it. On some of the older platforms we can't support rate
changing in a glitch free manner so we really need to disable the
clk across the rate switch.

We used to forcibly disable the clk and then change the rate and
then forcibly enable whatever we forcibly disabled all inside the
clk ops under a register spinlock. That was before we converted
to CCF. We may want to keep doing that, because it's confusing
from a consumer perspective to know if a clk needs to be disabled
or not when changing the rate (more on this point later).

> 
> > 
> > > 
> > > Do the hardware designers have a frequency plan in mind when
> > > designing the hardware so that we would know the PLLs they
> > > planned to use for particular clks? Or is the whole thing
> > > completely open ended and they expect software to figure out the
> > > configuration of the clk tree at runtime based on what
> > > frequencies are required on the different leaf clks (i2s/spdif).
> 
> Maybe they have a plan. If so they haven't told us yet ;-)

Great!

> 
> Are you thinking about the ccr stuff here for discrete clock
> plan/operating points?

I'm not really thinking ccr here, just that hardware designers
typically figure out some static configuration of the clk tree
that doesn't lead to these sorts of problems. The problems
typically happen when we start using the hardware in ways the
designers never thought, and then we get into these problems
where we have to dynamically calculate the clk tree
configuration.

> 
> > 
> > >  I haven't
> > > thought that through completely, but it may work enough to make
> > > sure the rate can't change while still allowing other clks to get
> > > rates they want by searching the tree for another source.
> > 
> > For this use case, I have to admit I was probably abusing the
> > CLK_SET_RATE_GATE to fit my use case ;)
> > 
> > The clock does not need to be gated for the rate to change, but the
> > rate can't change if a consumer depends on it.
> > 
> > Here another idea: yet another flag (CLK_SET_RATE_PROTECT).
> > It would require the clock to be prepared to be allowed to set the
> > rate. if prepare_count > 1, it would return the current rate, acting as
> > fixed clock. This allows determine_rate to switch to better parent if
> > available, or try to make the best out of what is available.
> 
> So I think this idea is getting somewhere, but it should not be a flag.
> Instead we could have a clk_lock_rate() and clk_unlock_rate() function,
> and even a nice helper named clk_set_rate_lock() that wraps
> clk_set_rate() and clk_lock_rate().
> 
> In order to make it easy to track whether parents of a clock are allowed
> to be changed by a sibling we should introduce a rate_lock_count member to
> struct clk_core and incremented it up the parent chain exactly how we do
> already for prepare_count and enable_count. Any time rate_lock_count > 0
> then we cannot change that clock rate.
> 
> I admit that clk_lock_rate() could be satisfied by using a range where
> min == max, but the problem there is that we do not propagate rate
> clocks up the parent chain to make it easy to figure out of rate changes
> are acceptable.

I lost you here. We should be handling constraints in the
framework, so min == max should make it impossible to change the
rate of that clk if it would be affected. The rate propagation up
the tree is supposed to happen so that we know what range of
acceptable rates is possible on parent clks.

> 
> Additionally the "range" semantics say nothing about whether a
> downstream peripheral will glitch during a clock rate change during an
> operation, which was the idea behind CLK_SET_RATE_GATE, but that flag
> doesn't handle the sibling-blows-up-everything corner case.

Agreed. But that sort of knowledge shouldn't always be put on the
consumer of the clk to know and indicate to the framework.
Sometimes providers have a glitch free mux that can handle rate
changes in a glitch free manner. So providers should be
indicating they can't perform glitch free rate changes through
some flag or they should ensure they can handle things glitch
free via coordinated clk rates.

I would say drivers don't really care to say they can or can't
handle glitches downstream either. Drivers most likely _always_
want it to be glitch free when they call clk_set_rate(), so we
should make it that way in the core framework by figuring out if
something downstream of whatever changes rate will glitch and
taking the right action to avoid that. I've only ever seen this
as disabling clks downstream of the rate changing source, but
maybe there are other solutions. Probably we can put this
information into the rate request structure and act upon it in
the core.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

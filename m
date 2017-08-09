Return-Path: <sboyd@codeaurora.org>
Date: Tue, 8 Aug 2017 19:19:06 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v3 05/10] clk: add support for clock protection
Message-ID: <20170809021906.GA2146@codeaurora.org>
References: <20170612194438.12298-1-jbrunet@baylibre.com>
 <20170612194438.12298-6-jbrunet@baylibre.com>
 <20170726001217.GC2146@codeaurora.org>
 <1501089516.2401.29.camel@baylibre.com>
 <20170804001836.GU2146@codeaurora.org>
 <150223186723.22158.11617219588466426777@resonance>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <150223186723.22158.11617219588466426777@resonance>
List-ID: <linux-clk.vger.kernel.org>

On 08/08, Michael Turquette wrote:
> Hi Stephen,
> 
> Quoting Stephen Boyd (2017-08-03 17:18:36)
> > On 07/26, Jerome Brunet wrote:
> > > > > +void clk_rate_protect(struct clk *clk);
> > > > 
> > > > Is there any plan to use this clk_rate_protect() API? It seems
> > > > inherently racy for a clk consumer to call clk_set_rate() and
> > > > then this clk_rate_protect() API after that to lock the rate in.
> > > > How about we leave this out of the consumer API until a user
> > > > needs it?
> > > 
> > > Having this API available is whole reason I've been working on this for so long.
> > > By the now, you may have forgot but I explained the use-case in first RFC [0]
> > > Here is an example (wip) of usage [1]
> > > 
> > > [0]: http://lkml.kernel.org/r/20170302173835.18313-1-jbrunet@baylibre.com
> > > [1]: https://github.com/jeromebrunet/linux/commits/amlogic/wip/audio-clk-lock
> 
> Indeed, something like rate protection or "lock rate" has been discussed
> since the birth of CCF. I remember a whiteboarding session between you,
> Paul W. and myself about it probably in 2012. Peter might have been
> there too.

I seem to recall this being about something with how OMAP could
change rates only high up in the tree and that would trickle down
to multiple different clks that all had to use that rate and then
divide it themselves to achieve the rate they actually wanted. Is
that right? I also vaguely remember Paul saying that
clk_round_rate() could return something and then clk_set_rate()
after that would fail because what was calculated during the rate
speculation/rounding phase would be different if some other
consumer goes and changes some rate high up in the tree.

> 
> > 
> > If we're forgetting why something is introduced then it means the
> > commit text is missing information. Please clearly describe the
> > need for the API in the commit text for the patch that introduces
> > it.
> 
> My $0.02 is that the "pick an unused PLL" thing is a benefit of this new
> api that is internal to the clock controller driver, and is not the
> driving force behind the series. If a simple, easy to understand
> justification for this patch series is needed, might I suggest something
> like the following for the next commit log/coverletter:
> 
> "Some clock consumers require that a clock rate must not deviate from
> its selected frequency. There can be several reasons for this, not least
> of which is that some hardware may not be able to handle or recover from
> a glitch caused by changing the clock rate while the hardware is in
> operation. The ability to lock a clock's rate, and release that lock, is
> a fundamental clock rate control primitive. It's absence is a bug that
> is fixed by this patch series."

This sounds like we're fixing the CLK_SET_RATE_GATE flag. I'd
prefer we also describe how adding that flag to some clk doesn't
solve the problem. I'm all more commit text when introducing this
API. Please don't go super verbose, but at least describe the
real problem.

> 
> That's the short and sweet version. If more verbosity is needed as to
> why rate_range doesn't need this, there are some good reasons:

I'm not really concerned about rate range handling this problem
here. Let's try to untangle the two in this discussion please.

> 
> > 
> > > 
> > > If you go over the initial RFC, the point is also for the CCF to favor other
> > > (unused parent) when several (sometimes with the same capabilities) are
> > > available. I think this is also a fairly common use case. That's something
> > > rate_range won't do either, as far as I understood.
> > 
> > Fair enough, but why do we want consumers to need to know that
> > there are sometimes unused parents that aren't getting chosen for
> > a particular frequency? I see this as exposing the internals of
> > the clk tree to consumers when they shouldn't need to care. Of
> > course, sometimes clk consumers really do care about internals,
> 
> Right, sometimes they do, and we need to strike a balance. I think that
> this api has been needed for some time. It very likely could have been
> included in the initial version of the CCF that was merged years back if
> I hadn't been trying very hard to stick only to the existing clk.h.
> 
> clk_set_rate has always been a "last write wins" api, across a shared
> resource, and we've always known that this is not a great situation.
> This patch series does a good job of solving that issue, in conjunction
> with the existing range stuff.
> 
> > for example if some PLL is used for a display controller and it's
> > also routed out of the chip on the display phy pins to encode
> > data or something. Then perhaps we really want to use one
> > particular PLL instead of a generic one that may also be a parent
> > of the display controller clk. Making sure clk_set_rate() doesn't
> > trample on clks deep in the tree seems different than this
> > though.
> > 
> > Going back to your RFC series cover letter though, I see three
> > PLLs (mppl0,1,2) and two users of the PLLs (amclk and mclk_i958).
> > Is anything else using these PLLs in the system? Why are we doing
> > all this stuff instead of hard-coding the parents for these clks
> > to be different PLLs? If we want it to be flexible we could
> > assign parents to the cts_amclk_sel and cts_mclk_i958_sel to be
> > different PLLs in DT via assigned clock parents. Or it could just
> > be hard-coded in the clk driver during probe.
> > 
> > If there's really sharing going on, and you can't hardcode the
> > parents, please indicate why that's the case in the commit text.
> > I don't want to introduce another consumer API just because we
> > didn't want to restrict the available parents for a couple clks.
> 
> I think the PLL sharing thing is a big distraction. Giving consumers the
> ability to guarantee that their rates are locked in using a simple
> critical section call just makes sense to me. If it helps with other
> cases then yay.

Ok. Can we get details on where we can't fix it in the provider
layer? I'm fine to ignore the PLL sharing thing, if we can
clearly describe a real situation where a clk consumer needs to
lock in a rate, and that isn't the only consumer of a clk that is
changing that rate or causing a glitch by changing some other
rate up the tree. So far we haven't come across this case,
presumably because clk providers are working around the problem
by hardcoding parents that can change rate during
determine_rate(), or blocking rate changes going up the tree for
certain clks, or the hardware isn't designed in a way that
something is shared while two devices are active, or maybe nobody
has complained (likely!).

I'm all for consumers locking in rates in a critical section,
just that I haven't seen a need for it so far. I've mostly seen
that hardware doesn't design it this way, or that there's some
sort of hardware plan to make sure that desired frequencies can
be achieved when there's some shared resource. And the glitching
thing hasn't been a problem because consumers are the only ones
causing the glitch when they call clk_set_rate() and so far they
have only called clk_set_rate() when their hardware is able to
handle the glitch that comes down (e.g. audio turns off speaker
output, or device is held in reset).

TL;DR: Please distract me from the PLL sharing thing with the
real problem that's being solved.

> 
> > 
> > > 
> > > Last but not least, it allows consumer to set the rate in a sort of critical
> > > section and have the guarantee that nobody will be able to change the rate
> > > between the clk_set_rate() call and prepare_enable(). That's something we don't
> > > have at the moment.
> > > 
> > 
> > Right, but clk_rate_protect() doesn't close the critical section
> > between clk_set_rate() and clk_rate_protect() if another
> > consumers changes the frequency, or if that consumer changes the
> > frequency of some parent of the clk. This is why I'm asking what
> 
> Right, clk_set_rate_protect does this in the next patch in this series.
> 
> > the use of this API is for. Shouldn't we want consumers to use
> > clk_set_rate_protect() so they can be sure they got the rate they
> > wanted, instead of hoping that something else hasn't come in
> > between the set_rate and the protect calls and changed the
> > frequency?
> 
> We can remove clk_rate_protect if you really want, but there is always
> the case that a consumer driver does not set the rate, but needs to
> guarantee that the rate will not change during operation.
> 
> Any driver that must both set the rate AND guarantee it will not change
> must use clk_set_rate_protect.
> 

No need to remove the API. This is a good description of a case
where a consumer would just call clk_rate_protect() (or perhaps
clk_dont_glitch()) without caring what the rate is. I was missing
this part of the argument because I got hung up on the critical
section part. Maybe this can be added to the function
documentation so we don't forget that some consumers don't set a
rate but still care to make sure it doesn't glitch for them.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

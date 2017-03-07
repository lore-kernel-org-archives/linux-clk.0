Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1488902436.28627.2.camel@baylibre.com>
Subject: Re: [RFC 0/2] CLK_SET_RATE_GATE and protection against changes
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Date: Tue, 07 Mar 2017 17:00:36 +0100
In-Reply-To: <20170307143823.GD10239@codeaurora.org>
References: <20170302173835.18313-1-jbrunet@baylibre.com>
	 <20170307143823.GD10239@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2017-03-07 at 06:38 -0800, Stephen Boyd wrote:
> On 03/02, Jerome Brunet wrote:
> > 
> > I tried to understand what happened but my understanding of CCF is
> > limited,
> > if the following is complete nonsense, feel free to (gently) mock
> > me.
> > CLK_SET_RATE_GATE only prevent rate change when the clock is busy
> > and we
> > through clk_core_set_rate_nolock. So if we call clk_set_rate
> > directly on
> > clock with CLK_SET_RATE_GATE, while another clock uses it, it shall
> > fail. However if we reach this clock by walking up the clock tree,
> > everything seems to be as if this flag did not exist. I think this
> > explains
> > why mpll0 was selected has best parent and updated.
> 
> Right. My understanding is that this is the desired behavior of
> this flag. At least, this is what I recall when speaking with
> Mike about this a year or two ago.
> 
> A few months ago, Jiada Wang reported a similar problem[1] and
> I've never merged it because of the concern it will break
> something due to the flag behavior changing. Perhaps the way
> forward here is to add a new flag for this different behavior and
> let drivers opt-in to it.
> 

In this previous thread, you mentioned the idea of deleting the flag.
While a bit radical, I kind of like it. The name, as it is, is
misleading. The flag does not really enforce gating the clock to change
the rate.
Changing the behavior of the flag is also too agressive I guess.

What about renaming the current flag to CLK_SET_RATE_GATE_LEAF (or
anything else) and clearly mark it as obsolete in the header with a bit
of explanation ?

We could keep that old behavior around while providers ask themself
whether they really need to gate to change rate or not.

> > 
> > In patch 1, I try in intercept the calls to .round_rate and
> > .determine_rate
> > and just return the current rate of the clock when it is busy.  The
> > way the
> > clock remains usable with the consumer can deal with the current
> > but the
> > rate won't change for the consumer already using the
> > clock.  Because of
> > this change, mpll0 is no longer the best parent out there.
> > 
> > fixed_pll                    3        3            2000000000
> >    mpll2                     0        0                     0
> >    mpll1                     0        0              36863870
> >       cts_mclk_i958_sel      0        0              36863870
> >          cts_mclk_i958_div   0        0               6143979
> >             cts_mclk_i958    0        0               6143979
> >    mpll0                     1        1             491495425
> >       cts_amclk_sel          1        1             491495425
> >          cts_amclk_div       1        1              12287386
> >             cts_amclk        1        1              12287386
> > 
> > This is the result I expected :) However, the situation is still
> > not ideal
> > as I think using CLK_SET_RATE_GATE to protect against rate changes
> > in such
> > case is subject to race condition.
> > 
> > Suppose that I start both playbacks at the same time, i2s sets its
> > rate but
> > get descheduled before enabling the clock. Then spdif get
> > scheduled, set
> > the rate on the same pll (it can as the prepare/enable count is
> > still 0)
> > and enables the clock.  Finally, i2s gets scheduled again, enables
> > its
> > clock but the rate of the selected parent has changed behind our
> > back.  I
> > don't really know how to solve this one. I was thinking of another
> > counter
> > (like owner_count) but we already have 2 of those, there must be
> > something
> > smarter we can do about it... I guess.
> 
> Solving this problem is never fun. One "solution" is to use clk
> notifiers to block rate changes that are undesirable. Overall,
> that isn't really great though because we are using notifiers,
> and it doesn't allow us to resolve what the rate changes should
> do. Instead, we can just say yes or no.

Wouldn't it be too late anyway ? The goal would be to force the second
consumer to switch a better suited parent. if we just notify "no" while
changing the rate, set_rate will return a error I suppose ? Even if
could have chosen another parent and be successful ? Something needs to
happen in round_rate/determine_rate, doesn't it ?

> 
> Do the hardware designers have a frequency plan in mind when
> designing the hardware so that we would know the PLLs they
> planned to use for particular clks? Or is the whole thing
> completely open ended and they expect software to figure out the
> configuration of the clk tree at runtime based on what
> frequencies are required on the different leaf clks (i2s/spdif).
> 
> It may also work to use clk_set_rate_range() to "lock" the rate
> of a clk to specifically what frequency you want.

Would any other driver be prevented from calling clk_set_rate_range as
well, if you have the kind race condition I mentioned ?

>  I haven't
> thought that through completely, but it may work enough to make
> sure the rate can't change while still allowing other clks to get
> rates they want by searching the tree for another source.

For this use case, I have to admit I was probably abusing the
CLK_SET_RATE_GATE to fit my use case ;)

The clock does not need to be gated for the rate to change, but the
rate can't change if a consumer depends on it.

Here another idea: yet another flag (CLK_SET_RATE_PROTECT).
It would require the clock to be prepared to be allowed to set the
rate. if prepare_count > 1, it would return the current rate, acting as
fixed clock. This allows determine_rate to switch to better parent if
available, or try to make the best out of what is available.

The problem I see with this approach is the case where 2 consumers
prepare the clock w/o being able to set the rate => no consumer is
satisfied by the clock is locked. Could it be solved by adding a
"prepare_set_rate" to the CCF api ?

> 
> [1] https://patchwork.kernel.org/patch/9222903/
> [2] https://patchwork.kernel.org/patch/9295171/
> 

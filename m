Return-Path: <sboyd@codeaurora.org>
Date: Tue, 7 Mar 2017 06:38:23 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC 0/2] CLK_SET_RATE_GATE and protection against changes
Message-ID: <20170307143823.GD10239@codeaurora.org>
References: <20170302173835.18313-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170302173835.18313-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On 03/02, Jerome Brunet wrote:
> 
> I tried to understand what happened but my understanding of CCF is limited,
> if the following is complete nonsense, feel free to (gently) mock me.
> CLK_SET_RATE_GATE only prevent rate change when the clock is busy and we
> through clk_core_set_rate_nolock. So if we call clk_set_rate directly on
> clock with CLK_SET_RATE_GATE, while another clock uses it, it shall
> fail. However if we reach this clock by walking up the clock tree,
> everything seems to be as if this flag did not exist. I think this explains
> why mpll0 was selected has best parent and updated.

Right. My understanding is that this is the desired behavior of
this flag. At least, this is what I recall when speaking with
Mike about this a year or two ago.

A few months ago, Jiada Wang reported a similar problem[1] and
I've never merged it because of the concern it will break
something due to the flag behavior changing. Perhaps the way
forward here is to add a new flag for this different behavior and
let drivers opt-in to it.

> 
> In patch 1, I try in intercept the calls to .round_rate and .determine_rate
> and just return the current rate of the clock when it is busy.  The way the
> clock remains usable with the consumer can deal with the current but the
> rate won't change for the consumer already using the clock.  Because of
> this change, mpll0 is no longer the best parent out there.
> 
> fixed_pll                    3        3            2000000000
>    mpll2                     0        0                     0
>    mpll1                     0        0              36863870
>       cts_mclk_i958_sel      0        0              36863870
>          cts_mclk_i958_div   0        0               6143979
>             cts_mclk_i958    0        0               6143979
>    mpll0                     1        1             491495425
>       cts_amclk_sel          1        1             491495425
>          cts_amclk_div       1        1              12287386
>             cts_amclk        1        1              12287386
> 
> This is the result I expected :) However, the situation is still not ideal
> as I think using CLK_SET_RATE_GATE to protect against rate changes in such
> case is subject to race condition.
> 
> Suppose that I start both playbacks at the same time, i2s sets its rate but
> get descheduled before enabling the clock. Then spdif get scheduled, set
> the rate on the same pll (it can as the prepare/enable count is still 0)
> and enables the clock.  Finally, i2s gets scheduled again, enables its
> clock but the rate of the selected parent has changed behind our back.  I
> don't really know how to solve this one. I was thinking of another counter
> (like owner_count) but we already have 2 of those, there must be something
> smarter we can do about it... I guess.

Solving this problem is never fun. One "solution" is to use clk
notifiers to block rate changes that are undesirable. Overall,
that isn't really great though because we are using notifiers,
and it doesn't allow us to resolve what the rate changes should
do. Instead, we can just say yes or no.

Do the hardware designers have a frequency plan in mind when
designing the hardware so that we would know the PLLs they
planned to use for particular clks? Or is the whole thing
completely open ended and they expect software to figure out the
configuration of the clk tree at runtime based on what
frequencies are required on the different leaf clks (i2s/spdif).

It may also work to use clk_set_rate_range() to "lock" the rate
of a clk to specifically what frequency you want. I haven't
thought that through completely, but it may work enough to make
sure the rate can't change while still allowing other clks to get
rates they want by searching the tree for another source.

[1] https://patchwork.kernel.org/patch/9222903/
[2] https://patchwork.kernel.org/patch/9295171/

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

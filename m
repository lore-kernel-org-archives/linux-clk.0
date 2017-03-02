Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC 0/2] CLK_SET_RATE_GATE and protection against changes
Date: Thu,  2 Mar 2017 18:38:33 +0100
Message-Id: <20170302173835.18313-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Hi,

I have been playing with CLK_SET_RATE_GATE, with the goal of protecting a
parent clock against rate change if the clock is already used. I did not
get the expected result.  Before explaining more my use case, I'd like to
point out that the patches attached to this RFC are just here to illustrate
what I understand of the problem and start a discussion. By no means I
expect them to be merged as it is.

I'm working on the audio support on Amlogic's meson platforms [0]. In CCF,
I have an i2s master clock and spdif clock. Both can take any of 3 PLLs as
parent. These 3 PLLs have the capabilities, and I have set the
"CLK_SET_RATE_GATE" on each of them.

After boot, here is what we have:
name                       | en_cnt | prepare_cnt | rate      |
===============================================================
fixed_pll                    2        2            2000000000
   mpll2                     0        0                     0
   mpll1                     0        0             346956926
   mpll0                     0        0             274510132

Here the audio clocks don't appear because of an undocumented boot value of
the mux in front of them Please ignore this.

Starting i2s playback:
fixed_pll                    3        3            2000000000
   mpll2                     0        0                     0
   mpll1                     0        0             346956926
   mpll0                     1        1             491495425
      cts_amclk_sel          1        1             491495425
         cts_amclk_div       1        1              12287386
            cts_amclk        1        1              12287386

Here the i2s master is attached to the mpll0 and pll is set to (roughly)
500Mhz. So far so good.

Now starting the spdif playback, I expected the mpll0 to be protected and
.round_rate/.determine_rate to return the current rate of mpll0. By going
through the possible parents, I expected CCF not to select mpll0 as the
best parent. Well, guess what happened ;)

Starting spdif playback
fixed_pll                    3        3            2000000000
    mpll2                    0        0                     0
    mpll1                    0        0             346956926
    mpll0                    2        2              36863870
       cts_mclk_i958_sel     1        1              36863870
          cts_mclk_i958_div  1        1               6143979
             cts_mclk_i958   1        1               6143979
       cts_amclk_sel         1        1              36863870
          cts_amclk_div      1        1                921597
             cts_amclk       1        1                921597

mpll0 got selected anyway, the rate changed and the i2s master clock
wrecked.

I tried to understand what happened but my understanding of CCF is limited,
if the following is complete nonsense, feel free to (gently) mock me.
CLK_SET_RATE_GATE only prevent rate change when the clock is busy and we
through clk_core_set_rate_nolock. So if we call clk_set_rate directly on
clock with CLK_SET_RATE_GATE, while another clock uses it, it shall
fail. However if we reach this clock by walking up the clock tree,
everything seems to be as if this flag did not exist. I think this explains
why mpll0 was selected has best parent and updated.

In patch 1, I try in intercept the calls to .round_rate and .determine_rate
and just return the current rate of the clock when it is busy.  The way the
clock remains usable with the consumer can deal with the current but the
rate won't change for the consumer already using the clock.  Because of
this change, mpll0 is no longer the best parent out there.

fixed_pll                    3        3            2000000000
   mpll2                     0        0                     0
   mpll1                     0        0              36863870
      cts_mclk_i958_sel      0        0              36863870
         cts_mclk_i958_div   0        0               6143979
            cts_mclk_i958    0        0               6143979
   mpll0                     1        1             491495425
      cts_amclk_sel          1        1             491495425
         cts_amclk_div       1        1              12287386
            cts_amclk        1        1              12287386

This is the result I expected :) However, the situation is still not ideal
as I think using CLK_SET_RATE_GATE to protect against rate changes in such
case is subject to race condition.

Suppose that I start both playbacks at the same time, i2s sets its rate but
get descheduled before enabling the clock. Then spdif get scheduled, set
the rate on the same pll (it can as the prepare/enable count is still 0)
and enables the clock.  Finally, i2s gets scheduled again, enables its
clock but the rate of the selected parent has changed behind our back.  I
don't really know how to solve this one. I was thinking of another counter
(like owner_count) but we already have 2 of those, there must be something
smarter we can do about it... I guess.

If you read that far, thanks a lot !

Does any of what I just wrote make sense ?  Do you have any suggestion ?

Patch 2 is merely a suggestion. As explained in the patch, I think the
wording is bit confusing.

[0] : https://github.com/jeromebrunet/linux/commits/amlogic/wip/audio

Jerome Brunet (2):
  clk: fix CLK_SET_RATE_GATE on parent clocks
  clk: use enable_count to check if clk is busy

 drivers/clk/clk.c | 56 +++++++++++++++++++++++++++++++++++--------------------
 1 file changed, 36 insertions(+), 20 deletions(-)

-- 
2.9.3

Return-Path: <wens@mirror2.csie.ntu.edu.tw>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH 0/3] clk: sunxi-ng: more misc fixes
Date: Wed,  5 Apr 2017 14:37:41 +0800
Message-Id: <20170405063744.14389-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

Hi Maxime,

Here are 3 more clk fixes. The first one is needed for the second.
The third is a TODO I spotted while doing the first two.

ChenYu

Chen-Yu Tsai (3):
  clk: sunxi-ng: mult: Support PLL lock detection
  clk: sunxi-ng: a80: Remodel CPU cluster PLLs as N-type multiplier
    clocks
  clk: sunxi-ng: a33: Add offset and minimum value for DDR1 PLL N factor

 drivers/clk/sunxi-ng/ccu-sun8i-a33.c | 18 ++++++----
 drivers/clk/sunxi-ng/ccu-sun9i-a80.c | 70 ++++++++++++++++++++++++++----------
 drivers/clk/sunxi-ng/ccu_mult.c      |  2 ++
 drivers/clk/sunxi-ng/ccu_mult.h      |  2 ++
 4 files changed, 67 insertions(+), 25 deletions(-)

-- 
2.11.0

Return-Path: <wens@wens.csie.org>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH 0/3] clk: sunxi-ng: minimum multiplier and comment fixes
Date: Fri, 24 Mar 2017 16:33:04 +0800
Message-Id: <20170324083307.18338-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

Hi Maxime,

Here's a few fixes I came up with while thinking more about how to
implement some of the tricky clocks on the A83T.

Please have a look. The first 2 might need to go in stable, but I'll
leave the decision to you.

Regards
ChenYu


Chen-Yu Tsai (3):
  clk: sunxi-ng: use 1 as fallback for minimum multiplier
  clk: sunxi-ng: Fix round_rate/set_rate multiplier minimum mismatch
  clk: sunxi-ng: a80: Fix audio PLL comment not matching actual code

 drivers/clk/sunxi-ng/ccu-sun9i-a80.c | 3 +--
 drivers/clk/sunxi-ng/ccu_nk.c        | 8 ++++----
 drivers/clk/sunxi-ng/ccu_nkm.c       | 8 ++++----
 drivers/clk/sunxi-ng/ccu_nkmp.c      | 8 ++++----
 drivers/clk/sunxi-ng/ccu_nm.c        | 4 ++--
 5 files changed, 15 insertions(+), 16 deletions(-)

-- 
2.11.0

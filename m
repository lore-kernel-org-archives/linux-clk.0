Return-Path: <vz@mleia.com>
From: Vladimir Zapolskiy <vz@mleia.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org
Subject: [PATCH 0/3] clk: remove dead code allocations of parent lookup tables
Date: Thu,  7 Jan 2016 05:16:05 +0200
Message-Id: <1452136568-478-1-git-send-email-vz@mleia.com>
List-ID: <linux-clk.vger.kernel.org>

The change simplifies core operations over multi-parent clocks (clock
registration, clk_set_parent() and clk_get_parent() internals) by
rejecting a possibilty to skip failed memory allocation during clock
registration time and falling back to it on the next [gs]et_parent.

No functional change is intended.

Vladimir Zapolskiy (3):
  clk: don't fetch parent index for non multi-parent clocks
  clk: simplify array allocation of clock parents for lookup
  clk: remove redundant clock parents lookup table allocations

 drivers/clk/clk.c | 49 +++++++++++++++++++------------------------------
 1 file changed, 19 insertions(+), 30 deletions(-)

-- 
2.5.0

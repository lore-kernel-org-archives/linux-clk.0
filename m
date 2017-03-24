Return-Path: <wens@wens.csie.org>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH 2/3] clk: sunxi-ng: Fix round_rate/set_rate multiplier minimum mismatch
Date: Fri, 24 Mar 2017 16:33:06 +0800
Message-Id: <20170324083307.18338-3-wens@csie.org>
In-Reply-To: <20170324083307.18338-1-wens@csie.org>
References: <20170324083307.18338-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

In commit 2beaa601c849 ("clk: sunxi-ng: Implement minimum for
multipliers"), the multiplier minimums in the set_rate callback
for NM and NKMP style clocks were not updated.

This patch fixes them to match their round_rate callbacks.

Fixes: 2beaa601c849 ("clk: sunxi-ng: Implement minimum for multipliers")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu_nkmp.c | 4 ++--
 drivers/clk/sunxi-ng/ccu_nm.c   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.c b/drivers/clk/sunxi-ng/ccu_nkmp.c
index 162ff2664f64..e58c95787f94 100644
--- a/drivers/clk/sunxi-ng/ccu_nkmp.c
+++ b/drivers/clk/sunxi-ng/ccu_nkmp.c
@@ -138,9 +138,9 @@ static int ccu_nkmp_set_rate(struct clk_hw *hw, unsigned long rate,
 	unsigned long flags;
 	u32 reg;
 
-	_nkmp.min_n = 1;
+	_nkmp.min_n = nkmp->n.min ?: 1;
 	_nkmp.max_n = nkmp->n.max ?: 1 << nkmp->n.width;
-	_nkmp.min_k = 1;
+	_nkmp.min_k = nkmp->k.min ?: 1;
 	_nkmp.max_k = nkmp->k.max ?: 1 << nkmp->k.width;
 	_nkmp.min_m = 1;
 	_nkmp.max_m = nkmp->m.max ?: 1 << nkmp->m.width;
diff --git a/drivers/clk/sunxi-ng/ccu_nm.c b/drivers/clk/sunxi-ng/ccu_nm.c
index f312c92f2a21..5e5e90a4a50c 100644
--- a/drivers/clk/sunxi-ng/ccu_nm.c
+++ b/drivers/clk/sunxi-ng/ccu_nm.c
@@ -122,7 +122,7 @@ static int ccu_nm_set_rate(struct clk_hw *hw, unsigned long rate,
 	else
 		ccu_frac_helper_disable(&nm->common, &nm->frac);
 
-	_nm.min_n = 1;
+	_nm.min_n = nm->n.min ?: 1;
 	_nm.max_n = nm->n.max ?: 1 << nm->n.width;
 	_nm.min_m = 1;
 	_nm.max_m = nm->m.max ?: 1 << nm->m.width;
-- 
2.11.0

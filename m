Return-Path: <wens@wens.csie.org>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH 1/3] clk: sunxi-ng: use 1 as fallback for minimum multiplier
Date: Fri, 24 Mar 2017 16:33:05 +0800
Message-Id: <20170324083307.18338-2-wens@csie.org>
In-Reply-To: <20170324083307.18338-1-wens@csie.org>
References: <20170324083307.18338-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

A zero multiplier does not make sense for clocks.

Use 1 as the minimum when a multiplier minimum isn't specified.

Fixes: 2beaa601c849 ("clk: sunxi-ng: Implement minimum for multipliers")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu_nk.c   | 8 ++++----
 drivers/clk/sunxi-ng/ccu_nkm.c  | 8 ++++----
 drivers/clk/sunxi-ng/ccu_nkmp.c | 4 ++--
 drivers/clk/sunxi-ng/ccu_nm.c   | 2 +-
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nk.c b/drivers/clk/sunxi-ng/ccu_nk.c
index b9e9b8a9d1b4..2485bda87a9a 100644
--- a/drivers/clk/sunxi-ng/ccu_nk.c
+++ b/drivers/clk/sunxi-ng/ccu_nk.c
@@ -102,9 +102,9 @@ static long ccu_nk_round_rate(struct clk_hw *hw, unsigned long rate,
 	if (nk->common.features & CCU_FEATURE_FIXED_POSTDIV)
 		rate *= nk->fixed_post_div;
 
-	_nk.min_n = nk->n.min;
+	_nk.min_n = nk->n.min ?: 1;
 	_nk.max_n = nk->n.max ?: 1 << nk->n.width;
-	_nk.min_k = nk->k.min;
+	_nk.min_k = nk->k.min ?: 1;
 	_nk.max_k = nk->k.max ?: 1 << nk->k.width;
 
 	ccu_nk_find_best(*parent_rate, rate, &_nk);
@@ -127,9 +127,9 @@ static int ccu_nk_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (nk->common.features & CCU_FEATURE_FIXED_POSTDIV)
 		rate = rate * nk->fixed_post_div;
 
-	_nk.min_n = nk->n.min;
+	_nk.min_n = nk->n.min ?: 1;
 	_nk.max_n = nk->n.max ?: 1 << nk->n.width;
-	_nk.min_k = nk->k.min;
+	_nk.min_k = nk->k.min ?: 1;
 	_nk.max_k = nk->k.max ?: 1 << nk->k.width;
 
 	ccu_nk_find_best(parent_rate, rate, &_nk);
diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
index 71f81e95a061..cba84afe1cf1 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.c
+++ b/drivers/clk/sunxi-ng/ccu_nkm.c
@@ -109,9 +109,9 @@ static unsigned long ccu_nkm_round_rate(struct ccu_mux_internal *mux,
 	struct ccu_nkm *nkm = data;
 	struct _ccu_nkm _nkm;
 
-	_nkm.min_n = nkm->n.min;
+	_nkm.min_n = nkm->n.min ?: 1;
 	_nkm.max_n = nkm->n.max ?: 1 << nkm->n.width;
-	_nkm.min_k = nkm->k.min;
+	_nkm.min_k = nkm->k.min ?: 1;
 	_nkm.max_k = nkm->k.max ?: 1 << nkm->k.width;
 	_nkm.min_m = 1;
 	_nkm.max_m = nkm->m.max ?: 1 << nkm->m.width;
@@ -138,9 +138,9 @@ static int ccu_nkm_set_rate(struct clk_hw *hw, unsigned long rate,
 	unsigned long flags;
 	u32 reg;
 
-	_nkm.min_n = nkm->n.min;
+	_nkm.min_n = nkm->n.min ?: 1;
 	_nkm.max_n = nkm->n.max ?: 1 << nkm->n.width;
-	_nkm.min_k = nkm->k.min;
+	_nkm.min_k = nkm->k.min ?: 1;
 	_nkm.max_k = nkm->k.max ?: 1 << nkm->k.width;
 	_nkm.min_m = 1;
 	_nkm.max_m = nkm->m.max ?: 1 << nkm->m.width;
diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.c b/drivers/clk/sunxi-ng/ccu_nkmp.c
index 488055ed944f..162ff2664f64 100644
--- a/drivers/clk/sunxi-ng/ccu_nkmp.c
+++ b/drivers/clk/sunxi-ng/ccu_nkmp.c
@@ -116,9 +116,9 @@ static long ccu_nkmp_round_rate(struct clk_hw *hw, unsigned long rate,
 	struct ccu_nkmp *nkmp = hw_to_ccu_nkmp(hw);
 	struct _ccu_nkmp _nkmp;
 
-	_nkmp.min_n = nkmp->n.min;
+	_nkmp.min_n = nkmp->n.min ?: 1;
 	_nkmp.max_n = nkmp->n.max ?: 1 << nkmp->n.width;
-	_nkmp.min_k = nkmp->k.min;
+	_nkmp.min_k = nkmp->k.min ?: 1;
 	_nkmp.max_k = nkmp->k.max ?: 1 << nkmp->k.width;
 	_nkmp.min_m = 1;
 	_nkmp.max_m = nkmp->m.max ?: 1 << nkmp->m.width;
diff --git a/drivers/clk/sunxi-ng/ccu_nm.c b/drivers/clk/sunxi-ng/ccu_nm.c
index af71b1909cd9..f312c92f2a21 100644
--- a/drivers/clk/sunxi-ng/ccu_nm.c
+++ b/drivers/clk/sunxi-ng/ccu_nm.c
@@ -99,7 +99,7 @@ static long ccu_nm_round_rate(struct clk_hw *hw, unsigned long rate,
 	struct ccu_nm *nm = hw_to_ccu_nm(hw);
 	struct _ccu_nm _nm;
 
-	_nm.min_n = nm->n.min;
+	_nm.min_n = nm->n.min ?: 1;
 	_nm.max_n = nm->n.max ?: 1 << nm->n.width;
 	_nm.min_m = 1;
 	_nm.max_m = nm->m.max ?: 1 << nm->m.width;
-- 
2.11.0

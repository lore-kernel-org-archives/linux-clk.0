Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:53878 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751741AbdHLMpc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 12 Aug 2017 08:45:32 -0400
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v4 2/3] clk: sunxi-ng: nkm: add support for fixed post-divider
Date: Sat, 12 Aug 2017 20:43:51 +0800
Message-Id: <20170812124352.24148-3-icenowy@aosc.io>
In-Reply-To: <20170812124352.24148-1-icenowy@aosc.io>
References: <20170812124352.24148-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

SATA PLL on Allwinner R40 is of type (parent) * N * K / M / 6 where 6 is
the fixed post-divider.

Add post-divider support for NKM type clock.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/clk/sunxi-ng/ccu_nkm.c | 22 +++++++++++++++++++---
 drivers/clk/sunxi-ng/ccu_nkm.h |  2 ++
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
index 44b16dc8fea6..ce7f03737ad5 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.c
+++ b/drivers/clk/sunxi-ng/ccu_nkm.c
@@ -75,7 +75,7 @@ static unsigned long ccu_nkm_recalc_rate(struct clk_hw *hw,
 					unsigned long parent_rate)
 {
 	struct ccu_nkm *nkm = hw_to_ccu_nkm(hw);
-	unsigned long n, m, k;
+	unsigned long n, m, k, rate;
 	u32 reg;
 
 	reg = readl(nkm->common.base + nkm->common.reg);
@@ -98,7 +98,12 @@ static unsigned long ccu_nkm_recalc_rate(struct clk_hw *hw,
 	if (!m)
 		m++;
 
-	return parent_rate * n  * k / m;
+	rate = parent_rate * n  * k / m;
+
+	if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		rate /= nkm->fixed_post_div;
+
+	return rate;
 }
 
 static unsigned long ccu_nkm_round_rate(struct ccu_mux_internal *mux,
@@ -117,9 +122,17 @@ static unsigned long ccu_nkm_round_rate(struct ccu_mux_internal *mux,
 	_nkm.min_m = 1;
 	_nkm.max_m = nkm->m.max ?: 1 << nkm->m.width;
 
+	if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		rate *= nkm->fixed_post_div;
+
 	ccu_nkm_find_best(*parent_rate, rate, &_nkm);
 
-	return *parent_rate * _nkm.n * _nkm.k / _nkm.m;
+	rate = *parent_rate * _nkm.n * _nkm.k / _nkm.m;
+
+	if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		rate /= nkm->fixed_post_div;
+
+	return rate;
 }
 
 static int ccu_nkm_determine_rate(struct clk_hw *hw,
@@ -139,6 +152,9 @@ static int ccu_nkm_set_rate(struct clk_hw *hw, unsigned long rate,
 	unsigned long flags;
 	u32 reg;
 
+	if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
+		rate /= nkm->fixed_post_div;
+
 	_nkm.min_n = nkm->n.min ?: 1;
 	_nkm.max_n = nkm->n.max ?: 1 << nkm->n.width;
 	_nkm.min_k = nkm->k.min ?: 1;
diff --git a/drivers/clk/sunxi-ng/ccu_nkm.h b/drivers/clk/sunxi-ng/ccu_nkm.h
index 34580894f4d1..cc6efb70a102 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.h
+++ b/drivers/clk/sunxi-ng/ccu_nkm.h
@@ -34,6 +34,8 @@ struct ccu_nkm {
 	struct ccu_div_internal		m;
 	struct ccu_mux_internal	mux;
 
+	unsigned int		fixed_post_div;
+
 	struct ccu_common	common;
 };
 
-- 
2.13.0


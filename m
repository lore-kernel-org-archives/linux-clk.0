Return-Path: <jernej.skrabec@siol.net>
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: maxime.ripard@bootlin.com,
	wens@csie.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com,
	jernej.skrabec@siol.net
Subject: [PATCH 4/5] clk: sunxi-ng: nkmp: Add constraint for maximum rate
Date: Thu,  9 Aug 2018 18:52:16 +0200
Message-Id: <20180809165217.30680-5-jernej.skrabec@siol.net>
In-Reply-To: <20180809165217.30680-1-jernej.skrabec@siol.net>
References: <20180809165217.30680-1-jernej.skrabec@siol.net>
List-ID: <linux-clk.vger.kernel.org>

Some, if not most, NKMP PLLs can be set to higher rate that is really
supported by HW.

Implement support for maximum frequency constrain for NKMP PLLs.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/clk/sunxi-ng/ccu_nkmp.c | 7 +++++++
 drivers/clk/sunxi-ng/ccu_nkmp.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.c b/drivers/clk/sunxi-ng/ccu_nkmp.c
index ebd9436d2c7c..9b49adb20d07 100644
--- a/drivers/clk/sunxi-ng/ccu_nkmp.c
+++ b/drivers/clk/sunxi-ng/ccu_nkmp.c
@@ -137,6 +137,13 @@ static long ccu_nkmp_round_rate(struct clk_hw *hw, unsigned long rate,
 	if (nkmp->common.features & CCU_FEATURE_FIXED_POSTDIV)
 		rate *= nkmp->fixed_post_div;
 
+	if (nkmp->max_rate && rate > nkmp->max_rate) {
+		rate = nkmp->max_rate;
+		if (nkmp->common.features & CCU_FEATURE_FIXED_POSTDIV)
+			rate /= nkmp->fixed_post_div;
+		return rate;
+	}
+
 	_nkmp.min_n = nkmp->n.min ?: 1;
 	_nkmp.max_n = nkmp->n.max ?: 1 << nkmp->n.width;
 	_nkmp.min_k = nkmp->k.min ?: 1;
diff --git a/drivers/clk/sunxi-ng/ccu_nkmp.h b/drivers/clk/sunxi-ng/ccu_nkmp.h
index 6940503e7fc4..a9f8c116a745 100644
--- a/drivers/clk/sunxi-ng/ccu_nkmp.h
+++ b/drivers/clk/sunxi-ng/ccu_nkmp.h
@@ -35,6 +35,7 @@ struct ccu_nkmp {
 	struct ccu_div_internal		p;
 
 	unsigned int		fixed_post_div;
+	unsigned int		max_rate;
 
 	struct ccu_common	common;
 };
-- 
2.18.0

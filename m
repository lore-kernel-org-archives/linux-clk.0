Return-Path: <wens@wens.csie.org>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH 02/11] clk: sunxi-ng: mux: honor CLK_SET_RATE_NO_REPARENT flag
Date: Tue, 24 Jan 2017 10:32:21 +0800
Message-Id: <20170124023230.3990-3-wens@csie.org>
In-Reply-To: <20170124023230.3990-1-wens@csie.org>
References: <20170124023230.3990-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

This patch adds support for the CLK_SET_RATE_NO_REPARENT flag to the
mux determine_rate helper, based on examples from clk-composite and
clk-mux.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu_mux.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 3445041894e7..7cee17cf9c19 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -70,6 +70,21 @@ int ccu_mux_helper_determine_rate(struct ccu_common *common,
 	struct clk_hw *best_parent, *hw = &common->hw;
 	unsigned int i;
 
+	if (clk_hw_get_flags(hw) & CLK_SET_RATE_NO_REPARENT) {
+		unsigned long adj_parent_rate;
+
+		best_parent = clk_hw_get_parent(hw);
+		best_parent_rate = clk_hw_get_rate(best_parent);
+
+		adj_parent_rate = best_parent_rate;
+		ccu_mux_helper_adjust_parent_for_prediv(common, cm, -1,
+							&adj_parent_rate);
+
+		best_rate = round(cm, adj_parent_rate, req->rate, data);
+
+		goto out;
+	}
+
 	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
 		unsigned long tmp_rate, parent_rate, adj_parent_rate;
 		struct clk_hw *parent;
-- 
2.11.0

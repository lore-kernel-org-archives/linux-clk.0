Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: dri-devel@lists.freedesktop.org,
	Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH 3/15] clk: sunxi-ng: div: Switch to divider_round_rate
Date: Tue,  7 Mar 2017 09:56:22 +0100
Message-Id: <47f7cedf0c913045ccf248afdc7e772c80d8af08.1488876832.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
References: <cover.bc06ffa88f847ddd9ddd7c259415d5f61b55307b.1488876832.git-series.maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

divider_round_rate already evaluates changing the parent rate if
CLK_SET_RATE_PARENT is set. Now that we can do that on muxes too, let's
just use it.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 drivers/clk/sunxi-ng/ccu_div.c | 25 ++-----------------------
 1 file changed, 2 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index 7f8b06e38636..0ccdd3dcc20c 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -20,18 +20,9 @@ static unsigned long ccu_div_round_rate(struct ccu_mux_internal *mux,
 					void *data)
 {
 	struct ccu_div *cd = data;
-	unsigned long val;
-
-	/*
-	 * We can't use divider_round_rate that assumes that there's
-	 * several parents, while we might be called to evaluate
-	 * several different parents.
-	 */
-	val = divider_get_val(rate, *parent_rate, cd->div.table, cd->div.width,
-			      cd->div.flags);
 
-	return divider_recalc_rate(&cd->common.hw, *parent_rate, val,
-				   cd->div.table, cd->div.flags);
+	return divider_round_rate(&cd->common.hw, parent, rate, parent_rate,
+				  cd->div.table, cd->div.width, cd->div.flags);
 }
 
 static void ccu_div_disable(struct clk_hw *hw)
@@ -78,18 +69,6 @@ static int ccu_div_determine_rate(struct clk_hw *hw,
 {
 	struct ccu_div *cd = hw_to_ccu_div(hw);
 
-	if (clk_hw_get_num_parents(hw) == 1) {
-		req->rate = divider_round_rate(hw, clk_hw_get_parent(hw),
-					       req->rate,
-					       &req->best_parent_rate,
-					       cd->div.table, cd->div.width,
-					       cd->div.flags);
-
-		req->best_parent_hw = clk_hw_get_parent(hw);
-
-		return 0;
-	}
-
 	return ccu_mux_helper_determine_rate(&cd->common, &cd->mux,
 					     req, ccu_div_round_rate, cd);
 }
-- 
git-series 0.8.11

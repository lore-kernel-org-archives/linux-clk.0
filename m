Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Rajendra Nayak <rnayak@codeaurora.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 4/5] clk: qcom: Add gfx3d ping-pong PLL frequency switching
Date: Mon, 30 Nov 2015 17:31:41 -0800
Message-Id: <1448933502-11944-5-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1448933502-11944-1-git-send-email-sboyd@codeaurora.org>
References: <1448933502-11944-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The GPU clocks on msm8996 have three dedicated PLLs, MMPLL2,
MMPLL8, and MMPLL9. We leave MMPLL9 at the maximum speed (624
MHz), and we use MMPLL2 and MMPLL8 for the other frequencies. To
make switching frequencies faster, we ping-pong between MMPLL2
and MMPLL8 when we're switching between frequencies that aren't
the maximum. Implement custom rcg clk ops for this type of
frequency switching.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/qcom/clk-rcg.h  |  1 +
 drivers/clk/qcom/clk-rcg2.c | 87 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index 4b1e94bdf29e..b904c335cda4 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -178,5 +178,6 @@ extern const struct clk_ops clk_edp_pixel_ops;
 extern const struct clk_ops clk_byte_ops;
 extern const struct clk_ops clk_byte2_ops;
 extern const struct clk_ops clk_pixel_ops;
+extern const struct clk_ops clk_gfx3d_ops;
 
 #endif
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index b544bb302f79..a071bba8018c 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -723,3 +723,90 @@ const struct clk_ops clk_pixel_ops = {
 	.determine_rate = clk_pixel_determine_rate,
 };
 EXPORT_SYMBOL_GPL(clk_pixel_ops);
+
+static int clk_gfx3d_determine_rate(struct clk_hw *hw,
+				    struct clk_rate_request *req)
+{
+	struct clk_rate_request parent_req = { };
+	struct clk_hw *p2, *p8, *p9, *xo;
+	unsigned long p9_rate;
+	int ret;
+
+	xo = clk_hw_get_parent_by_index(hw, 0);
+	if (req->rate == clk_hw_get_rate(xo)) {
+		req->best_parent_hw = xo;
+		return 0;
+	}
+
+	p9 = clk_hw_get_parent_by_index(hw, 2);
+	p2 = clk_hw_get_parent_by_index(hw, 3);
+	p8 = clk_hw_get_parent_by_index(hw, 4);
+
+	/* PLL9 is a fixed rate PLL */
+	p9_rate = clk_hw_get_rate(p9);
+
+	parent_req.rate = req->rate = min(req->rate, p9_rate);
+	if (req->rate == p9_rate) {
+		req->rate = req->best_parent_rate = p9_rate;
+		req->best_parent_hw = p9;
+		return 0;
+	}
+
+	if (req->best_parent_hw == p9) {
+		/* Are we going back to a previously used rate? */
+		if (clk_hw_get_rate(p8) == req->rate)
+			req->best_parent_hw = p8;
+		else
+			req->best_parent_hw = p2;
+	} else if (req->best_parent_hw == p8) {
+		req->best_parent_hw = p2;
+	} else {
+		req->best_parent_hw = p8;
+	}
+
+	ret = __clk_determine_rate(req->best_parent_hw, &parent_req);
+	if (ret)
+		return ret;
+
+	req->rate = req->best_parent_rate = parent_req.rate;
+
+	return 0;
+}
+
+static int clk_gfx3d_set_rate_and_parent(struct clk_hw *hw, unsigned long rate,
+		unsigned long parent_rate, u8 index)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	u32 cfg;
+	int ret;
+
+	/* Just mux it, we don't use the division or m/n hardware */
+	cfg = rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
+	ret = regmap_write(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, cfg);
+	if (ret)
+		return ret;
+
+	return update_config(rcg);
+}
+
+static int clk_gfx3d_set_rate(struct clk_hw *hw, unsigned long rate,
+			      unsigned long parent_rate)
+{
+	/*
+	 * We should never get here; clk_gfx3d_determine_rate() should always
+	 * make us use a different parent than what we're currently using, so
+	 * clk_gfx3d_set_rate_and_parent() should always be called.
+	 */
+	return 0;
+}
+
+const struct clk_ops clk_gfx3d_ops = {
+	.is_enabled = clk_rcg2_is_enabled,
+	.get_parent = clk_rcg2_get_parent,
+	.set_parent = clk_rcg2_set_parent,
+	.recalc_rate = clk_rcg2_recalc_rate,
+	.set_rate = clk_gfx3d_set_rate,
+	.set_rate_and_parent = clk_gfx3d_set_rate_and_parent,
+	.determine_rate = clk_gfx3d_determine_rate,
+};
+EXPORT_SYMBOL_GPL(clk_gfx3d_ops);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

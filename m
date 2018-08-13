Return-Path: <anischal@codeaurora.org>
From: Amit Nischal <anischal@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Odelu Kukatla <okukatla@codeaurora.org>,
	Taniya Das <tdas@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amit Nischal <anischal@codeaurora.org>
Subject: [PATCH v3 2/4] clk: qcom: Add clk_rcg2_gfx3d_ops for SDM845
Date: Mon, 13 Aug 2018 12:03:05 +0530
Message-Id: <1534141987-29601-3-git-send-email-anischal@codeaurora.org>
In-Reply-To: <1534141987-29601-1-git-send-email-anischal@codeaurora.org>
References: <1534141987-29601-1-git-send-email-anischal@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

To turn on the gpu_gx_gdsc, there is a hardware requirement to
turn on the root clock (GFX3D RCG) first which would be the turn
on signal for the gdsc along with the SW_COLLAPSE. As per the
current implementation of clk_rcg2_shared_ops, it clears the
root_enable bit in the enable() clock op. But due to the above
said requirement for GFX3D shared RCG, root_enable bit would be
already set by gdsc driver and clk_rcg2_shared_enable()should
not clear the root unless the disable is called.

Add support for the same by reusing the existing clk_rcg2_shared_ops
and deriving "clk_rcg2_gfx3d_ops" clk_ops for GFX3D clock to take
care of the root set/clear requirement.

Signed-off-by: Amit Nischal <anischal@codeaurora.org>
---
 drivers/clk/qcom/clk-rcg.h  |  1 +
 drivers/clk/qcom/clk-rcg2.c | 86 +++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index dbd5a9e..081eca9 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -162,5 +162,6 @@ struct clk_rcg2 {
 extern const struct clk_ops clk_pixel_ops;
 extern const struct clk_ops clk_gfx3d_ops;
 extern const struct clk_ops clk_rcg2_shared_ops;
+extern const struct clk_ops clk_rcg2_gfx3d_ops;

 #endif
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 52208d4..a57ce00 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -866,7 +866,7 @@ static int clk_rcg2_shared_set_rate_and_parent(struct clk_hw *hw,
 	return clk_rcg2_shared_set_rate(hw, rate, parent_rate);
 }

-static int clk_rcg2_shared_enable(struct clk_hw *hw)
+static int __clk_rcg2_shared_enable(struct clk_hw *hw)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
 	int ret;
@@ -879,7 +879,14 @@ static int clk_rcg2_shared_enable(struct clk_hw *hw)
 	if (ret)
 		return ret;

-	ret = update_config(rcg);
+	return update_config(rcg);
+}
+
+static int clk_rcg2_shared_enable(struct clk_hw *hw)
+{
+	int ret;
+
+	ret = __clk_rcg2_shared_enable(hw);
 	if (ret)
 		return ret;

@@ -929,3 +936,78 @@ static void clk_rcg2_shared_disable(struct clk_hw *hw)
 	.set_rate_and_parent = clk_rcg2_shared_set_rate_and_parent,
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
+
+static int clk_rcg2_gfx3d_enable(struct clk_hw *hw)
+{
+	return __clk_rcg2_shared_enable(hw);
+}
+
+static int clk_rcg2_gfx3d_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
+{
+	struct clk_rate_request parent_req = { };
+	struct clk_hw *p;
+	unsigned long rate = req->rate;
+	int ret;
+
+	rate = clamp(rate, req->min_rate, req->max_rate);
+
+	/* Get fixed parent - GPU_CC_PLL0_OUT_EVEN */
+	p = clk_hw_get_parent_by_index(hw, 1);
+
+	/* Parent should always run at twice of the requested rate */
+	parent_req.rate = 2 * rate;
+
+	ret = __clk_determine_rate(req->best_parent_hw, &parent_req);
+	if (ret)
+		return ret;
+
+	req->best_parent_hw = p;
+	req->best_parent_rate = parent_req.rate;
+	req->rate = parent_req.rate / 2;
+
+	return 0;
+}
+
+static int clk_rcg2_gfx3d_set_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long parent_rate)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	int ret;
+	u32 cfg;
+
+	/* Configure fixed SRC and DIV */
+	cfg = rcg->parent_map[1].cfg << CFG_SRC_SEL_SHIFT;
+	cfg |= 0x3 << CFG_SRC_DIV_SHIFT;
+
+	ret = regmap_write(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, cfg);
+	if (ret)
+		return ret;
+
+	/*
+	 * In case clock is disabled, update the SRC and DIV only
+	 * and return without configuration update.
+	 */
+	if (!__clk_is_enabled(hw->clk))
+		return 0;
+
+	return update_config(rcg);
+}
+
+static int clk_rcg2_gfx3d_set_rate_and_parent(struct clk_hw *hw,
+		unsigned long rate, unsigned long parent_rate, u8 index)
+{
+	return clk_rcg2_gfx3d_set_rate(hw, rate, parent_rate);
+}
+
+const struct clk_ops clk_rcg2_gfx3d_ops = {
+	.enable = clk_rcg2_gfx3d_enable,
+	.disable = clk_rcg2_shared_disable,
+	.get_parent = clk_rcg2_get_parent,
+	.set_parent = clk_rcg2_set_parent,
+	.recalc_rate = clk_rcg2_recalc_rate,
+	.determine_rate = clk_rcg2_gfx3d_determine_rate,
+	.set_rate = clk_rcg2_gfx3d_set_rate,
+	.set_rate_and_parent = clk_rcg2_gfx3d_set_rate_and_parent,
+};
+EXPORT_SYMBOL_GPL(clk_rcg2_gfx3d_ops);
--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 6/7] clk: qcom: Add force enable/disable needed for gfx3d rcg on msm8996
Date: Wed, 19 Oct 2016 16:58:42 +0530
Message-Id: <1476876523-27378-7-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1476876523-27378-1-git-send-email-rnayak@codeaurora.org>
References: <1476876523-27378-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The gfx3d RCG on msm8996 needs to be force enabled/disabled by
toggling the CMD_ROOT_EN bit. Add enable/disable ops to clk_gfx3d_ops

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/clk-rcg2.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index a071bba..6c79cca 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -300,7 +300,7 @@ static int clk_rcg2_set_rate_and_parent(struct clk_hw *hw,
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_ops);
 
-static int clk_rcg2_shared_force_enable(struct clk_hw *hw, unsigned long rate)
+static int clk_rcg2_force_enable(struct clk_hw *hw)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
 	const char *name = clk_hw_get_name(hw);
@@ -316,20 +316,39 @@ static int clk_rcg2_shared_force_enable(struct clk_hw *hw, unsigned long rate)
 	for (count = 500; count > 0; count--) {
 		ret = clk_rcg2_is_enabled(hw);
 		if (ret)
-			break;
+			return 0;
 		udelay(1);
 	}
 	if (!count)
 		pr_err("%s: RCG did not turn on\n", name);
 
+	return -ETIMEDOUT;
+}
+
+static void clk_rcg2_force_disable(struct clk_hw *hw)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+
+	/* clear force enable RCG */
+	regmap_update_bits(rcg->clkr.regmap, rcg->cmd_rcgr + CMD_REG,
+			   CMD_ROOT_EN, 0);
+}
+
+static int clk_rcg2_shared_force_enable(struct clk_hw *hw, unsigned long rate)
+{
+	int ret;
+
+	ret = clk_rcg2_force_enable(hw);
+	if (ret)
+		return ret;
+
 	/* set clock rate */
 	ret = __clk_rcg2_set_rate(hw, rate);
 	if (ret)
 		return ret;
 
-	/* clear force enable RCG */
-	return regmap_update_bits(rcg->clkr.regmap, rcg->cmd_rcgr + CMD_REG,
-				 CMD_ROOT_EN, 0);
+	clk_rcg2_force_disable(hw);
+	return 0;
 }
 
 static int clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -801,6 +820,8 @@ static int clk_gfx3d_set_rate(struct clk_hw *hw, unsigned long rate,
 }
 
 const struct clk_ops clk_gfx3d_ops = {
+	.enable = clk_rcg2_force_enable,
+	.disable = clk_rcg2_force_disable,
 	.is_enabled = clk_rcg2_is_enabled,
 	.get_parent = clk_rcg2_get_parent,
 	.set_parent = clk_rcg2_set_parent,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Tirupathi Reddy <tirupath@codeaurora.org>
Subject: [PATCH 2/2] clk: qcom: common: Migrate to devm_* APIs for resets and clk providers
Date: Fri,  1 Sep 2017 16:16:41 -0700
Message-Id: <20170901231641.19141-3-sboyd@codeaurora.org>
In-Reply-To: <20170901231641.19141-1-sboyd@codeaurora.org>
References: <20170901231641.19141-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Now that we have devm APIs for the reset controller and of clk hw
provider APIs we can remove the custom code here.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/qcom/common.c | 26 ++------------------------
 1 file changed, 2 insertions(+), 24 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index d523991c945f..b35564c0493f 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -111,16 +111,6 @@ qcom_pll_set_fsm_mode(struct regmap *map, u32 reg, u8 bias_count, u8 lock_count)
 }
 EXPORT_SYMBOL_GPL(qcom_pll_set_fsm_mode);
 
-static void qcom_cc_del_clk_provider(void *data)
-{
-	of_clk_del_provider(data);
-}
-
-static void qcom_cc_reset_unregister(void *data)
-{
-	reset_controller_unregister(data);
-}
-
 static void qcom_cc_gdsc_unregister(void *data)
 {
 	gdsc_unregister(data);
@@ -248,13 +238,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 			return ret;
 	}
 
-	ret = of_clk_add_hw_provider(dev->of_node, qcom_cc_clk_hw_get, cc);
-	if (ret)
-		return ret;
-
-	ret = devm_add_action_or_reset(dev, qcom_cc_del_clk_provider,
-				       pdev->dev.of_node);
-
+	ret = devm_of_clk_add_hw_provider(dev, qcom_cc_clk_hw_get, cc);
 	if (ret)
 		return ret;
 
@@ -266,13 +250,7 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 	reset->regmap = regmap;
 	reset->reset_map = desc->resets;
 
-	ret = reset_controller_register(&reset->rcdev);
-	if (ret)
-		return ret;
-
-	ret = devm_add_action_or_reset(dev, qcom_cc_reset_unregister,
-				       &reset->rcdev);
-
+	ret = devm_reset_controller_register(dev, &reset->rcdev);
 	if (ret)
 		return ret;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

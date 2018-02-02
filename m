Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: smd-rpm: Migrate to devm_of_clk_add_hw_provider()
Date: Thu,  1 Feb 2018 16:33:26 -0800
Message-Id: <20180202003326.3571-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index c26d9007bfc4..850c02a52248 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -686,7 +686,7 @@ static int rpm_smd_clk_probe(struct platform_device *pdev)
 			goto err;
 	}
 
-	ret = of_clk_add_hw_provider(pdev->dev.of_node, qcom_smdrpm_clk_hw_get,
+	ret = devm_of_clk_add_hw_provider(&pdev->dev, qcom_smdrpm_clk_hw_get,
 				     rcc);
 	if (ret)
 		goto err;
@@ -697,19 +697,12 @@ static int rpm_smd_clk_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static int rpm_smd_clk_remove(struct platform_device *pdev)
-{
-	of_clk_del_provider(pdev->dev.of_node);
-	return 0;
-}
-
 static struct platform_driver rpm_smd_clk_driver = {
 	.driver = {
 		.name = "qcom-clk-smd-rpm",
 		.of_match_table = rpm_smd_clk_match_table,
 	},
 	.probe = rpm_smd_clk_probe,
-	.remove = rpm_smd_clk_remove,
 };
 
 static int __init rpm_smd_clk_init(void)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

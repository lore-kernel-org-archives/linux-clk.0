Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 6/6] clk: qcom: mmcc8974: Use gdscs .parent and remove genpd calls
Date: Thu, 26 Nov 2015 11:24:57 +0530
Message-Id: <1448517297-32419-7-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1448517297-32419-1-git-send-email-rnayak@codeaurora.org>
References: <1448517297-32419-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

With gdsc driver capable of handling hierarchical power domains,
specify oxili_gdsc as parent of oxilicx_gdsc.

Remove all direct calls to genpd from the mmcc clock driver. The
adding and removing of subdomains is now handled from within
the gdsc driver.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/mmcc-msm8974.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index 9d790bc..12cea42 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -2400,6 +2400,7 @@ static struct gdsc oxilicx_gdsc = {
 	.pd = {
 		.name = "oxilicx",
 	},
+	.parent = &oxili_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -2624,22 +2625,11 @@ static int mmcc_msm8974_probe(struct platform_device *pdev)
 	clk_pll_configure_sr_hpm_lp(&mmpll1, regmap, &mmpll1_config, true);
 	clk_pll_configure_sr_hpm_lp(&mmpll3, regmap, &mmpll3_config, false);
 
-	ret = qcom_cc_really_probe(pdev, &mmcc_msm8974_desc, regmap);
-	if (ret)
-		return ret;
-
-	return pm_genpd_add_subdomain(&oxili_gdsc.pd, &oxilicx_gdsc.pd);
-}
-
-static int mmcc_msm8974_remove(struct platform_device *pdev)
-{
-	pm_genpd_remove_subdomain(&oxili_gdsc.pd, &oxilicx_gdsc.pd);
-	return 0;
+	return qcom_cc_really_probe(pdev, &mmcc_msm8974_desc, regmap);
 }
 
 static struct platform_driver mmcc_msm8974_driver = {
 	.probe		= mmcc_msm8974_probe,
-	.remove		= mmcc_msm8974_remove,
 	.driver		= {
 		.name	= "mmcc-msm8974",
 		.of_match_table = mmcc_msm8974_match_table,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

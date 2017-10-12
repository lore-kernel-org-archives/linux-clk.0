Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	stanimir.varbanov@linaro.org,
	vivek.gautam@codeaurora.org,
	architt@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 2/3] clk: qcom: Register the gdscs before the clocks
Date: Thu, 12 Oct 2017 12:28:48 +0530
Message-Id: <1507791529-24353-3-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1507791529-24353-1-git-send-email-rnayak@codeaurora.org>
References: <1507791529-24353-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

We have atleast some instances of ALWAYS_ON gdscs, which need to
be turned ON *before* some clocks within the gdsc domain marked
with a CLK_IS_CRITICAL can be turned ON.
To facilitate this sequence, register the GDCSs (and hence handle
the ALWAYS_ON gdscs) before we register clocks (and handle the
clocks marked as CLK_IS_CRITICAL)

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/common.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index d523991..d7b0b6b 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -232,6 +232,22 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 	size_t num_clks = desc->num_clks;
 	struct clk_regmap **rclks = desc->clks;
 
+	if (desc->gdscs && desc->num_gdscs) {
+		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);
+		if (!scd)
+			return -ENOMEM;
+		scd->dev = dev;
+		scd->scs = desc->gdscs;
+		scd->num = desc->num_gdscs;
+		ret = gdsc_register(scd, &reset->rcdev, regmap);
+		if (ret)
+			return ret;
+		ret = devm_add_action_or_reset(dev, qcom_cc_gdsc_unregister,
+					       scd);
+		if (ret)
+			return ret;
+	}
+
 	cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
 	if (!cc)
 		return -ENOMEM;
@@ -276,22 +292,6 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 	if (ret)
 		return ret;
 
-	if (desc->gdscs && desc->num_gdscs) {
-		scd = devm_kzalloc(dev, sizeof(*scd), GFP_KERNEL);
-		if (!scd)
-			return -ENOMEM;
-		scd->dev = dev;
-		scd->scs = desc->gdscs;
-		scd->num = desc->num_gdscs;
-		ret = gdsc_register(scd, &reset->rcdev, regmap);
-		if (ret)
-			return ret;
-		ret = devm_add_action_or_reset(dev, qcom_cc_gdsc_unregister,
-					       scd);
-		if (ret)
-			return ret;
-	}
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

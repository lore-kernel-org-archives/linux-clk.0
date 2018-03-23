Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@kernel.org,
	mturquette@baylibre.com
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	stanimir.varbanov@linaro.org,
	vivek.gautam@codeaurora.org,
	srinivas.kandagatla@linaro.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 2/3] clk: qcom: Register the gdscs before the clocks
Date: Fri, 23 Mar 2018 13:56:15 +0530
Message-Id: <20180323082616.10142-3-rnayak@codeaurora.org>
In-Reply-To: <20180323082616.10142-1-rnayak@codeaurora.org>
References: <20180323082616.10142-1-rnayak@codeaurora.org>
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
index b8064a336d46..39ce64c2783b 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -228,22 +228,6 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 	if (!cc)
 		return -ENOMEM;
 
-	cc->rclks = rclks;
-	cc->num_rclks = num_clks;
-
-	for (i = 0; i < num_clks; i++) {
-		if (!rclks[i])
-			continue;
-
-		ret = devm_clk_register_regmap(dev, rclks[i]);
-		if (ret)
-			return ret;
-	}
-
-	ret = devm_of_clk_add_hw_provider(dev, qcom_cc_clk_hw_get, cc);
-	if (ret)
-		return ret;
-
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
 	reset->rcdev.ops = &qcom_reset_ops;
@@ -272,6 +256,22 @@ int qcom_cc_really_probe(struct platform_device *pdev,
 			return ret;
 	}
 
+	cc->rclks = rclks;
+	cc->num_rclks = num_clks;
+
+	for (i = 0; i < num_clks; i++) {
+		if (!rclks[i])
+			continue;
+
+		ret = devm_clk_register_regmap(dev, rclks[i]);
+		if (ret)
+			return ret;
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, qcom_cc_clk_hw_get, cc);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_cc_really_probe);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

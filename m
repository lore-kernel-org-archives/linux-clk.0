Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH v2 2/2] clk: qcom: Move cxo/pxo/xo into dt files
Date: Tue, 27 Oct 2015 16:05:00 -0700
Message-Id: <1445987100-19492-2-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1445987100-19492-1-git-send-email-sboyd@codeaurora.org>
References: <1445987100-19492-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Put these clocks into the dt files instead of registering them
from C code. This provides a few benefits. It allows us to
specify the frequency of these clocks at the board level instead
of hard-coding them in the driver. It allows us to insert an RPM
clock in between the consumers of the crystals and the actual
clock. And finally, it helps us transition the GCC driver to use
RPM clocks when that configuration is enabled.

Cc: Georgi Djakov <georgi.djakov@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---

Changes from v1:
 * Convert all armv7 platforms instead of just msm8960

 drivers/clk/qcom/gcc-apq8084.c | 16 +++++++---------
 drivers/clk/qcom/gcc-ipq806x.c | 14 ++++++--------
 drivers/clk/qcom/gcc-msm8660.c | 15 +++++++--------
 drivers/clk/qcom/gcc-msm8960.c | 14 ++++++--------
 drivers/clk/qcom/gcc-msm8974.c | 17 +++++++----------
 5 files changed, 33 insertions(+), 43 deletions(-)

diff --git a/drivers/clk/qcom/gcc-apq8084.c b/drivers/clk/qcom/gcc-apq8084.c
index 1567c3a79534..070037a29ea5 100644
--- a/drivers/clk/qcom/gcc-apq8084.c
+++ b/drivers/clk/qcom/gcc-apq8084.c
@@ -3607,18 +3607,16 @@ MODULE_DEVICE_TABLE(of, gcc_apq8084_match_table);
 
 static int gcc_apq8084_probe(struct platform_device *pdev)
 {
-	struct clk *clk;
+	int ret;
 	struct device *dev = &pdev->dev;
 
-	/* Temporary until RPM clocks supported */
-	clk = clk_register_fixed_rate(dev, "xo", NULL, CLK_IS_ROOT, 19200000);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	ret = qcom_cc_register_board_clk(dev, "xo_board", "xo", 19200000);
+	if (ret)
+		return ret;
 
-	clk = clk_register_fixed_rate(dev, "sleep_clk_src", NULL,
-				      CLK_IS_ROOT, 32768);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	ret = qcom_cc_register_sleep_clk(dev);
+	if (ret)
+		return ret;
 
 	return qcom_cc_probe(pdev, &gcc_apq8084_desc);
 }
diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
index 16fc64c082a5..dd5402bac620 100644
--- a/drivers/clk/qcom/gcc-ipq806x.c
+++ b/drivers/clk/qcom/gcc-ipq806x.c
@@ -3023,19 +3023,17 @@ MODULE_DEVICE_TABLE(of, gcc_ipq806x_match_table);
 
 static int gcc_ipq806x_probe(struct platform_device *pdev)
 {
-	struct clk *clk;
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
 	int ret;
 
-	/* Temporary until RPM clocks supported */
-	clk = clk_register_fixed_rate(dev, "cxo", NULL, CLK_IS_ROOT, 25000000);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	ret = qcom_cc_register_board_clk(dev, "cxo_board", "cxo", 19200000);
+	if (ret)
+		return ret;
 
-	clk = clk_register_fixed_rate(dev, "pxo", NULL, CLK_IS_ROOT, 25000000);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	ret = qcom_cc_register_board_clk(dev, "pxo_board", "pxo", 27000000);
+	if (ret)
+		return ret;
 
 	ret = qcom_cc_probe(pdev, &gcc_ipq806x_desc);
 	if (ret)
diff --git a/drivers/clk/qcom/gcc-msm8660.c b/drivers/clk/qcom/gcc-msm8660.c
index f110bb5a1df3..ad413036f7c7 100644
--- a/drivers/clk/qcom/gcc-msm8660.c
+++ b/drivers/clk/qcom/gcc-msm8660.c
@@ -2720,17 +2720,16 @@ MODULE_DEVICE_TABLE(of, gcc_msm8660_match_table);
 
 static int gcc_msm8660_probe(struct platform_device *pdev)
 {
-	struct clk *clk;
+	int ret;
 	struct device *dev = &pdev->dev;
 
-	/* Temporary until RPM clocks supported */
-	clk = clk_register_fixed_rate(dev, "cxo", NULL, CLK_IS_ROOT, 19200000);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	ret = qcom_cc_register_board_clk(dev, "cxo_board", "cxo", 19200000);
+	if (ret)
+		return ret;
 
-	clk = clk_register_fixed_rate(dev, "pxo", NULL, CLK_IS_ROOT, 27000000);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	ret = qcom_cc_register_board_clk(dev, "pxo_board", "pxo", 27000000);
+	if (ret)
+		return ret;
 
 	return qcom_cc_probe(pdev, &gcc_msm8660_desc);
 }
diff --git a/drivers/clk/qcom/gcc-msm8960.c b/drivers/clk/qcom/gcc-msm8960.c
index 66c18bc97857..983dd7dc89a7 100644
--- a/drivers/clk/qcom/gcc-msm8960.c
+++ b/drivers/clk/qcom/gcc-msm8960.c
@@ -3503,7 +3503,6 @@ MODULE_DEVICE_TABLE(of, gcc_msm8960_match_table);
 
 static int gcc_msm8960_probe(struct platform_device *pdev)
 {
-	struct clk *clk;
 	struct device *dev = &pdev->dev;
 	const struct of_device_id *match;
 	struct platform_device *tsens;
@@ -3513,14 +3512,13 @@ static int gcc_msm8960_probe(struct platform_device *pdev)
 	if (!match)
 		return -EINVAL;
 
-	/* Temporary until RPM clocks supported */
-	clk = clk_register_fixed_rate(dev, "cxo", NULL, CLK_IS_ROOT, 19200000);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	ret = qcom_cc_register_board_clk(dev, "cxo_board", "cxo", 19200000);
+	if (ret)
+		return ret;
 
-	clk = clk_register_fixed_rate(dev, "pxo", NULL, CLK_IS_ROOT, 27000000);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	ret = qcom_cc_register_board_clk(dev, "pxo_board", "pxo", 27000000);
+	if (ret)
+		return ret;
 
 	ret = qcom_cc_probe(pdev, match->data);
 	if (ret)
diff --git a/drivers/clk/qcom/gcc-msm8974.c b/drivers/clk/qcom/gcc-msm8974.c
index 28abb8f8f293..335952db309b 100644
--- a/drivers/clk/qcom/gcc-msm8974.c
+++ b/drivers/clk/qcom/gcc-msm8974.c
@@ -2717,7 +2717,7 @@ static void msm8974_pro_clock_override(void)
 
 static int gcc_msm8974_probe(struct platform_device *pdev)
 {
-	struct clk *clk;
+	int ret;
 	struct device *dev = &pdev->dev;
 	bool pro;
 	const struct of_device_id *id;
@@ -2730,16 +2730,13 @@ static int gcc_msm8974_probe(struct platform_device *pdev)
 	if (pro)
 		msm8974_pro_clock_override();
 
-	/* Temporary until RPM clocks supported */
-	clk = clk_register_fixed_rate(dev, "xo", NULL, CLK_IS_ROOT, 19200000);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	ret = qcom_cc_register_board_clk(dev, "xo_board", "xo", 19200000);
+	if (ret)
+		return ret;
 
-	/* Should move to DT node? */
-	clk = clk_register_fixed_rate(dev, "sleep_clk_src", NULL,
-				      CLK_IS_ROOT, 32768);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	ret = qcom_cc_register_sleep_clk(dev);
+	if (ret)
+		return ret;
 
 	return qcom_cc_probe(pdev, &gcc_msm8974_desc);
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

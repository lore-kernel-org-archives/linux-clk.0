Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org,
	agross@codeaurora.org
Cc: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	bjorn.andersson@sonymobile.com,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH v4 1/5] clk: qcom: msm8916: Move xo and sleep clocks into DT
Date: Thu, 19 Nov 2015 15:57:56 +0200
Message-Id: <1447941480-27487-2-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1447941480-27487-1-git-send-email-georgi.djakov@linaro.org>
References: <1447941480-27487-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Move the xo and sleep clocks to device-tree, instead of hard-coding
them in the driver. This allows us to insert the RPM clocks (if they
are enabled) in between the on-board oscillators and the actual clock.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c |   16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index d0a0313d6bef..8cc9b2868b41 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -3356,18 +3356,16 @@ MODULE_DEVICE_TABLE(of, gcc_msm8916_match_table);
 
 static int gcc_msm8916_probe(struct platform_device *pdev)
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
 
 	return qcom_cc_probe(pdev, &gcc_msm8916_desc);
 }

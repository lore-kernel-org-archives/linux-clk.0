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
Subject: [PATCH v3 7/8] clk: qcom: msm8916: Use RPMCC if it is enabled
Date: Tue, 20 Oct 2015 19:57:59 +0300
Message-Id: <1445360280-2347-8-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1445360280-2347-1-git-send-email-georgi.djakov@linaro.org>
References: <1445360280-2347-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

The RPM clock controller driver takes care of registering the
xo clock. Do not register it in this driver if RPM is enabled.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c |   16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 4bb7d8415ba7..3e1062fed230 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -3359,13 +3359,15 @@ static int gcc_msm8916_probe(struct platform_device *pdev)
 	struct clk *clk;
 	struct device *dev = &pdev->dev;
 
-	/* Temporary until RPM clocks supported */
-	clk = clk_register_fixed_factor(dev, "xo", "xo_board", 0, 1, 1);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
-
-	clk_register_fixed_rate(dev, "sleep_clk_src", NULL,
-				CLK_IS_ROOT, 32768);
+	if (!IS_ENABLED(CONFIG_QCOM_RPMCC)) {
+		/* RPM clocks are not enabled */
+		clk = clk_register_fixed_factor(dev, "xo", "xo_board", 0, 1, 1);
+		if (IS_ERR(clk))
+			return PTR_ERR(clk);
+
+		clk_register_fixed_rate(dev, "sleep_clk_src", NULL,
+					CLK_IS_ROOT, 32768);
+	}
 
 	return qcom_cc_probe(pdev, &gcc_msm8916_desc);
 }

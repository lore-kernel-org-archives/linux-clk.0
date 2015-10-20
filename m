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
Subject: [PATCH v3 3/8] clk: qcom: msm8916: Ignore sleep_clk_src registration errors
Date: Tue, 20 Oct 2015 19:57:55 +0300
Message-Id: <1445360280-2347-4-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1445360280-2347-1-git-send-email-georgi.djakov@linaro.org>
References: <1445360280-2347-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

We are moving the sleep clock to the DT. While all patches
are merged, we will ignore sleep_clk_src registration errors.
By ignoring this error, the msm8916 boards will continue booting
during this transition period, otherwise the clock controller
initialization will fail.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 3c0668b12142..4bb7d8415ba7 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -3364,10 +3364,8 @@ static int gcc_msm8916_probe(struct platform_device *pdev)
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
-	clk = clk_register_fixed_rate(dev, "sleep_clk_src", NULL,
-				      CLK_IS_ROOT, 32768);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	clk_register_fixed_rate(dev, "sleep_clk_src", NULL,
+				CLK_IS_ROOT, 32768);
 
 	return qcom_cc_probe(pdev, &gcc_msm8916_desc);
 }

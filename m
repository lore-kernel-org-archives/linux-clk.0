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
Subject: [PATCH v3 2/8] clk: qcom: msm8916: Set the parent of xo to xo_board
Date: Tue, 20 Oct 2015 19:57:54 +0300
Message-Id: <1445360280-2347-3-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1445360280-2347-1-git-send-email-georgi.djakov@linaro.org>
References: <1445360280-2347-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Remove the hard-coded clock rate from the driver and set the XO
parent to the on-board XO oscillator that is defined in the DT.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index d0a0313d6bef..3c0668b12142 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -3360,7 +3360,7 @@ static int gcc_msm8916_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 
 	/* Temporary until RPM clocks supported */
-	clk = clk_register_fixed_rate(dev, "xo", NULL, CLK_IS_ROOT, 19200000);
+	clk = clk_register_fixed_factor(dev, "xo", "xo_board", 0, 1, 1);
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 

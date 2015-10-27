Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH 2/2] clk: qcom: msm8960: Move cxo/pxo into dt files
Date: Mon, 26 Oct 2015 18:20:27 -0700
Message-Id: <1445908827-31015-2-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1445908827-31015-1-git-send-email-sboyd@codeaurora.org>
References: <1445908827-31015-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Put the cxo and pxo clocks into the dt files as 'cxo_board' and
'pxo_board'. This provides a few benefits. It allows us to
specify the frequency of these clocks at the board level instead
of hard-coding them in the driver. It allows us to insert an RPM
clock in between the consumers of the crystals and the actual
clock if desired. And finally, it helps us transition the GCC
driver to use RPM clocks when the configuration is enabled.

Cc: Georgi Djakov <georgi.djakov@linaro.org>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/qcom/gcc-msm8960.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8960.c b/drivers/clk/qcom/gcc-msm8960.c
index 66c18bc97857..6f11035bca93 100644
--- a/drivers/clk/qcom/gcc-msm8960.c
+++ b/drivers/clk/qcom/gcc-msm8960.c
@@ -3503,7 +3503,6 @@ MODULE_DEVICE_TABLE(of, gcc_msm8960_match_table);
 
 static int gcc_msm8960_probe(struct platform_device *pdev)
 {
-	struct clk *clk;
 	struct device *dev = &pdev->dev;
 	const struct of_device_id *match;
 	struct platform_device *tsens;
@@ -3513,14 +3512,18 @@ static int gcc_msm8960_probe(struct platform_device *pdev)
 	if (!match)
 		return -EINVAL;
 
-	/* Temporary until RPM clocks supported */
-	clk = clk_register_fixed_rate(dev, "cxo", NULL, CLK_IS_ROOT, 19200000);
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	/*
+	 * Backwards compatibility with old DTs. Register a pass-through
+	 * factor 1/1 clock to translate cxo_board into cxo and pxo_board
+	 * into pxo.
+	 */
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
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

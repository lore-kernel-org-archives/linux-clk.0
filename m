Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH] clk: qcom: ipq806x: Fix board clk rates
Date: Wed,  9 Nov 2016 17:13:37 -0800
Message-Id: <20161110011337.25707-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The clocks on these boards run at 25 MHz, not 19.2 and 27 like
other platforms. Unfortunately I copy/pasted from other similar
SoCs but forgot this one is different. Fix it.

Fixes: a085f877a882 ("clk: qcom: Move cxo/pxo/xo into dt files")
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq806x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806x.c
index 52a7d3959875..28eb200d0f1e 100644
--- a/drivers/clk/qcom/gcc-ipq806x.c
+++ b/drivers/clk/qcom/gcc-ipq806x.c
@@ -2990,11 +2990,11 @@ static int gcc_ipq806x_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	int ret;
 
-	ret = qcom_cc_register_board_clk(dev, "cxo_board", "cxo", 19200000);
+	ret = qcom_cc_register_board_clk(dev, "cxo_board", "cxo", 25000000);
 	if (ret)
 		return ret;
 
-	ret = qcom_cc_register_board_clk(dev, "pxo_board", "pxo", 27000000);
+	ret = qcom_cc_register_board_clk(dev, "pxo_board", "pxo", 25000000);
 	if (ret)
 		return ret;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

Return-Path: <stanimir.varbanov@linaro.org>
Return-Path: <stanimir.varbanov@linaro.org>
From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
To: Andy Gross <andy.gross@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Rajendra Nayak <rnayak@codeaurora.org>,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] clk: qcom: add parent for venus core0 and core1 gdsc's
Date: Thu,  9 Feb 2017 17:20:30 +0200
Message-Id: <1486653630-15552-1-git-send-email-stanimir.varbanov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Make venus_gdsc parent of venus gdsc core0 and core1.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/clk/qcom/mmcc-msm8996.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index 9b97246287a7..d9aa886d260f 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -2944,6 +2944,7 @@ static struct gdsc venus_core0_gdsc = {
 	.pd = {
 		.name = "venus_core0",
 	},
+	.parent = &venus_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = HW_CTRL,
 };
@@ -2955,6 +2956,7 @@ static struct gdsc venus_core1_gdsc = {
 	.pd = {
 		.name = "venus_core1",
 	},
+	.parent = &venus_gdsc.pd,
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = HW_CTRL,
 };
-- 
2.7.4

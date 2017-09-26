Return-Path: <absahu@codeaurora.org>
From: Abhishek Sahu <absahu@codeaurora.org>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH 03/11] clk: qcom: ipq8074: fix missing GPLL0 divider width
Date: Tue, 26 Sep 2017 17:53:56 +0530
Message-Id: <1506428644-2996-4-git-send-email-absahu@codeaurora.org>
In-Reply-To: <1506428644-2996-1-git-send-email-absahu@codeaurora.org>
References: <1506428644-2996-1-git-send-email-absahu@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

GPLL0 uses 4 bits post divider which should be specified
in clock driver structure.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/gcc-ipq8074.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-ipq8074.c b/drivers/clk/qcom/gcc-ipq8074.c
index 0f735d3..f9b6d51 100644
--- a/drivers/clk/qcom/gcc-ipq8074.c
+++ b/drivers/clk/qcom/gcc-ipq8074.c
@@ -82,6 +82,7 @@ enum {
 
 static struct clk_alpha_pll_postdiv gpll0 = {
 	.offset = 0x21000,
+	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0",
 		.parent_names = (const char *[]){
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

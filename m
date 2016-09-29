Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 08/11] clk: qcom: mmcc-8996: Add capability flags for some alpha PLLs
Date: Thu, 29 Sep 2016 14:05:49 +0530
Message-Id: <1475138152-859-9-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
References: <1475138152-859-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Flag alpha PLLs which support fsmmode, dynamic update and the ones
with latched input interface.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/mmcc-msm8996.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index 847dd9d..f2f40ce 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -269,6 +269,7 @@ static struct clk_alpha_pll mmpll0_early = {
 	.offset = 0x0,
 	.vco_table = mmpll_p_vco,
 	.num_vco = ARRAY_SIZE(mmpll_p_vco),
+	.flags = SUPPORTS_FSM_MODE,
 	.clkr = {
 		.enable_reg = 0x100,
 		.enable_mask = BIT(0),
@@ -297,6 +298,7 @@ static struct clk_alpha_pll mmpll1_early = {
 	.offset = 0x30,
 	.vco_table = mmpll_p_vco,
 	.num_vco = ARRAY_SIZE(mmpll_p_vco),
+	.flags = SUPPORTS_FSM_MODE,
 	.clkr = {
 		.enable_reg = 0x100,
 		.enable_mask = BIT(1),
@@ -445,6 +447,8 @@ static struct clk_alpha_pll mmpll9_early = {
 	.offset = 0x4200,
 	.vco_table = mmpll_t_vco,
 	.num_vco = ARRAY_SIZE(mmpll_t_vco),
+	.flags = SUPPORTS_DYNAMIC_UPDATE | SUPPORTS_LATCHED_INPUT,
+	.latch_ack_bit = 29,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll9_early",
 		.parent_names = (const char *[]){ "xo" },
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

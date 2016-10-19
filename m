Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 5/7] clk: qcom: Mark a few clocks as BRANCH_VOTED
Date: Wed, 19 Oct 2016 16:58:41 +0530
Message-Id: <1476876523-27378-6-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1476876523-27378-1-git-send-email-rnayak@codeaurora.org>
References: <1476876523-27378-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Mark some of the bimc and smmu clocks with BRANCH_VOTED so
we just add a delay on disable without waiting on the halt
status.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/gcc-msm8996.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index f6124cf..2c01b62 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -1341,6 +1341,7 @@ enum {
 
 static struct clk_branch gcc_mmss_bimc_gfx_clk = {
 	.halt_reg = 0x9010,
+	.halt_check = BRANCH_VOTED,
 	.clkr = {
 		.enable_reg = 0x9010,
 		.enable_mask = BIT(0),
@@ -2897,6 +2898,7 @@ enum {
 
 static struct clk_branch gcc_smmu_aggre0_axi_clk = {
 	.halt_reg = 0x81014,
+	.halt_check = BRANCH_VOTED,
 	.clkr = {
 		.enable_reg = 0x81014,
 		.enable_mask = BIT(0),
@@ -2912,6 +2914,7 @@ enum {
 
 static struct clk_branch gcc_smmu_aggre0_ahb_clk = {
 	.halt_reg = 0x81018,
+	.halt_check = BRANCH_VOTED,
 	.clkr = {
 		.enable_reg = 0x81018,
 		.enable_mask = BIT(0),
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

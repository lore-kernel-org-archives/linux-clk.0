Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 3/7] clk: qcom: Add custom udelays for clks in msm8996
Date: Wed, 19 Oct 2016 16:58:39 +0530
Message-Id: <1476876523-27378-4-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1476876523-27378-1-git-send-email-rnayak@codeaurora.org>
References: <1476876523-27378-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Some of the branch clocks in msm8996 which are marked with
a BRANCH_HALT_DELAY require a little more than the default
10us delay, so specify some custom delays for such clocks

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/gcc-msm8996.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 4e78924..3c85e05 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -1389,6 +1389,7 @@ enum {
 
 static struct clk_branch gcc_usb3_phy_pipe_clk = {
 	.halt_check = BRANCH_HALT_DELAY,
+	.udelay = 50,
 	.clkr = {
 		.enable_reg = 0x50004,
 		.enable_mask = BIT(0),
@@ -2443,6 +2444,7 @@ enum {
 
 static struct clk_branch gcc_pcie_0_pipe_clk = {
 	.halt_check = BRANCH_HALT_DELAY,
+	.udelay = 500,
 	.clkr = {
 		.enable_reg = 0x6b018,
 		.enable_mask = BIT(0),
@@ -2518,6 +2520,7 @@ enum {
 
 static struct clk_branch gcc_pcie_1_pipe_clk = {
 	.halt_check = BRANCH_HALT_DELAY,
+	.udelay = 500,
 	.clkr = {
 		.enable_reg = 0x6d018,
 		.enable_mask = BIT(0),
@@ -2593,6 +2596,7 @@ enum {
 
 static struct clk_branch gcc_pcie_2_pipe_clk = {
 	.halt_check = BRANCH_HALT_DELAY,
+	.udelay = 500,
 	.clkr = {
 		.enable_reg = 0x6e018,
 		.enable_mask = BIT(0),
@@ -2722,6 +2726,7 @@ enum {
 
 static struct clk_branch gcc_ufs_tx_symbol_0_clk = {
 	.halt_check = BRANCH_HALT_DELAY,
+	.udelay = 500,
 	.clkr = {
 		.enable_reg = 0x75018,
 		.enable_mask = BIT(0),
@@ -2737,6 +2742,7 @@ enum {
 
 static struct clk_branch gcc_ufs_rx_symbol_0_clk = {
 	.halt_check = BRANCH_HALT_DELAY,
+	.udelay = 500,
 	.clkr = {
 		.enable_reg = 0x7501c,
 		.enable_mask = BIT(0),
@@ -2752,6 +2758,7 @@ enum {
 
 static struct clk_branch gcc_ufs_rx_symbol_1_clk = {
 	.halt_check = BRANCH_HALT_DELAY,
+	.udelay = 500,
 	.clkr = {
 		.enable_reg = 0x75020,
 		.enable_mask = BIT(0),
@@ -2809,6 +2816,7 @@ enum {
 
 static struct clk_branch gcc_ufs_sys_clk_core_clk = {
 	.halt_check = BRANCH_HALT_DELAY,
+	.udelay = 500,
 	.clkr = {
 		.enable_reg = 0x76030,
 		.enable_mask = BIT(0),
@@ -2821,6 +2829,7 @@ enum {
 
 static struct clk_branch gcc_ufs_tx_symbol_clk_core_clk = {
 	.halt_check = BRANCH_HALT_DELAY,
+	.udelay = 500,
 	.clkr = {
 		.enable_reg = 0x76034,
 		.enable_mask = BIT(0),
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

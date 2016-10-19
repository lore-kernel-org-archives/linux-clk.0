Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	tdas@codeaurora.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 1/7] clk: qcom: Mark a few branch clocks with BRANCH_HALT_DELAY
Date: Wed, 19 Oct 2016 16:58:37 +0530
Message-Id: <1476876523-27378-2-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1476876523-27378-1-git-send-email-rnayak@codeaurora.org>
References: <1476876523-27378-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

We seem to have a few branch clocks within gcc for msm8996 which do
have a valid halt bit but can't be used to check branch enable/disable
status as they rely on external clocks in some cases and in some 
others only toggle during an ongoing bus transaction.
Mark these with BRANCH_HALT_DELAY, so we just add a delay instead.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/clk/qcom/gcc-msm8996.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index fe03e6f..4e78924 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -1388,7 +1388,7 @@ enum {
 };
 
 static struct clk_branch gcc_usb3_phy_pipe_clk = {
-	.halt_reg = 0x50004,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x50004,
 		.enable_mask = BIT(0),
@@ -2442,7 +2442,7 @@ enum {
 };
 
 static struct clk_branch gcc_pcie_0_pipe_clk = {
-	.halt_reg = 0x6b018,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x6b018,
 		.enable_mask = BIT(0),
@@ -2517,7 +2517,7 @@ enum {
 };
 
 static struct clk_branch gcc_pcie_1_pipe_clk = {
-	.halt_reg = 0x6d018,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x6d018,
 		.enable_mask = BIT(0),
@@ -2592,7 +2592,7 @@ enum {
 };
 
 static struct clk_branch gcc_pcie_2_pipe_clk = {
-	.halt_reg = 0x6e018,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x6e018,
 		.enable_mask = BIT(0),
@@ -2721,7 +2721,7 @@ enum {
 };
 
 static struct clk_branch gcc_ufs_tx_symbol_0_clk = {
-	.halt_reg = 0x75018,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x75018,
 		.enable_mask = BIT(0),
@@ -2736,7 +2736,7 @@ enum {
 };
 
 static struct clk_branch gcc_ufs_rx_symbol_0_clk = {
-	.halt_reg = 0x7501c,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x7501c,
 		.enable_mask = BIT(0),
@@ -2751,7 +2751,7 @@ enum {
 };
 
 static struct clk_branch gcc_ufs_rx_symbol_1_clk = {
-	.halt_reg = 0x75020,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x75020,
 		.enable_mask = BIT(0),
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

Return-Path: <sricharan@codeaurora.org>
From: Sricharan R <sricharan@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rnayak@codeaurora.org,
	stanimir.varbanov@linaro.org
Cc: sricharan@codeaurora.org
Subject: [PATCH 3/3] clk: qcom: Set BRANCH_HALT_DELAY flags for venus core0/1 clks
Date: Mon, 24 Oct 2016 15:48:17 +0530
Message-Id: <1477304297-5248-4-git-send-email-sricharan@codeaurora.org>
In-Reply-To: <1477304297-5248-1-git-send-email-sricharan@codeaurora.org>
References: <1477304297-5248-1-git-send-email-sricharan@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

With the venus subcore0/1 gdscs(powerdomains) in
hw controlled mode, the clock controller does not handle
the status bit for the clocks in that domain. So avoid
checking for the status bit of those clocks by setting the
BRANCH_HALT_DELAY flag. This avoids the WARN_ONs which
otherwise occurs when enabling/disabling those clocks.

Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 drivers/clk/qcom/mmcc-msm8996.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index 41aabe3..8f3f480 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -1760,6 +1760,7 @@ enum {
 };
 
 static struct clk_branch video_subcore0_clk = {
+	.halt_check = BRANCH_HALT_DELAY,
 	.halt_reg = 0x1048,
 	.clkr = {
 		.enable_reg = 0x1048,
@@ -1775,6 +1776,7 @@ enum {
 };
 
 static struct clk_branch video_subcore1_clk = {
+	.halt_check = BRANCH_HALT_DELAY,
 	.halt_reg = 0x104c,
 	.clkr = {
 		.enable_reg = 0x104c,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

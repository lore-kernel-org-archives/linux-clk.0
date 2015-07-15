Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@sonymobile.com>
Subject: [PATCH] clk: qcom: Set CLK_SET_RATE_PARENT on ce1 clocks
Date: Tue, 14 Jul 2015 17:09:24 -0700
Message-Id: <1436918964-3895-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The other ce clocks have the flag set, but ce1 doesn't, so
clk_set_rate() doesn't propagate up the tree to the ce1_src_clk.
Set the flag as this is supported.

Reported-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Fixes: 02824653200b ("clk: qcom: Add APQ8084 Global Clock Controller support")
Fixes: d33faa9ead8d ("clk: qcom: Add support for MSM8974's global clock controller (GCC)")
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/qcom/gcc-apq8084.c | 1 +
 drivers/clk/qcom/gcc-msm8974.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-apq8084.c b/drivers/clk/qcom/gcc-apq8084.c
index 05b7a25b80e8..3563019b8e3c 100644
--- a/drivers/clk/qcom/gcc-apq8084.c
+++ b/drivers/clk/qcom/gcc-apq8084.c
@@ -2105,6 +2105,7 @@ static struct clk_branch gcc_ce1_clk = {
 				"ce1_clk_src",
 			},
 			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
diff --git a/drivers/clk/qcom/gcc-msm8974.c b/drivers/clk/qcom/gcc-msm8974.c
index 2c289702119f..2bcf87538f9d 100644
--- a/drivers/clk/qcom/gcc-msm8974.c
+++ b/drivers/clk/qcom/gcc-msm8974.c
@@ -1783,6 +1783,7 @@ static struct clk_branch gcc_ce1_clk = {
 				"ce1_clk_src",
 			},
 			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


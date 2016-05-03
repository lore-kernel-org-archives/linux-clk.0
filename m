Return-Path: <andy.gross@linaro.org>
Return-Path: <andy.gross@linaro.org>
From: Andy Gross <andy.gross@linaro.org>
To: linux-clk@vger.kernel.org
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	Andy Gross <andy.gross@linaro.org>
Subject: [PATCH] clk: qcom: msm8916: Fix crypto clock flags
Date: Tue,  3 May 2016 15:24:11 -0500
Message-Id: <1462307051-19256-1-git-send-email-andy.gross@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

This patch adds the CLK_SET_RATE_PARENT flag for the crypto core and
ahb blocks.  Without this flag, clk_set_rate can fail for certain
frequency requests.

Signed-off-by: Andy Gross <andy.gross@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 9c29080..5c4e193 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -2346,6 +2346,7 @@ static struct clk_branch gcc_crypto_ahb_clk = {
 				"pcnoc_bfdcd_clk_src",
 			},
 			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2381,6 +2382,7 @@ static struct clk_branch gcc_crypto_clk = {
 				"crypto_clk_src",
 			},
 			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
-- 
1.9.1

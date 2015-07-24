Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org, agross@codeaurora.org
Cc: mturquette@linaro.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH v2 1/5] clk: qcom: Enable gpll0_vote rate propagation on MSM8916
Date: Fri, 24 Jul 2015 19:58:35 +0300
Message-Id: <1437757119-6910-2-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1437757119-6910-1-git-send-email-georgi.djakov@linaro.org>
References: <1437757119-6910-1-git-send-email-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Currently we are missing the SET_RATE_PARENT flag on gpll0_vote and
as a result of that, when it has a child with SET_RATE_PARENT flag,
the rate of the child is not propagated up to the gpll0. Fix that
by adding the SET_RATE_PARENT flag to gpll0_vote.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 28ef2c771157..3019e89cdfa8 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -216,6 +216,7 @@ static struct clk_regmap gpll0_vote = {
 		.parent_names = (const char *[]){ "gpll0" },
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 

Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@baylibre.com,
	robdclark@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH] clk: qcom: msm8916: Fix bimc gpu clock ops
Date: Fri, 18 Aug 2017 17:22:50 +0300
Message-Id: <20170818142250.27867-1-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

The clock bimc_gpu_clk_src is incorrectly set to use the shared rcg2
ops, which are for RCGs with child branches controlled by different
CPUs.

The result of the incorrect ops is that the GPU's PM runtime may leave
this clock set at a very low rate. Fix this issue by using the correct
rcg2 ops.

Fixes: a2e8272f3f89 ("clk: qcom: Add MSM8916 gpu clocks")
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 2cfe7000fc60..3410ee68d4bc 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -1176,7 +1176,7 @@ static struct clk_rcg2 bimc_gpu_clk_src = {
 		.parent_names = gcc_xo_gpll0_bimc,
 		.num_parents = 3,
 		.flags = CLK_GET_RATE_NOCACHE,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 

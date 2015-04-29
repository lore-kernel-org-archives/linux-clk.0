Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@linaro.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: Fix MSM8916 gfx3d_clk_src configuration
Date: Wed, 29 Apr 2015 14:52:47 +0300
Message-Id: <1430308367-19567-2-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1430308367-19567-1-git-send-email-georgi.djakov@linaro.org>
References: <1430308367-19567-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

The gfx3d_clk_src parents configuration is incorrect. Fix it.

Fixes: 3966fab8b6ab "clk: qcom: Add MSM8916 Global Clock Controller support"
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index b15d52b56c6a..c66f7bc2ae87 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -71,8 +71,8 @@ static const char *gcc_xo_gpll0_bimc[] = {
 static const struct parent_map gcc_xo_gpll0a_gpll1_gpll2a_map[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_AUX, 3 },
-	{ P_GPLL2_AUX, 2 },
 	{ P_GPLL1, 1 },
+	{ P_GPLL2_AUX, 2 },
 };
 
 static const char *gcc_xo_gpll0a_gpll1_gpll2a[] = {

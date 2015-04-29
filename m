Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@linaro.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: Fix MSM8916 venus divider value
Date: Wed, 29 Apr 2015 14:52:46 +0300
Message-Id: <1430308367-19567-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

One of the video codec clock frequencies has incorrect divider value. Fix it.

Fixes: 3966fab8b6ab "clk: qcom: Add MSM8916 Global Clock Controller support"
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index d3458474eb3a..b15d52b56c6a 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -1115,7 +1115,7 @@ static struct clk_rcg2 usb_hs_system_clk_src = {
 static const struct freq_tbl ftbl_gcc_venus0_vcodec0_clk[] = {
 	F(100000000, P_GPLL0, 8, 0, 0),
 	F(160000000, P_GPLL0, 5, 0, 0),
-	F(228570000, P_GPLL0, 5, 0, 0),
+	F(228570000, P_GPLL0, 3.5, 0, 0),
 	{ }
 };
 

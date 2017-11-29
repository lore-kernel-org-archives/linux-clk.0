Return-Path: <linux-kernel-owner@vger.kernel.org>
From: srinivas.kandagatla@linaro.org
To: sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] clk: qcom: msm8916: Fix i2s clk rates required for mclk
Date: Wed, 29 Nov 2017 18:25:25 +0000
Message-Id: <20171129182525.18603-1-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

lpaif i2s clk rates in the freq table are not accurate enough
for I2S mclk. Fix the inaccurate ones and add few more clock
rates that are used in LPASS audio driver.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 3410ee68d4bc..506e0736bf92 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -1259,20 +1259,25 @@ static struct clk_branch gcc_ultaudio_ahbfabric_ixfabric_lpm_clk = {
 };
 
 static const struct freq_tbl ftbl_gcc_ultaudio_lpaif_i2s_clk[] = {
+	F(128000, P_XO, 10, 1, 15),
 	F(256000, P_XO, 5, 1, 15),
+	F(384000, P_XO, 5, 1, 10),
 	F(512000, P_XO, 5, 2, 15),
+	F(576000, P_XO, 5, 3, 20),
 	F(705600, P_GPLL1, 16, 1, 80),
 	F(768000, P_XO, 5, 1, 5),
 	F(800000, P_XO, 5, 5, 24),
-	F(1024000, P_GPLL1, 14, 1, 63),
+	F(1024000, P_XO, 5, 4, 15),
 	F(1152000, P_XO, 1, 3, 50),
 	F(1411200, P_GPLL1, 16, 1, 40),
 	F(1536000, P_XO, 1, 2, 25),
 	F(1600000, P_XO, 12, 0, 0),
-	F(2048000, P_GPLL1, 9, 1, 49),
+	F(1728000, P_XO, 5, 9, 20),
+	F(2048000, P_XO, 5, 8, 15),
+	F(2304000, P_XO, 5, 3, 5),
 	F(2400000, P_XO, 8, 0, 0),
 	F(2822400, P_GPLL1, 16, 1, 20),
-	F(3072000, P_GPLL1, 14, 1, 21),
+	F(3072000, P_XO, 5, 4, 5),
 	F(4096000, P_GPLL1, 9, 2, 49),
 	F(4800000, P_XO, 4, 0, 0),
 	F(5644800, P_GPLL1, 16, 1, 10),
-- 
2.15.0

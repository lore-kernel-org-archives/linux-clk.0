Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/2] clk: gcc-msm8996: Fix pcie 2 pipe register offset
Date: Thu, 25 Aug 2016 12:20:46 +0100
Message-Id: <1472124047-22627-1-git-send-email-srinivas.kandagatla@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

This patch corrects the register offset for pcie2 pipe clock.
Offset according to datasheet is 0x6e018 instead of 0x6e108.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/clk/qcom/gcc-msm8996.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index a1ef12f..456b2f4 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -2592,9 +2592,9 @@ static struct clk_branch gcc_pcie_2_aux_clk = {
 };
 
 static struct clk_branch gcc_pcie_2_pipe_clk = {
-	.halt_reg = 0x6e108,
+	.halt_reg = 0x6e018,
 	.clkr = {
-		.enable_reg = 0x6e108,
+		.enable_reg = 0x6e018,
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_2_pipe_clk",
-- 
2.7.4

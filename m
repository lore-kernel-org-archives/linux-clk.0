Return-Path: <srinivas.kandagatla@linaro.org>
Return-Path: <srinivas.kandagatla@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH] clk: qcom: msm8960: fix ce3_core clk enable register
Date: Mon, 22 Feb 2016 11:43:39 +0000
Message-Id: <1456141419-7439-1-git-send-email-srinivas.kandagatla@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

This patch corrects the enable register offset which is actually 0x36cc
instead of 0x36c4

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 drivers/clk/qcom/gcc-msm8960.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8960.c b/drivers/clk/qcom/gcc-msm8960.c
index 063e0f0..d14eae1 100644
--- a/drivers/clk/qcom/gcc-msm8960.c
+++ b/drivers/clk/qcom/gcc-msm8960.c
@@ -2928,7 +2928,7 @@ static struct clk_branch ce3_core_clk = {
 	.halt_reg = 0x2fdc,
 	.halt_bit = 5,
 	.clkr = {
-		.enable_reg = 0x36c4,
+		.enable_reg = 0x36cc,
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
 			.name = "ce3_core_clk",
-- 
1.9.1

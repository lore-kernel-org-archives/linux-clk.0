Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	stanimir.varbanov@linaro.org, georgi.djakov@linaro.org
Subject: [PATCH] clk: qcom: Fix MSM8916 prng clock enable bit
Date: Tue, 25 Aug 2015 15:27:43 +0300
Message-Id: <1440505663-6218-1-git-send-email-georgi.djakov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Fix the enable bit of the pseudorandom number generator clock.

Reported-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Fixes: 3966fab8b6ab "clk: qcom: Add MSM8916 Global Clock Controller support"
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 3bf4fb3deef6..22a4e1e732c0 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -2278,7 +2278,7 @@ static struct clk_branch gcc_prng_ahb_clk = {
 	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
 		.enable_reg = 0x45004,
-		.enable_mask = BIT(0),
+		.enable_mask = BIT(8),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_prng_ahb_clk",
 			.parent_names = (const char *[]){

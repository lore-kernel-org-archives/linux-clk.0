Return-Path: <linus.walleij@linaro.org>
Return-Path: <linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] clk: qcom: add EBI2 clocks to the MSM8660 GCC
Date: Fri,  1 Jul 2016 17:54:01 +0200
Message-Id: <1467388441-22352-1-git-send-email-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

This adds the EBI2 2X and EBI2 clocks to the MSM8660/APQ8060
GCC. This is necessary to enable clocking of the external bus
interface so that peripherals on it can be mounted. These two
clocks are simple gated branch clocks.

In the vendor tree clock-8x60, these clocks have some kind of
dependency, the EBI2 clock has .depends = &ebi2_2x_clk.c,
what this means is undocumented, it doesn't seem like there
is a parent/child relationship, so the solution I chose was to
just have the EBI2 driver get and enable both clocks.

Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Any comments or documenation welcome, after googling around
it seems that the EBI2 found in the MSM8x60 is basically
undocumented and the code contains cryptic hex values with
little or no explanation.
---
 drivers/clk/qcom/gcc-msm8660.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8660.c b/drivers/clk/qcom/gcc-msm8660.c
index 6dc55864979c..c347a0d44bc8 100644
--- a/drivers/clk/qcom/gcc-msm8660.c
+++ b/drivers/clk/qcom/gcc-msm8660.c
@@ -2290,6 +2290,32 @@ static struct clk_branch sdc5_h_clk = {
 	},
 };
 
+static struct clk_branch ebi2_2x_clk = {
+	.halt_reg = 0x2fcc,
+	.halt_bit = 18,
+	.clkr = {
+		.enable_reg = 0x2660,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "ebi2_2x_clk",
+			.ops = &clk_branch_ops,
+		},
+	},
+};
+
+static struct clk_branch ebi2_clk = {
+	.halt_reg = 0x2fcc,
+	.halt_bit = 19,
+	.clkr = {
+		.enable_reg = 0x2664,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "ebi2_clk",
+			.ops = &clk_branch_ops,
+		},
+	},
+};
+
 static struct clk_branch adm0_clk = {
 	.halt_reg = 0x2fdc,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -2533,6 +2559,8 @@ static struct clk_regmap *gcc_msm8660_clks[] = {
 	[SDC3_H_CLK] = &sdc3_h_clk.clkr,
 	[SDC4_H_CLK] = &sdc4_h_clk.clkr,
 	[SDC5_H_CLK] = &sdc5_h_clk.clkr,
+	[EBI2_2X_CLK] = &ebi2_2x_clk.clkr,
+	[EBI2_CLK] = &ebi2_clk.clkr,
 	[ADM0_CLK] = &adm0_clk.clkr,
 	[ADM0_PBUS_CLK] = &adm0_pbus_clk.clkr,
 	[ADM1_CLK] = &adm1_clk.clkr,
-- 
2.4.11

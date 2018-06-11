Return-Path: <anischal@codeaurora.org>
From: Amit Nischal <anischal@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Odelu Kukatla <okukatla@codeaurora.org>,
	Taniya Das <tdas@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amit Nischal <anischal@codeaurora.org>
Subject: [PATCH v3] clk: qcom: Enable clocks which needs to be always on for SDM845
Date: Mon, 11 Jun 2018 12:08:15 +0530
Message-Id: <1528699095-17930-1-git-send-email-anischal@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

There are certain clocks which needs to be always enabled for system
operation. Add support for the same by adding 'CLK_IS_CRITICAL' flag
for such clocks.

Signed-off-by: Amit Nischal <anischal@codeaurora.org>
---

Changes in v3:
* Addressed review comments by Stephen to associate 'CLK_IS_CRITICAL'
  flag for the clocks which are required to be always ON.
* Added two gcc_cpuss* critical clocks and remove direct clock enable
  for them from gcc probe function.

Changes in v2:
* Fix target name in kernel configuration help text for SDM845 GCC
  clock driver.

[v1]: https://lkml.org/lkml/2018/5/28/171
[v2]: https://lkml.org/lkml/2018/5/29/43

 drivers/clk/qcom/gcc-sdm845.c               | 43 ++++++++++++++++++++++++++---
 include/dt-bindings/clock/qcom,gcc-sdm845.h |  2 ++
 2 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index e78e6f5..0f694ed 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -1103,6 +1103,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camera_ahb_clk",
+			.flags = CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1129,6 +1130,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camera_xo_clk",
+			.flags = CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1270,6 +1272,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_disp_ahb_clk",
+			.flags = CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1328,6 +1331,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_disp_xo_clk",
+			.flags = CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1397,6 +1401,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gpu_cfg_ahb_clk",
+			.flags = CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2985,6 +2990,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_video_ahb_clk",
+			.flags = CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -3011,6 +3017,7 @@ enum {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_video_xo_clk",
+			.flags = CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -3049,6 +3056,36 @@ enum {
 	},
 };

+static struct clk_branch gcc_cpuss_dvm_bus_clk = {
+	.halt_reg = 0x48190,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x48190,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_cpuss_dvm_bus_clk",
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_cpuss_gnoc_clk = {
+	.halt_reg = 0x48004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x48004,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52004,
+		.enable_mask = BIT(22),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_cpuss_gnoc_clk",
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct gdsc pcie_0_gdsc = {
 	.gdscr = 0x6b004,
 	.pd = {
@@ -3344,6 +3381,8 @@ enum {
 	[GPLL0] = &gpll0.clkr,
 	[GPLL0_OUT_EVEN] = &gpll0_out_even.clkr,
 	[GPLL4] = &gpll4.clkr,
+	[GCC_CPUSS_DVM_BUS_CLK] = &gcc_cpuss_dvm_bus_clk.clkr,
+	[GCC_CPUSS_GNOC_CLK] = &gcc_cpuss_gnoc_clk.clkr,
 };

 static const struct qcom_reset_map gcc_sdm845_resets[] = {
@@ -3433,10 +3472,6 @@ static int gcc_sdm845_probe(struct platform_device *pdev)
 	regmap_update_bits(regmap, 0x09ffc, 0x3, 0x3);
 	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);

-	/* Enable CPUSS clocks */
-	regmap_update_bits(regmap, 0x48190, BIT(0), 0x1);
-	regmap_update_bits(regmap, 0x52004, BIT(22), 0x1);
-
 	return qcom_cc_really_probe(pdev, &gcc_sdm845_desc, regmap);
 }

diff --git a/include/dt-bindings/clock/qcom,gcc-sdm845.h b/include/dt-bindings/clock/qcom,gcc-sdm845.h
index aca6126..f96fc2d 100644
--- a/include/dt-bindings/clock/qcom,gcc-sdm845.h
+++ b/include/dt-bindings/clock/qcom,gcc-sdm845.h
@@ -192,6 +192,8 @@
 #define GCC_VS_CTRL_CLK_SRC					182
 #define GCC_VSENSOR_CLK_SRC					183
 #define GPLL4							184
+#define GCC_CPUSS_DVM_BUS_CLK					185
+#define GCC_CPUSS_GNOC_CLK					186

 /* GCC Resets */
 #define GCC_MMSS_BCR						0
--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

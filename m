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
Subject: [PATCH v2 3/4] dt-bindings: clock: Introduce QCOM Graphics clock bindings
Date: Thu, 12 Jul 2018 22:39:40 +0530
Message-Id: <1531415381-16885-4-git-send-email-anischal@codeaurora.org>
In-Reply-To: <1531415381-16885-1-git-send-email-anischal@codeaurora.org>
References: <1531415381-16885-1-git-send-email-anischal@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Add device tree bindings for graphics clock controller for
Qualcomm Technology Inc's SDM845 SoCs.

Signed-off-by: Amit Nischal <anischal@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,gpucc.txt       | 18 ++++++++++
 include/dt-bindings/clock/qcom,gpucc-sdm845.h      | 38 ++++++++++++++++++++++
 2 files changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc.txt
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sdm845.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.txt b/Documentation/devicetree/bindings/clock/qcom,gpucc.txt
new file mode 100644
index 0000000..93752db
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.txt
@@ -0,0 +1,18 @@
+Qualcomm Graphics Clock & Reset Controller Binding
+--------------------------------------------------
+
+Required properties :
+- compatible : shall contain "qcom,sdm845-gpucc".
+- reg : shall contain base register location and length.
+- #clock-cells : from common clock binding, shall contain 1.
+- #reset-cells : from common reset binding, shall contain 1.
+- #power-domain-cells : from generic power domain binding, shall contain 1.
+
+Example:
+	gpucc: clock-controller@5090000 {
+		compatible = "qcom,sdm845-gpucc";
+		reg = <0x5090000 0x9000>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
diff --git a/include/dt-bindings/clock/qcom,gpucc-sdm845.h b/include/dt-bindings/clock/qcom,gpucc-sdm845.h
new file mode 100644
index 0000000..b9cbce5
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gpucc-sdm845.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_SDM_GPU_CC_SDM845_H
+#define _DT_BINDINGS_CLK_SDM_GPU_CC_SDM845_H
+
+/* GPU_CC clock registers */
+#define GPU_CC_CRC_AHB_CLK			0
+#define GPU_CC_CX_APB_CLK			1
+#define GPU_CC_CX_GFX3D_CLK			2
+#define GPU_CC_CX_GFX3D_SLV_CLK			3
+#define GPU_CC_CX_GMU_CLK			4
+#define GPU_CC_CX_SNOC_DVM_CLK			5
+#define GPU_CC_CXO_CLK				6
+#define GPU_CC_GMU_CLK_SRC			7
+#define GPU_CC_GX_GMU_CLK			8
+#define GPU_CC_GX_GFX3D_CLK_SRC			9
+#define GPU_CC_GX_GFX3D_CLK			10
+#define GPU_CC_PLL0				11
+#define GPU_CC_PLL0_OUT_EVEN			12
+#define GPU_CC_PLL1				13
+
+/* GPU_CC Resets */
+#define GPUCC_GPU_CC_ACD_BCR			0
+#define GPUCC_GPU_CC_CX_BCR			1
+#define GPUCC_GPU_CC_GFX3D_AON_BCR		2
+#define GPUCC_GPU_CC_GMU_BCR			3
+#define GPUCC_GPU_CC_GX_BCR			4
+#define GPUCC_GPU_CC_SPDM_BCR			5
+#define GPUCC_GPU_CC_XO_BCR			6
+
+/* GPU_CC GDSCRs */
+#define GPU_CX_GDSC				0
+#define GPU_GX_GDSC				1
+
+#endif
--
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

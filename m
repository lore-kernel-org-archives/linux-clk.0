Return-Path: <seanpaul@chromium.org>
Return-Path: <seanpaul@chromium.org>
From: Sean Paul <seanpaul@chromium.org>
To: abhinavk@codeaurora.org,
	architt@codeaurora.org,
	chandanu@codeaurora.org,
	jsanka@codeaurora.org,
	jcrouse@codeaurora.org,
	ryadav@codeaurora.org,
	seanpaul@chromium.org,
	skolluku@codeaurora.org,
	dri-devel@lists.freedesktop.org,
	robdclark@gmail.com,
	airlied@linux.ie,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	nganji@codeaurora.org,
	hoegsberg@chromium.org,
	dovizu@chromium.org,
	robh+dt@kernel.org
Cc: Taniya Das <tdas@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 02/21] dt-bindings: clock: Introduce QCOM Display clock bindings
Date: Mon,  9 Jul 2018 13:31:38 -0400
Message-Id: <20180709173200.238457-3-seanpaul@chromium.org>
In-Reply-To: <20180709173200.238457-1-seanpaul@chromium.org>
References: <20180709173200.238457-1-seanpaul@chromium.org>
List-ID: <linux-clk.vger.kernel.org>

From: Taniya Das <tdas@codeaurora.org>

Add device tree bindings for display clock controller for Qualcomm
Technology Inc's SDM845 SoCs.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 .../devicetree/bindings/clock/qcom,dispcc.txt | 19 ++++++++
 .../dt-bindings/clock/qcom,dispcc-sdm845.h    | 45 +++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc.txt
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sdm845.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc.txt b/Documentation/devicetree/bindings/clock/qcom,dispcc.txt
new file mode 100644
index 000000000000..d639e18d0b85
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc.txt
@@ -0,0 +1,19 @@
+Qualcomm Technologies, Inc. Display Clock Controller Binding
+------------------------------------------------------------
+
+Required properties :
+
+- compatible : shall contain "qcom,sdm845-dispcc"
+- reg : shall contain base register location and length.
+- #clock-cells : from common clock binding, shall contain 1.
+- #reset-cells : from common reset binding, shall contain 1.
+- #power-domain-cells : from generic power domain binding, shall contain 1.
+
+Example:
+	dispcc: clock-controller@af00000 {
+		compatible = "qcom,sdm845-dispcc";
+		reg = <0xaf00000 0x100000>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
diff --git a/include/dt-bindings/clock/qcom,dispcc-sdm845.h b/include/dt-bindings/clock/qcom,dispcc-sdm845.h
new file mode 100644
index 000000000000..11eed4bc9646
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,dispcc-sdm845.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_SDM_DISP_CC_SDM845_H
+#define _DT_BINDINGS_CLK_SDM_DISP_CC_SDM845_H
+
+/* DISP_CC clock registers */
+#define DISP_CC_MDSS_AHB_CLK					0
+#define DISP_CC_MDSS_AXI_CLK					1
+#define DISP_CC_MDSS_BYTE0_CLK					2
+#define DISP_CC_MDSS_BYTE0_CLK_SRC				3
+#define DISP_CC_MDSS_BYTE0_INTF_CLK				4
+#define DISP_CC_MDSS_BYTE1_CLK					5
+#define DISP_CC_MDSS_BYTE1_CLK_SRC				6
+#define DISP_CC_MDSS_BYTE1_INTF_CLK				7
+#define DISP_CC_MDSS_ESC0_CLK					8
+#define DISP_CC_MDSS_ESC0_CLK_SRC				9
+#define DISP_CC_MDSS_ESC1_CLK					10
+#define DISP_CC_MDSS_ESC1_CLK_SRC				11
+#define DISP_CC_MDSS_MDP_CLK					12
+#define DISP_CC_MDSS_MDP_CLK_SRC				13
+#define DISP_CC_MDSS_MDP_LUT_CLK				14
+#define DISP_CC_MDSS_PCLK0_CLK					15
+#define DISP_CC_MDSS_PCLK0_CLK_SRC				16
+#define DISP_CC_MDSS_PCLK1_CLK					17
+#define DISP_CC_MDSS_PCLK1_CLK_SRC				18
+#define DISP_CC_MDSS_ROT_CLK					19
+#define DISP_CC_MDSS_ROT_CLK_SRC				20
+#define DISP_CC_MDSS_RSCC_AHB_CLK				21
+#define DISP_CC_MDSS_RSCC_VSYNC_CLK				22
+#define DISP_CC_MDSS_VSYNC_CLK					23
+#define DISP_CC_MDSS_VSYNC_CLK_SRC				24
+#define DISP_CC_PLL0						25
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				26
+#define DISP_CC_MDSS_BYTE1_DIV_CLK_SRC				27
+
+/* DISP_CC Reset */
+#define DISP_CC_MDSS_RSCC_BCR					0
+
+/* DISP_CC GDSCR */
+#define MDSS_GDSC						0
+
+#endif
-- 
Sean Paul, Software Engineer, Google / Chromium OS

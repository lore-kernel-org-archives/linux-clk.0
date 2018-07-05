Return-Path: <tdas@codeaurora.org>
From: Taniya Das <tdas@codeaurora.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>,
	David Brown <david.brown@linaro.org>,
	Rajendra Nayak <rnayak@codeaurora.org>,
	Amit Nischal <anischal@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rohitkr@codeaurora.org,
	Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 1/2] dt-bindings: clock: Introduce QCOM LPASS clock bindings
Date: Thu,  5 Jul 2018 12:25:20 +0530
Message-Id: <1530773721-14668-2-git-send-email-tdas@codeaurora.org>
In-Reply-To: <1530773721-14668-1-git-send-email-tdas@codeaurora.org>
References: <1530773721-14668-1-git-send-email-tdas@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Add device tree bindings for Low Power Audio subsystem clock controller for
Qualcomm Technology Inc's SDM845 SoCs.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,lpasscc.txt     | 22 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,lpass-sdm845.h      | 18 ++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
 create mode 100644 include/dt-bindings/clock/qcom,lpass-sdm845.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt b/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
new file mode 100644
index 0000000..fe7378b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,lpasscc.txt
@@ -0,0 +1,22 @@
+Qualcomm LPASS Clock Controller Binding
+-----------------------------------------------
+
+Required properties :
+- compatible	: shall contain "qcom,sdm845-lpasscc"
+- #clock-cells	: from common clock binding, shall contain 1.
+- reg		: shall contain base register address and size.
+- reg-names	: shall contain the register names of LPASS domain
+			"lpass_gcc", "lpass_cc", "lpass_qdsp6ss".
+
+Example:
+
+The below node has to be defined in the cases where the LPASS peripheral loader
+would bring the subsystem out of reset.
+
+	lpasscc: clock-controller {
+		compatible = "qcom,sdm845-lpasscc";
+		reg = <0x00147000 0x20>, <0x17014000 0x1f004>,
+			<0x17300020 0x20>;
+		reg-names = "lpass_gcc", "lpass_cc", "lpass_qdsp6ss";
+		#clock-cells = <1>;
+	};
diff --git a/include/dt-bindings/clock/qcom,lpass-sdm845.h b/include/dt-bindings/clock/qcom,lpass-sdm845.h
new file mode 100644
index 0000000..b9d816e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,lpass-sdm845.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_SDM_LPASS_SDM845_H
+#define _DT_BINDINGS_CLK_SDM_LPASS_SDM845_H
+
+#define GCC_LPASS_Q6_AXI_CLK				0
+#define GCC_LPASS_SWAY_CLK				1
+#define LPASS_AUDIO_WRAPPER_AON_CLK			2
+#define LPASS_Q6SS_AHBM_AON_CLK				3
+#define LPASS_Q6SS_AHBS_AON_CLK				4
+#define LPASS_QDSP6SS_XO_CLK				5
+#define LPASS_QDSP6SS_SLEEP_CLK				6
+#define LPASS_QDSP6SS_CORE_CLK				7
+
+#endif
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

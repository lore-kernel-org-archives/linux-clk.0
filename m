Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513771;
	b=GkNeXgNMcDmSae9ZSO9l3S6xN03a69qXY7gZ0qJ7IDnLPISCxPpAI1WcY7MrJ//zBr+D
	 hpJxRauprLZXELQ2FhtgAtJlKerR/SuiiUq757XGAJLPwt2rib7pF3NUQzWtKZoMpWk3C
	 3SUyDyLDtD+HuygxiVbQlzIxBGswkZPY+chXn5fIwpzgakxHm22sGy7uITMWObL6nfgDM
	 wP7fOQtUiSTHmcXAeu8iCargB3LGLQc7Xx0csY2fJbcoJxR4naWlj7v4hwhtO2bUpMaUl
	 5UP5p+FZAQZXQxXFua9qU8FQdpr48o230wD6hOOVYvCFQdDi7NzVmFkaJtvddWbdzPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513771;
	h=DMARC-Filter:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=KYuKjnnUkCd7r3z1adYLdeJzKI49YAI50FABByBSQ5c=;
	b=EmUrz2KYOB5+MnzZnYfM2jDRMPVrFhfrMvm0Uo36SsmoJ/3pxEp5oLeXfBR//J8U2Faj
	 Fkg6Q77hOBY1jmIentkuFq3OEYbg3N/isQ7t/l2d1P9dXfz5Oqa80WOI4Bu8LYd2txxqg
	 W0isy3RuOTWhdnV8xYB/QX8fbbHF/uT1Wb1j7u9aiAJO1fLNbxHrjuT2b/I8CnRZy1Jjb
	 JLmPLanOvmbIjsI1mk0O6hyQxwM9TU+d4iIRxZxWw5twILydUKn2WZPUXjFzqsjqJOg50
	 PLYE3WtsVsp8t9yAnLgLz8VHfEjU5dNO3UEI9IhtkeSocX5crI/89ks+m/39MM98PgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46819606CC26;
	Tue, 24 Nov 2026 09:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46819606CC26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from [10.42.0.96] (unknown [114.242.206.180])
	by krgm.moe (Postfix) with ESMTPSA id 7019E77B7;
	Tue, 24 Nov 2026 15:19:18 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Date: Tue, 24 Nov 2026 17:48:20 +0800
Subject: [PATCH 1/4] dt-bindings: clock: Add Qualcomm Netrani GCC
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-netrani-clock-v1-v1-1-ce10cedbfa4b@krgm.moe>
References: <20261124-netrani-clock-v1-v1-0-ce10cedbfa4b@krgm.moe>
In-Reply-To: <20261124-netrani-clock-v1-v1-0-ce10cedbfa4b@krgm.moe>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10587; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=ge4J2DvDBPXWTTRkFNBcznpelw4poGX/XIwYAFoDuXE=;
 b=owEBCQL2/ZANAwAIAV0dOJt2umJjAcsmYgBrBV13hlYgQwWKtkTDYfgOOO+x9sD9+4JsqcxS3
 DJLurl8CQmJAc8EAAEIADkWIQRSClJ2zjncUdNU0FFdHTibdrpiYwUCawVddxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDIACgkQXR04m3a6YmOTygv/TnNbw1CL1flMn/GU/uqxt9ZBf6wpl/F
 x6iAHzPPPZF6ymGTAn9WQ7413Z7hgCkISaKtT/hZ88e1sdWZ45P2Jw60fRbQGpeyi2XtWW+ZZlt
 7NVykW7IYsNUvglHDEaQsaMEh6oEnsNx4SO86jOYbCFoWnbarOEOvXbj0Yb2WqLwydBbvOqCDJi
 N2aJkeQtXoblI8UT0FIg6AtgJtvk4A6iyiFT/BJupoBxXudiPEeApozU7rdcai4jNRVlO3B+fv8
 06ZS6QPcdr8rQ6bD8We8gM1uTBGPv44DI+NnXFi0u0dNLBMjsLKAsWsmDxrfzGQ327Tz6LfDVa+
 K2Chr5y8ANCdjV3kFJU+m54qFO1JaLMc+Plc2OezWpaZ1WxnuDJHrDwyE+GcDcfAerIFz1b7wLK
 +q7070ncXyDZlkLSfeoIsAsCyWqBcyn3ZjBSSf7YNnoJOVFPJeIzMbbvzLYwcaDXB/8+ab8JNw0
 t62Pi6aotRz5QVC+Zjn1P624QupFyjv
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=520A5276CE39DC51D354D0515D1D389B76BA6263

Add the Netrani global clock, reset and power-domain controller.
Describe its seven input clocks and provide clock and reset identifiers.

Signed-off-by: SignKirigami <prcups@krgm.moe>
---
 .../bindings/clock/qcom,netrani-gcc.yaml           |  77 +++++++++
 include/dt-bindings/clock/qcom,netrani-gcc.h       | 184 +++++++++++++++++++++
 2 files changed, 261 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,netrani-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,netrani-gcc.yaml
new file mode 100644
index 0000000000000..f05e0ca78cb94
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,netrani-gcc.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,netrani-gcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on Netrani
+
+maintainers:
+  - SignKirigami <prcups@krgm.moe>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and power
+  domains on Netrani (Qualcomm codename parrot).
+
+  The controller is register compatible with the SM4450 one, but its clock
+  tree is not: it has no GPLL3, no HLOS1 vote clocks and no video/vcodec
+  clocks, and it adds the QUPV3 SE5/QSPI0 clocks of both wrappers, the camera
+  sleep clock and the video AXI0 clock.  Clock IDs therefore come from
+  qcom,netrani-gcc.h and are not interchangeable with SM4450's.
+
+  See also: include/dt-bindings/clock/qcom,netrani-gcc.h
+
+properties:
+  compatible:
+    const: qcom,netrani-gcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: PCIe 0 pipe clock source
+      - description: UFS Phy Rx symbol 0 clock source
+      - description: UFS Phy Rx symbol 1 clock source
+      - description: UFS Phy Tx symbol 0 clock source
+      - description: USB3 Phy wrapper pipe clock source
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+      - const: sleep_clk
+      - const: pcie_0_pipe_clk
+      - const: ufs_phy_rx_symbol_0_clk
+      - const: ufs_phy_rx_symbol_1_clk
+      - const: ufs_phy_tx_symbol_0_clk
+      - const: usb3_phy_wrapper_gcc_usb30_pipe_clk
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@100000 {
+      compatible = "qcom,netrani-gcc";
+      reg = <0x00100000 0x001f4200>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>, <&sleep_clk>,
+               <&pcie_0_pipe_clk>, <&ufs_mem_phy 0>, <&ufs_mem_phy 1>,
+               <&ufs_mem_phy 2>, <&usb_1_qmpphy>;
+      clock-names = "bi_tcxo", "sleep_clk", "pcie_0_pipe_clk",
+                    "ufs_phy_rx_symbol_0_clk", "ufs_phy_rx_symbol_1_clk",
+                    "ufs_phy_tx_symbol_0_clk",
+                    "usb3_phy_wrapper_gcc_usb30_pipe_clk";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,netrani-gcc.h b/include/dt-bindings/clock/qcom,netrani-gcc.h
new file mode 100644
index 0000000000000..b4d4a39d4d690
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,netrani-gcc.h
@@ -0,0 +1,184 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2021, 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_NETRANI_GCC_H
+#define _DT_BINDINGS_CLK_QCOM_NETRANI_GCC_H
+
+/* GCC clocks */
+#define GCC_GPLL0						0
+#define GCC_GPLL0_OUT_EVEN					1
+#define GCC_GPLL0_OUT_ODD					2
+#define GCC_GPLL1						3
+#define GCC_GPLL10						4
+#define GCC_GPLL4						5
+#define GCC_GPLL9						6
+#define GCC_AGGRE_NOC_PCIE_0_AXI_CLK				7
+#define GCC_AGGRE_UFS_PHY_AXI_CLK				8
+#define GCC_AGGRE_UFS_PHY_AXI_HW_CTL_CLK			9
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK				10
+#define GCC_BOOT_ROM_AHB_CLK					11
+#define GCC_CAMERA_AHB_CLK					12
+#define GCC_CAMERA_HF_AXI_CLK					13
+#define GCC_CAMERA_SF_AXI_CLK					14
+#define GCC_CAMERA_SLEEP_CLK					15
+#define GCC_CAMERA_XO_CLK					16
+#define GCC_CFG_NOC_PCIE_ANOC_AHB_CLK				17
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				18
+#define GCC_DDRSS_GPU_AXI_CLK					19
+#define GCC_DDRSS_PCIE_SF_TBU_CLK				20
+#define GCC_DISP_AHB_CLK					21
+#define GCC_DISP_HF_AXI_CLK					22
+#define GCC_DISP_XO_CLK						23
+#define GCC_EUSB3_0_CLKREF_EN					24
+#define GCC_GP1_CLK						25
+#define GCC_GP1_CLK_SRC						26
+#define GCC_GP2_CLK						27
+#define GCC_GP2_CLK_SRC						28
+#define GCC_GP3_CLK						29
+#define GCC_GP3_CLK_SRC						30
+#define GCC_GPU_CFG_AHB_CLK					31
+#define GCC_GPU_GPLL0_CLK_SRC					32
+#define GCC_GPU_GPLL0_DIV_CLK_SRC				33
+#define GCC_GPU_MEMNOC_GFX_CLK					34
+#define GCC_GPU_SNOC_DVM_GFX_CLK				35
+#define GCC_PCIE_0_AUX_CLK					36
+#define GCC_PCIE_0_AUX_CLK_SRC					37
+#define GCC_PCIE_0_CFG_AHB_CLK					38
+#define GCC_PCIE_0_CLKREF_EN					39
+#define GCC_PCIE_0_MSTR_AXI_CLK					40
+#define GCC_PCIE_0_PHY_RCHNG_CLK				41
+#define GCC_PCIE_0_PHY_RCHNG_CLK_SRC				42
+#define GCC_PCIE_0_PIPE_CLK					43
+#define GCC_PCIE_0_PIPE_CLK_SRC					44
+#define GCC_PCIE_0_PIPE_DIV2_CLK				45
+#define GCC_PCIE_0_PIPE_DIV2_CLK_SRC				46
+#define GCC_PCIE_0_SLV_AXI_CLK					47
+#define GCC_PCIE_0_SLV_Q2A_AXI_CLK				48
+#define GCC_PDM2_CLK						49
+#define GCC_PDM2_CLK_SRC					50
+#define GCC_PDM_AHB_CLK						51
+#define GCC_PDM_XO4_CLK						52
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				53
+#define GCC_QMIP_CAMERA_RT_AHB_CLK				54
+#define GCC_QMIP_DISP_AHB_CLK					55
+#define GCC_QMIP_GPU_AHB_CLK					56
+#define GCC_QMIP_PCIE_AHB_CLK					57
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				58
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK				59
+#define GCC_QUPV3_WRAP0_CORE_CLK				60
+#define GCC_QUPV3_WRAP0_QSPI0_CLK				61
+#define GCC_QUPV3_WRAP0_S0_CLK					62
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				63
+#define GCC_QUPV3_WRAP0_S1_CLK					64
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				65
+#define GCC_QUPV3_WRAP0_S2_CLK					66
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				67
+#define GCC_QUPV3_WRAP0_S3_CLK					68
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				69
+#define GCC_QUPV3_WRAP0_S4_CLK					70
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				71
+#define GCC_QUPV3_WRAP0_S5_CLK					72
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC				73
+#define GCC_QUPV3_WRAP0_S5_DIV_CLK_SRC				74
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK				75
+#define GCC_QUPV3_WRAP1_CORE_CLK				76
+#define GCC_QUPV3_WRAP1_QSPI0_CLK				77
+#define GCC_QUPV3_WRAP1_S0_CLK					78
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC				79
+#define GCC_QUPV3_WRAP1_S1_CLK					80
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC				81
+#define GCC_QUPV3_WRAP1_S2_CLK					82
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC				83
+#define GCC_QUPV3_WRAP1_S3_CLK					84
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC				85
+#define GCC_QUPV3_WRAP1_S4_CLK					86
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC				87
+#define GCC_QUPV3_WRAP1_S5_CLK					88
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC				89
+#define GCC_QUPV3_WRAP1_S5_DIV_CLK_SRC				90
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				91
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				92
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK				93
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				94
+#define GCC_SDCC1_AHB_CLK					95
+#define GCC_SDCC1_APPS_CLK					96
+#define GCC_SDCC1_APPS_CLK_SRC					97
+#define GCC_SDCC1_ICE_CORE_CLK					98
+#define GCC_SDCC1_ICE_CORE_CLK_SRC				99
+#define GCC_SDCC2_AHB_CLK					100
+#define GCC_SDCC2_APPS_CLK					101
+#define GCC_SDCC2_APPS_CLK_SRC					102
+#define GCC_UFS_0_CLKREF_EN					103
+#define GCC_UFS_PAD_CLKREF_EN					104
+#define GCC_UFS_PHY_AHB_CLK					105
+#define GCC_UFS_PHY_AXI_CLK					106
+#define GCC_UFS_PHY_AXI_CLK_SRC					107
+#define GCC_UFS_PHY_ICE_CORE_CLK				108
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				109
+#define GCC_UFS_PHY_PHY_AUX_CLK					110
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				111
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				112
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC				113
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK				114
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC				115
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				116
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC				117
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK				118
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				119
+#define GCC_USB30_PRIM_MASTER_CLK				120
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				121
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				122
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			123
+#define GCC_USB30_PRIM_MOCK_UTMI_POSTDIV_CLK_SRC		124
+#define GCC_USB30_PRIM_SLEEP_CLK				125
+#define GCC_USB3_0_CLKREF_EN					126
+#define GCC_USB3_PRIM_PHY_AUX_CLK				127
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				128
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				129
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				130
+#define GCC_USB3_PRIM_PHY_PIPE_CLK_SRC				131
+#define GCC_UFS_PHY_AXI_HW_CTL_CLK				132
+#define GCC_UFS_PHY_ICE_CORE_HW_CTL_CLK				133
+#define GCC_UFS_PHY_PHY_AUX_HW_CTL_CLK				134
+#define GCC_UFS_PHY_UNIPRO_CORE_HW_CTL_CLK			135
+#define GCC_VIDEO_AHB_CLK					136
+#define GCC_VIDEO_AXI0_CLK					137
+#define GCC_VIDEO_THROTTLE_CORE_CLK				138
+#define GCC_VIDEO_XO_CLK					139
+
+/* GCC resets */
+#define GCC_CAMERA_BCR						0
+#define GCC_DISPLAY_BCR						1
+#define GCC_EMMC_BCR						2
+#define GCC_GPU_BCR						3
+#define GCC_PCIE_0_BCR						4
+#define GCC_PCIE_0_LINK_DOWN_BCR				5
+#define GCC_PCIE_0_NOCSR_COM_PHY_BCR				6
+#define GCC_PCIE_0_PHY_BCR					7
+#define GCC_PCIE_0_PHY_NOCSR_COM_PHY_BCR			8
+#define GCC_PCIE_PHY_CFG_AHB_BCR				9
+#define GCC_PCIE_PHY_COM_BCR					10
+#define GCC_PDM_BCR						11
+#define GCC_QUPV3_WRAPPER_0_BCR					12
+#define GCC_QUPV3_WRAPPER_1_BCR					13
+#define GCC_QUSB2PHY_PRIM_BCR					14
+#define GCC_QUSB2PHY_SEC_BCR					15
+#define GCC_SDCC2_BCR						16
+#define GCC_UFS_PHY_BCR						17
+#define GCC_USB30_PRIM_BCR					18
+#define GCC_USB3_DP_PHY_PRIM_BCR				19
+#define GCC_USB3_DP_PHY_SEC_BCR					20
+#define GCC_USB3_PHY_PRIM_BCR					21
+#define GCC_USB3_PHY_SEC_BCR					22
+#define GCC_USB3PHY_PHY_PRIM_BCR				23
+#define GCC_USB3PHY_PHY_SEC_BCR					24
+#define GCC_VIDEO_AXI0_CLK_ARES					25
+#define GCC_VIDEO_BCR						26
+
+/* GCC power domains */
+#define GCC_UFS_PHY_GDSC					27
+#define GCC_USB30_PRIM_GDSC					28
+
+#endif

-- 
2.56.0


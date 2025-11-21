Received: from mail-sh.amlogic.com (unknown [114.94.151.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655E4346772;
	Fri, 21 Nov 2025 11:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.94.151.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763722860; cv=none; b=Q1ygxTCF3+Z8kelVxNgaIJRxji01xUI4+qXI4+ZV3VQlyoHGI6P9Hx/Yzec2//zoDgN+BH+iaVJ4JI4JUaKJYm0bXuH65fkAsNDzDLJzbQUhffBVA2Fm31vQJzN/f3rs7JF7NWnHZw48m8k3XdBqrAaoVHpS6GYz6HMqxSIb914=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763722860; c=relaxed/simple;
	bh=DusKfrc3K7uxkJ76mJMFQrjl7ZqTkpeNppuFqy6qrvk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q07/wndeYYpkb1Dk/XG77IVlQ3CK9kED5WKR/R+C3O2wXHWkYB+8V226zEzEdZcwIuvW8/xhfXaRZO1RM31twfk20PTRjLps30IhuXuihxS8fuAR49/DCzDC324FxrBWdzo2ocJdo2kC4Uw5hVXGbPpisYMQ573hgDCo6MCXeaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; arc=none smtp.client-ip=114.94.151.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Received: from rd03-sz.software.amlogic (10.28.11.121) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.61; Fri, 21 Nov 2025
 18:59:42 +0800
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao
	<xianwei.zhao@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	"Dmitry Rokosov" <ddrokosov@sberdevices.ru>, robh+dt <robh+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
CC: Jian Hu <jian.hu@amlogic.com>, devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, linux-amlogic
	<linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v5 3/5] dt-bindings: clock: add Amlogic T7 peripherals clock controller
Date: Fri, 21 Nov 2025 18:59:32 +0800
Message-ID: <20251121105934.1759745-4-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20251121105934.1759745-1-jian.hu@amlogic.com>
References: <20251121105934.1759745-1-jian.hu@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add DT bindings for the peripheral clock controller of the Amlogic T7
SoC family.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../clock/amlogic,t7-peripherals-clkc.yaml    | 116 +++++++++
 .../clock/amlogic,t7-peripherals-clkc.h       | 228 ++++++++++++++++++
 2 files changed, 344 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
 create mode 100644 include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
new file mode 100644
index 000000000000..55bb73707d58
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/amlogic,t7-peripherals-clkc.yaml
@@ -0,0 +1,116 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright (C) 2024-2025 Amlogic, Inc. All rights reserved
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/amlogic,t7-peripherals-clkc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic T7 Peripherals Clock Controller
+
+maintainers:
+  - Neil Armstrong <neil.armstrong@linaro.org>
+  - Jerome Brunet <jbrunet@baylibre.com>
+  - Xianwei Zhao <xianwei.zhao@amlogic.com>
+  - Jian Hu <jian.hu@amlogic.com>
+
+properties:
+  compatible:
+    const: amlogic,t7-peripherals-clkc
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    minItems: 14
+    items:
+      - description: input oscillator
+      - description: input sys clk
+      - description: input fixed pll
+      - description: input fclk div 2
+      - description: input fclk div 2p5
+      - description: input fclk div 3
+      - description: input fclk div 4
+      - description: input fclk div 5
+      - description: input fclk div 7
+      - description: input hifi pll
+      - description: input gp0 pll
+      - description: input gp1 pll
+      - description: input mpll1
+      - description: input mpll2
+      - description: external input rmii oscillator (optional)
+      - description: input video pll0 (optional)
+      - description: external pad input for rtc (optional)
+
+  clock-names:
+    minItems: 14
+    items:
+      - const: xtal
+      - const: sys
+      - const: fix
+      - const: fdiv2
+      - const: fdiv2p5
+      - const: fdiv3
+      - const: fdiv4
+      - const: fdiv5
+      - const: fdiv7
+      - const: hifi
+      - const: gp0
+      - const: gp1
+      - const: mpll1
+      - const: mpll2
+      - const: ext_rmii
+      - const: vid_pll0
+      - const: ext_rtc
+
+required:
+  - compatible
+  - '#clock-cells'
+  - reg
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    apb {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clkc_periphs:clock-controller@0 {
+            compatible = "amlogic,t7-peripherals-clkc";
+            reg = <0 0x0 0 0x1c8>;
+            #clock-cells = <1>;
+            clocks = <&xtal>,
+                     <&scmi_clk 13>,
+                     <&scmi_clk 16>,
+                     <&scmi_clk 18>,
+                     <&scmi_clk 20>,
+                     <&scmi_clk 22>,
+                     <&scmi_clk 24>,
+                     <&scmi_clk 26>,
+                     <&scmi_clk 28>,
+                     <&hifi 1>,
+                     <&gp0 1>,
+                     <&gp1 1>,
+                     <&mpll 4>,
+                     <&mpll 6>;
+            clock-names = "xtal",
+                          "sys",
+                          "fix",
+                          "fdiv2",
+                          "fdiv2p5",
+                          "fdiv3",
+                          "fdiv4",
+                          "fdiv5",
+                          "fdiv7",
+                          "hifi",
+                          "gp0",
+                          "gp1",
+                          "mpll1",
+                          "mpll2";
+        };
+    };
diff --git a/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h b/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
new file mode 100644
index 000000000000..e3bbfe517f1f
--- /dev/null
+++ b/include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
@@ -0,0 +1,228 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2024-2025 Amlogic, Inc. All rights reserved
+ */
+
+#ifndef __T7_PERIPHERALS_CLKC_H
+#define __T7_PERIPHERALS_CLKC_H
+
+#define CLKID_RTC_DUALDIV_IN		0
+#define CLKID_RTC_DUALDIV_DIV		1
+#define CLKID_RTC_DUALDIV_SEL		2
+#define CLKID_RTC_DUALDIV		3
+#define CLKID_RTC			4
+#define CLKID_CECA_DUALDIV_IN		5
+#define CLKID_CECA_DUALDIV_DIV		6
+#define CLKID_CECA_DUALDIV_SEL		7
+#define CLKID_CECA_DUALDIV		8
+#define CLKID_CECA			9
+#define CLKID_CECB_DUALDIV_IN		10
+#define CLKID_CECB_DUALDIV_DIV		11
+#define CLKID_CECB_DUALDIV_SEL		12
+#define CLKID_CECB_DUALDIV		13
+#define CLKID_CECB			14
+#define CLKID_SC_SEL			15
+#define CLKID_SC_DIV			16
+#define CLKID_SC			17
+#define CLKID_DSPA_0_SEL		18
+#define CLKID_DSPA_0_DIV		19
+#define CLKID_DSPA_0			20
+#define CLKID_DSPA_1_SEL		21
+#define CLKID_DSPA_1_DIV		22
+#define CLKID_DSPA_1			23
+#define CLKID_DSPA			24
+#define CLKID_DSPB_0_SEL		25
+#define CLKID_DSPB_0_DIV		26
+#define CLKID_DSPB_0			27
+#define CLKID_DSPB_1_SEL		28
+#define CLKID_DSPB_1_DIV		29
+#define CLKID_DSPB_1			30
+#define CLKID_DSPB			31
+#define CLKID_24M			32
+#define CLKID_24M_DIV2			33
+#define CLKID_12M			34
+#define CLKID_25M_DIV			35
+#define CLKID_25M			36
+#define CLKID_ANAKIN_0_SEL		37
+#define CLKID_ANAKIN_0_DIV		38
+#define CLKID_ANAKIN_0			39
+#define CLKID_ANAKIN_1_SEL		40
+#define CLKID_ANAKIN_1_DIV		41
+#define CLKID_ANAKIN_1			42
+#define CLKID_ANAKIN_01_SEL		43
+#define CLKID_ANAKIN			44
+#define CLKID_TS_DIV			45
+#define CLKID_TS			46
+#define CLKID_MIPI_CSI_PHY_0_SEL	47
+#define CLKID_MIPI_CSI_PHY_0_DIV	48
+#define CLKID_MIPI_CSI_PHY_0		49
+#define CLKID_MIPI_CSI_PHY_1_SEL	50
+#define CLKID_MIPI_CSI_PHY_1_DIV	51
+#define CLKID_MIPI_CSI_PHY_1		52
+#define CLKID_MIPI_CSI_PHY		53
+#define CLKID_MIPI_ISP_SEL		54
+#define CLKID_MIPI_ISP_DIV		55
+#define CLKID_MIPI_ISP			56
+#define CLKID_MALI_0_SEL		57
+#define CLKID_MALI_0_DIV		58
+#define CLKID_MALI_0			59
+#define CLKID_MALI_1_SEL		60
+#define CLKID_MALI_1_DIV		61
+#define CLKID_MALI_1			62
+#define CLKID_MALI			63
+#define CLKID_ETH_RMII_SEL		64
+#define CLKID_ETH_RMII_DIV		65
+#define CLKID_ETH_RMII			66
+#define CLKID_FCLK_DIV2_DIV8		67
+#define CLKID_ETH_125M			68
+#define CLKID_SD_EMMC_C_SEL		69
+#define CLKID_SD_EMMC_C_DIV		70
+#define CLKID_SD_EMMC_C			71
+#define CLKID_SD_EMMC_A_SEL		72
+#define CLKID_SD_EMMC_A_DIV		73
+#define CLKID_SD_EMMC_A			74
+#define CLKID_SD_EMMC_B_SEL		75
+#define CLKID_SD_EMMC_B_DIV		76
+#define CLKID_SD_EMMC_B			77
+#define CLKID_SPICC0_SEL		78
+#define CLKID_SPICC0_DIV		79
+#define CLKID_SPICC0			80
+#define CLKID_SPICC1_SEL		81
+#define CLKID_SPICC1_DIV		82
+#define CLKID_SPICC1			83
+#define CLKID_SPICC2_SEL		84
+#define CLKID_SPICC2_DIV		85
+#define CLKID_SPICC2			86
+#define CLKID_SPICC3_SEL		87
+#define CLKID_SPICC3_DIV		88
+#define CLKID_SPICC3			89
+#define CLKID_SPICC4_SEL		90
+#define CLKID_SPICC4_DIV		91
+#define CLKID_SPICC4			92
+#define CLKID_SPICC5_SEL		93
+#define CLKID_SPICC5_DIV		94
+#define CLKID_SPICC5			95
+#define CLKID_SARADC_SEL		96
+#define CLKID_SARADC_DIV		97
+#define CLKID_SARADC			98
+#define CLKID_PWM_A_SEL			99
+#define CLKID_PWM_A_DIV			100
+#define CLKID_PWM_A			101
+#define CLKID_PWM_B_SEL			102
+#define CLKID_PWM_B_DIV			103
+#define CLKID_PWM_B			104
+#define CLKID_PWM_C_SEL			105
+#define CLKID_PWM_C_DIV			106
+#define CLKID_PWM_C			107
+#define CLKID_PWM_D_SEL			108
+#define CLKID_PWM_D_DIV			109
+#define CLKID_PWM_D			110
+#define CLKID_PWM_E_SEL			111
+#define CLKID_PWM_E_DIV			112
+#define CLKID_PWM_E			113
+#define CLKID_PWM_F_SEL			114
+#define CLKID_PWM_F_DIV			115
+#define CLKID_PWM_F			116
+#define CLKID_PWM_AO_A_SEL		117
+#define CLKID_PWM_AO_A_DIV		118
+#define CLKID_PWM_AO_A			119
+#define CLKID_PWM_AO_B_SEL		120
+#define CLKID_PWM_AO_B_DIV		121
+#define CLKID_PWM_AO_B			122
+#define CLKID_PWM_AO_C_SEL		123
+#define CLKID_PWM_AO_C_DIV		124
+#define CLKID_PWM_AO_C			125
+#define CLKID_PWM_AO_D_SEL		126
+#define CLKID_PWM_AO_D_DIV		127
+#define CLKID_PWM_AO_D			128
+#define CLKID_PWM_AO_E_SEL		129
+#define CLKID_PWM_AO_E_DIV		130
+#define CLKID_PWM_AO_E			131
+#define CLKID_PWM_AO_F_SEL		132
+#define CLKID_PWM_AO_F_DIV		133
+#define CLKID_PWM_AO_F			134
+#define CLKID_PWM_AO_G_SEL		135
+#define CLKID_PWM_AO_G_DIV		136
+#define CLKID_PWM_AO_G			137
+#define CLKID_PWM_AO_H_SEL		138
+#define CLKID_PWM_AO_H_DIV		139
+#define CLKID_PWM_AO_H			140
+#define CLKID_SYS_DDR			141
+#define CLKID_SYS_DOS			142
+#define CLKID_SYS_MIPI_DSI_A		143
+#define CLKID_SYS_MIPI_DSI_B		144
+#define CLKID_SYS_ETHPHY		145
+#define CLKID_SYS_MALI			146
+#define CLKID_SYS_AOCPU			147
+#define CLKID_SYS_AUCPU			148
+#define CLKID_SYS_CEC			149
+#define CLKID_SYS_GDC			150
+#define CLKID_SYS_DESWARP		151
+#define CLKID_SYS_AMPIPE_NAND		152
+#define CLKID_SYS_AMPIPE_ETH		153
+#define CLKID_SYS_AM2AXI0		154
+#define CLKID_SYS_AM2AXI1		155
+#define CLKID_SYS_AM2AXI2		156
+#define CLKID_SYS_SD_EMMC_A		157
+#define CLKID_SYS_SD_EMMC_B		158
+#define CLKID_SYS_SD_EMMC_C		159
+#define CLKID_SYS_SMARTCARD		160
+#define CLKID_SYS_ACODEC		161
+#define CLKID_SYS_SPIFC			162
+#define CLKID_SYS_MSR_CLK		163
+#define CLKID_SYS_IR_CTRL		164
+#define CLKID_SYS_AUDIO			165
+#define CLKID_SYS_ETH			166
+#define CLKID_SYS_UART_A		167
+#define CLKID_SYS_UART_B		168
+#define CLKID_SYS_UART_C		169
+#define CLKID_SYS_UART_D		170
+#define CLKID_SYS_UART_E		171
+#define CLKID_SYS_UART_F		172
+#define CLKID_SYS_AIFIFO		173
+#define CLKID_SYS_SPICC2		174
+#define CLKID_SYS_SPICC3		175
+#define CLKID_SYS_SPICC4		176
+#define CLKID_SYS_TS_A73		177
+#define CLKID_SYS_TS_A53		178
+#define CLKID_SYS_SPICC5		179
+#define CLKID_SYS_G2D			180
+#define CLKID_SYS_SPICC0		181
+#define CLKID_SYS_SPICC1		182
+#define CLKID_SYS_PCIE			183
+#define CLKID_SYS_USB			184
+#define CLKID_SYS_PCIE_PHY		185
+#define CLKID_SYS_I2C_AO_A		186
+#define CLKID_SYS_I2C_AO_B		187
+#define CLKID_SYS_I2C_M_A		188
+#define CLKID_SYS_I2C_M_B		189
+#define CLKID_SYS_I2C_M_C		190
+#define CLKID_SYS_I2C_M_D		191
+#define CLKID_SYS_I2C_M_E		192
+#define CLKID_SYS_I2C_M_F		193
+#define CLKID_SYS_HDMITX_APB		194
+#define CLKID_SYS_I2C_S_A		195
+#define CLKID_SYS_HDMIRX_PCLK		196
+#define CLKID_SYS_MMC_APB		197
+#define CLKID_SYS_MIPI_ISP_PCLK		198
+#define CLKID_SYS_RSA			199
+#define CLKID_SYS_PCLK_SYS_APB		200
+#define CLKID_SYS_A73PCLK_APB		201
+#define CLKID_SYS_DSPA			202
+#define CLKID_SYS_DSPB			203
+#define CLKID_SYS_VPU_INTR		204
+#define CLKID_SYS_SAR_ADC		205
+#define CLKID_SYS_GIC			206
+#define CLKID_SYS_TS_GPU		207
+#define CLKID_SYS_TS_NNA		208
+#define CLKID_SYS_TS_VPU		209
+#define CLKID_SYS_TS_HEVC		210
+#define CLKID_SYS_PWM_AB		211
+#define CLKID_SYS_PWM_CD		212
+#define CLKID_SYS_PWM_EF		213
+#define CLKID_SYS_PWM_AO_AB		214
+#define CLKID_SYS_PWM_AO_CD		215
+#define CLKID_SYS_PWM_AO_EF		216
+#define CLKID_SYS_PWM_AO_GH		217
+
+#endif /* __T7_PERIPHERALS_CLKC_H */
-- 
2.47.1


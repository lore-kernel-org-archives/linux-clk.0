Return-Path: <martin.blumenstingl@googlemail.com>
Return-Path: <martin.blumenstingl@googlemail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com,
	carlo@caione.org,
	narmstrong@baylibre.com,
	jbrunet@baylibre.com,
	linux-clk@vger.kernel.org,
	robh+dt@kernel.org
Cc: devicetree@vger.kernel.org,
	linux@armlinux.org.uk,
	mark.rutland@arm.com,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v3 1/3] dt-bindings: clock: meson8b: describe the embedded reset controller
Date: Fri, 28 Jul 2017 23:13:11 +0200
Message-Id: <20170728211313.10603-2-martin.blumenstingl@googlemail.com>
In-Reply-To: <20170728211313.10603-1-martin.blumenstingl@googlemail.com>
References: <20170728211313.10603-1-martin.blumenstingl@googlemail.com>
List-ID: <linux-clk.vger.kernel.org>

The Amlogic Meson8/Meson8b/Meson8m2 clock controller provides some reset
lines. These are used for example to boot the secondary CPU cores.

This patch describes the reset controller which is embedded into the
clock controller on these SoCs.
A header file is provided which provides preprocessor macros for each
reset line (to make the .dts files easier to read).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/clock/amlogic,meson8b-clkc.txt        |  9 +++++++-
 .../dt-bindings/reset/amlogic,meson8b-clkc-reset.h | 27 ++++++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/reset/amlogic,meson8b-clkc-reset.h

diff --git a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
index 606da38c0959..c858fd64f680 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
@@ -16,18 +16,25 @@ Required Properties:
 	   mapped region.
 
 - #clock-cells: should be 1.
+- #reset-cells: should be 1.
 
 Each clock is assigned an identifier and client nodes can use this identifier
 to specify the clock which they consume. All available clocks are defined as
 preprocessor macros in the dt-bindings/clock/meson8b-clkc.h header and can be
 used in device tree sources.
 
+Similarly a preprocessor macro for each reset line is defined in
+dt-bindings/reset/amlogic,meson8b-clkc-reset.h (which can be used from the
+device tree sources).
+
+
 Example: Clock controller node:
 
 	clkc: clock-controller@c1104000 {
-		#clock-cells = <1>;
 		compatible = "amlogic,meson8b-clkc";
 		reg = <0xc1108000 0x4>, <0xc1104000 0x460>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
 	};
 
 
diff --git a/include/dt-bindings/reset/amlogic,meson8b-clkc-reset.h b/include/dt-bindings/reset/amlogic,meson8b-clkc-reset.h
new file mode 100644
index 000000000000..1f1b56e57346
--- /dev/null
+++ b/include/dt-bindings/reset/amlogic,meson8b-clkc-reset.h
@@ -0,0 +1,27 @@
+/*
+ * Copyright (c) 2017 Martin Blumenstingl <martin.blumenstingl@googlemail.com>.
+ *
+ * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+ */
+
+#ifndef _DT_BINDINGS_AMLOGIC_MESON8B_CLKC_RESET_H
+#define _DT_BINDINGS_AMLOGIC_MESON8B_CLKC_RESET_H
+
+#define CLKC_RESET_L2_CACHE_SOFT_RESET				0
+#define CLKC_RESET_AXI_64_TO_128_BRIDGE_A5_SOFT_RESET		1
+#define CLKC_RESET_SCU_SOFT_RESET				2
+#define CLKC_RESET_CPU0_SOFT_RESET				3
+#define CLKC_RESET_CPU1_SOFT_RESET				4
+#define CLKC_RESET_CPU2_SOFT_RESET				5
+#define CLKC_RESET_CPU3_SOFT_RESET				6
+#define CLKC_RESET_A5_GLOBAL_RESET				7
+#define CLKC_RESET_A5_AXI_SOFT_RESET				8
+#define CLKC_RESET_A5_ABP_SOFT_RESET				9
+#define CLKC_RESET_AXI_64_TO_128_BRIDGE_MMC_SOFT_RESET		10
+#define CLKC_RESET_VID_CLK_CNTL_SOFT_RESET			11
+#define CLKC_RESET_VID_DIVIDER_CNTL_SOFT_RESET_POST		12
+#define CLKC_RESET_VID_DIVIDER_CNTL_SOFT_RESET_PRE		13
+#define CLKC_RESET_VID_DIVIDER_CNTL_RESET_N_POST		14
+#define CLKC_RESET_VID_DIVIDER_CNTL_RESET_N_PRE			15
+
+#endif /* _DT_BINDINGS_AMLOGIC_MESON8B_CLKC_RESET_H */
-- 
2.13.3

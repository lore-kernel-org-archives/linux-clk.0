Return-Path: <icenowy@aosc.xyz>
From: Icenowy Zheng <icenowy@aosc.xyz>
To: rui.zhang@intel.com,
	edubezval@gmail.com,
	robh+dt@kernel.org,
	maxime.ripard@free-electrons.com,
	wens@csie.org,
	emilio@elopez.com.ar
Cc: mark.rutland@arm.com,
	linux@armlinux.org.uk,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Icenowy Zheng <icenowy@aosc.xyz>
Subject: [RFC PATCH 4/5] ARM: sun8i: enable PLL2 on a23/33
Date: Tue, 28 Jun 2016 18:13:24 +0800
Message-Id: <20160628101325.2522-4-icenowy@aosc.xyz>
In-Reply-To: <20160628101325.2522-1-icenowy@aosc.xyz>
References: <20160628101325.2522-1-icenowy@aosc.xyz>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
 arch/arm/boot/dts/sun8i-a23-a33.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
index 7e05e09..a340cea 100644
--- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
@@ -46,6 +46,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 
+#include <dt-bindings/clock/sun4i-a10-pll2.h>
 #include <dt-bindings/pinctrl/sun4i-a10.h>
 
 / {
@@ -120,6 +121,15 @@
 			clock-output-names = "pll1";
 		};
 
+		pll2: clk@01c20008 {
+			#clock-cells = <1>;
+			compatible = "allwinner,sun6i-a31-pll2-clk";
+			reg = <0x01c20008 0x8>;
+			clocks = <&osc24M>;
+			clock-output-names = "pll2-1x", "pll2-2x",
+					     "pll2-4x", "pll2-8x";
+		};
+
 		/* dummy clock until actually implemented */
 		pll5: pll5_clk {
 			#clock-cells = <0>;
-- 
2.9.0

Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp5-g21.free.fr ([212.27.42.5]:63093 "EHLO smtp5-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752222AbcFKR4G (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Sat, 11 Jun 2016 13:56:06 -0400
Message-Id: <61aeb2c338f6c1a3dc00db4ad66d285e6b7f48d2.1465666788.git.moinejf@free.fr>
In-Reply-To: <cover.1465666788.git.moinejf@free.fr>
References: <cover.1465666788.git.moinejf@free.fr>
From: Jean-Francois Moine <moinejf@free.fr>
Date: Sat, 11 Jun 2016 19:04:50 +0200
Subject: [PATCH v2 3/3] dt: sun8i: Define the clocks of the A83T
To: Emilio Lopez <emilio@elopez.com.ar>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The clocks are defined by the CCU binding.

Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index d3473f8..4fec56a 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -45,9 +45,10 @@
 
 #include "skeleton.dtsi"
 
+#include <dt-bindings/clock/sun8i-a83t.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
-
 #include <dt-bindings/pinctrl/sun4i-a10.h>
+#include <dt-bindings/reset/sun8i-a83t.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -138,13 +139,13 @@
 			clock-output-names = "osc16M";
 		};
 
-		osc16Md512: osc16Md512_clk {
+		osc32k: osc32k_clk {
 			#clock-cells = <0>;
 			compatible = "fixed-factor-clock";
 			clock-div = <512>;
 			clock-mult = <1>;
 			clocks = <&osc16M>;
-			clock-output-names = "osc16M-d512";
+			clock-output-names = "osc32k";
 		};
 	};
 
@@ -154,13 +155,20 @@
 		#size-cells = <1>;
 		ranges;
 
+		ccu: clock@01c20000 {
+			compatible = "allwinner,sun8i-a83t-ccu";
+			reg = <0x01c20000 0x400>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@01c20800 {
 			compatible = "allwinner,sun8i-a83t-pinctrl";
 			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 			reg = <0x01c20800 0x400>;
-			clocks = <&osc24M>;
+			clocks = <&ccu CLK_BUS_PIO>;
 			gpio-controller;
 			interrupt-controller;
 			#interrupt-cells = <3>;
@@ -210,7 +218,7 @@
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
-			clocks = <&osc24M>;
+			clocks = <&ccu CLK_BUS_UART0>;
 			status = "disabled";
 		};
 
-- 
2.8.4


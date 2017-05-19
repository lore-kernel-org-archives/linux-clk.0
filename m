Return-Path: <wens@wens.csie.org>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH v4 4/6] ARM: sun8i: a83t: Add CCU device nodes
Date: Fri, 19 May 2017 15:06:10 +0800
Message-Id: <20170519070612.32159-5-wens@csie.org>
In-Reply-To: <20170519070612.32159-1-wens@csie.org>
References: <20170519070612.32159-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

Now that we have support for the A83T CCU, add a device node for it,
and replace any existing placeholder clock phandles with the correct
ones.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index c0a1e4f74b89..c9a5d07b2ada 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -162,13 +162,23 @@
 		#size-cells = <1>;
 		ranges;
 
+		ccu: clock@1c20000 {
+			compatible = "allwinner,sun8i-a83t-ccu";
+			reg = <0x01c20000 0x400>;
+			clocks = <&osc24M>, <&osc16Md512>;
+			clock-names = "hosc", "losc";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@1c20800 {
 			compatible = "allwinner,sun8i-a83t-pinctrl";
 			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
 			reg = <0x01c20800 0x400>;
-			clocks = <&osc24M>;
+			clocks = <&ccu 45>, <&osc24M>, <&osc16Md512>;
+			clock-names = "apb", "hosc", "losc";
 			gpio-controller;
 			interrupt-controller;
 			#interrupt-cells = <3>;
@@ -214,7 +224,8 @@
 			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
-			clocks = <&osc24M>;
+			clocks = <&ccu 53>;
+			resets = <&ccu 40>;
 			status = "disabled";
 		};
 
-- 
2.11.0

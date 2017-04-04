Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 4/5] ARM: sunxi: h3/h5: switch apb0-related clocks to r_ccu
Date: Tue,  4 Apr 2017 17:50:59 +0800
Message-Id: <20170404095100.18649-5-icenowy@aosc.io>
In-Reply-To: <20170404095100.18649-1-icenowy@aosc.io>
References: <20170404095100.18649-1-icenowy@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.xyz>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

From: Icenowy Zheng <icenowy@aosc.xyz>

Now we have driver for the PRCM CCU, switch to use it instead of
old-style clock nodes for apb0-related clocks in sunxi-h3-h5.dtsi .

The mux 3 of R_CCU is still the internal oscillator, which is said to be
16MHz plus minus 30%, and get a measured value of 15MHz~16MHz on my two
H3 boards and one H5 board.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
Changes in v4:
- Temporarily dropped the CCU headers.
Changes in v3:
- Change osc32000 to iosc.

 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 45 ++++++++++++--------------------------
 1 file changed, 14 insertions(+), 31 deletions(-)

diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index 6640ebfa6419..1aeeacb3a884 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -68,31 +68,12 @@
 			clock-output-names = "osc32k";
 		};
 
-		apb0: apb0_clk {
-			compatible = "fixed-factor-clock";
+		iosc: internal-osc-clk {
 			#clock-cells = <0>;
-			clock-div = <1>;
-			clock-mult = <1>;
-			clocks = <&osc24M>;
-			clock-output-names = "apb0";
-		};
-
-		apb0_gates: clk@01f01428 {
-			compatible = "allwinner,sun8i-h3-apb0-gates-clk",
-				     "allwinner,sun4i-a10-gates-clk";
-			reg = <0x01f01428 0x4>;
-			#clock-cells = <1>;
-			clocks = <&apb0>;
-			clock-indices = <0>, <1>;
-			clock-output-names = "apb0_pio", "apb0_ir";
-		};
-
-		ir_clk: ir_clk@01f01454 {
-			compatible = "allwinner,sun4i-a10-mod0-clk";
-			reg = <0x01f01454 0x4>;
-			#clock-cells = <0>;
-			clocks = <&osc32k>, <&osc24M>;
-			clock-output-names = "ir";
+			compatible = "fixed-clock";
+			clock-frequency = <16000000>;
+			clock-accuracy = <300000000>;
+			clock-output-names = "iosc";
 		};
 	};
 
@@ -576,9 +557,12 @@
 				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		apb0_reset: reset@01f014b0 {
-			reg = <0x01f014b0 0x4>;
-			compatible = "allwinner,sun6i-a31-clock-reset";
+		r_ccu: clock@1f01400 {
+			compatible = "allwinner,sun50i-a64-r-ccu";
+			reg = <0x01f01400 0x100>;
+			clocks = <&osc24M>, <&osc32k>, <&iosc>;
+			clock-names = "hosc", "losc", "iosc";
+			#clock-cells = <1>;
 			#reset-cells = <1>;
 		};
 
@@ -589,9 +573,9 @@
 
 		ir: ir@01f02000 {
 			compatible = "allwinner,sun5i-a13-ir";
-			clocks = <&apb0_gates 1>, <&ir_clk>;
+			clocks = <&r_ccu 4>, <&r_ccu 11>;
 			clock-names = "apb", "ir";
-			resets = <&apb0_reset 1>;
+			resets = <&r_ccu 0>;
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 			reg = <0x01f02000 0x40>;
 			status = "disabled";
@@ -601,9 +585,8 @@
 			compatible = "allwinner,sun8i-h3-r-pinctrl";
 			reg = <0x01f02c00 0x400>;
 			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&apb0_gates 0>, <&osc24M>, <&osc32k>;
+			clocks = <&r_ccu 3>, <&osc24M>, <&osc32k>;
 			clock-names = "apb", "hosc", "losc";
-			resets = <&apb0_reset 0>;
 			gpio-controller;
 			#gpio-cells = <3>;
 			interrupt-controller;
-- 
2.12.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

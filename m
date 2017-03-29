Return-Path: <icenowy@aosc.io>
From: Icenowy Zheng <icenowy@aosc.io>
To: Michael Turquette <mturquette@baylibre.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Rob Herring <robh+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com,
	Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH v3 1/5] dt-bindings: update device tree binding for Allwinner PRCM CCUs
Date: Wed, 29 Mar 2017 18:42:42 +0800
Message-Id: <20170329104246.34204-2-icenowy@aosc.io>
In-Reply-To: <20170329104246.34204-1-icenowy@aosc.io>
References: <20170329104246.34204-1-icenowy@aosc.io>
List-ID: <linux-clk.vger.kernel.org>

From: Icenowy Zheng <icenowy@aosc.xyz>

Many Allwinner SoCs after A31 have a CCU in PRCM block.

Give the ones on H3 and A64 compatible strings.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
Changes in v3:
- Removed frequency info of iosc in this device tree binding document.
Changes in v2:
- Add iosc for R_CCU's on H3/A64.

 Documentation/devicetree/bindings/clock/sunxi-ccu.txt | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
index 68512aa398a9..e9c5a1d9834a 100644
--- a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
@@ -7,9 +7,11 @@ Required properties :
 		- "allwinner,sun8i-a23-ccu"
 		- "allwinner,sun8i-a33-ccu"
 		- "allwinner,sun8i-h3-ccu"
+		- "allwinner,sun8i-h3-r-ccu"
 		- "allwinner,sun8i-v3s-ccu"
 		- "allwinner,sun9i-a80-ccu"
 		- "allwinner,sun50i-a64-ccu"
+		- "allwinner,sun50i-a64-r-ccu"
 		- "allwinner,sun50i-h5-ccu"
 
 - reg: Must contain the registers base address and length
@@ -20,7 +22,10 @@ Required properties :
 - #clock-cells : must contain 1
 - #reset-cells : must contain 1
 
-Example:
+For the PRCM CCUs on H3/A64, one more clock is needed:
+- "iosc": the SoC's internal frequency oscillator
+
+Example for generic CCU:
 ccu: clock@01c20000 {
 	compatible = "allwinner,sun8i-h3-ccu";
 	reg = <0x01c20000 0x400>;
@@ -29,3 +34,13 @@ ccu: clock@01c20000 {
 	#clock-cells = <1>;
 	#reset-cells = <1>;
 };
+
+Example for PRCM CCU:
+r_ccu: clock@01f01400 {
+	compatible = "allwinner,sun50i-a64-r-ccu";
+	reg = <0x01f01400 0x100>;
+	clocks = <&osc24M>, <&osc32k>, <&iosc>;
+	clock-names = "hosc", "losc", "iosc";
+	#clock-cells = <1>;
+	#reset-cells = <1>;
+};
-- 
2.12.0

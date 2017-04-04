Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 1/5] dt-bindings: update device tree binding for Allwinner
 PRCM CCUs
Date: Tue,  4 Apr 2017 17:50:56 +0800
Message-Id: <20170404095100.18649-2-icenowy@aosc.io>
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

Many Allwinner SoCs after A31 have a CCU in PRCM block.

Give the ones on H3 and A64 compatible strings.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes in v4:
- Add Rob's ACK.
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
2.12.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

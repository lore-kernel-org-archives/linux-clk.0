Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:57138 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751198AbeFVMrV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 22 Jun 2018 08:47:21 -0400
From: Icenowy Zheng <icenowy@aosc.io>
To: Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v2 2/7] dt-bindings: add binding for the Allwinner A64 DE2 bus
Date: Fri, 22 Jun 2018 20:45:35 +0800
Message-Id: <20180622124540.56203-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

All the sub-blocks of Allwinner A64 DE2 needs the SRAM C on A64 SoC to
be claimed, otherwise the whole DE2 space is inaccessible.

Add a device tree binding of the DE2 part as a sub-bus.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
No changes since v1.

 .../bindings/bus/sun50i-de2-bus.txt           | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/sun50i-de2-bus.txt

diff --git a/Documentation/devicetree/bindings/bus/sun50i-de2-bus.txt b/Documentation/devicetree/bindings/bus/sun50i-de2-bus.txt
new file mode 100644
index 000000000000..87dfb33fb3be
--- /dev/null
+++ b/Documentation/devicetree/bindings/bus/sun50i-de2-bus.txt
@@ -0,0 +1,37 @@
+Device tree bindings for Allwinner A64 DE2 bus
+
+The Allwinner A64 DE2 is on a special bus, which needs a SRAM region (SRAM C)
+to be claimed for enabling the access.
+
+Required properties:
+
+ - compatible:		Should contain "allwinner,sun50i-a64-de2"
+ - reg:			A resource specifier for the register space
+ - #address-cells:	Must be set to 1
+ - #size-cells:		Must be set to 1
+ - ranges:		Must be set up to map the address space inside the
+			DE2, for the sub-blocks of DE2.
+ - allwinner,sram:	the SRAM that needs to be claimed
+
+Example:
+
+	de2@1000000 {
+		compatible = "allwinner,sun50i-a64-de2";
+		reg = <0x1000000 0x400000>;
+		allwinner,sram = <&de2_sram 1>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x1000000 0x400000>;
+
+		display_clocks: clock@0 {
+			compatible = "allwinner,sun50i-a64-de2-clk";
+			reg = <0x0 0x100000>;
+			clocks = <&ccu CLK_DE>,
+				 <&ccu CLK_BUS_DE>;
+			clock-names = "mod",
+				      "bus";
+			resets = <&ccu RST_BUS_DE>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+	};
-- 
2.17.1


Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.io>
To: Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH v3 01/11] dt-bindings: add binding for the Allwinner DE2 CCU
Date: Thu, 30 Mar 2017 03:46:03 +0800
Message-Id: <20170329194613.55548-2-icenowy@aosc.io>
In-Reply-To: <20170329194613.55548-1-icenowy@aosc.io>
References: <20170329194613.55548-1-icenowy@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 Icenowy Zheng <icenowy@aosc.xyz>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

From: Icenowy Zheng <icenowy@aosc.xyz>

Allwinner "Display Engine 2.0" contains some clock controls in it.

In order to add them as clock drivers, we need a device tree binding.
Add the binding here.

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
Changes in v3:
- Fill the address space length of DE2 CCU to 0x100000, just reach the start of mixer0.

 .../devicetree/bindings/clock/sun8i-de2.txt        | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sun8i-de2.txt

diff --git a/Documentation/devicetree/bindings/clock/sun8i-de2.txt b/Documentation/devicetree/bindings/clock/sun8i-de2.txt
new file mode 100644
index 000000000000..34cf79c05f13
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sun8i-de2.txt
@@ -0,0 +1,31 @@
+Allwinner Display Engine 2.0 Clock Control Binding
+--------------------------------------------------
+
+Required properties :
+- compatible: must contain one of the following compatibles:
+		- "allwinner,sun8i-a83t-de2-clk"
+		- "allwinner,sun50i-a64-de2-clk"
+		- "allwinner,sun50i-h5-de2-clk"
+
+- reg: Must contain the registers base address and length
+- clocks: phandle to the clocks feeding the display engine subsystem.
+	  Three are needed:
+  - "mod": the display engine module clock
+  - "bus": the bus clock for the whole display engine subsystem
+- clock-names: Must contain the clock names described just above
+- resets: phandle to the reset control for the display engine subsystem.
+- #clock-cells : must contain 1
+- #reset-cells : must contain 1
+
+Example:
+de2_clocks: clock@01000000 {
+	compatible = "allwinner,sun50i-a64-de2-clk";
+	reg = <0x01000000 0x100000>;
+	clocks = <&ccu CLK_DE>,
+		 <&ccu CLK_BUS_DE>;
+	clock-names = "mod",
+		      "bus";
+	resets = <&ccu RST_BUS_DE>;
+	#clock-cells = <1>;
+	#reset-cells = <1>;
+};
-- 
2.12.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

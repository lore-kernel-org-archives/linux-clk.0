Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Icenowy Zheng <icenowy@aosc.io>
To: Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH v5 11/11] [DO NOT MERGE] ARM: dts: sun8i: enable LCD panel of Lichee Pi Zero
Date: Sun, 23 Apr 2017 18:37:54 +0800
Message-Id: <20170423103754.50012-12-icenowy@aosc.io>
In-Reply-To: <20170423103754.50012-1-icenowy@aosc.io>
References: <20170423103754.50012-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

A 480x272 QiaoDian QD43003C0-40-7LED panel is available from Lichee Pi.

This commit connects this panel to Lichee Pi Zero.

Lichee Pi also provides a 800x480 panel without accurate model number,
so do not merge this patch. It will finally come as device tree overlay.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts | 36 +++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts b/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts
index 387fc2aa546d..7ae72bf63cd0 100644
--- a/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts
+++ b/arch/arm/boot/dts/sun8i-v3s-licheepi-zero.dts
@@ -75,6 +75,28 @@
 			gpios = <&pio 6 2 GPIO_ACTIVE_LOW>; /* PG2 */
 		};
 	};
+
+	panel: panel {
+		compatible = "qiaodian,qd43003c0-40", "simple-panel";
+		enable-gpios = <&pio 1 4 GPIO_ACTIVE_HIGH>; /* Should be backlight */
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			panel_input: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&tcon0_out_lcd>;
+			};
+		};
+	};
+};
+
+&de {
+	status = "okay";
 };
 
 &mmc0 {
@@ -86,6 +108,20 @@
 	status = "okay";
 };
 
+&tcon0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&lcd_rgb666_pins>;
+	status = "okay";
+
+};
+
+&tcon0_out {
+	tcon0_out_lcd: endpoint@0 {
+		reg = <0>;
+		remote-endpoint = <&panel_input>;
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_pins_a>;
 	pinctrl-names = "default";
-- 
2.12.2

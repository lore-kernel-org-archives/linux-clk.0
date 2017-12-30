Return-Path: <jernej.skrabec@siol.net>
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: maxime.ripard@free-electrons.com,
	airlied@linux.ie,
	robh+dt@kernel.org,
	mark.rutland@arm.com,
	wens@csie.org,
	architt@codeaurora.org,
	a.hajda@samsung.com,
	Laurent.pinchart@ideasonboard.com
Cc: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	Jose.Abreu@synopsys.com,
	narmstrong@baylibre.com,
	jernej.skrabec@siol.net,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH 10/11] ARM: dts: sun8i: a83t: Add HDMI display pipeline
Date: Sat, 30 Dec 2017 22:02:02 +0100
Message-Id: <20171230210203.24115-11-jernej.skrabec@siol.net>
In-Reply-To: <20171230210203.24115-1-jernej.skrabec@siol.net>
References: <20171230210203.24115-1-jernej.skrabec@siol.net>
List-ID: <linux-clk.vger.kernel.org>

This commit adds all bits necessary for HDMI on A83T - mixer1, tcon1,
hdmi and hdmi pinctrl entries.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 108 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 107 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 7f4955a5fab7..601d1eb5460e 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -155,7 +155,7 @@
 
 	de: display-engine {
 		compatible = "allwinner,sun8i-a83t-display-engine";
-		allwinner,pipelines = <&mixer0>;
+		allwinner,pipelines = <&mixer0>, <&mixer1>;
 		status = "disabled";
 	};
 
@@ -208,6 +208,32 @@
 			};
 		};
 
+		mixer1: mixer@1200000 {
+			compatible = "allwinner,sun8i-a83t-de2-mixer-1";
+			reg = <0x01200000 0x100000>;
+			clocks = <&display_clocks CLK_BUS_MIXER1>,
+				 <&display_clocks CLK_MIXER1>;
+			clock-names = "bus",
+				      "mod";
+			resets = <&display_clocks RST_WB>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				mixer1_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					mixer1_out_tcon1: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon1_in_mixer1>;
+					};
+				};
+			};
+		};
+
 		syscon: syscon@1c00000 {
 			compatible = "allwinner,sun8i-a83t-system-controller",
 				"syscon";
@@ -256,6 +282,43 @@
 			};
 		};
 
+		tcon1: lcd-controller@1c0d000 {
+			compatible = "allwinner,sun8i-a83t-tcon-tv";
+			reg = <0x01c0d000 0x1000>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON1>, <&ccu CLK_TCON1>;
+			clock-names = "ahb", "tcon-ch1";
+			resets = <&ccu RST_BUS_TCON1>;
+			reset-names = "lcd";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon1_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon1_in_mixer1: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&mixer1_out_tcon1>;
+					};
+				};
+
+				tcon1_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					tcon1_out_hdmi: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&hdmi_in_tcon1>;
+					};
+				};
+			};
+		};
+
 		mmc0: mmc@1c0f000 {
 			compatible = "allwinner,sun8i-a83t-mmc",
 				     "allwinner,sun7i-a20-mmc";
@@ -427,6 +490,11 @@
 				drive-strength = <40>;
 			};
 
+			hdmi_pins: hdmi-pins {
+				pins = "PH6", "PH7", "PH8";
+				function = "hdmi";
+			};
+
 			i2c0_pins: i2c0-pins {
 				pins = "PH0", "PH1";
 				function = "i2c0";
@@ -685,6 +753,44 @@
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		hdmi: hdmi@1ee0000 {
+			compatible = "allwinner,sun8i-a83t-dw-hdmi";
+			reg = <0x01ee0000 0x10000>,
+			      <0x01ef0000 0x10000>;
+			reg-io-width = <1>;
+			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_HDMI>, <&ccu CLK_HDMI_SLOW>,
+				 <&ccu CLK_HDMI>;
+			clock-names = "iahb", "isfr", "tmds";
+			resets = <&ccu RST_BUS_HDMI0>, <&ccu RST_BUS_HDMI1>;
+			reset-names = "phy", "ctrl";
+			pinctrl-names = "default";
+			pinctrl-0 = <&hdmi_pins>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				hdmi_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					hdmi_in_tcon1: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon1_out_hdmi>;
+					};
+				};
+
+				hdmi_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+			};
+		};
+
 		r_intc: interrupt-controller@1f00c00 {
 			compatible = "allwinner,sun8i-a83t-r-intc",
 				     "allwinner,sun6i-a31-r-intc";
-- 
2.15.1

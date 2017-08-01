Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH 07/13] ARM: sun8i: h3: add display engine pipeline barebone
Date: Tue,  1 Aug 2017 21:12:58 +0800
Message-Id: <20170801131304.7741-8-icenowy@aosc.io>
In-Reply-To: <20170801131304.7741-1-icenowy@aosc.io>
References: <20170801131304.7741-1-icenowy@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

As we have already the support for the DE2 on Allwinner H3, add the
display engine pipeline device tree nodes to its DTSI file.

The H5 pipeline has some differences and will be enabled later.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 arch/arm/boot/dts/sun8i-h3.dtsi | 170 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index b36f9f423c39..75ad7b65a7fc 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -41,6 +41,8 @@
  */
 
 #include "sunxi-h3-h5.dtsi"
+#include <dt-bindings/clock/sun8i-de2.h>
+#include <dt-bindings/reset/sun8i-de2.h>
 
 / {
 	cpus {
@@ -72,6 +74,174 @@
 		};
 	};
 
+	de: display-engine {
+		compatible = "allwinner,sun8i-h3-display-engine";
+		allwinner,pipelines = <&mixer0>,
+				      <&mixer1>;
+		status = "disabled";
+	};
+
+	soc {
+		display_clocks: clock@1000000 {
+			compatible = "allwinner,sun8i-a83t-de2-clk";
+			reg = <0x01000000 0x100000>;
+			clocks = <&ccu CLK_BUS_DE>,
+				 <&ccu CLK_DE>;
+			clock-names = "bus",
+				      "mod";
+			resets = <&ccu RST_BUS_DE>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			assigned-clocks = <&ccu CLK_DE>;
+			assigned-clock-parents = <&ccu CLK_PLL_DE>;
+			assigned-clock-rates = <432000000>;
+		};
+
+		mixer0: mixer@1100000 {
+			compatible = "allwinner,sun8i-h3-de2-mixer0";
+			reg = <0x01100000 0x100000>;
+			clocks = <&display_clocks CLK_BUS_MIXER0>,
+				 <&display_clocks CLK_MIXER0>;
+			clock-names = "bus",
+				      "mod";
+			resets = <&display_clocks RST_MIXER0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				mixer0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					mixer0_out_tcon0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon0_in_mixer0>;
+					};
+
+					mixer0_out_tcon1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon1_in_mixer0>;
+					};
+				};
+			};
+		};
+
+		mixer1: mixer@1200000 {
+			compatible = "allwinner,sun8i-h3-de2-mixer1";
+			reg = <0x01200000 0x100000>;
+			clocks = <&display_clocks CLK_BUS_MIXER1>,
+				 <&display_clocks CLK_MIXER1>;
+			clock-names = "bus",
+				      "mod";
+			resets = <&display_clocks RST_WB>;
+			status = "disabled";
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
+					mixer1_out_tcon0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon0_in_mixer1>;
+					};
+
+					mixer1_out_tcon1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&tcon1_in_mixer1>;
+					};
+				};
+			};
+		};
+
+		tcon0: lcd-controller@1c0c000 {
+			compatible = "allwinner,sun8i-h3-tcon";
+			reg = <0x01c0c000 0x1000>;
+			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON0>,
+				 <&ccu CLK_TCON0>;
+			clock-names = "ahb",
+				      "tcon-ch1";
+			resets = <&ccu RST_BUS_TCON0>;
+			reset-names = "lcd";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tcon0_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					tcon0_in_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&mixer0_out_tcon0>;
+					};
+
+					tcon0_in_mixer1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&mixer1_out_tcon0>;
+					};
+				};
+
+				tcon0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+			};
+		};
+
+		tcon1: lcd-controller@1c0d000 {
+			compatible = "allwinner,sun8i-h3-tcon";
+			reg = <0x01c0d000 0x1000>;
+			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_TCON1>,
+				 <&ccu CLK_TVE>;
+			clock-names = "ahb",
+				      "tcon-ch1";
+			resets = <&ccu RST_BUS_TCON1>;
+			reset-names = "lcd";
+			status = "disabled";
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
+					tcon1_in_mixer0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&mixer0_out_tcon1>;
+					};
+
+					tcon1_in_mixer1: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&mixer1_out_tcon1>;
+					};
+				};
+
+				tcon1_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
-- 
2.13.0


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

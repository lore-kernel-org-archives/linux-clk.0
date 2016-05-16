Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Rob Herring <robh+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 15/20] ARM: sun5i: Move display blocks to A13
Date: Mon, 16 May 2016 14:47:15 +0200
Message-Id: <1463402840-17062-16-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1463402840-17062-1-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Most of the display engine is shared between the R8 and the A13. Move the
common parts to the Á13 DTSI.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/boot/dts/sun5i-a13.dtsi | 112 ++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/sun5i-r8.dtsi  | 120 ++-------------------------------------
 2 files changed, 117 insertions(+), 115 deletions(-)

diff --git a/arch/arm/boot/dts/sun5i-a13.dtsi b/arch/arm/boot/dts/sun5i-a13.dtsi
index 79b5d513c142..e012890e0cf2 100644
--- a/arch/arm/boot/dts/sun5i-a13.dtsi
+++ b/arch/arm/boot/dts/sun5i-a13.dtsi
@@ -207,7 +207,50 @@
 		};
 	};
 
+	display-engine {
+		compatible = "allwinner,sun5i-a13-display-engine";
+		allwinner,pipelines = <&fe0>;
+	};
+
 	soc@01c00000 {
+		tcon0: lcd-controller@01c0c000 {
+			compatible = "allwinner,sun5i-a13-tcon";
+			reg = <0x01c0c000 0x1000>;
+			interrupts = <44>;
+			resets = <&tcon_ch0_clk 1>;
+			reset-names = "lcd";
+			clocks = <&ahb_gates 36>,
+				 <&tcon_ch0_clk>,
+				 <&tcon_ch1_clk>;
+			clock-names = "ahb",
+				      "tcon-ch0",
+				      "tcon-ch1";
+			clock-output-names = "tcon-pixel-clock";
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
+					tcon0_in_be0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&be0_out_tcon0>;
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
 		pwm: pwm@01c20e00 {
 			compatible = "allwinner,sun5i-a13-pwm";
 			reg = <0x01c20e00 0xc>;
@@ -215,6 +258,75 @@
 			#pwm-cells = <3>;
 			status = "disabled";
 		};
+
+		fe0: display-frontend@01e00000 {
+			compatible = "allwinner,sun5i-a13-display-frontend";
+			reg = <0x01e00000 0x20000>;
+			interrupts = <47>;
+			clocks = <&ahb_gates 46>, <&de_fe_clk>,
+				 <&dram_gates 25>;
+			clock-names = "ahb", "mod",
+				      "ram";
+			resets = <&de_fe_clk>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				fe0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					fe0_out_be0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&be0_in_fe0>;
+					};
+				};
+			};
+		};
+
+		be0: display-backend@01e60000 {
+			compatible = "allwinner,sun5i-a13-display-backend";
+			reg = <0x01e60000 0x10000>;
+			clocks = <&ahb_gates 44>, <&de_be_clk>,
+				 <&dram_gates 26>;
+			clock-names = "ahb", "mod",
+				      "ram";
+			resets = <&de_be_clk>;
+			status = "disabled";
+
+			assigned-clocks = <&de_be_clk>;
+			assigned-clock-rates = <300000000>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				be0_in: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					be0_in_fe0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&fe0_out_be0>;
+					};
+				};
+
+				be0_out: port@1 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <1>;
+
+					be0_out_tcon0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tcon0_in_be0>;
+					};
+				};
+			};
+		};
 	};
 };
 
diff --git a/arch/arm/boot/dts/sun5i-r8.dtsi b/arch/arm/boot/dts/sun5i-r8.dtsi
index c04cf690b858..8b058f53b7dc 100644
--- a/arch/arm/boot/dts/sun5i-r8.dtsi
+++ b/arch/arm/boot/dts/sun5i-r8.dtsi
@@ -76,122 +76,12 @@
 				};
 			};
 		};
-
-		tcon0: lcd-controller@01c0c000 {
-			compatible = "allwinner,sun5i-a13-tcon";
-			reg = <0x01c0c000 0x1000>;
-			interrupts = <44>;
-			resets = <&tcon_ch0_clk 1>;
-			reset-names = "lcd";
-			clocks = <&ahb_gates 36>,
-				 <&tcon_ch0_clk>,
-				 <&tcon_ch1_clk>;
-			clock-names = "ahb",
-				      "tcon-ch0",
-				      "tcon-ch1";
-			clock-output-names = "tcon-pixel-clock";
-			status = "disabled";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				tcon0_in: port@0 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0>;
-
-					tcon0_in_be0: endpoint@0 {
-						reg = <0>;
-						remote-endpoint = <&be0_out_tcon0>;
-					};
-				};
-
-				tcon0_out: port@1 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <1>;
-
-					tcon0_out_tve0: endpoint@1 {
-						reg = <1>;
-						remote-endpoint = <&tve0_in_tcon0>;
-					};
-				};
-			};
-		};
-
-		fe0: display-frontend@01e00000 {
-			compatible = "allwinner,sun5i-a13-display-frontend";
-			reg = <0x01e00000 0x20000>;
-			interrupts = <47>;
-			clocks = <&ahb_gates 46>, <&de_fe_clk>,
-				 <&dram_gates 25>;
-			clock-names = "ahb", "mod",
-				      "ram";
-			resets = <&de_fe_clk>;
-			status = "disabled";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				fe0_out: port@1 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <1>;
-
-					fe0_out_be0: endpoint@0 {
-						reg = <0>;
-						remote-endpoint = <&be0_in_fe0>;
-					};
-				};
-			};
-		};
-
-		be0: display-backend@01e60000 {
-			compatible = "allwinner,sun5i-a13-display-backend";
-			reg = <0x01e60000 0x10000>;
-			clocks = <&ahb_gates 44>, <&de_be_clk>,
-				 <&dram_gates 26>;
-			clock-names = "ahb", "mod",
-				      "ram";
-			resets = <&de_be_clk>;
-			status = "disabled";
-
-			assigned-clocks = <&de_be_clk>;
-			assigned-clock-rates = <300000000>;
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				be0_in: port@0 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <0>;
-
-					be0_in_fe0: endpoint@0 {
-						reg = <0>;
-						remote-endpoint = <&fe0_out_be0>;
-					};
-				};
-
-				be0_out: port@1 {
-					#address-cells = <1>;
-					#size-cells = <0>;
-					reg = <1>;
-
-					be0_out_tcon0: endpoint@0 {
-						reg = <0>;
-						remote-endpoint = <&tcon0_in_be0>;
-					};
-				};
-			};
-		};
 	};
+};
 
-	display-engine {
-		compatible = "allwinner,sun5i-a13-display-engine";
-		allwinner,pipelines = <&fe0>;
+&tcon0_out {
+	tcon0_out_tve0: endpoint@1 {
+		reg = <1>;
+		remote-endpoint = <&tve0_in_tcon0>;
 	};
 };
-- 
2.8.2

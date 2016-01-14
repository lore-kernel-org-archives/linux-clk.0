Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>,
	Thierry Reding <thierry.reding@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@googlegroups.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Wynter Woods <wynter@nextthing.co>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Rob Clark <robdclark@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v2 22/26] ARM: sun5i: r8: Add display blocks to the DTSI
Date: Thu, 14 Jan 2016 16:25:05 +0100
Message-Id: <1452785109-6172-23-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1452785109-6172-1-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

The TCON, tv-encoder and display engine backends and frontends are combined
to create our display pipeline.

Add them to the R8 DTSI. It's supposed to be perfectly compatible with the
A10s and A13, but since we haven't tested it on them yet, it's safer to
just enable it on the R8. Eventually, it should be moved to sun5i.dtsi

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/boot/dts/sun5i-r8.dtsi | 134 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/arch/arm/boot/dts/sun5i-r8.dtsi b/arch/arm/boot/dts/sun5i-r8.dtsi
index 691d3de75b35..b3bf91516a80 100644
--- a/arch/arm/boot/dts/sun5i-r8.dtsi
+++ b/arch/arm/boot/dts/sun5i-r8.dtsi
@@ -57,4 +57,138 @@
 			status = "disabled";
 		};
 	};
+
+	soc@01c00000 {
+		tve0: tv-encoder@01c0a000 {
+			compatible = "allwinner,sun4i-a10-tv-encoder";
+			reg = <0x01c0a000 0x1000>;
+			clocks = <&ahb_gates 34>;
+			status = "disabled";
+
+			port {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				tve0_in_tcon0: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&tcon0_out_tve0>;
+				};
+			};
+		};
+
+		tcon0: lcd-controller@01c0c000 {
+			compatible = "allwinner,sun4i-a10-tcon";
+			reg = <0x01c0c000 0x1000>;
+			interrupts = <44>;
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
+
+					tcon0_out_tve0: endpoint@0 {
+						reg = <0>;
+						remote-endpoint = <&tve0_in_tcon0>;
+					};
+				};
+			};
+		};
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
+				fe0_out: port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
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
+	};
+
+	display-engine {
+		compatible = "allwinner,sun5i-a13-display-engine";
+		pipelines = <&be0>;
+	};
 };
-- 
2.6.4

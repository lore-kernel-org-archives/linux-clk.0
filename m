Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	David Airlie <airlied@linux.ie>,
	Chen-Yu Tsai <wens@csie.org>,
	Rob Herring <robh+dt@kernel.org>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Hans de Goede <hdegoede@redhat.com>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com,
	dri-devel@lists.freedesktop.org,
	Boris Brezillon <boris.brezillon@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Alexander Kaplan <alex@nextthing.co>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v4 10/11] ARM: sun5i: r8: Add display blocks to the DTSI
Date: Mon, 25 Apr 2016 15:22:51 +0200
Message-Id: <1461590572-4027-11-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1461590572-4027-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1461590572-4027-1-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

The TCON, tv-encoder and display engine backends and frontends are combined
to create our display pipeline.

Add them to the R8 DTSI. It's supposed to be perfectly compatible with the
A10s and A13, but since we haven't tested it on them yet, it's safer to
just enable it on the R8. Eventually, it should be moved to sun5i.dtsi

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/boot/dts/sun5i-r8.dtsi | 137 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/arch/arm/boot/dts/sun5i-r8.dtsi b/arch/arm/boot/dts/sun5i-r8.dtsi
index 691d3de75b35..a42b5404893e 100644
--- a/arch/arm/boot/dts/sun5i-r8.dtsi
+++ b/arch/arm/boot/dts/sun5i-r8.dtsi
@@ -57,4 +57,141 @@
 			status = "disabled";
 		};
 	};
+
+	soc@01c00000 {
+		tve0: tv-encoder@01c0a000 {
+			compatible = "allwinner,sun4i-a10-tv-encoder";
+			reg = <0x01c0a000 0x1000>;
+			clocks = <&ahb_gates 34>;
+			resets = <&tcon_ch0_clk 0>;
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
+
+					tcon0_out_tve0: endpoint@1 {
+						reg = <1>;
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
+	};
+
+	display-engine {
+		compatible = "allwinner,sun5i-a13-display-engine";
+		pipelines = <&fe0>;
+	};
 };
-- 
2.8.1

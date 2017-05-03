Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
	David Airlie <airlied@linux.ie>,
	dri-devel@lists.freedesktop.org,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH v2 19/20] ARM: sun5i: a10s: Add the HDMI controller node
Date: Wed,  3 May 2017 13:59:56 +0200
Message-Id: <1e3ddf81459adbab455b2211fe6b78bd6cf1bbec.1493812478.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard@free-electrons.com>
References: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard@free-electrons.com>
In-Reply-To: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard@free-electrons.com>
References: <cover.d697f34bb7b0605c5e76cbc4167a64453e5e0984.1493812478.git-series.maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

The A10s has an HDMI controller connected to the second TCON channel. Add
it to our DT.

Since the TV Encoder was the only channel 1 user so far, also add the
property now that we have several users.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/boot/dts/sun5i-a10s.dtsi | 50 ++++++++++++++++++++++++++++++++-
 arch/arm/boot/dts/sun5i.dtsi      |  1 +-
 2 files changed, 51 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/sun5i-a10s.dtsi b/arch/arm/boot/dts/sun5i-a10s.dtsi
index 1e38ff80366c..c9d4ee12599d 100644
--- a/arch/arm/boot/dts/sun5i-a10s.dtsi
+++ b/arch/arm/boot/dts/sun5i-a10s.dtsi
@@ -71,7 +71,49 @@
 		};
 	};
 
+	display-engine {
+		compatible = "allwinner,sun5i-a10s-display-engine",
+			     "allwinner,sun5i-a13-display-engine";
+		allwinner,pipelines = <&fe0>;
+	};
+
 	soc@01c00000 {
+		hdmi: hdmi@01c16000 {
+			compatible = "allwinner,sun5i-a10s-hdmi";
+			reg = <0x01c16000 0x1000>;
+			interrupts = <58>;
+			clocks = <&ccu CLK_AHB_HDMI>, <&ccu CLK_HDMI>,
+				 <&ccu CLK_PLL_VIDEO0_2X>,
+				 <&ccu CLK_PLL_VIDEO1_2X>;
+			clock-names = "ahb", "mod", "pll-0", "pll-1";
+			dmas = <&dma SUN4I_DMA_NORMAL 16>,
+			       <&dma SUN4I_DMA_NORMAL 16>,
+			       <&dma SUN4I_DMA_DEDICATED 24>;
+			dma-names = "ddc-tx", "ddc-rx", "audio-tx";
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
+					hdmi_in_tcon0: endpoint {
+						remote-endpoint = <&tcon0_out_hdmi>;
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
 		pwm: pwm@01c20e00 {
 			compatible = "allwinner,sun5i-a10s-pwm";
 			reg = <0x01c20e00 0xc>;
@@ -128,3 +170,11 @@
 
 &sram_a {
 };
+
+&tcon0_out {
+	tcon0_out_hdmi: endpoint@2 {
+		reg = <2>;
+		remote-endpoint = <&hdmi_in_tcon0>;
+		allwinner,tcon-channel = <1>;
+	};
+};
diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
index 5175f9cc9bed..0e29f1d98a9e 100644
--- a/arch/arm/boot/dts/sun5i.dtsi
+++ b/arch/arm/boot/dts/sun5i.dtsi
@@ -272,6 +272,7 @@
 					tcon0_out_tve0: endpoint@1 {
 						reg = <1>;
 						remote-endpoint = <&tve0_in_tcon0>;
+						allwinner,tcon-channel = <1>;
 					};
 				};
 			};
-- 
git-series 0.8.11

Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH 7/8] ARM: sunxi: Add codec clock support
Date: Sat,  2 May 2015 13:24:38 +0200
Message-Id: <1430565879-28113-8-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1430565879-28113-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1430565879-28113-1-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

From: Emilio López <emilio@elopez.com.ar>

This commit adds the codec clock definition to the sun4i, sun5i and
sun7i device trees. The codec clock is used in the analog codec block.

Signed-off-by: Emilio López <emilio@elopez.com.ar>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/boot/dts/sun4i-a10.dtsi | 9 +++++++++
 arch/arm/boot/dts/sun5i.dtsi     | 9 +++++++++
 arch/arm/boot/dts/sun7i-a20.dtsi | 9 +++++++++
 3 files changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
index 2ed3a0b43131..f4dead8cde2c 100644
--- a/arch/arm/boot/dts/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/sun4i-a10.dtsi
@@ -50,6 +50,7 @@
 
 #include <dt-bindings/thermal/thermal.h>
 
+#include <dt-bindings/clock/sun4i-a10-pll2.h>
 #include <dt-bindings/dma/sun4i-a10.h>
 #include <dt-bindings/pinctrl/sun4i-a10.h>
 
@@ -457,6 +458,14 @@
 			clocks = <&osc24M>, <&pll6 1>, <&pll5 1>;
 			clock-output-names = "spi3";
 		};
+
+		codec_clk: clk@01c20140 {
+			#clock-cells = <0>;
+			compatible = "allwinner,sun4i-a10-codec-clk";
+			reg = <0x01c20140 0x4>;
+			clocks = <&pll2 SUN4I_A10_PLL2_1X>;
+			clock-output-names = "codec";
+		};
 	};
 
 	/*
diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
index b291c165966f..38cb77c378ec 100644
--- a/arch/arm/boot/dts/sun5i.dtsi
+++ b/arch/arm/boot/dts/sun5i.dtsi
@@ -49,6 +49,7 @@
 
 #include "skeleton.dtsi"
 
+#include <dt-bindings/clock/sun4i-a10-pll2.h>
 #include <dt-bindings/dma/sun4i-a10.h>
 #include <dt-bindings/pinctrl/sun4i-a10.h>
 
@@ -298,6 +299,14 @@
 			clock-output-names = "usb_ohci0", "usb_phy";
 		};
 
+		codec_clk: clk@01c20140 {
+			#clock-cells = <0>;
+			compatible = "allwinner,sun4i-a10-codec-clk";
+			reg = <0x01c20140 0x4>;
+			clocks = <&pll2 SUN4I_A10_PLL2_1X>;
+			clock-output-names = "codec";
+		};
+
 		mbus_clk: clk@01c2015c {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun5i-a13-mbus-clk";
diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 7c850dc1b197..8a5418a0e795 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -52,6 +52,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/thermal/thermal.h>
 
+#include <dt-bindings/clock/sun4i-a10-pll2.h>
 #include <dt-bindings/dma/sun4i-a10.h>
 #include <dt-bindings/pinctrl/sun4i-a10.h>
 
@@ -472,6 +473,14 @@
 			clock-output-names = "spi3";
 		};
 
+		codec_clk: clk@01c20140 {
+			#clock-cells = <0>;
+			compatible = "allwinner,sun4i-a10-codec-clk";
+			reg = <0x01c20140 0x4>;
+			clocks = <&pll2 SUN4I_A10_PLL2_1X>;
+			clock-output-names = "codec";
+		};
+
 		mbus_clk: clk@01c2015c {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun5i-a13-mbus-clk";
-- 
2.3.6

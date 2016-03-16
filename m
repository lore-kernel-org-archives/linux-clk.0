Return-Path: <vishnupatekar0510@gmail.com>
Return-Path: <vishnupatekar0510@gmail.com>
From: Vishnu Patekar <vishnupatekar0510@gmail.com>
To: robh+dt@kernel.org,
	corbet@lwn.net,
	pawel.moll@arm.com,
	mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk,
	galak@codeaurora.org,
	maxime.ripard@free-electrons.com,
	linux@arm.linux.org.uk,
	emilio@elopez.com.ar
Cc: jenskuske@gmail.com,
	hdegoede@redhat.com,
	wens@csie.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com,
	linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	patchesrdh@mveas.com,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 06/13] ARM: dts: sun8i-a83t: Add mmc controller nodes
Date: Thu, 17 Mar 2016 00:04:29 +0800
Message-Id: <1458144276-31108-7-git-send-email-vishnupatekar0510@gmail.com>
In-Reply-To: <1458144276-31108-1-git-send-email-vishnupatekar0510@gmail.com>
References: <1458144276-31108-1-git-send-email-vishnupatekar0510@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

A83T mmc is compatible with earliers sunxi socs.
This adds mmc0, mmc1, and mmc2 controller nodes for A83T.

Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 57 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 943d8a8..a44d4dc 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -275,6 +275,63 @@
 		#size-cells = <1>;
 		ranges;
 
+		mmc0: mmc@01c0f000 {
+			compatible = "allwinner,sun5i-a13-mmc";
+			reg = <0x01c0f000 0x1000>;
+			clocks = <&bus_gates 8>,
+				 <&mmc0_clk 0>,
+				 <&mmc0_clk 1>,
+				 <&mmc0_clk 2>;
+			clock-names = "ahb",
+				      "mmc",
+				      "output",
+				      "sample";
+			resets = <&ahb_reset 8>;
+			reset-names = "ahb";
+			interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		mmc1: mmc@01c10000 {
+			compatible = "allwinner,sun5i-a13-mmc";
+			reg = <0x01c10000 0x1000>;
+			clocks = <&bus_gates 9>,
+				 <&mmc1_clk 0>,
+				 <&mmc1_clk 1>,
+				 <&mmc1_clk 2>;
+			clock-names = "ahb",
+				      "mmc",
+				      "output",
+				      "sample";
+			resets = <&ahb_reset 9>;
+			reset-names = "ahb";
+			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		mmc2: mmc@01c11000 {
+			compatible = "allwinner,sun5i-a13-mmc";
+			reg = <0x01c11000 0x1000>;
+			clocks = <&bus_gates 10>,
+				 <&mmc2_clk 0>,
+				 <&mmc2_clk 1>,
+				 <&mmc2_clk 2>;
+			clock-names = "ahb",
+				      "mmc",
+				      "output",
+				      "sample";
+			resets = <&ahb_reset 10>;
+			reset-names = "ahb";
+			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		pio: pinctrl@01c20800 {
 			compatible = "allwinner,sun8i-a83t-pinctrl";
 			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
-- 
1.9.1

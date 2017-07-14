Return-Path: <wens@wens.csie.org>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH 11/11] ARM: dts: sun8i: a83t: h8homlet: Enable micro-SD card and onboard eMMC
Date: Fri, 14 Jul 2017 14:43:02 +0800
Message-Id: <20170714064302.20383-12-wens@csie.org>
In-Reply-To: <20170714064302.20383-1-wens@csie.org>
References: <20170714064302.20383-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

The H8 homlet has a micro-SD card slot connected to mmc0,
and onboard eMMC from FORESEE, connected to mmc2.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts   | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts b/arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts
index aecdeeb368ed..7afbaa4eea8d 100644
--- a/arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts
+++ b/arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts
@@ -43,6 +43,7 @@
 
 /dts-v1/;
 #include "sun8i-a83t.dtsi"
+#include "sunxi-common-regulators.dtsi"
 
 / {
 	model = "Allwinner A83T H8Homlet Proto Dev Board v2.0";
@@ -57,6 +58,26 @@
 	};
 };
 
+&mmc0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_pins>;
+	vmmc-supply = <&reg_vcc3v0>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
+	bus-width = <4>;
+	cd-inverted;
+	status = "okay";
+};
+
+&mmc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc2_8bit_emmc_pins>;
+	vmmc-supply = <&reg_vcc3v0>;
+	bus-width = <8>;
+	non-removable;
+	cap-mmc-hw-reset;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.13.2

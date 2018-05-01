Return-Path: <wens@wens.csie.org>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH net-next v2 11/15] ARM: dts: sun8i: r40: bananapi-m2-ultra: Sort device node dereferences
Date: Wed,  2 May 2018 00:12:23 +0800
Message-Id: <20180501161227.2110-12-wens@csie.org>
In-Reply-To: <20180501161227.2110-1-wens@csie.org>
References: <20180501161227.2110-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

The device nodes dereference (&foo) usages should be sorted by the label
names, barring any parsing order issues such as the #include statement
for the PMIC's .dtsi file that must come after the PMIC.

Move the mmc and ohci blocks in front of the PMIC's regulator blocks.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 .../boot/dts/sun8i-r40-bananapi-m2-ultra.dts  | 69 ++++++++++---------
 1 file changed, 35 insertions(+), 34 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
index 27d9ccd0ef2f..c6da21e43572 100644
--- a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
+++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
@@ -114,6 +114,41 @@
 
 #include "axp22x.dtsi"
 
+&mmc0 {
+	vmmc-supply = <&reg_dcdc1>;
+	bus-width = <4>;
+	cd-gpios = <&pio 7 13 GPIO_ACTIVE_HIGH>; /* PH13 */
+	cd-inverted;
+	status = "okay";
+};
+
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pg_pins>;
+	vmmc-supply = <&reg_dldo2>;
+	vqmmc-supply = <&reg_dldo1>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	bus-width = <4>;
+	non-removable;
+	status = "okay";
+};
+
+&mmc2 {
+	vmmc-supply = <&reg_dcdc1>;
+	vqmmc-supply = <&reg_dcdc1>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&ohci2 {
+	status = "okay";
+};
+
 &reg_aldo3 {
 	regulator-always-on;
 	regulator-min-microvolt = <2700000>;
@@ -161,40 +196,6 @@
 	regulator-name = "vcc-wifi";
 };
 
-&mmc0 {
-	vmmc-supply = <&reg_dcdc1>;
-	bus-width = <4>;
-	cd-gpios = <&pio 7 13 GPIO_ACTIVE_LOW>; /* PH13 */
-	status = "okay";
-};
-
-&mmc1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mmc1_pg_pins>;
-	vmmc-supply = <&reg_dldo2>;
-	vqmmc-supply = <&reg_dldo1>;
-	mmc-pwrseq = <&wifi_pwrseq>;
-	bus-width = <4>;
-	non-removable;
-	status = "okay";
-};
-
-&mmc2 {
-	vmmc-supply = <&reg_dcdc1>;
-	vqmmc-supply = <&reg_dcdc1>;
-	bus-width = <8>;
-	non-removable;
-	status = "okay";
-};
-
-&ohci1 {
-	status = "okay";
-};
-
-&ohci2 {
-	status = "okay";
-};
-
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pb_pins>;
-- 
2.17.0

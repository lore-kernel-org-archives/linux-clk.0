Return-Path: <wens@wens.csie.org>
From: Chen-Yu Tsai <wens@csie.org>
To: Mark Brown <broonie@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	rtc-linux@googlegroups.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 09/10] ARM: dts: sun9i: a80-optimus: Order nodes by alphabetical order
Date: Tue, 14 Jun 2016 10:17:57 +0800
Message-Id: <1465870678-30128-11-git-send-email-wens@csie.org>
In-Reply-To: <1465870678-30128-1-git-send-email-wens@csie.org>
References: <1465870678-30128-1-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

Move the mmc nodes above the ohci nodes for proper ordering by name.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun9i-a80-optimus.dts | 50 ++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/sun9i-a80-optimus.dts b/arch/arm/boot/dts/sun9i-a80-optimus.dts
index 24ef8e65a975..3b013dc5fef1 100644
--- a/arch/arm/boot/dts/sun9i-a80-optimus.dts
+++ b/arch/arm/boot/dts/sun9i-a80-optimus.dts
@@ -119,6 +119,31 @@
 	status = "okay";
 };
 
+&mmc0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_pins>, <&mmc0_cd_pin_optimus>;
+	vmmc-supply = <&reg_dcdc1>;
+	bus-width = <4>;
+	cd-gpios = <&pio 7 18 GPIO_ACTIVE_HIGH>; /* PH8 */
+	cd-inverted;
+	status = "okay";
+};
+
+&mmc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc2_8bit_pins>;
+	vmmc-supply = <&reg_dcdc1>;
+	bus-width = <8>;
+	non-removable;
+	cap-mmc-hw-reset;
+	status = "okay";
+};
+
+&mmc2_8bit_pins {
+	/* Increase drive strength for DDR modes */
+	allwinner,drive = <SUN4I_PINCTRL_40_MA>;
+};
+
 &ohci0 {
 	status = "okay";
 };
@@ -157,31 +182,6 @@
 	};
 };
 
-&mmc0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mmc0_pins>, <&mmc0_cd_pin_optimus>;
-	vmmc-supply = <&reg_dcdc1>;
-	bus-width = <4>;
-	cd-gpios = <&pio 7 18 GPIO_ACTIVE_HIGH>; /* PH8 */
-	cd-inverted;
-	status = "okay";
-};
-
-&mmc2 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mmc2_8bit_pins>;
-	vmmc-supply = <&reg_dcdc1>;
-	bus-width = <8>;
-	non-removable;
-	cap-mmc-hw-reset;
-	status = "okay";
-};
-
-&mmc2_8bit_pins {
-	/* Increase drive strength for DDR modes */
-	allwinner,drive = <SUN4I_PINCTRL_40_MA>;
-};
-
 &r_ir {
 	status = "okay";
 };
-- 
2.8.1

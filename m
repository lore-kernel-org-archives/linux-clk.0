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
Subject: [PATCH 13/14] ARM: dts: sun8i: enable mmc for H8Homlet Board.
Date: Sun, 31 Jan 2016 09:21:05 +0800
Message-Id: <1454203266-4450-14-git-send-email-vishnupatekar0510@gmail.com>
In-Reply-To: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

This enables mmc0.

Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
Tested-by: LABBE Corentin <clabbe.montjoie@gmail.com>
---
 .../boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts    | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts b/arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts
index 342e1d3..6c1f598 100644
--- a/arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts
+++ b/arch/arm/boot/dts/sun8i-a83t-allwinner-h8homlet-v2.dts
@@ -43,6 +43,7 @@
 
 /dts-v1/;
 #include "sun8i-a83t.dtsi"
+#include "sunxi-common-regulators.dtsi"
 
 / {
 	model = "Allwinner A83T H8Homlet Proto Dev Board v2.0";
@@ -57,6 +58,25 @@
 	};
 };
 
+&pio {
+	mmc0_cd_pin_h8homlet: mmc0_cd_pin@0 {
+		allwinner,pins = "PF6";
+		allwinner,function = "gpio_in";
+		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+		allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+	};
+};
+
+&mmc0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_pins_a>, <&mmc0_cd_pin_h8homlet>;
+	vmmc-supply = <&reg_vcc3v0>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
+	bus-width = <4>;
+	cd-inverted;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins_b>;
-- 
1.9.1

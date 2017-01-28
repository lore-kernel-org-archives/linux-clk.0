Return-Path: <wens@wens.csie.org>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH v2 08/10] ARM: dts: sun8i-a23-q8-tablet: Drop pinmux setting for codec PA gpio
Date: Sat, 28 Jan 2017 20:22:37 +0800
Message-Id: <20170128122239.4480-9-wens@csie.org>
In-Reply-To: <20170128122239.4480-1-wens@csie.org>
References: <20170128122239.4480-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

The old sunxi specific pinctrl bindings are deprecated, in favor of
the new generic pinconf bindings. Also, we are moving towards handling
GPIO pinmux settings that don't require extra bias or drive strength
settings to use the GPIO bindings only.

This patch removes the last instance of the sunxi specific pinctrl
bindings that use the pinctrl header by dropping the pinmux setting
for the audio codec's PA (external amplifier) control GPIO. The pin
is pulled down externally.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun8i-a23-q8-tablet.dts | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-a23-q8-tablet.dts b/arch/arm/boot/dts/sun8i-a23-q8-tablet.dts
index 3ab5c0c09d93..b6958e8f2f01 100644
--- a/arch/arm/boot/dts/sun8i-a23-q8-tablet.dts
+++ b/arch/arm/boot/dts/sun8i-a23-q8-tablet.dts
@@ -50,7 +50,6 @@
 };
 
 &codec {
-	pinctrl-0 = <&codec_pa_pin>;
 	allwinner,pa-gpios = <&pio 7 9 GPIO_ACTIVE_HIGH>; /* PH9 */
 	allwinner,audio-routing =
 		"Headphone", "HP",
@@ -62,12 +61,3 @@
 		"Headset Mic", "HBIAS";
 	status = "okay";
 };
-
-&pio {
-	codec_pa_pin: codec_pa_pin@0 {
-		allwinner,pins = "PH9";
-		allwinner,function = "gpio_out";
-		allwinner,drive = <SUN4I_PINCTRL_10_MA>;
-		allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
-	};
-};
-- 
2.11.0

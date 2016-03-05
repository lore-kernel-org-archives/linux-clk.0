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
Subject: [PATCH v3 10/13] ARM: dts: sun8i-a83t: add mmc0 CD pin
Date: Sat,  5 Mar 2016 23:43:03 +0800
Message-Id: <1457192586-25596-11-git-send-email-vishnupatekar0510@gmail.com>
In-Reply-To: <1457192586-25596-1-git-send-email-vishnupatekar0510@gmail.com>
References: <1457192586-25596-1-git-send-email-vishnupatekar0510@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

A83T Boards BPI-m3 and Allwinner H8Homletv2 boards use PF6 as
Card Detect pin., so use PF6 as reference design CD pin in dtsi.

Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 7b02d85..c64d8d6 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -390,6 +390,13 @@
 				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
 			};
 
+			mmc0_cd_pin_reference_design: mmc0_cd_pin@0 {
+				allwinner,pins = "PF6";
+				allwinner,function = "gpio_in";
+				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
+				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
+			};
+
 			uart0_pins_a: uart0@0 {
 				allwinner,pins = "PF2", "PF4";
 				allwinner,function = "uart0";
-- 
1.9.1

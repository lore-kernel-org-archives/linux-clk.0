Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Florian Fainelli <f.fainelli@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	dri-devel@lists.freedesktop.org,
	Thierry Reding <thierry.reding@gmail.com>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stephen Warren <swarren@wwwdotorg.org>,
	Lee Jones <lee@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-clk@vger.kernel.org,
	Eric Anholt <eric@anholt.net>
Subject: [PATCH 11/11] ARM: bcm2835: Enable the Raspberry Pi touchscreen panel.
Date: Wed, 14 Dec 2016 11:46:21 -0800
Message-Id: <20161214194621.16499-12-eric@anholt.net>
In-Reply-To: <20161214194621.16499-1-eric@anholt.net>
References: <20161214194621.16499-1-eric@anholt.net>
List-ID: <linux-clk.vger.kernel.org>

This commit is not intended to be merged.  Instead we will use
overlays to enable the panel, and this commit is just a demo of how
things get wired up.

Signed-off-by: Eric Anholt <eric@anholt.net>
---
 arch/arm/boot/dts/bcm283x.dtsi | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/bcm283x.dtsi b/arch/arm/boot/dts/bcm283x.dtsi
index 82a4eccfb3d8..e96d0f29759a 100644
--- a/arch/arm/boot/dts/bcm283x.dtsi
+++ b/arch/arm/boot/dts/bcm283x.dtsi
@@ -286,7 +286,12 @@
 					     "dsi1_ddr2",
 					     "dsi1_ddr";
 
-			status = "disabled";
+			pitouchscreen: panel@0 {
+				compatible = "raspberrypi,touchscreen";
+				reg = <0>;
+
+				raspberrypi,touchscreen-bridge = <&pitouchscreen_bridge>;
+			};
 		};
 
 		i2c1: i2c@7e804000 {
@@ -346,6 +351,29 @@
 		vc4: gpu {
 			compatible = "brcm,bcm2835-vc4";
 		};
+
+		i2c_dsi: i2c {
+			/* We have to use i2c-gpio because the
+			 * firmware is also polling another device
+			 * using the only hardware I2C bus that could
+			 * connect to these pins.
+			 */
+			compatible = "i2c-gpio";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			gpios = <&gpio 28 0
+				 &gpio 29 0>;
+
+			pitouchscreen_bridge: bridge@45 {
+				compatible = "raspberrypi,touchscreen-bridge-i2c";
+				reg = <0x45>;
+			};
+
+			pitouchscreen_touch: bridge@38 {
+				compatible = "raspberrypi,touchscreen-ts-i2c";
+				reg = <0x38>;
+			};
+		};
 	};
 
 	clocks {
-- 
2.11.0

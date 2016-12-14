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
Subject: [PATCH 08/11] dt-bindings: Document the Raspberry Pi Touchscreen nodes.
Date: Wed, 14 Dec 2016 11:46:18 -0800
Message-Id: <20161214194621.16499-9-eric@anholt.net>
In-Reply-To: <20161214194621.16499-1-eric@anholt.net>
References: <20161214194621.16499-1-eric@anholt.net>
List-ID: <linux-clk.vger.kernel.org>

This doesn't yet cover input, but the driver does get the display
working when the firmware is disabled from talking to our I2C lines.

Signed-off-by: Eric Anholt <eric@anholt.net>
---
 .../display/panel/raspberrypi,touchscreen.txt      | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/raspberrypi,touchscreen.txt

diff --git a/Documentation/devicetree/bindings/display/panel/raspberrypi,touchscreen.txt b/Documentation/devicetree/bindings/display/panel/raspberrypi,touchscreen.txt
new file mode 100644
index 000000000000..fd328c52706b
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/raspberrypi,touchscreen.txt
@@ -0,0 +1,45 @@
+This binding covers the official 7" (800x480) Raspberry Pi touchscreen
+panel.
+
+This DSI panel contains:
+
+- TC358762 DSI->DPI bridge
+- Atmel microcontroller on I2C for power sequencing the DSI bridge and
+  controlling backlight
+- Touchscreen controller on I2C for touch input
+
+and the binding currently covers the DSI display parts but not its
+touch input.
+
+Required properties:
+- compatible:	Must be "raspberrypi,touchscreen"
+- raspberrypi,touchscreen-bridge:
+		Handle to the I2C device for Atmel microcontroller
+
+Example:
+
+dsi1: dsi@7e700000 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	<...>
+
+	pitouchscreen: panel@0 {
+		compatible = "raspberrypi,touchscreen";
+		reg = <0>;
+
+		raspberrypi,touchscreen-bridge = <&pitouchscreen_bridge>;
+	};
+};
+
+i2c_dsi: i2c {
+	compatible = "i2c-gpio";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	gpios = <&gpio 28 0
+		 &gpio 29 0>;
+
+	pitouchscreen_bridge: bridge@45 {
+		compatible = "raspberrypi,touchscreen-bridge-i2c";
+		reg = <0x45>;
+	};
+};
-- 
2.11.0

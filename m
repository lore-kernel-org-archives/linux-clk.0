Return-Path: <anholt@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Florian Fainelli <f.fainelli@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stephen Warren <swarren@wwwdotorg.org>,
	Lee Jones <lee@kernel.org>,
	bcm-kernel-feedback-list@broadcom.com,
	linux-clk@vger.kernel.org,
	Eric Anholt <eric@anholt.net>
Subject: [PATCH 1/2] dt-bindings: Document the VC4 DSI module nodes.
Date: Mon, 23 Jan 2017 16:38:52 -0800
Message-Id: <20170124003853.16418-2-eric@anholt.net>
In-Reply-To: <20170124003853.16418-1-eric@anholt.net>
References: <20170124003853.16418-1-eric@anholt.net>
List-ID: <linux-clk.vger.kernel.org>

These are part of the vc4 display pipeline.

Signed-off-by: Eric Anholt <eric@anholt.net>
---
 .../devicetree/bindings/display/brcm,bcm-vc4.txt   | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt b/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
index e2768703ac2b..34c7fddcea39 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
+++ b/Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
@@ -56,6 +56,18 @@ Required properties for V3D:
 - interrupts:	The interrupt number
 		  See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
 
+Required properties for DSI:
+- compatible:	Should be "brcm,bcm2835-dsi0" or "brcm,bcm2835-dsi1"
+- reg:		Physical base address and length of the DSI block's registers
+- interrupts:	The interrupt number
+		  See bindings/interrupt-controller/brcm,bcm2835-armctrl-ic.txt
+- clocks:	a) phy: The DSI PLL clock feeding the DSI analog PHY
+		b) escape: The DSI ESC clock from CPRMAN
+		c) pixel: The DSI pixel clock from CPRMAN
+- clock-output-names:
+		The 3 clocks output from the DSI analog PHY: dsi[01]_byte,
+		dsi[01]_ddr2, and dsi[01]_ddr
+
 [1] Documentation/devicetree/bindings/media/video-interfaces.txt
 
 Example:
@@ -99,6 +111,29 @@ dpi: dpi@7e208000 {
 	};
 };
 
+dsi1: dsi@7e700000 {
+	compatible = "brcm,bcm2835-dsi1";
+	reg = <0x7e700000 0x8c>;
+	interrupts = <2 12>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	#clock-cells = <1>;
+
+	clocks = <&clocks BCM2835_PLLD_DSI1>,
+		 <&clocks BCM2835_CLOCK_DSI1E>,
+		 <&clocks BCM2835_CLOCK_DSI1P>;
+	clock-names = "phy", "escape", "pixel";
+
+	clock-output-names = "dsi1_byte", "dsi1_ddr2", "dsi1_ddr";
+
+	pitouchscreen: panel@0 {
+		compatible = "raspberrypi,touchscreen";
+		reg = <0>;
+
+		<...>
+	};
+};
+
 vec: vec@7e806000 {
 	compatible = "brcm,bcm2835-vec";
 	reg = <0x7e806000 0x1000>;
-- 
2.11.0

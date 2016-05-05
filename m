Return-Path: <kernel@martin.sperl.org>
From: kernel@martin.sperl.org
To: Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Stephen Warren <swarren@wwwdotorg.org>,
	Lee Jones <lee@kernel.org>,
	Eric Anholt <eric@anholt.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Cc: Martin Sperl <kernel@martin.sperl.org>
Subject: [PATCH 1/5] dt: bindings: add means to control flags of specific clocks
Date: Thu,  5 May 2016 15:53:24 +0000
Message-Id: <1462463608-22940-2-git-send-email-kernel@martin.sperl.org>
In-Reply-To: <1462463608-22940-1-git-send-email-kernel@martin.sperl.org>
References: <1462463608-22940-1-git-send-email-kernel@martin.sperl.org>
List-ID: <linux-clk.vger.kernel.org>

From: Martin Sperl <kernel@martin.sperl.org>

Add documentation for "brcm,clock-index" and "brcm,clock-flags"
which allows to set flags to enable the use of parent clocks
that may be different from the default.

In the future this may also contain flags that would allow
enabling higher order mash dividers.

Signed-off-by: Martin Sperl <kernel@martin.sperl.org>
---
 .../devicetree/bindings/clock/brcm,bcm2835-cprman.txt      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt b/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
index e56a1df..cbcca56 100644
--- a/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
+++ b/Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
@@ -18,6 +18,15 @@ Required properties:
 - reg:		Specifies base physical address and size of the registers
 - clocks:	The external oscillator clock phandle

+Optional properties:
+- brcm,clock-index: clock id to which the corresponding brcm,clock-flags
+		      value applies
+- brcm,clock-flags: flags for the specific clock id given in
+		      brcm,clock-index - the bits are defined in
+		      include/dt-bindings/clock/bcm2835.h
+		      of which the bottom 16 bits are reserved for
+		      parent clock selection.
+
 Example:

 	clk_osc: clock@3 {
@@ -33,7 +42,11 @@ Example:
 		#clock-cells = <1>;
 		reg = <0x7e101000 0x2000>;
 		clocks = <&clk_osc>;
+		/* the pcm clock should use the non-standard pllc-per parent */
+		brcm,clock-index = <BCM2835_CLOCK_PCM>;
+		brcm,clock-flags = <((1 <<BCM2835_PER_PARENT_GND)|
+				     (1 <<BCM2835_PER_PARENT_OSC)|
+				     (1 <<BCM2835_PER_PARENT_PLLC))>;
 	};

 	i2c0: i2c@7e205000 {
--
2.1.4

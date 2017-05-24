Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:33128 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933461AbdEXItM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 May 2017 04:49:12 -0400
Received: by mail-lf0-f46.google.com with SMTP id m18so63312389lfj.0
        for <linux-clk@vger.kernel.org>; Wed, 24 May 2017 01:49:11 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc: Janos Laube <janos.dev@gmail.com>,
        Paulius Zaleckas <paulius.zaleckas@gmail.com>,
        linux-clk@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/3 v4] ARM: dts: Add clocks to the Gemini SoC
Date: Wed, 24 May 2017 10:49:02 +0200
Message-Id: <20170524084902.24972-1-linus.walleij@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

We have a clock controller for the Gemini SoC, so make use of the
driver and add clocks to the peripherals. Remove the hard-coded
frequency from the UART and add switch the timer compatible to the
generic that uses the clock framework for clock speed look-up.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v4:
- Use numerical values rather than macros and plan for a patch
  post-rc1 to switch to the macro definitions.
ChangeLog v2->v3:
- No special compatible on the system controller to indicate
  that it is a clock controller.
ChangeLog v1->v2:
- Reference clocks directly from the syscon (subnode needed)
---
 arch/arm/boot/dts/gemini.dtsi | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/gemini.dtsi b/arch/arm/boot/dts/gemini.dtsi
index dadc8412243e..80abf84f8a80 100644
--- a/arch/arm/boot/dts/gemini.dtsi
+++ b/arch/arm/boot/dts/gemini.dtsi
@@ -28,6 +28,7 @@
 			compatible = "cortina,gemini-syscon",
 				     "syscon", "simple-mfd";
 			reg = <0x40000000 0x1000>;
+			#clock-cells = <1>;
 			#reset-cells = <1>;
 
 			syscon-reboot {
@@ -45,25 +46,29 @@
 			reg = <0x41000000 0x1000>;
 			interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&syscon 23>;
+			clocks = <&syscon 2>;
 		};
 
 		uart0: serial@42000000 {
 			compatible = "ns16550a";
 			reg = <0x42000000 0x100>;
 			resets = <&syscon 18>;
-			clock-frequency = <48000000>;
+			clocks = <&syscon 6>;
 			interrupts = <18 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 		};
 
 		timer@43000000 {
-			compatible = "cortina,gemini-timer";
+			compatible = "faraday,fttmr010";
 			reg = <0x43000000 0x1000>;
 			interrupt-parent = <&intcon>;
 			interrupts = <14 IRQ_TYPE_EDGE_FALLING>, /* Timer 1 */
 				     <15 IRQ_TYPE_EDGE_FALLING>, /* Timer 2 */
 				     <16 IRQ_TYPE_EDGE_FALLING>; /* Timer 3 */
 			resets = <&syscon 17>;
+			/* APB clock or RTC clock */
+			clocks = <&syscon 2>, <&syscon 0>;
+			clock-names = "PCLK", "EXTCLK";
 			syscon = <&syscon>;
 		};
 
@@ -72,6 +77,8 @@
 			reg = <0x45000000 0x100>;
 			interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&syscon 16>;
+			clocks = <&syscon 2>, <&syscon 0>;
+			clock-names = "PCLK", "EXTCLK";
 		};
 
 		intcon: interrupt-controller@48000000 {
@@ -93,6 +100,7 @@
 			reg = <0x4d000000 0x100>;
 			interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&syscon 20>;
+			clocks = <&syscon 2>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
@@ -104,6 +112,7 @@
 			reg = <0x4e000000 0x100>;
 			interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&syscon 21>;
+			clocks = <&syscon 2>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
@@ -115,6 +124,7 @@
 			reg = <0x4f000000 0x100>;
 			interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&syscon 22>;
+			clocks = <&syscon 2>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
@@ -129,6 +139,8 @@
 			 */
 			reg = <0x50000000 0x100>;
 			resets = <&syscon 7>;
+			clocks = <&syscon 15>, <&syscon 4>;
+			clock-names = "PCLK", "PCICLK";
 			#address-cells = <3>;
 			#size-cells = <2>;
 			#interrupt-cells = <1>;
-- 
2.9.4


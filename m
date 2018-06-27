Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp07.smtpout.orange.fr ([80.12.242.129]:60395 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965529AbeF0PCH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Jun 2018 11:02:07 -0400
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 2/2] ARM: dts: pxa: fix the rtc controller
Date: Wed, 27 Jun 2018 17:01:50 +0200
Message-Id: <20180627150150.23951-2-robert.jarzmik@free.fr>
In-Reply-To: <20180627150150.23951-1-robert.jarzmik@free.fr>
References: <20180627150150.23951-1-robert.jarzmik@free.fr>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The RTC controller is fed by an external fixed 32kHz clock. Yet the
driver wants to acquire this clock, even though it doesn't make any use
of it, ie. doesn't get the rate to make calculation.

Therefore, use the exported 32.768kHz clock in the PXA clock tree to
make the driver happy and working.

Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
---
Since v1: change the dummy clock by the actual 32.768kHz
---
 arch/arm/boot/dts/pxa25x.dtsi | 4 ++++
 arch/arm/boot/dts/pxa27x.dtsi | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/pxa25x.dtsi b/arch/arm/boot/dts/pxa25x.dtsi
index 95d59be97213..78a413ea0e88 100644
--- a/arch/arm/boot/dts/pxa25x.dtsi
+++ b/arch/arm/boot/dts/pxa25x.dtsi
@@ -80,6 +80,10 @@
 			#pwm-cells = <1>;
 			clocks = <&clks CLK_PWM1>;
 		};
+
+		rtc@40900000 {
+			clocks = <&clks CLK_OSC32k768>>;
+		};
 	};
 
 	timer@40a00000 {
diff --git a/arch/arm/boot/dts/pxa27x.dtsi b/arch/arm/boot/dts/pxa27x.dtsi
index 747f750f675d..2ab6986433c8 100644
--- a/arch/arm/boot/dts/pxa27x.dtsi
+++ b/arch/arm/boot/dts/pxa27x.dtsi
@@ -113,6 +113,10 @@
 
 			status = "disabled";
 		};
+
+		rtc@40900000 {
+			clocks = <&clks CLK_OSC32k768>;
+		};
 	};
 
 	clocks {
-- 
2.11.0


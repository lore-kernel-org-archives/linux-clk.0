Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:42679 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752931AbdDHSxU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 8 Apr 2017 14:53:20 -0400
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Quentin Schulz <quentin.schulz@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 5/5] ARM: sun8i: h2+: add SY8113B regulator used by Orange Pi Zero board
Date: Sun,  9 Apr 2017 02:50:25 +0800
Message-Id: <20170408185025.53841-6-icenowy@aosc.io>
In-Reply-To: <20170408185025.53841-1-icenowy@aosc.io>
References: <20170408185025.53841-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Orange Pi Zero board has a SY8113B regulator, which is controlled via
GPIO and capable of outputing 1.1V when the PL6 GPIO is set to output 0
or 1.3V when the PL6 GPIO is set to input or output 1, and the output is
the power supply of the ARM cores in H2+ SoC.

Add the device tree node of this regulator and set the cpu's cpu-supply
property to it.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
index 9e8b082c134f..8f6acca7d12d 100644
--- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
@@ -93,6 +93,27 @@
 		reset-gpios = <&r_pio 0 7 GPIO_ACTIVE_LOW>;
 		post-power-on-delay-ms = <200>;
 	};
+
+	reg_sy8113b: gpio-regulator {
+		compatible = "regulator-gpio";
+
+		regulator-name = "vdd-cpux";
+		regulator-type = "voltage";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1300000>;
+		regulator-ramp-delay = <50>; /* 4ms */
+
+		gpios = <&r_pio 0 6 GPIO_ACTIVE_HIGH>; /* PL6 */
+		gpios-states = <0x1>;
+		states = <1100000 0x0
+			  1300000 0x1>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_sy8113b>;
 };
 
 &ehci0 {
-- 
2.12.2


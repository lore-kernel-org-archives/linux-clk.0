Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:42652 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752109AbdDHSwz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 8 Apr 2017 14:52:55 -0400
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Quentin Schulz <quentin.schulz@free-electrons.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-sunxi@googlegroups.com, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 4/5] ARM: sun8i: h3: add operating-points-v2 table for CPU
Date: Sun,  9 Apr 2017 02:50:24 +0800
Message-Id: <20170408185025.53841-5-icenowy@aosc.io>
In-Reply-To: <20170408185025.53841-1-icenowy@aosc.io>
References: <20170408185025.53841-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The CPU on Allwinner H3 can do dynamic frequency scaling.

Add a DVFS table based on the one tweaked by Armbian developers, which
are proven to work stably on BSP kernels.

Frequencies higher than 1008MHz are temporarily dropped in the table, as
they may lead to over voltage on boards without proper regulator
settings or over temperature on boards with proper regulator settings.
They will be added back once regulator settings are ready and thermal
sensor driver is merged.

In order to satisfy all different regulators (SY8106A which is 50mV per
level, SY8113B which have two states: 1.1V and 1.3V, and some board with
non-tweakable regulators), all the OPPs are defined with a range which has
the target value as the minimum allowed value, and 1.3V (the highest
VDD-CPUX voltage suggested by the datasheet) as the maximum allowed value.
It's proven to work well with a board with SY8113B.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 arch/arm/boot/dts/sun8i-h3.dtsi | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
index b36f9f423c39..a0cee17fe44b 100644
--- a/arch/arm/boot/dts/sun8i-h3.dtsi
+++ b/arch/arm/boot/dts/sun8i-h3.dtsi
@@ -43,32 +43,68 @@
 #include "sunxi-h3-h5.dtsi"
 
 / {
+	cpu0_opp_table: opp_table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp@480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			opp-microvolt = <980000 980000 1300000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp@648000000 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-microvolt = <1020000 1020000 1300000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp@912000000 {
+			opp-hz = /bits/ 64 <960000000>;
+			opp-microvolt = <1080000 1080000 1300000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp@1008000000 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-microvolt = <1140000 1140000 1300000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-		cpu@0 {
+		cpu0: cpu@0 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <0>;
+			clocks = <&ccu CLK_CPUX>;
+			clock-names = "cpu";
+			operating-points-v2 = <&cpu0_opp_table>;
+			#cooling-cells = <0x2>;
 		};
 
 		cpu@1 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <1>;
+			operating-points-v2 = <&cpu0_opp_table>;
 		};
 
 		cpu@2 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <2>;
+			operating-points-v2 = <&cpu0_opp_table>;
 		};
 
 		cpu@3 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <3>;
+			operating-points-v2 = <&cpu0_opp_table>;
 		};
 	};
 
-- 
2.12.2


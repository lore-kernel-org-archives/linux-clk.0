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
Subject: [PATCH v4 07/13] ARM: dts: sun8i-a83t: Add PRCM related clocks and resets
Date: Thu, 17 Mar 2016 00:04:30 +0800
Message-Id: <1458144276-31108-8-git-send-email-vishnupatekar0510@gmail.com>
In-Reply-To: <1458144276-31108-1-git-send-email-vishnupatekar0510@gmail.com>
References: <1458144276-31108-1-git-send-email-vishnupatekar0510@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

This adds A83T PRCM related clocks, clock resets.

As a83t apb0 gates clock support is added earlier, this enables it.
Apart from apb0 gates, other added clocks are compatible with
earlier sun8i socs.

Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
Acked-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 44 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index a44d4dc..691bbf1 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -267,6 +267,44 @@
 					     "mmc2_output",
 					     "mmc2_sample";
 		};
+
+		cpus_clk: clk@01f01400 {
+			compatible = "allwinner,sun9i-a80-cpus-clk";
+			reg = <0x01f01400 0x4>;
+			#clock-cells = <0>;
+			clocks = <&osc16Md512>, <&osc24M>, <&pll6>, <&osc16M>;
+			clock-output-names = "cpus";
+		};
+
+		ahb0: ahb0_clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+			clock-div = <1>;
+			clock-mult = <1>;
+			clocks = <&cpus_clk>;
+			clock-output-names = "ahb0";
+		};
+
+		apb0: clk@01f0140c {
+			compatible = "allwinner,sun8i-a23-apb0-clk";
+			reg = <0x01f0140c 0x4>;
+			#clock-cells = <0>;
+			clocks = <&ahb0>;
+			clock-output-names = "apb0";
+		};
+
+		apb0_gates: clk@01f01428 {
+			compatible = "allwinner,sun8i-a83t-apb0-gates-clk";
+			reg = <0x01f01428 0x4>;
+			#clock-cells = <1>;
+			clocks = <&apb0>;
+			clock-indices = <0>, <1>,
+					<2>, <3>,
+					<4>, <6>, <7>;
+			clock-output-names = "apb0_pio", "apb0_ir",
+					"apb0_timer", "apb0_rsb",
+					"apb0_uart", "apb0_i2c0", "apb0_twd";
+		};
 	};
 
 	soc {
@@ -421,5 +459,11 @@
 			#interrupt-cells = <3>;
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
+
+		apb0_reset: reset@01f014b0 {
+			reg = <0x01f014b0 0x4>;
+			compatible = "allwinner,sun6i-a31-clock-reset";
+			#reset-cells = <1>;
+		};
 	};
 };
-- 
1.9.1

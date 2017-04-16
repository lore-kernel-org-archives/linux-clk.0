Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:33218 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756149AbdDPQ6X (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 16 Apr 2017 12:58:23 -0400
From: Marek Vasut <marek.vasut@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 2/2] ARM: dts: r8a7791: Add GyroADC bindings
Date: Sun, 16 Apr 2017 18:57:09 +0200
Message-Id: <20170416165709.27449-2-marek.vasut+renesas@gmail.com>
In-Reply-To: <20170416165709.27449-1-marek.vasut+renesas@gmail.com>
References: <20170416165709.27449-1-marek.vasut+renesas@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add bindings for the GyroADC block and it's associated clock.

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms+renesas@verge.net.au>
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm/boot/dts/r8a7791.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 4d0c2ce59900..1b099dbc9eef 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -776,6 +776,15 @@
 		status = "disabled";
 	};
 
+	adc: adc@e6e54000 {
+		compatible = "renesas,r8a7791-gyroadc", "renesas,rcar-gyroadc";
+		reg = <0 0xe6e54000 0 64>;
+		clocks = <&mstp9_clks R8A7791_CLK_GYROADC>, <&adc_clk>;
+		clock-names = "fck", "if";
+		power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
+		status = "disabled";
+	};
+
 	scif2: serial@e6e58000 {
 		compatible = "renesas,scif-r8a7791", "renesas,rcar-gen2-scif",
 			     "renesas,scif";
@@ -1133,6 +1142,13 @@
 			clock-frequency = <0>;
 		};
 
+		/* GyroADC clock */
+		adc_clk: adc_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <65000000>;
+		};
+
 		/* Special CPG clocks */
 		cpg_clocks: cpg_clocks@e6150000 {
 			compatible = "renesas,r8a7791-cpg-clocks",
@@ -1432,6 +1448,7 @@
 				 <&hp_clk>, <&hp_clk>;
 			#clock-cells = <1>;
 			clock-indices = <
+				R8A7791_CLK_GYROADC
 				R8A7791_CLK_GPIO7 R8A7791_CLK_GPIO6 R8A7791_CLK_GPIO5 R8A7791_CLK_GPIO4
 				R8A7791_CLK_GPIO3 R8A7791_CLK_GPIO2 R8A7791_CLK_GPIO1 R8A7791_CLK_GPIO0
 				R8A7791_CLK_RCAN1 R8A7791_CLK_RCAN0 R8A7791_CLK_QSPI_MOD R8A7791_CLK_I2C5
@@ -1439,6 +1456,7 @@
 				R8A7791_CLK_I2C1 R8A7791_CLK_I2C0
 			>;
 			clock-output-names =
+				"gyroadc",
 				"gpio7", "gpio6", "gpio5", "gpio4", "gpio3", "gpio2", "gpio1", "gpio0",
 				"rcan1", "rcan0", "qspi_mod", "i2c5", "i2c6", "i2c4", "i2c3", "i2c2",
 				"i2c1", "i2c0";
-- 
2.11.0


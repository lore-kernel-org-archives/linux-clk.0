Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:50832 "EHLO
	albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752915AbcHLQi5 (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 12 Aug 2016 12:38:57 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-spi@vger.kernel.org, linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/PROTO 4/9 common] arm64: dts: salvator-x: Add dummy MSIOF SPI slave devices
Date: Fri, 12 Aug 2016 18:38:40 +0200
Message-Id: <1471019925-29083-5-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1471019925-29083-1-git-send-email-geert+renesas@glider.be>
References: <1471019925-29083-1-git-send-email-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Declares three SPI slave devices on three different MSIOF instances:
  - high-speed (30 MHz),
  - medium-speed (1 MHz),
  - low-speed (20 kHz).

The maximum frequencies are chosen such that the optimal parent clock
frequency for the high-speed device is outside of the allowed range for
the low-speed device.

Reorder the devices by changing the "&msiofX" references to investigate
different probe order.

Not-Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 4ef4a712671b2579..9040a691b8b61887 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -45,6 +45,10 @@
 		serial2 = &scif3;
 		serial3 = &hscif3;
 		ethernet0 = &avb;
+		spi0 = &msiof0;
+		spi1 = &msiof1;
+		spi2 = &msiof2;
+		spi3 = &msiof3;
 	};
 
 	chosen {
@@ -182,6 +186,24 @@
 		function = "avb";
 	};
 
+	msiof0_pins: msiof0 {
+		groups = "msiof0_clk", "msiof0_sync", "msiof0_rxd",
+			 "msiof0_txd";
+		function = "msiof0";
+	};
+
+	msiof2_pins: msiof2 {
+		groups = "msiof2_clk_b", "msiof2_sync_b", "msiof2_rxd_b",
+			 "msiof2_txd_b";
+		function = "msiof2";
+	};
+
+	msiof3_pins: msiof3 {
+		groups = "msiof3_clk_a", "msiof3_sync_a", "msiof3_rxd_a",
+			 "msiof3_txd_a";
+		function = "msiof3";
+	};
+
 	sdhi0_pins: sd0 {
 		groups = "sdhi0_data4", "sdhi0_ctrl";
 		function = "sdhi0";
@@ -455,3 +477,55 @@
 &pciec1 {
 	status = "okay";
 };
+
+/* Dummy high-speed SPI slave device */
+&msiof0 {
+	pinctrl-0 = <&msiof0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		//compatible = "spidev";
+		reg = <0>;
+
+		spi-max-frequency = <30000000>;
+	};
+};
+
+/* Dummy medium-speed SPI slave device */
+&msiof2 {
+	pinctrl-0 = <&msiof2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	spidev@0 {
+		//compatible = "jedec,spi-nor";
+		compatible = "spidev";
+		reg = <0>;
+
+		spi-max-frequency = <1000000>;
+	};
+};
+
+/* Dummy low-speed SPI slave device */
+&msiof3 {
+	pinctrl-0 = <&msiof3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	gpio@0 {
+		compatible = "fairchild,74hc595";
+		//compatible = "jedec,spi-nor";
+		//compatible = "spidev";
+		reg = <0>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+		registers-number = <2>;
+		spi-max-frequency = <20000>;
+	};
+};
-- 
1.9.1


Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kmu-office.ch ([178.209.48.109]:39913 "EHLO
        mail.kmu-office.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752009AbeB0QFu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Feb 2018 11:05:50 -0500
From: Stefan Agner <stefan@agner.ch>
To: shawnguo@kernel.org, kernel@pengutronix.de
Cc: fabio.estevam@nxp.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Stefan Agner <stefan@agner.ch>
Subject: [PATCH 2/2] ARM: dts: imx7s: add Keypad Port module
Date: Tue, 27 Feb 2018 17:05:44 +0100
Message-Id: <20180227160544.11446-2-stefan@agner.ch>
In-Reply-To: <20180227160544.11446-1-stefan@agner.ch>
References: <20180227160544.11446-1-stefan@agner.ch>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add the Keypad Port module. Add it disabled by default since
only some boards use it. Boards which do need to specify
additional properties as documented in the device tree bindings.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/imx7s.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index 097b066ed23c..46400ba2217a 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -499,6 +499,14 @@
 				status = "disabled";
 			};
 
+			kpp: kpp@30320000 {
+				compatible = "fsl,imx7d-kpp", "fsl,imx21-kpp";
+				reg = <0x30320000 0x10000>;
+				interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX7D_KPP_ROOT_CLK>;
+				status = "disabled";
+			};
+
 			iomuxc: iomuxc@30330000 {
 				compatible = "fsl,imx7d-iomuxc";
 				reg = <0x30330000 0x10000>;
-- 
2.16.2


Return-Path: <vz@mleia.com>
From: Vladimir Zapolskiy <vz@mleia.com>
To: Rob Herring <robh+dt@kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@arm.linux.org.uk>,
	Roland Stigge <stigge@antcom.de>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 07/11] arm: dts: lpc32xx: add USB clock controller
Date: Fri, 20 Nov 2015 03:05:07 +0200
Message-Id: <1447981511-29653-8-git-send-email-vz@mleia.com>
In-Reply-To: <1447981511-29653-1-git-send-email-vz@mleia.com>
References: <1447981511-29653-1-git-send-email-vz@mleia.com>
List-ID: <linux-clk.vger.kernel.org>

The change adds device node of LPC32xx USB clock controller and adds
clock properties to USB OHCI, USB device and I2C controller to USB phy
device nodes.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/lpc32xx.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/lpc32xx.dtsi b/arch/arm/boot/dts/lpc32xx.dtsi
index 792468e..68bf011 100644
--- a/arch/arm/boot/dts/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/lpc32xx.dtsi
@@ -92,6 +92,7 @@
 				compatible = "nxp,ohci-nxp", "usb-ohci";
 				reg = <0x0 0x300>;
 				interrupts = <0x3b 0>;
+				clocks = <&usbclk LPC32XX_USB_CLK_HOST>;
 				status = "disabled";
 			};
 
@@ -99,6 +100,7 @@
 				compatible = "nxp,lpc3220-udc";
 				reg = <0x0 0x300>;
 				interrupts = <0x3d 0>, <0x3e 0>, <0x3c 0>, <0x3a 0>;
+				clocks = <&usbclk LPC32XX_USB_CLK_DEVICE>;
 				status = "disabled";
 			};
 
@@ -106,10 +108,17 @@
 				compatible = "nxp,pnx-i2c";
 				reg = <0x300 0x100>;
 				interrupts = <0x3f 0>;
+				clocks = <&usbclk LPC32XX_USB_CLK_I2C>;
 				#address-cells = <1>;
 				#size-cells = <0>;
 				pnx,timeout = <0x64>;
 			};
+
+			usbclk: clock-controller@F00 {
+				compatible = "nxp,lpc3220-usb-clk";
+				reg = <0xF00 0x100>;
+				#clock-cells = <1>;
+			};
 		};
 
 		clcd: clcd@31040000 {
-- 
2.1.4

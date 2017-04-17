Return-Path: <thomas.petazzoni@free-electrons.com>
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: arm-soc <arm@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH v2 1/7] arm: spear6xx: add labels to various nodes in spear600.dtsi
Date: Mon, 17 Apr 2017 14:46:39 +0200
Message-Id: <1492433205-13376-2-git-send-email-thomas.petazzoni@free-electrons.com>
In-Reply-To: <1492433205-13376-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1492433205-13376-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

Having labels allows to more easily reference nodes in .dts files
including spear600.dtsi.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/arm/boot/dts/spear600.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/spear600.dtsi b/arch/arm/boot/dts/spear600.dtsi
index 9f60a7b..8459286 100644
--- a/arch/arm/boot/dts/spear600.dtsi
+++ b/arch/arm/boot/dts/spear600.dtsi
@@ -49,7 +49,7 @@
 			#interrupt-cells = <1>;
 		};
 
-		clcd@fc200000 {
+		clcd: clcd@fc200000 {
 			compatible = "arm,pl110", "arm,primecell";
 			reg = <0xfc200000 0x1000>;
 			interrupt-parent = <&vic1>;
@@ -57,7 +57,7 @@
 			status = "disabled";
 		};
 
-		dma@fc400000 {
+		dmac: dma@fc400000 {
 			compatible = "arm,pl080", "arm,primecell";
 			reg = <0xfc400000 0x1000>;
 			interrupt-parent = <&vic1>;
@@ -97,7 +97,7 @@
 			status = "disabled";
 		};
 
-		ehci@e1800000 {
+		ehci_usb0: ehci@e1800000 {
 			compatible = "st,spear600-ehci", "usb-ehci";
 			reg = <0xe1800000 0x1000>;
 			interrupt-parent = <&vic1>;
@@ -105,7 +105,7 @@
 			status = "disabled";
 		};
 
-		ehci@e2000000 {
+		ehci_usb1: ehci@e2000000 {
 			compatible = "st,spear600-ehci", "usb-ehci";
 			reg = <0xe2000000 0x1000>;
 			interrupt-parent = <&vic1>;
@@ -113,7 +113,7 @@
 			status = "disabled";
 		};
 
-		ohci@e1900000 {
+		ohci_usb0: ohci@e1900000 {
 			compatible = "st,spear600-ohci", "usb-ohci";
 			reg = <0xe1900000 0x1000>;
 			interrupt-parent = <&vic1>;
@@ -121,7 +121,7 @@
 			status = "disabled";
 		};
 
-		ohci@e2100000 {
+		ohci_usb1: ohci@e2100000 {
 			compatible = "st,spear600-ohci", "usb-ohci";
 			reg = <0xe2100000 0x1000>;
 			interrupt-parent = <&vic1>;
@@ -135,7 +135,7 @@
 			compatible = "simple-bus";
 			ranges = <0xd0000000 0xd0000000 0x30000000>;
 
-			serial@d0000000 {
+			uart0: serial@d0000000 {
 				compatible = "arm,pl011", "arm,primecell";
 				reg = <0xd0000000 0x1000>;
 				interrupt-parent = <&vic0>;
@@ -143,7 +143,7 @@
 				status = "disabled";
 			};
 
-			serial@d0080000 {
+			uart1: serial@d0080000 {
 				compatible = "arm,pl011", "arm,primecell";
 				reg = <0xd0080000 0x1000>;
 				interrupt-parent = <&vic0>;
@@ -181,7 +181,7 @@
 				interrupts = <4>;
 			};
 
-			i2c@d0200000 {
+			i2c: i2c@d0200000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "snps,designware-i2c";
@@ -191,7 +191,7 @@
 				status = "disabled";
 			};
 
-			rtc@fc900000 {
+			rtc: rtc@fc900000 {
 				compatible = "st,spear600-rtc";
 				reg = <0xfc900000 0x1000>;
 				interrupts = <10>;
-- 
2.7.4

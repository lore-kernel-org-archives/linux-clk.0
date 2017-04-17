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
Subject: [PATCH v2 2/7] arm: spear6xx: use node labels in spear600-evb.dts
Date: Mon, 17 Apr 2017 14:46:40 +0200
Message-Id: <1492433205-13376-3-git-send-email-thomas.petazzoni@free-electrons.com>
In-Reply-To: <1492433205-13376-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1492433205-13376-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

Now that we have introduced node labels in spear600.dtsi, we can use
them for spear600-evb.dts.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 arch/arm/boot/dts/spear600-evb.dts | 156 ++++++++++++++++++-------------------
 1 file changed, 76 insertions(+), 80 deletions(-)

diff --git a/arch/arm/boot/dts/spear600-evb.dts b/arch/arm/boot/dts/spear600-evb.dts
index d865a89..375eb61 100644
--- a/arch/arm/boot/dts/spear600-evb.dts
+++ b/arch/arm/boot/dts/spear600-evb.dts
@@ -22,95 +22,91 @@
 		device_type = "memory";
 		reg = <0 0x10000000>;
 	};
+};
 
-	ahb {
-		clcd@fc200000 {
-			status = "okay";
-		};
+&clcd {
+	status = "okay";
+};
 
-		dma@fc400000 {
-			status = "okay";
-		};
+&dmac {
+	status = "okay";
+};
 
-		ehci@e1800000 {
-			status = "okay";
-		};
+&ehci_usb0 {
+	status = "okay";
+};
 
-		ehci@e2000000 {
-			status = "okay";
-		};
+&ehci_usb1 {
+	status = "okay";
+};
 
-		gmac: ethernet@e0800000 {
-			phy-mode = "gmii";
-			status = "okay";
-		};
+&gmac {
+	phy-mode = "gmii";
+	status = "okay";
+};
 
-		ohci@e1900000 {
-			status = "okay";
-		};
+&ohci_usb0 {
+	status = "okay";
+};
 
-		ohci@e2100000 {
-			status = "okay";
-		};
+&ohci_usb1 {
+	status = "okay";
+};
 
-		smi: flash@fc000000 {
-			status = "okay";
-			clock-rate=<50000000>;
-
-			flash@f8000000 {
-				#address-cells = <1>;
-				#size-cells = <1>;
-				reg = <0xf8000000 0x800000>;
-				st,smi-fast-mode;
-
-				partition@0 {
-					label = "xloader";
-					reg = <0x0 0x10000>;
-				};
-				partition@10000 {
-					label = "u-boot";
-					reg = <0x10000 0x50000>;
-				};
-				partition@60000 {
-					label = "environment";
-					reg = <0x60000 0x10000>;
-				};
-				partition@70000 {
-					label = "dtb";
-					reg = <0x70000 0x10000>;
-				};
-				partition@80000 {
-					label = "linux";
-					reg = <0x80000 0x310000>;
-				};
-				partition@390000 {
-					label = "rootfs";
-					reg = <0x390000 0x0>;
-				};
-			};
-		};
+&smi {
+	status = "okay";
+	clock-rate=<50000000>;
+
+	flash@f8000000 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0xf8000000 0x800000>;
+		st,smi-fast-mode;
 
-		apb {
-			serial@d0000000 {
-				status = "okay";
-				pinctrl-names = "default";
-				pinctrl-0 = <>;
-			};
-
-			serial@d0080000 {
-				status = "okay";
-				pinctrl-names = "default";
-				pinctrl-0 = <>;
-			};
-
-			rtc@fc900000 {
-			       status = "okay";
-			};
-
-			i2c@d0200000 {
-				clock-frequency = <400000>;
-				status = "okay";
-			};
+		partition@0 {
+			label = "xloader";
+			reg = <0x0 0x10000>;
+		};
+		partition@10000 {
+			label = "u-boot";
+			reg = <0x10000 0x50000>;
+		};
+		partition@60000 {
+			label = "environment";
+			reg = <0x60000 0x10000>;
+		};
+		partition@70000 {
+			label = "dtb";
+			reg = <0x70000 0x10000>;
+		};
+		partition@80000 {
+			label = "linux";
+			reg = <0x80000 0x310000>;
+		};
+		partition@390000 {
+			label = "rootfs";
+			reg = <0x390000 0x0>;
 		};
 	};
 };
+
+&uart0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <>;
+};
+
+&uart1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <>;
+};
+
+&rtc {
+	status = "okay";
+};
+
+&i2c {
+	clock-frequency = <400000>;
+	status = "okay";
+};
-- 
2.7.4

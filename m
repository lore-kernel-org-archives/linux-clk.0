Return-Path: <gabriel.fernandez@st.com>
From: <gabriel.fernandez@st.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>, Nicolas Pitre <nico@linaro.org>,
        Arnd Bergmann
	<arnd@arndb.de>, <daniel.thompson@linaro.org>,
        <andrea.merello@gmail.com>, <radoslaw.pietrzyk@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <kernel@stlinux.com>, <gabriel.fernandez@st.com>,
        <ludovic.barre@st.com>, <olivier.bideau@st.com>,
        <amelie.delaunay@st.com>
Subject: [PATCH 3/4] ARM: dts: stm32: stm32f7: Enable clocks for STM32F746 boards
Date: Fri, 6 Jan 2017 14:59:24 +0100
Message-ID: <1483711165-17149-4-git-send-email-gabriel.fernandez@st.com>
In-Reply-To: <1483711165-17149-1-git-send-email-gabriel.fernandez@st.com>
References: <1483711165-17149-1-git-send-email-gabriel.fernandez@st.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Gabriel Fernandez <gabriel.fernandez@st.com>

This patch enables clocks for STM32F746 boards.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
---
 arch/arm/boot/dts/stm32f746.dtsi | 29 +++++++++++++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/stm32f746.dtsi b/arch/arm/boot/dts/stm32f746.dtsi
index f321ffe..e05e131 100644
--- a/arch/arm/boot/dts/stm32f746.dtsi
+++ b/arch/arm/boot/dts/stm32f746.dtsi
@@ -43,6 +43,7 @@
 #include "skeleton.dtsi"
 #include "armv7-m.dtsi"
 #include <dt-bindings/pinctrl/stm32f746-pinfunc.h>
+#include <dt-bindings/clock/stm32fx-clock.h>
 
 / {
 	clocks {
@@ -51,6 +52,24 @@
 			compatible = "fixed-clock";
 			clock-frequency = <0>;
 		};
+
+		clk-lse {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <32768>;
+		};
+
+		clk-lsi {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+		};
+
+		clk_i2s_ckin: clk-i2s-ckin {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <48000000>;
+		};
 	};
 
 	soc {
@@ -178,6 +197,11 @@
 			interrupts = <1>, <2>, <3>, <6>, <7>, <8>, <9>, <10>, <23>, <40>, <41>, <42>, <62>, <76>;
 		};
 
+		pwrcfg: power-config@40007000 {
+			compatible = "syscon";
+			reg = <0x40007000 0x400>;
+		};
+
 		pin-controller {
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -291,9 +315,10 @@
 
 		rcc: rcc@40023800 {
 			#clock-cells = <2>;
-			compatible = "st,stm32f42xx-rcc", "st,stm32-rcc";
+			compatible = "st,stm32f746-rcc", "st,stm32-rcc";
 			reg = <0x40023800 0x400>;
-			clocks = <&clk_hse>;
+			clocks = <&clk_hse>, <&clk_i2s_ckin>;
+			st,syscfg = <&pwrcfg>;
 		};
 	};
 };
-- 
1.9.1

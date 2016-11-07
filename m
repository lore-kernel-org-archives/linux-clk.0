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
        <andrea.merello@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <kernel@stlinux.com>, <gabriel.fernandez@st.com>,
        <ludovic.barre@st.com>, <olivier.bideau@st.com>,
        <amelie.delaunay@st.com>
Subject: [PATCH 6/6] arm: dts: stm32f4: Add external I2S clock
Date: Mon, 7 Nov 2016 14:05:43 +0100
Message-ID: <1478523943-23142-7-git-send-email-gabriel.fernandez@st.com>
In-Reply-To: <1478523943-23142-1-git-send-email-gabriel.fernandez@st.com>
References: <1478523943-23142-1-git-send-email-gabriel.fernandez@st.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Gabriel Fernandez <gabriel.fernandez@st.com>

This patch adds an external I2S clock in the DT.
The I2S clock could be derived from an external I2S clock or by I2S pll.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
---
 arch/arm/boot/dts/stm32f429.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stm32f429.dtsi b/arch/arm/boot/dts/stm32f429.dtsi
index 2700449..14da6ce 100644
--- a/arch/arm/boot/dts/stm32f429.dtsi
+++ b/arch/arm/boot/dts/stm32f429.dtsi
@@ -68,6 +68,12 @@
 			compatible = "fixed-clock";
 			clock-frequency = <32000>;
 		};
+
+		clk_i2s_ckin: i2s-ckin {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <0>;
+		};
 	};
 
 	soc {
@@ -356,7 +362,7 @@
 			#clock-cells = <2>;
 			compatible = "st,stm32f42xx-rcc", "st,stm32-rcc";
 			reg = <0x40023800 0x400>;
-			clocks = <&clk_hse>;
+			clocks = <&clk_hse>, <&clk_i2s_ckin>;
 			st,syscfg = <&pwrcfg>;
 		};
 
-- 
1.9.1

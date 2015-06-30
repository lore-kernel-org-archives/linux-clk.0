Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Paul Osmialowski <pawelo@king.net.pl>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Jiri Slaby <jslaby@suse.cz>, Kumar Gala <galak@codeaurora.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pawel Moll <pawel.moll@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Russell King <linux@arm.linux.org.uk>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Vinod Koul <vinod.koul@intel.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Nicolas Pitre <nicolas.pitre@linaro.org>,
	Paul Bolle <pebolle@tiscali.nl>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>,
	Paul Osmialowski <pawelo@king.net.pl>,
	Anson Huang <b20788@freescale.com>,
	Frank Li <Frank.Li@freescale.com>,
	Jingchang Lu <jingchang.lu@freescale.com>,
	Rob Herring <r.herring@freescale.com>,
	Yuri Tikhonov <yur@emcraft.com>,
	Sergei Poselenov <sposelenov@emcraft.com>,
	Alexander Potashev <aspotashev@emcraft.com>
Subject: [PATCH v2 9/9] arm: twr-k70f120m: use Freescale lpuart driver with Kinetis SoC
Date: Tue, 30 Jun 2015 14:27:30 +0200
Message-Id: <1435667250-28299-10-git-send-email-pawelo@king.net.pl>
In-Reply-To: <1435667250-28299-1-git-send-email-pawelo@king.net.pl>
References: <1435667250-28299-1-git-send-email-pawelo@king.net.pl>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Note that enabling tx DMA resulted in messy output, so I didn't configure
it in the .dts file - however nothing in the code prevents one from doing
so. Also note that original reference UART driver from Emcraft did not
implement tx DMA at all.

Signed-off-by: Paul Osmialowski <pawelo@king.net.pl>
---
 arch/arm/boot/dts/kinetis-twr-k70f120m.dts | 23 +++++++++
 arch/arm/boot/dts/kinetis.dtsi             | 78 ++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/arch/arm/boot/dts/kinetis-twr-k70f120m.dts b/arch/arm/boot/dts/kinetis-twr-k70f120m.dts
index a6efc29..5d8470a 100644
--- a/arch/arm/boot/dts/kinetis-twr-k70f120m.dts
+++ b/arch/arm/boot/dts/kinetis-twr-k70f120m.dts
@@ -10,11 +10,34 @@
 	model = "Freescale TWR-K70F120M Development Kit";
 	compatible = "fsl,kinetis-twr-k70f120m";
 
+	chosen {
+		bootargs = "console=ttyLP2,115200";
+	};
+
 	memory {
 		reg = <0x8000000 0x8000000>;
 	};
 };
 
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+	status = "ok";
+};
+
+&portE {
+	status = "ok";
+
+	uart2 {
+		uart2_pins: pinmux_uart2_pins {
+			fsl,pins = <
+				16	0x300 /* E.16 = UART2_TX */
+				17	0x300 /* E.17 = UART2_RX */
+			>;
+		};
+	};
+};
+
 &pit0 {
 	status = "ok";
 };
diff --git a/arch/arm/boot/dts/kinetis.dtsi b/arch/arm/boot/dts/kinetis.dtsi
index c2861f5..fedafe3 100644
--- a/arch/arm/boot/dts/kinetis.dtsi
+++ b/arch/arm/boot/dts/kinetis.dtsi
@@ -16,9 +16,87 @@
 		pmx3 = &portD;
 		pmx4 = &portE;
 		pmx5 = &portF;
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+		serial5 = &uart5;
 	};
 
 	soc {
+		uart0: serial@4006a000 {
+			compatible = "fsl,kinetis-lpuart";
+			reg = <0x4006a000 0x1000>;
+			interrupts = <45>, <46>;
+			interrupt-names = "uart-stat", "uart-err";
+			clocks = <&mcg_cclk_gate 3 10>;
+			clock-names = "ipg";
+			dmas = <&edma 0 2>;
+			dma-names = "rx";
+			status = "disabled";
+		};
+
+		uart1: serial@4006b000 {
+			compatible = "fsl,kinetis-lpuart";
+			reg = <0x4006b000 0x1000>;
+			interrupts = <47>, <48>;
+			interrupt-names = "uart-stat", "uart-err";
+			clocks = <&mcg_cclk_gate 3 11>;
+			clock-names = "ipg";
+			dmas = <&edma 0 4>;
+			dma-names = "rx";
+			status = "disabled";
+		};
+
+		uart2: serial@4006c000 {
+			compatible = "fsl,kinetis-lpuart";
+			reg = <0x4006c000 0x1000>;
+			interrupts = <49>, <50>;
+			interrupt-names = "uart-stat", "uart-err";
+			clocks = <&mcg_pclk_gate 3 12>;
+			clock-names = "ipg";
+			dmas = <&edma 0 6>;
+			dma-names = "rx";
+			status = "disabled";
+		};
+
+		uart3: serial@4006d000 {
+			compatible = "fsl,kinetis-lpuart";
+			reg = <0x4006d000 0x1000>;
+			interrupts = <51>, <52>;
+			interrupt-names = "uart-stat", "uart-err";
+			clocks = <&mcg_pclk_gate 3 13>;
+			clock-names = "ipg";
+			dmas = <&edma 0 8>;
+			dma-names = "rx";
+			status = "disabled";
+		};
+
+		uart4: serial@400ea000 {
+			compatible = "fsl,kinetis-lpuart";
+			reg = <0x400ea000 0x1000>;
+			interrupts = <53>, <54>;
+			interrupt-names = "uart-stat", "uart-err";
+			clocks = <&mcg_pclk_gate 0 10>;
+			clock-names = "ipg";
+			dmas = <&edma 0 10>;
+			dma-names = "rx";
+			status = "disabled";
+		};
+
+		uart5: serial@400eb000 {
+			compatible = "fsl,kinetis-lpuart";
+			reg = <0x400eb000 0x1000>;
+			interrupts = <55>, <56>;
+			interrupt-names = "uart-stat", "uart-err";
+			clocks = <&mcg_pclk_gate 0 11>;
+			clock-names = "ipg";
+			dmas = <&edma 0 12>;
+			dma-names = "rx";
+			status = "disabled";
+		};
+
 		edma: dma-controller@40008000 {
 			compatible = "fsl,kinetis-edma";
 			reg = <0x40008000 0x2000>, /* DMAC */
-- 
2.3.6


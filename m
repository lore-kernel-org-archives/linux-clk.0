Return-Path: <LW@karo-electronics.de>
From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
To: Anson Huang <b20788@freescale.com>,
	Bai Ping <b51503@freescale.com>,
	Frank Li <Frank.Li@freescale.com>,
	Fugang Duan <B38611@freescale.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	=?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pawel Moll <pawel.moll@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Russell King <linux@arm.linux.org.uk>,
	Sascha Hauer <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCHv2 10/16] ARM: dts: imx6ul: add sai support
Date: Wed, 20 Jan 2016 11:09:03 +0100
Message-Id: <1453284549-16363-11-git-send-email-LW@KARO-electronics.de>
In-Reply-To: <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
 <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Add device nodes for the i.MX6UL synchronous audio interfaces (SAI).

Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/imx6ul.dtsi | 45 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index 9c873a6..e1fda39e 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -235,6 +235,51 @@
 					clock-names = "ipg", "per";
 					status = "disabled";
 				};
+
+				sai1: sai@02028000 {
+					#sound-dai-cells = <0>;
+					compatible = "fsl,imx6ul-sai", "fsl,imx6sx-sai";
+					reg = <0x02028000 0x4000>;
+					interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&clks IMX6UL_CLK_SAI1_IPG>,
+						 <&clks IMX6UL_CLK_SAI1>,
+						 <&clks IMX6UL_CLK_DUMMY>, <&clks IMX6UL_CLK_DUMMY>;
+					clock-names = "bus", "mclk1", "mclk2", "mclk3";
+					dmas = <&sdma 35 24 0>,
+					       <&sdma 36 24 0>;
+					dma-names = "rx", "tx";
+					status = "disabled";
+				};
+
+				sai2: sai@0202c000 {
+					#sound-dai-cells = <0>;
+					compatible = "fsl,imx6ul-sai", "fsl,imx6sx-sai";
+					reg = <0x0202c000 0x4000>;
+					interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&clks IMX6UL_CLK_SAI2_IPG>,
+						 <&clks IMX6UL_CLK_SAI2>,
+						 <&clks IMX6UL_CLK_DUMMY>, <&clks IMX6UL_CLK_DUMMY>;
+					clock-names = "bus", "mclk1", "mclk2", "mclk3";
+					dmas = <&sdma 37 24 0>,
+					       <&sdma 38 24 0>;
+					dma-names = "rx", "tx";
+					status = "disabled";
+				};
+
+				sai3: sai@02030000 {
+					#sound-dai-cells = <0>;
+					compatible = "fsl,imx6ul-sai", "fsl,imx6sx-sai";
+					reg = <0x02030000 0x4000>;
+					interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
+					clocks = <&clks IMX6UL_CLK_SAI3_IPG>,
+						 <&clks IMX6UL_CLK_SAI3>,
+						 <&clks IMX6UL_CLK_DUMMY>, <&clks IMX6UL_CLK_DUMMY>;
+					clock-names = "bus", "mclk1", "mclk2", "mclk3";
+					dmas = <&sdma 39 24 0>,
+					       <&sdma 40 24 0>;
+					dma-names = "rx", "tx";
+					status = "disabled";
+				};
 			};
 
 			tsc: tsc@02040000 {
-- 
2.1.4

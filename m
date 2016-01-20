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
Subject: [PATCHv2 09/16] ARM: dts: imx6ul: add flexcan support
Date: Wed, 20 Jan 2016 11:09:02 +0100
Message-Id: <1453284549-16363-10-git-send-email-LW@KARO-electronics.de>
In-Reply-To: <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
 <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Add device nodes for the i.MX6UL flexcan interfaces.

Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/imx6ul.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index 9c719b2..9c873a6 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -292,6 +292,26 @@
 				status = "disabled";
 			};
 
+			can1: flexcan@02090000 {
+				compatible = "fsl,imx6ul-flexcan", "fsl,imx6q-flexcan";
+				reg = <0x02090000 0x4000>;
+				interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6UL_CLK_CAN1_IPG>,
+					 <&clks IMX6UL_CLK_CAN1_SERIAL>;
+				clock-names = "ipg", "per";
+				status = "disabled";
+			};
+
+			can2: flexcan@02094000 {
+				compatible = "fsl,imx6ul-flexcan", "fsl,imx6q-flexcan";
+				reg = <0x02094000 0x4000>;
+				interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6UL_CLK_CAN2_IPG>,
+					 <&clks IMX6UL_CLK_CAN2_SERIAL>;
+				clock-names = "ipg", "per";
+				status = "disabled";
+			};
+
 			gpt1: gpt@02098000 {
 				compatible = "fsl,imx6ul-gpt", "fsl,imx6sx-gpt";
 				reg = <0x02098000 0x4000>;
-- 
2.1.4

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
Subject: [PATCHv2 11/16] ARM: dts: imx6ul: add lcdif support
Date: Wed, 20 Jan 2016 11:09:04 +0100
Message-Id: <1453284549-16363-12-git-send-email-LW@KARO-electronics.de>
In-Reply-To: <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
 <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Add the device node for the i.MX6UL eLCDIF interface.

Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/imx6ul.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index e1fda39e..985c1b1 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -798,6 +798,17 @@
 				reg = <0x021b0000 0x4000>;
 			};
 
+			lcdif: lcdif@021c8000 {
+				compatible = "fsl,imx6ul-lcdif", "fsl,imx28-lcdif";
+				reg = <0x021c8000 0x4000>;
+				interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6UL_CLK_LCDIF_PIX>,
+					 <&clks IMX6UL_CLK_LCDIF_APB>,
+					 <&clks IMX6UL_CLK_DUMMY>;
+				clock-names = "pix", "axi", "disp_axi";
+				status = "disabled";
+			};
+
 			qspi: qspi@021e0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.1.4

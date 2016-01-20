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
Subject: [PATCHv2 07/16] ARM: dts: imx6ul: add pwm[1-4] nodes
Date: Wed, 20 Jan 2016 11:09:00 +0100
Message-Id: <1453284549-16363-8-git-send-email-LW@KARO-electronics.de>
In-Reply-To: <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
 <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Add device nodes for the PWM uinits 1..4 which were missing in the
original commit for i.MX6UL support.

Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/imx6ul.dtsi | 44 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index 863777e..40ea5f0 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -248,6 +248,50 @@
 				status = "disabled";
 			};
 
+			pwm1: pwm@02080000 {
+				compatible = "fsl,imx6ul-pwm", "fsl,imx27-pwm";
+				reg = <0x02080000 0x4000>;
+				interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6UL_CLK_PWM1>,
+					 <&clks IMX6UL_CLK_PWM1>;
+				clock-names = "ipg", "per";
+				#pwm-cells = <2>;
+				status = "disabled";
+			};
+
+			pwm2: pwm@02084000 {
+				compatible = "fsl,imx6ul-pwm", "fsl,imx27-pwm";
+				reg = <0x02084000 0x4000>;
+				interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6UL_CLK_PWM2>,
+					 <&clks IMX6UL_CLK_PWM2>;
+				clock-names = "ipg", "per";
+				#pwm-cells = <2>;
+				status = "disabled";
+			};
+
+			pwm3: pwm@02088000 {
+				compatible = "fsl,imx6ul-pwm", "fsl,imx27-pwm";
+				reg = <0x02088000 0x4000>;
+				interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6UL_CLK_PWM3>,
+					 <&clks IMX6UL_CLK_PWM3>;
+				clock-names = "ipg", "per";
+				#pwm-cells = <2>;
+				status = "disabled";
+			};
+
+			pwm4: pwm@0208c000 {
+				compatible = "fsl,imx6ul-pwm", "fsl,imx27-pwm";
+				reg = <0x0208c000 0x4000>;
+				interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6UL_CLK_PWM4>,
+					 <&clks IMX6UL_CLK_PWM4>;
+				clock-names = "ipg", "per";
+				#pwm-cells = <2>;
+				status = "disabled";
+			};
+
 			gpt1: gpt@02098000 {
 				compatible = "fsl,imx6ul-gpt", "fsl,imx6sx-gpt";
 				reg = <0x02098000 0x4000>;
-- 
2.1.4

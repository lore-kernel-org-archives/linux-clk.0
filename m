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
Subject: [PATCHv2 06/16] ARM: dts: imx6ul: disable PWMs by default
Date: Wed, 20 Jan 2016 11:08:59 +0100
Message-Id: <1453284549-16363-7-git-send-email-LW@KARO-electronics.de>
In-Reply-To: <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
References: <1452619291-13625-1-git-send-email-LW@KARO-electronics.de>
 <1453284549-16363-1-git-send-email-LW@KARO-electronics.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Since PWMs are only useful if they are actually connected to an output pin,
let users enable them explicitly in their device trees where they should
also set up the pin configuration. This is in sync with a recent change
(commit e2675266b39b "ARM: dts: imx6qdl: disable PWMs by default")
to other i.MX SoCs.

Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
---
 arch/arm/boot/dts/imx6ul.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index 3aba0bb..863777e 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -512,6 +512,7 @@
 					 <&clks IMX6UL_CLK_PWM5>;
 				clock-names = "ipg", "per";
 				#pwm-cells = <2>;
+				status = "disabled";
 			};
 
 			pwm6: pwm@020f4000 {
@@ -522,6 +523,7 @@
 					 <&clks IMX6UL_CLK_PWM6>;
 				clock-names = "ipg", "per";
 				#pwm-cells = <2>;
+				status = "disabled";
 			};
 
 			pwm7: pwm@020f8000 {
@@ -532,6 +534,7 @@
 					 <&clks IMX6UL_CLK_PWM7>;
 				clock-names = "ipg", "per";
 				#pwm-cells = <2>;
+				status = "disabled";
 			};
 
 			pwm8: pwm@020fc000 {
@@ -542,6 +545,7 @@
 					 <&clks IMX6UL_CLK_PWM8>;
 				clock-names = "ipg", "per";
 				#pwm-cells = <2>;
+				status = "disabled";
 			};
 		};
 
-- 
2.1.4

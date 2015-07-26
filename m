Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Subject: [PATCH 3/7] ARM: sun6i: Add clock indices
Date: Sun, 26 Jul 2015 23:14:26 +0200
Message-Id: <1437945270-32014-4-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1437945270-32014-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1437945270-32014-1-git-send-email-maxime.ripard@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

The A31 gates have a non continuous set of clock IDs that are valid. Add
the clock-indices property to the DT to express this.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/boot/dts/sun6i-a31.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/sun6i-a31.dtsi b/arch/arm/boot/dts/sun6i-a31.dtsi
index 008047a018cf..3ec456fa03a4 100644
--- a/arch/arm/boot/dts/sun6i-a31.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31.dtsi
@@ -252,6 +252,20 @@
 			compatible = "allwinner,sun6i-a31-ahb1-gates-clk";
 			reg = <0x01c20060 0x8>;
 			clocks = <&ahb1>;
+			clock-indices = <1>, <5>,
+					<6>, <8>, <9>,
+					<10>, <11>, <12>,
+					<13>, <14>,
+					<17>, <18>, <19>,
+					<20>, <21>, <22>,
+					<23>, <24>, <26>,
+					<27>, <29>,
+					<30>, <31>, <32>,
+					<36>, <37>, <40>,
+					<43>, <44>, <45>,
+					<46>, <47>, <50>,
+					<52>, <55>, <56>,
+					<57>, <58>;
 			clock-output-names = "ahb1_mipidsi", "ahb1_ss",
 					"ahb1_dma", "ahb1_mmc0", "ahb1_mmc1",
 					"ahb1_mmc2", "ahb1_mmc3", "ahb1_nand1",
@@ -281,6 +295,9 @@
 			compatible = "allwinner,sun6i-a31-apb1-gates-clk";
 			reg = <0x01c20068 0x4>;
 			clocks = <&apb1>;
+			clock-indices = <0>, <4>,
+					<5>, <12>,
+					<13>;
 			clock-output-names = "apb1_codec", "apb1_digital_mic",
 					"apb1_pio", "apb1_daudio0",
 					"apb1_daudio1";
@@ -299,6 +316,10 @@
 			compatible = "allwinner,sun6i-a31-apb2-gates-clk";
 			reg = <0x01c2006c 0x4>;
 			clocks = <&apb2>;
+			clock-indices = <0>, <1>,
+					<2>, <3>, <16>,
+					<17>, <18>, <19>,
+					<20>, <21>;
 			clock-output-names = "apb2_i2c0", "apb2_i2c1",
 					     "apb2_i2c2", "apb2_i2c3",
 					     "apb2_uart0", "apb2_uart1",
@@ -384,6 +405,9 @@
 			compatible = "allwinner,sun6i-a31-usb-clk";
 			reg = <0x01c200cc 0x4>;
 			clocks = <&osc24M>;
+			clock-indices = <8>, <9>, <10>,
+					<16>, <17>,
+					<18>;
 			clock-output-names = "usb_phy0", "usb_phy1", "usb_phy2",
 					     "usb_ohci0", "usb_ohci1",
 					     "usb_ohci2";
-- 
2.4.6


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

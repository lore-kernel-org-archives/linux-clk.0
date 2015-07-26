Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
Subject: [PATCH 5/7] ARM: sun8i: Add clock indices
Date: Sun, 26 Jul 2015 23:14:28 +0200
Message-Id: <1437945270-32014-6-git-send-email-maxime.ripard@free-electrons.com>
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

The A23 and A33 gates have a non continuous set of clock IDs that are
valid. Add the clock-indices property to the DT to express this.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/boot/dts/sun8i-a23-a33.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
index 7abd0ae3143d..c318c770b6c1 100644
--- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
@@ -180,6 +180,15 @@
 			compatible = "allwinner,sun8i-a23-ahb1-gates-clk";
 			reg = <0x01c20060 0x8>;
 			clocks = <&ahb1>;
+			clock-indices = <1>, <6>,
+					<8>, <9>, <10>,
+					<13>, <14>,
+					<19>, <20>,
+					<21>, <24>, <26>,
+					<29>, <32>, <36>,
+					<40>, <44>, <46>,
+					<52>, <54>,
+					<57>;
 			clock-output-names = "ahb1_mipidsi", "ahb1_dma",
 					"ahb1_mmc0", "ahb1_mmc1", "ahb1_mmc2",
 					"ahb1_nand", "ahb1_sdram",
@@ -196,6 +205,8 @@
 			compatible = "allwinner,sun8i-a23-apb1-gates-clk";
 			reg = <0x01c20068 0x4>;
 			clocks = <&apb1>;
+			clock-indices = <0>, <5>,
+					<12>, <13>;
 			clock-output-names = "apb1_codec", "apb1_pio",
 					"apb1_daudio0",	"apb1_daudio1";
 		};
@@ -213,6 +224,10 @@
 			compatible = "allwinner,sun8i-a23-apb2-gates-clk";
 			reg = <0x01c2006c 0x4>;
 			clocks = <&apb2>;
+			clock-indices = <0>, <1>,
+					<2>, <16>,
+					<17>, <18>,
+					<19>, <20>;
 			clock-output-names = "apb2_i2c0", "apb2_i2c1",
 					"apb2_i2c2", "apb2_uart0",
 					"apb2_uart1", "apb2_uart2",
-- 
2.4.6


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

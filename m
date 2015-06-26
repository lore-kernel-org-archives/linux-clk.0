Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
From: Fabio Estevam <fabio.estevam@freescale.com>
To: <shawnguo@kernel.org>
Subject: [PATCH v3 1/2] ARM: dts: imx6qdl-sabresd: Allow HDMI and LVDS to work
 simultaneously
Date: Fri, 26 Jun 2015 14:10:53 -0300
Message-ID: <1435338654-9098-1-git-send-email-fabio.estevam@freescale.com>
MIME-Version: 1.0
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux@arm.linux.org.uk,
 mturquette@baylibre.com, eric.nelson@boundarydevices.com,
 vladimir_zapolskiy@mentor.com, kernel@pengutronix.de, Ying.liu@freescale.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Currently it is not possible to have HDMI and LVDS working simultaneously,
because both ports try to use PLL5.

Move the LVDS clock parent to PLL3_USB_OTG, so that HDMI and LVDS can be
driven from independent sources.

With this change the LDB pixel clock goes to 68.57 MHz, which is still
within the valid range for the HSD100PXN1 LVDS panel.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Changes since v2:
- None
Changes since v1:
- Move the clock assignment inside &clks as suggested by Philipp

 arch/arm/boot/dts/imx6qdl-sabresd.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
index a626e6d..cca847e 100644
--- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
@@ -141,6 +141,13 @@
 	status = "okay";
 };
 
+&clks {
+	assigned-clocks = <&clks IMX6QDL_CLK_LDB_DI0_SEL>,
+			  <&clks IMX6QDL_CLK_LDB_DI1_SEL>;
+	assigned-clock-parents = <&clks IMX6QDL_CLK_PLL3_USB_OTG>,
+				 <&clks IMX6QDL_CLK_PLL3_USB_OTG>;
+};
+
 &ecspi1 {
 	fsl,spi-num-chipselects = <1>;
 	cs-gpios = <&gpio4 9 0>;
-- 
1.9.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

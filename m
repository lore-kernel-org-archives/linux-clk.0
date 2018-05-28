Return-Path: <peron.clem@gmail.com>
Return-Path: <peron.clem@gmail.com>
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Colin Didier <colin.dider@devialet.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
	NXP Linux Team <linux-imx@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Colin Didier <colin.didier@devialet.com>,
	=?UTF-8?q?Cl=C3=A9ment=20Peron?= <clement.peron@devialet.com>
Subject: [PATCH 5/5] ARM: dts: imx6qdl: add missing compatible and clock properties for EPIT
Date: Mon, 28 May 2018 19:34:12 +0200
Message-Id: <20180528173412.10000-6-peron.clem@gmail.com>
In-Reply-To: <20180528173412.10000-1-peron.clem@gmail.com>
References: <20180528173412.10000-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

From: Colin Didier <colin.didier@devialet.com>

Add missing compatible and clock properties for EPIT node.

Signed-off-by: Colin Didier <colin.didier@devialet.com>
Signed-off-by: Clément Peron <clement.peron@devialet.com>
---
 arch/arm/boot/dts/imx6qdl.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index c003e62bf290..16fec147dcb8 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -844,13 +844,25 @@
 			};
 
 			epit1: epit@20d0000 { /* EPIT1 */
+				compatible = "fsl,imx6q-epit";
 				reg = <0x020d0000 0x4000>;
 				interrupts = <0 56 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6QDL_CLK_EPIT1>,
+					<&clks IMX6QDL_CLK_IPG_PER>,
+					<&clks IMX6QDL_CLK_CKIL>;
+				clock-names = "ipg", "per", "ckil";
+				status = "disabled";
 			};
 
 			epit2: epit@20d4000 { /* EPIT2 */
+				compatible = "fsl,imx6q-epit";
 				reg = <0x020d4000 0x4000>;
 				interrupts = <0 57 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clks IMX6QDL_CLK_EPIT2>,
+					<&clks IMX6QDL_CLK_IPG_PER>,
+					<&clks IMX6QDL_CLK_CKIL>;
+				clock-names = "ipg", "per", "ckil";
+				status = "disabled";
 			};
 
 			src: src@20d8000 {
-- 
2.17.0

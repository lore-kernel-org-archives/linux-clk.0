Return-Path: <SRS0=O2Di=ZJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F1EEC432C0
	for <linux-clk@archiver.kernel.org>; Sun, 17 Nov 2019 12:46:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E9E4206F4
	for <linux-clk@archiver.kernel.org>; Sun, 17 Nov 2019 12:46:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbfKQMqN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 17 Nov 2019 07:46:13 -0500
Received: from inva020.nxp.com ([92.121.34.13]:58906 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726088AbfKQMqN (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 17 Nov 2019 07:46:13 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2BD341A0A53;
        Sun, 17 Nov 2019 13:46:09 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AE4DC1A07F0;
        Sun, 17 Nov 2019 13:46:04 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 882F9402AE;
        Sun, 17 Nov 2019 20:45:59 +0800 (SGT)
From:   Dong Aisheng <aisheng.dong@nxp.com>
To:     linux-arm-kernel@lists.infradead.org
Cc:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, shawnguo@kernel.org,
        fabio.estevam@nxp.com, linux-imx@nxp.com, kernel@pengutronix.de,
        Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH RESEND v3 08/15] arm64: dts: imx8: switch to new lpcg clock binding
Date:   Sun, 17 Nov 2019 20:43:48 +0800
Message-Id: <1573994635-14479-9-git-send-email-aisheng.dong@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573994635-14479-1-git-send-email-aisheng.dong@nxp.com>
References: <1573994635-14479-1-git-send-email-aisheng.dong@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

switch to new lpcg clock binding

Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v2->v3:
 * use new clock-indices IDs
v1->v2:
 * split scu clock changes
---
 .../boot/dts/freescale/imx8-ss-adma.dtsi      | 46 ++++++++++---------
 .../boot/dts/freescale/imx8-ss-conn.dtsi      | 44 +++++++++---------
 .../boot/dts/freescale/imx8-ss-lsio.dtsi      | 13 ++++--
 .../boot/dts/freescale/imx8qxp-ss-adma.dtsi   |  4 --
 .../boot/dts/freescale/imx8qxp-ss-conn.dtsi   |  4 --
 .../boot/dts/freescale/imx8qxp-ss-lsio.dtsi   |  4 --
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi    |  1 +
 7 files changed, 56 insertions(+), 60 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi
index 044db3d659c0..1501424c7b76 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-adma.dtsi
@@ -20,13 +20,8 @@ adma_subsys: bus@59000000 {
 		clock-output-names = "dma_ipg_clk";
 	};
 
-	/* LPCG clocks */
-	adma_lpcg: clock-controller@59000000 {
-		reg = <0x59000000 0x2000000>;
-		#clock-cells = <1>;
-	};
-
 	dsp_lpcg: clock-controller@59580000 {
+		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x59580000 0x10000>;
 		#clock-cells = <1>;
 		clocks = <&dma_ipg_clk>,
@@ -41,6 +36,7 @@ adma_subsys: bus@59000000 {
 	};
 
 	dsp_ram_lpcg: clock-controller@59590000 {
+		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x59590000 0x10000>;
 		#clock-cells = <1>;
 		clocks = <&dma_ipg_clk>;
@@ -52,9 +48,9 @@ adma_subsys: bus@59000000 {
 	adma_dsp: dsp@596e8000 {
 		compatible = "fsl,imx8qxp-dsp";
 		reg = <0x596e8000 0x88000>;
-		clocks = <&adma_lpcg IMX_ADMA_LPCG_DSP_IPG_CLK>,
-			<&adma_lpcg IMX_ADMA_LPCG_OCRAM_IPG_CLK>,
-			<&adma_lpcg IMX_ADMA_LPCG_DSP_CORE_CLK>;
+		clocks = <&dsp_lpcg IMX_LPCG_CLK_5>,
+			 <&dsp_ram_lpcg IMX_LPCG_CLK_4>,
+			 <&dsp_lpcg IMX_LPCG_CLK_7>;
 		clock-names = "ipg", "ocram", "core";
 		power-domains = <&pd IMX_SC_R_MU_13A>,
 			<&pd IMX_SC_R_MU_13B>,
@@ -74,8 +70,8 @@ adma_subsys: bus@59000000 {
 		reg = <0x5a060000 0x1000>;
 		interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-parent = <&gic>;
-		clocks = <&adma_lpcg IMX_ADMA_LPCG_UART0_IPG_CLK>,
-			 <&adma_lpcg IMX_ADMA_LPCG_UART0_BAUD_CLK>;
+		clocks = <&uart0_lpcg IMX_LPCG_CLK_4>,
+			 <&uart0_lpcg IMX_LPCG_CLK_0>;
 		clock-names = "ipg", "baud";
 		power-domains = <&pd IMX_SC_R_UART_0>;
 		status = "disabled";
@@ -85,8 +81,8 @@ adma_subsys: bus@59000000 {
 		reg = <0x5a070000 0x1000>;
 		interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-parent = <&gic>;
-		clocks = <&adma_lpcg IMX_ADMA_LPCG_UART1_IPG_CLK>,
-			 <&adma_lpcg IMX_ADMA_LPCG_UART1_BAUD_CLK>;
+		clocks = <&uart1_lpcg IMX_LPCG_CLK_4>,
+			 <&uart1_lpcg IMX_LPCG_CLK_0>;
 		clock-names = "ipg", "baud";
 		power-domains = <&pd IMX_SC_R_UART_1>;
 		status = "disabled";
@@ -96,8 +92,8 @@ adma_subsys: bus@59000000 {
 		reg = <0x5a080000 0x1000>;
 		interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-parent = <&gic>;
-		clocks = <&adma_lpcg IMX_ADMA_LPCG_UART2_IPG_CLK>,
-			 <&adma_lpcg IMX_ADMA_LPCG_UART2_BAUD_CLK>;
+		clocks = <&uart2_lpcg IMX_LPCG_CLK_4>,
+			 <&uart2_lpcg IMX_LPCG_CLK_0>;
 		clock-names = "ipg", "baud";
 		power-domains = <&pd IMX_SC_R_UART_2>;
 		status = "disabled";
@@ -107,14 +103,15 @@ adma_subsys: bus@59000000 {
 		reg = <0x5a090000 0x1000>;
 		interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-parent = <&gic>;
-		clocks = <&adma_lpcg IMX_ADMA_LPCG_UART3_IPG_CLK>,
-			 <&adma_lpcg IMX_ADMA_LPCG_UART3_BAUD_CLK>;
+		clocks = <&uart3_lpcg IMX_LPCG_CLK_4>,
+			 <&uart3_lpcg IMX_LPCG_CLK_0>;
 		clock-names = "ipg", "baud";
 		power-domains = <&pd IMX_SC_R_UART_3>;
 		status = "disabled";
 	};
 
 	uart0_lpcg: clock-controller@5a460000 {
+		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5a460000 0x10000>;
 		#clock-cells = <1>;
 		clocks = <&clk IMX_SC_R_UART_0 IMX_SC_PM_CLK_PER>,
@@ -126,6 +123,7 @@ adma_subsys: bus@59000000 {
 	};
 
 	uart1_lpcg: clock-controller@5a470000 {
+		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5a470000 0x10000>;
 		#clock-cells = <1>;
 		clocks = <&clk IMX_SC_R_UART_1 IMX_SC_PM_CLK_PER>,
@@ -137,6 +135,7 @@ adma_subsys: bus@59000000 {
 	};
 
 	uart2_lpcg: clock-controller@5a480000 {
+		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5a480000 0x10000>;
 		#clock-cells = <1>;
 		clocks = <&clk IMX_SC_R_UART_2 IMX_SC_PM_CLK_PER>,
@@ -148,6 +147,7 @@ adma_subsys: bus@59000000 {
 	};
 
 	uart3_lpcg: clock-controller@5a490000 {
+		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5a490000 0x10000>;
 		#clock-cells = <1>;
 		clocks = <&clk IMX_SC_R_UART_3 IMX_SC_PM_CLK_PER>,
@@ -162,7 +162,7 @@ adma_subsys: bus@59000000 {
 		reg = <0x5a800000 0x4000>;
 		interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-parent = <&gic>;
-		clocks = <&adma_lpcg IMX_ADMA_LPCG_I2C0_CLK>;
+		clocks = <&i2c0_lpcg IMX_LPCG_CLK_0>;
 		clock-names = "per";
 		assigned-clocks = <&clk IMX_SC_R_I2C_0 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <24000000>;
@@ -174,7 +174,7 @@ adma_subsys: bus@59000000 {
 		reg = <0x5a810000 0x4000>;
 		interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-parent = <&gic>;
-		clocks = <&adma_lpcg IMX_ADMA_LPCG_I2C1_CLK>;
+		clocks = <&i2c1_lpcg IMX_LPCG_CLK_0>;
 		clock-names = "per";
 		assigned-clocks = <&clk IMX_SC_R_I2C_1 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <24000000>;
@@ -186,7 +186,7 @@ adma_subsys: bus@59000000 {
 		reg = <0x5a820000 0x4000>;
 		interrupts = <GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-parent = <&gic>;
-		clocks = <&adma_lpcg IMX_ADMA_LPCG_I2C2_CLK>;
+		clocks = <&i2c2_lpcg IMX_LPCG_CLK_0>;
 		clock-names = "per";
 		assigned-clocks = <&clk IMX_SC_R_I2C_2 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <24000000>;
@@ -198,7 +198,7 @@ adma_subsys: bus@59000000 {
 		reg = <0x5a830000 0x4000>;
 		interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-parent = <&gic>;
-		clocks = <&adma_lpcg IMX_ADMA_LPCG_I2C3_CLK>;
+		clocks = <&i2c3_lpcg IMX_LPCG_CLK_0>;
 		clock-names = "per";
 		assigned-clocks = <&clk IMX_SC_R_I2C_3 IMX_SC_PM_CLK_PER>;
 		assigned-clock-rates = <24000000>;
@@ -207,6 +207,7 @@ adma_subsys: bus@59000000 {
 	};
 
 	i2c0_lpcg: clock-controller@5ac00000 {
+		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5ac00000 0x10000>;
 		#clock-cells = <1>;
 		clocks = <&clk IMX_SC_R_I2C_0 IMX_SC_PM_CLK_PER>,
@@ -218,6 +219,7 @@ adma_subsys: bus@59000000 {
 	};
 
 	i2c1_lpcg: clock-controller@5ac10000 {
+		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5ac10000 0x10000>;
 		#clock-cells = <1>;
 		clocks = <&clk IMX_SC_R_I2C_1 IMX_SC_PM_CLK_PER>,
@@ -229,6 +231,7 @@ adma_subsys: bus@59000000 {
 	};
 
 	i2c2_lpcg: clock-controller@5ac20000 {
+		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5ac20000 0x10000>;
 		#clock-cells = <1>;
 		clocks = <&clk IMX_SC_R_I2C_2 IMX_SC_PM_CLK_PER>,
@@ -240,6 +243,7 @@ adma_subsys: bus@59000000 {
 	};
 
 	i2c3_lpcg: clock-controller@5ac30000 {
+		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5ac30000 0x10000>;
 		#clock-cells = <1>;
 		clocks = <&clk IMX_SC_R_I2C_3 IMX_SC_PM_CLK_PER>,
diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
index c04c939be58c..725349e297be 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-conn.dtsi
@@ -38,9 +38,9 @@ conn_subsys: bus@5b000000 {
 		interrupt-parent = <&gic>;
 		interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
 		reg = <0x5b010000 0x10000>;
-		clocks = <&conn_lpcg IMX_CONN_LPCG_SDHC0_IPG_CLK>,
-			 <&conn_lpcg IMX_CONN_LPCG_SDHC0_PER_CLK>,
-			 <&conn_lpcg IMX_CONN_LPCG_SDHC0_HCLK>;
+		clocks = <&sdhc0_lpcg IMX_LPCG_CLK_4>,
+			 <&sdhc0_lpcg IMX_LPCG_CLK_0>,
+			 <&sdhc0_lpcg IMX_LPCG_CLK_5>;
 		clock-names = "ipg", "per", "ahb";
 		power-domains = <&pd IMX_SC_R_SDHC_0>;
 		status = "disabled";
@@ -50,9 +50,9 @@ conn_subsys: bus@5b000000 {
 		interrupt-parent = <&gic>;
 		interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>;
 		reg = <0x5b020000 0x10000>;
-		clocks = <&conn_lpcg IMX_CONN_LPCG_SDHC1_IPG_CLK>,
-			 <&conn_lpcg IMX_CONN_LPCG_SDHC1_PER_CLK>,
-			 <&conn_lpcg IMX_CONN_LPCG_SDHC1_HCLK>;
+		clocks = <&sdhc1_lpcg IMX_LPCG_CLK_4>,
+			 <&sdhc1_lpcg IMX_LPCG_CLK_0>,
+			 <&sdhc1_lpcg IMX_LPCG_CLK_5>;
 		clock-names = "ipg", "per", "ahb";
 		power-domains = <&pd IMX_SC_R_SDHC_1>;
 		fsl,tuning-start-tap = <20>;
@@ -64,9 +64,9 @@ conn_subsys: bus@5b000000 {
 		interrupt-parent = <&gic>;
 		interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH>;
 		reg = <0x5b030000 0x10000>;
-		clocks = <&conn_lpcg IMX_CONN_LPCG_SDHC2_IPG_CLK>,
-			 <&conn_lpcg IMX_CONN_LPCG_SDHC2_PER_CLK>,
-			 <&conn_lpcg IMX_CONN_LPCG_SDHC2_HCLK>;
+		clocks = <&sdhc2_lpcg IMX_LPCG_CLK_4>,
+			 <&sdhc2_lpcg IMX_LPCG_CLK_0>,
+			 <&sdhc2_lpcg IMX_LPCG_CLK_5>;
 		clock-names = "ipg", "per", "ahb";
 		power-domains = <&pd IMX_SC_R_SDHC_2>;
 		status = "disabled";
@@ -78,10 +78,10 @@ conn_subsys: bus@5b000000 {
 			     <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&conn_lpcg IMX_CONN_LPCG_ENET0_IPG_CLK>,
-			 <&conn_lpcg IMX_CONN_LPCG_ENET0_AHB_CLK>,
-			 <&conn_lpcg IMX_CONN_LPCG_ENET0_TX_CLK>,
-			 <&conn_lpcg IMX_CONN_LPCG_ENET0_ROOT_CLK>;
+		clocks = <&enet0_lpcg IMX_LPCG_CLK_4>,
+			 <&enet0_lpcg IMX_LPCG_CLK_2>,
+			 <&enet0_lpcg IMX_LPCG_CLK_1>,
+			 <&enet0_lpcg IMX_LPCG_CLK_0>;
 		clock-names = "ipg", "ahb", "enet_clk_ref", "ptp";
 		fsl,num-tx-queues=<3>;
 		fsl,num-rx-queues=<3>;
@@ -95,10 +95,10 @@ conn_subsys: bus@5b000000 {
 				<GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&conn_lpcg IMX_CONN_LPCG_ENET1_IPG_CLK>,
-			 <&conn_lpcg IMX_CONN_LPCG_ENET1_AHB_CLK>,
-			 <&conn_lpcg IMX_CONN_LPCG_ENET1_TX_CLK>,
-			 <&conn_lpcg IMX_CONN_LPCG_ENET1_ROOT_CLK>;
+		clocks = <&enet1_lpcg IMX_LPCG_CLK_4>,
+			 <&enet1_lpcg IMX_LPCG_CLK_2>,
+			 <&enet1_lpcg IMX_LPCG_CLK_1>,
+			 <&enet1_lpcg IMX_LPCG_CLK_0>;
 		clock-names = "ipg", "ahb", "enet_clk_ref", "ptp";
 		fsl,num-tx-queues=<3>;
 		fsl,num-rx-queues=<3>;
@@ -107,12 +107,8 @@ conn_subsys: bus@5b000000 {
 	};
 
 	/* LPCG clocks */
-	conn_lpcg: clock-controller-legacy@5b200000 {
-		reg = <0x5b200000 0xb0000>;
-		#clock-cells = <1>;
-	};
-
 	sdhc0_lpcg: clock-controller@5b200000 {
+		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5b200000 0x10000>;
 		#clock-cells = <1>;
 		clocks = <&clk IMX_SC_R_SDHC_0 IMX_SC_PM_CLK_PER>,
@@ -126,6 +122,7 @@ conn_subsys: bus@5b000000 {
 	};
 
 	sdhc1_lpcg: clock-controller@5b210000 {
+		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5b210000 0x10000>;
 		#clock-cells = <1>;
 		clocks = <&clk IMX_SC_R_SDHC_1 IMX_SC_PM_CLK_PER>,
@@ -139,6 +136,7 @@ conn_subsys: bus@5b000000 {
 	};
 
 	sdhc2_lpcg: clock-controller@5b220000 {
+		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5b220000 0x10000>;
 		#clock-cells = <1>;
 		clocks = <&clk IMX_SC_R_SDHC_2 IMX_SC_PM_CLK_PER>,
@@ -152,6 +150,7 @@ conn_subsys: bus@5b000000 {
 	};
 
 	enet0_lpcg: clock-controller@5b230000 {
+		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5b230000 0x10000>;
 		#clock-cells = <1>;
 		clocks = <&clk IMX_SC_R_ENET_0 IMX_SC_PM_CLK_PER>,
@@ -169,6 +168,7 @@ conn_subsys: bus@5b000000 {
 	};
 
 	enet1_lpcg: clock-controller@5b240000 {
+		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5b240000 0x10000>;
 		#clock-cells = <1>;
 		clocks = <&clk IMX_SC_R_ENET_1 IMX_SC_PM_CLK_PER>,
diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi
index 4aa84c4dbb36..c21e0818887b 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-lsio.dtsi
@@ -149,12 +149,8 @@ lsio_subsys: bus@5d000000 {
 	};
 
 	/* LPCG clocks */
-	lsio_lpcg: clock-controller-legacy@5d400000 {
-		reg = <0x5d400000 0x400000>;
-		#clock-cells = <1>;
-	};
-
 	pwm0_lpcg: clock-controller@5d400000 {
+		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5d400000 0x10000>;
 		#clock-cells = <1>;
 		clocks = <&clk IMX_SC_R_PWM_0 IMX_SC_PM_CLK_PER>,
@@ -174,6 +170,7 @@ lsio_subsys: bus@5d000000 {
 	};
 
 	pwm1_lpcg: clock-controller@5d410000 {
+		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5d410000 0x10000>;
 		#clock-cells = <1>;
 		clocks = <&clk IMX_SC_R_PWM_1 IMX_SC_PM_CLK_PER>,
@@ -193,6 +190,7 @@ lsio_subsys: bus@5d000000 {
 	};
 
 	pwm2_lpcg: clock-controller@5d420000 {
+		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5d420000 0x10000>;
 		#clock-cells = <1>;
 		clocks = <&clk IMX_SC_R_PWM_2 IMX_SC_PM_CLK_PER>,
@@ -212,6 +210,7 @@ lsio_subsys: bus@5d000000 {
 	};
 
 	pwm3_lpcg: clock-controller@5d430000 {
+		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5d430000 0x10000>;
 		#clock-cells = <1>;
 		clocks = <&clk IMX_SC_R_PWM_3 IMX_SC_PM_CLK_PER>,
@@ -231,6 +230,7 @@ lsio_subsys: bus@5d000000 {
 	};
 
 	pwm4_lpcg: clock-controller@5d440000 {
+		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5d440000 0x10000>;
 		#clock-cells = <1>;
 		clocks = <&clk IMX_SC_R_PWM_4 IMX_SC_PM_CLK_PER>,
@@ -250,6 +250,7 @@ lsio_subsys: bus@5d000000 {
 	};
 
 	pwm5_lpcg: clock-controller@5d450000 {
+		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5d450000 0x10000>;
 		#clock-cells = <1>;
 		clocks = <&clk IMX_SC_R_PWM_5 IMX_SC_PM_CLK_PER>,
@@ -269,6 +270,7 @@ lsio_subsys: bus@5d000000 {
 	};
 
 	pwm6_lpcg: clock-controller@5d460000 {
+		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5d460000 0x10000>;
 		#clock-cells = <1>;
 		clocks = <&clk IMX_SC_R_PWM_6 IMX_SC_PM_CLK_PER>,
@@ -288,6 +290,7 @@ lsio_subsys: bus@5d000000 {
 	};
 
 	pwm7_lpcg: clock-controller@5d470000 {
+		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5d470000 0x10000>;
 		#clock-cells = <1>;
 		clocks = <&clk IMX_SC_R_PWM_7 IMX_SC_PM_CLK_PER>,
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-adma.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-adma.dtsi
index 5809324de8df..c80303d5cc78 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-adma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-adma.dtsi
@@ -4,10 +4,6 @@
  *	Dong Aisheng <aisheng.dong@nxp.com>
  */
 
-&adma_lpcg {
-	compatible = "fsl,imx8qxp-lpcg-adma";
-};
-
 &adma_lpuart0 {
 	compatible = "fsl,imx8qxp-lpuart", "fsl,imx7ulp-lpuart";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-conn.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-conn.dtsi
index ea0cd518680b..8dd22bdd72c0 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-conn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-conn.dtsi
@@ -4,10 +4,6 @@
  *	Dong Aisheng <aisheng.dong@nxp.com>
  */
 
-&conn_lpcg {
-	compatible = "fsl,imx8qxp-lpcg-conn";
-};
-
 &usdhc1 {
 	compatible = "fsl,imx8qxp-usdhc", "fsl,imx7d-usdhc";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-lsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-lsio.dtsi
index b02ae5df597f..1c3d1171c1c3 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-lsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-lsio.dtsi
@@ -59,7 +59,3 @@
 &lsio_mu13 {
 	compatible = "fsl,imx8qxp-mu", "fsl,imx6sx-mu";
 };
-
-&lsio_lpcg {
-	compatible = "fsl,imx8qxp-lpcg-lsio";
-};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index eb2f3765334e..4281dd68ded2 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/clock/imx8-clock.h>
+#include <dt-bindings/clock/imx8-lpcg.h>
 #include <dt-bindings/firmware/imx/rsrc.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
-- 
2.23.0


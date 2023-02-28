Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE73BC64EC4
	for <linux-clk@archiver.kernel.org>; Tue, 28 Feb 2023 21:53:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbjB1VxE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 16:53:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbjB1VxD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 16:53:03 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99F5A4C32;
        Tue, 28 Feb 2023 13:52:58 -0800 (PST)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id AA1A985ACD;
        Tue, 28 Feb 2023 22:52:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1677621176;
        bh=t2UEnYhPrB+7hBbMBMusw0w1m6fEnb2ItsRXmtThsYc=;
        h=From:To:Cc:Subject:Date:From;
        b=sxDBgm4Rq6r8x3W0wMnQk2eMlS8y1Xj0xX9ciNzhy2NFZzzhmOcHCA727TiikqiaX
         DqeZDXbppubrgg774u3cMJN+jZ3oiLa/iH+ibUGMBqsacwyiS8vOq4sXRlpvmGPXjy
         ljthqt8ScijyKUdSeBb0dqDYzQo/OwPcnOzgKfTHzaFUmA/SSxfeXzkB2RYUdL43rZ
         1s0Flz9vJ/ncUIzwQmkc3T5SCnouDpZ+ZYhHj9jslbc93FY9u/PTComkNvDOQI8aQc
         PrHmIdaMV6eoHwSfCq+XEOBZXceEtV2jvfxGSIVzrBRwTU1cmMP3mwWoAtLRMh8uc4
         RaB5MPixfBNFw==
From:   Marek Vasut <marex@denx.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marex@denx.de>, Adam Ford <aford173@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH v2] arm64: dts: imx8mn: specify #sound-dai-cells for SAI nodes
Date:   Tue, 28 Feb 2023 22:52:44 +0100
Message-Id: <20230228215244.166627-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add #sound-dai-cells properties to SAI nodes.

Reviewed-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Fixes: 9e9860069725 ("arm64: dts: imx8mn: Add SAI nodes")
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jacky Bai <ping.bai@nxp.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Marco Felsch <m.felsch@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Richard Cochran <richardcochran@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
V2: - Add RB from Adam and Fabio
    - Add Fixes tag
    - Move sound-dai-cells below regs
---
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index ed9ac6c5047c0..9e0ddd6b7a322 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -296,6 +296,7 @@ spba2: spba-bus@30000000 {
 				sai2: sai@30020000 {
 					compatible = "fsl,imx8mn-sai", "fsl,imx8mq-sai";
 					reg = <0x30020000 0x10000>;
+					#sound-dai-cells = <0>;
 					interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&clk IMX8MN_CLK_SAI2_IPG>,
 						<&clk IMX8MN_CLK_DUMMY>,
@@ -310,6 +311,7 @@ sai2: sai@30020000 {
 				sai3: sai@30030000 {
 					compatible = "fsl,imx8mn-sai", "fsl,imx8mq-sai";
 					reg = <0x30030000 0x10000>;
+					#sound-dai-cells = <0>;
 					interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&clk IMX8MN_CLK_SAI3_IPG>,
 						 <&clk IMX8MN_CLK_DUMMY>,
@@ -324,6 +326,7 @@ sai3: sai@30030000 {
 				sai5: sai@30050000 {
 					compatible = "fsl,imx8mn-sai", "fsl,imx8mq-sai";
 					reg = <0x30050000 0x10000>;
+					#sound-dai-cells = <0>;
 					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&clk IMX8MN_CLK_SAI5_IPG>,
 						 <&clk IMX8MN_CLK_DUMMY>,
@@ -340,6 +343,7 @@ sai5: sai@30050000 {
 				sai6: sai@30060000 {
 					compatible = "fsl,imx8mn-sai", "fsl,imx8mq-sai";
 					reg = <0x30060000  0x10000>;
+					#sound-dai-cells = <0>;
 					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&clk IMX8MN_CLK_SAI6_IPG>,
 						 <&clk IMX8MN_CLK_DUMMY>,
@@ -397,6 +401,7 @@ spdif1: spdif@30090000 {
 				sai7: sai@300b0000 {
 					compatible = "fsl,imx8mn-sai", "fsl,imx8mq-sai";
 					reg = <0x300b0000 0x10000>;
+					#sound-dai-cells = <0>;
 					interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
 					clocks = <&clk IMX8MN_CLK_SAI7_IPG>,
 						 <&clk IMX8MN_CLK_DUMMY>,
-- 
2.39.2


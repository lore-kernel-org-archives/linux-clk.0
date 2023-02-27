Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F21A0C64ED6
	for <linux-clk@archiver.kernel.org>; Mon, 27 Feb 2023 17:45:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbjB0Rp4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Feb 2023 12:45:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbjB0Rpy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Feb 2023 12:45:54 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 587F610EF;
        Mon, 27 Feb 2023 09:45:48 -0800 (PST)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 2EC6380EB1;
        Mon, 27 Feb 2023 18:45:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1677519947;
        bh=s3tTRZE4HZaWKAnUwXLQPhfjfboLn8AJ6uHNE7xV0Dg=;
        h=From:To:Cc:Subject:Date:From;
        b=zjJfCXfEj427QRw5WPpRUfXpeuYEaw7UyNinS4B/rLplxIYUrCmpfOarrDpcbDh6S
         /2SjPl+hEb2zog5gn0THNZuEns4fd85FqSrHQ2afiafnoGjnlYs+n0UL5pvSslauzN
         x0vpsK/cGyEGGLMcMlT12aK5zBqHvBa3bLu294L7yYUKqX/c0AzwW2HGLtXWI6Q2Mr
         KU58ppj2dDP9OxEh0f3lWb1Zld1CKpOEBQaxbL9zr3SGsO8WKz9VgG39LkZUfa74vU
         Xil2p3Ji8sEzoPhaog0FIA1in0DWIAfDK6Vg/VbJwY6yvM5WmK9E4q7cTuyTfFwhYq
         oKNvjzVogVDfg==
From:   Marek Vasut <marex@denx.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marex@denx.de>, Abel Vesa <abelvesa@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Fabio Estevam <festevam@gmail.com>,
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
Subject: [PATCH] arm64: dts: imx8mn: specify #sound-dai-cells for SAI nodes
Date:   Mon, 27 Feb 2023 18:45:35 +0100
Message-Id: <20230227174535.87657-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add #sound-dai-cells properties to SAI nodes.

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
 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index ed9ac6c5047c0..bbec860ef8548 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -294,6 +294,7 @@ spba2: spba-bus@30000000 {
 				ranges;
 
 				sai2: sai@30020000 {
+					#sound-dai-cells = <0>;
 					compatible = "fsl,imx8mn-sai", "fsl,imx8mq-sai";
 					reg = <0x30020000 0x10000>;
 					interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
@@ -308,6 +309,7 @@ sai2: sai@30020000 {
 				};
 
 				sai3: sai@30030000 {
+					#sound-dai-cells = <0>;
 					compatible = "fsl,imx8mn-sai", "fsl,imx8mq-sai";
 					reg = <0x30030000 0x10000>;
 					interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
@@ -322,6 +324,7 @@ sai3: sai@30030000 {
 				};
 
 				sai5: sai@30050000 {
+					#sound-dai-cells = <0>;
 					compatible = "fsl,imx8mn-sai", "fsl,imx8mq-sai";
 					reg = <0x30050000 0x10000>;
 					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
@@ -338,6 +341,7 @@ sai5: sai@30050000 {
 				};
 
 				sai6: sai@30060000 {
+					#sound-dai-cells = <0>;
 					compatible = "fsl,imx8mn-sai", "fsl,imx8mq-sai";
 					reg = <0x30060000  0x10000>;
 					interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
@@ -395,6 +399,7 @@ spdif1: spdif@30090000 {
 				};
 
 				sai7: sai@300b0000 {
+					#sound-dai-cells = <0>;
 					compatible = "fsl,imx8mn-sai", "fsl,imx8mq-sai";
 					reg = <0x300b0000 0x10000>;
 					interrupts = <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.39.2


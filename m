Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA4AC4332D
	for <linux-clk@archiver.kernel.org>; Fri, 19 Feb 2021 16:03:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0764D64EB1
	for <linux-clk@archiver.kernel.org>; Fri, 19 Feb 2021 16:03:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhBSQC6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Feb 2021 11:02:58 -0500
Received: from inva020.nxp.com ([92.121.34.13]:36934 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229996AbhBSQCf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Feb 2021 11:02:35 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 440131A0074;
        Fri, 19 Feb 2021 17:01:06 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 3EA701A02E8;
        Fri, 19 Feb 2021 17:01:06 +0100 (CET)
Received: from fsr-ub1664-175.ea.freescale.net (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 96D302042F;
        Fri, 19 Feb 2021 17:01:05 +0100 (CET)
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Lucas Stach <l.stach@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Georgi Djakov <djakov@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Martin Kepplinger <martink@posteo.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     NXP Linux Team <linux-imx@nxp.com>, Abel Vesa <abel.vesa@nxp.com>
Subject: [RFC 13/19] arm64: dts: imx8mq: Add fsl,icc-id property to ddrc node
Date:   Fri, 19 Feb 2021 18:00:10 +0200
Message-Id: <1613750416-11901-14-git-send-email-abel.vesa@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1613750416-11901-1-git-send-email-abel.vesa@nxp.com>
References: <1613750416-11901-1-git-send-email-abel.vesa@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The fsl,icc-id property here is used to link the icc node
registered by the imx8mq interconnect driver with the ddrc
device.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 17c449e12c2e..ac229a8288cd 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -1433,10 +1433,12 @@ ddrc: memory-controller@3d400000 {
 			compatible = "fsl,imx8mq-ddrc", "fsl,imx8m-ddrc";
 			reg = <0x3d400000 0x400000>;
 			clock-names = "core", "pll", "alt", "apb";
+			fsl,icc-id = <IMX8MQ_ICS_DRAM>;
 			clocks = <&clk IMX8MQ_CLK_DRAM_CORE>,
 				 <&clk IMX8MQ_DRAM_PLL_OUT>,
 				 <&clk IMX8MQ_CLK_DRAM_ALT>,
 				 <&clk IMX8MQ_CLK_DRAM_APB>;
+			#interconnect-cells = <0>;
 		};
 
 		ddr-pmu@3d800000 {
-- 
2.29.2


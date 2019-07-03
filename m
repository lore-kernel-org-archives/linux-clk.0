Return-Path: <SRS0=btre=VA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42FEBC5B578
	for <linux-clk@archiver.kernel.org>; Wed,  3 Jul 2019 07:32:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1BD5F21881
	for <linux-clk@archiver.kernel.org>; Wed,  3 Jul 2019 07:32:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbfGCHcn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Jul 2019 03:32:43 -0400
Received: from inva021.nxp.com ([92.121.34.21]:45458 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726327AbfGCHcn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 3 Jul 2019 03:32:43 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 986AE2000AF;
        Wed,  3 Jul 2019 09:32:41 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B6B89200363;
        Wed,  3 Jul 2019 09:32:31 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 2C486402EC;
        Wed,  3 Jul 2019 15:32:20 +0800 (SGT)
From:   jun.li@nxp.com
To:     shawnguo@kernel.org, sboyd@kernel.org, robh+dt@kernel.org
Cc:     mark.rutland@arm.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        mturquette@baylibre.com, Peter.Chen@nxp.com, ping.bai@nxp.com,
        leonard.crestez@nxp.com, daniel.baluta@nxp.com, jun.li@nxp.com,
        Anson.Huang@nxp.com, aisheng.dong@nxp.com, peng.fan@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: imx8mm: Remove setting for IMX8MM_CLK_USB_CORE_REF
Date:   Wed,  3 Jul 2019 15:23:26 +0800
Message-Id: <20190703072327.38165-2-jun.li@nxp.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20190703072327.38165-1-jun.li@nxp.com>
References: <20190703072327.38165-1-jun.li@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

Since IMX8MM_CLK_USB_CORE_REF is not used at all, so remove the setting
for it.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 232a741..5d691a5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -743,10 +743,8 @@
 				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MM_CLK_USB1_CTRL_ROOT>;
 				clock-names = "usb1_ctrl_root_clk";
-				assigned-clocks = <&clk IMX8MM_CLK_USB_BUS>,
-						  <&clk IMX8MM_CLK_USB_CORE_REF>;
-				assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_500M>,
-							 <&clk IMX8MM_SYS_PLL1_100M>;
+				assigned-clocks = <&clk IMX8MM_CLK_USB_BUS>;
+				assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_500M>;
 				fsl,usbphy = <&usbphynop1>;
 				fsl,usbmisc = <&usbmisc1 0>;
 				status = "disabled";
@@ -764,10 +762,8 @@
 				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clk IMX8MM_CLK_USB1_CTRL_ROOT>;
 				clock-names = "usb1_ctrl_root_clk";
-				assigned-clocks = <&clk IMX8MM_CLK_USB_BUS>,
-						  <&clk IMX8MM_CLK_USB_CORE_REF>;
-				assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_500M>,
-							 <&clk IMX8MM_SYS_PLL1_100M>;
+				assigned-clocks = <&clk IMX8MM_CLK_USB_BUS>;
+				assigned-clock-parents = <&clk IMX8MM_SYS_PLL2_500M>;
 				fsl,usbphy = <&usbphynop2>;
 				fsl,usbmisc = <&usbmisc2 0>;
 				status = "disabled";
-- 
2.7.4


Return-Path: <SRS0=+/2J=VH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A1DCC004EF
	for <linux-clk@archiver.kernel.org>; Wed, 10 Jul 2019 11:28:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F3A642064A
	for <linux-clk@archiver.kernel.org>; Wed, 10 Jul 2019 11:28:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727102AbfGJL2o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Jul 2019 07:28:44 -0400
Received: from inva021.nxp.com ([92.121.34.21]:47392 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725956AbfGJL2o (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 10 Jul 2019 07:28:44 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 790D82002DA;
        Wed, 10 Jul 2019 13:28:42 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B7E8320070E;
        Wed, 10 Jul 2019 13:28:31 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id AD956402E3;
        Wed, 10 Jul 2019 19:28:18 +0800 (SGT)
From:   jun.li@nxp.com
To:     shawnguo@kernel.org, sboyd@kernel.org, robh+dt@kernel.org
Cc:     mark.rutland@arm.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        mturquette@baylibre.com, peter.chen@nxp.com, ping.bai@nxp.com,
        jun.li@nxp.com, Anson.Huang@nxp.com, l.stach@pengutronix.de,
        abel.vesa@nxp.com, andrew.smirnov@gmail.com, ccaione@baylibre.com,
        angus@akkea.ca, agx@sigxcpu.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: imx8mq: correct usb controller clocks
Date:   Wed, 10 Jul 2019 19:19:17 +0800
Message-Id: <20190710111917.6615-2-jun.li@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20190710111917.6615-1-jun.li@nxp.com>
References: <20190710111917.6615-1-jun.li@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

The correct clock for "bus_early", "ref", "suspend" should be:
IMX8MQ_CLK_USB1_CTRL_ROOT, IMX8MQ_CLK_USB_CORE_REF, IMX8MQ_CLK_32K,
especially we may need the right suspend clock rate to set register
in controller driver.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d09b808..a43ddac 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -901,9 +901,9 @@
 		usb_dwc3_0: usb@38100000 {
 			compatible = "fsl,imx8mq-dwc3", "snps,dwc3";
 			reg = <0x38100000 0x10000>;
-			clocks = <&clk IMX8MQ_CLK_USB_BUS>,
+			clocks = <&clk IMX8MQ_CLK_USB1_CTRL_ROOT>,
 			         <&clk IMX8MQ_CLK_USB_CORE_REF>,
-			         <&clk IMX8MQ_CLK_USB1_CTRL_ROOT>;
+				 <&clk IMX8MQ_CLK_32K>;
 			clock-names = "bus_early", "ref", "suspend";
 			assigned-clocks = <&clk IMX8MQ_CLK_USB_BUS>,
 			                  <&clk IMX8MQ_CLK_USB_CORE_REF>;
@@ -933,9 +933,9 @@
 		usb_dwc3_1: usb@38200000 {
 			compatible = "fsl,imx8mq-dwc3", "snps,dwc3";
 			reg = <0x38200000 0x10000>;
-			clocks = <&clk IMX8MQ_CLK_USB_BUS>,
+			clocks = <&clk IMX8MQ_CLK_USB2_CTRL_ROOT>,
 			         <&clk IMX8MQ_CLK_USB_CORE_REF>,
-			         <&clk IMX8MQ_CLK_USB2_CTRL_ROOT>;
+				 <&clk IMX8MQ_CLK_32K>;
 			clock-names = "bus_early", "ref", "suspend";
 			assigned-clocks = <&clk IMX8MQ_CLK_USB_BUS>,
 			                  <&clk IMX8MQ_CLK_USB_CORE_REF>;
-- 
2.7.4


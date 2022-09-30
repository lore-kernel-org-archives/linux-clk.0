Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70906C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 06:21:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbiI3GV6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 02:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbiI3GV5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 02:21:57 -0400
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07D09140190
        for <linux-clk@vger.kernel.org>; Thu, 29 Sep 2022 23:21:56 -0700 (PDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0D908221C99;
        Fri, 30 Sep 2022 08:21:55 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CAB93221C97;
        Fri, 30 Sep 2022 08:21:54 +0200 (CEST)
Received: from local (shlinux2.ap.freescale.net [10.192.224.44])
        by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 3C8951820F5D;
        Fri, 30 Sep 2022 14:21:53 +0800 (+08)
From:   haibo.chen@nxp.com
To:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de
Cc:     festevam@gmail.com, linux-clk@vger.kernel.org, linux-imx@nxp.com,
        haibo.chen@nxp.com, peng.fan@nxp.com, ping.bai@nxp.com
Subject: [PATCH] clk: imx93: correct the flexspi1 clock setting
Date:   Fri, 30 Sep 2022 14:02:39 +0800
Message-Id: <1664517759-19807-1-git-send-email-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Haibo Chen <haibo.chen@nxp.com>

Correct IMX93_CLK_FLEXSPI1_GATE CCGR setting. Otherwise the flexspi
always can't be assigned to a parent clock when dump the clock tree.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/clk/imx/clk-imx93.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx93.c b/drivers/clk/imx/clk-imx93.c
index 99cff1fd108b..40ecee3b5e78 100644
--- a/drivers/clk/imx/clk-imx93.c
+++ b/drivers/clk/imx/clk-imx93.c
@@ -170,7 +170,7 @@ static const struct imx93_clk_ccgr {
 	{ IMX93_CLK_MU2_B_GATE,		"mu2_b",	"bus_wakeup_root",	0x8500, 0, &share_count_mub },
 	{ IMX93_CLK_EDMA1_GATE,		"edma1",	"m33_root",		0x8540, },
 	{ IMX93_CLK_EDMA2_GATE,		"edma2",	"wakeup_axi_root",	0x8580, },
-	{ IMX93_CLK_FLEXSPI1_GATE,	"flexspi",	"flexspi_root",		0x8640, },
+	{ IMX93_CLK_FLEXSPI1_GATE,	"flexspi1",	"flexspi1_root",	0x8640, },
 	{ IMX93_CLK_GPIO1_GATE,		"gpio1",	"m33_root",		0x8880, },
 	{ IMX93_CLK_GPIO2_GATE,		"gpio2",	"bus_wakeup_root",	0x88c0, },
 	{ IMX93_CLK_GPIO3_GATE,		"gpio3",	"bus_wakeup_root",	0x8900, },
-- 
2.34.1


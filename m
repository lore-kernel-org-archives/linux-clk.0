Return-Path: <SRS0=d2gX=2G=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2668C43603
	for <linux-clk@archiver.kernel.org>; Mon, 16 Dec 2019 10:02:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E94320CC7
	for <linux-clk@archiver.kernel.org>; Mon, 16 Dec 2019 10:02:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727199AbfLPKCG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Dec 2019 05:02:06 -0500
Received: from inva021.nxp.com ([92.121.34.21]:38794 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726992AbfLPKCG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 16 Dec 2019 05:02:06 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 5628620153D;
        Mon, 16 Dec 2019 11:02:04 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 28B9520097B;
        Mon, 16 Dec 2019 11:02:02 +0100 (CET)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 139C5402DA;
        Mon, 16 Dec 2019 18:01:59 +0800 (SGT)
From:   Yangbo Lu <yangbo.lu@nxp.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Yangbo Lu <yangbo.lu@nxp.com>
Subject: [PATCH] clk: qoriq: add ls1088a hwaccel clocks support
Date:   Mon, 16 Dec 2019 18:01:11 +0800
Message-Id: <20191216100111.17122-1-yangbo.lu@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch is to add hwaccel clocks information for ls1088a.

Signed-off-by: Yangbo Lu <yangbo.lu@nxp.com>
---
 drivers/clk/clk-qoriq.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index bed140f..d5946f7 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -342,6 +342,32 @@ static const struct clockgen_muxinfo ls1046a_hwa2 = {
 	},
 };
 
+static const struct clockgen_muxinfo ls1088a_hwa1 = {
+	{
+		{},
+		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV1 },
+		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV2 },
+		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV3 },
+		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV4 },
+		{},
+		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV2 },
+		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV3 },
+	},
+};
+
+static const struct clockgen_muxinfo ls1088a_hwa2 = {
+	{
+		{},
+		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV1 },
+		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV2 },
+		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV3 },
+		{ CLKSEL_VALID, CGA_PLL2, PLL_DIV4 },
+		{},
+		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV2 },
+		{ CLKSEL_VALID, CGA_PLL1, PLL_DIV3 },
+	},
+};
+
 static const struct clockgen_muxinfo ls1012a_cmux = {
 	{
 		[0] = { CLKSEL_VALID, CGA_PLL1, PLL_DIV1 },
@@ -607,6 +633,9 @@ static const struct clockgen_chipinfo chipinfo[] = {
 		.cmux_groups = {
 			&clockgen2_cmux_cga12
 		},
+		.hwaccel = {
+			&ls1088a_hwa1, &ls1088a_hwa2
+		},
 		.cmux_to_group = {
 			0, 0, -1
 		},
-- 
2.7.4


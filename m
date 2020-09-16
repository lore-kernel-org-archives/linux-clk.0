Return-Path: <SRS0=aoxw=CZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3943C43461
	for <linux-clk@archiver.kernel.org>; Wed, 16 Sep 2020 03:49:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C2B38221F0
	for <linux-clk@archiver.kernel.org>; Wed, 16 Sep 2020 03:49:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgIPDta (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Sep 2020 23:49:30 -0400
Received: from inva020.nxp.com ([92.121.34.13]:40266 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726353AbgIPDsz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 15 Sep 2020 23:48:55 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 038031A0BB2;
        Wed, 16 Sep 2020 05:48:54 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 92AB41A0C11;
        Wed, 16 Sep 2020 05:48:50 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id D6ADF409AD;
        Wed, 16 Sep 2020 05:11:20 +0200 (CEST)
From:   Qiang Zhao <qiang.zhao@nxp.com>
To:     shawnguo@kernel.org, robh+dt@kernel.org, mturquette@baylibre.com
Cc:     andy.tang@nxp.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Zhao Qiang <qiang.zhao@nxp.com>
Subject: [PATCH 1/2] clk: qoriq: modify MAX_PLL_DIV to 32
Date:   Wed, 16 Sep 2020 11:03:10 +0800
Message-Id: <20200916030311.17280-1-qiang.zhao@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Zhao Qiang <qiang.zhao@nxp.com>

On LS2088A, Watchdog need clk divided by 32,
so modify MAX_PLL_DIV to 32

Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
---
 drivers/clk/clk-qoriq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index 5942e98..46101c6 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -31,7 +31,7 @@
 #define CGA_PLL4	4	/* only on clockgen-1.0, which lacks CGB */
 #define CGB_PLL1	4
 #define CGB_PLL2	5
-#define MAX_PLL_DIV	16
+#define MAX_PLL_DIV	32
 
 struct clockgen_pll_div {
 	struct clk *clk;
-- 
2.7.4


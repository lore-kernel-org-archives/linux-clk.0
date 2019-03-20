Return-Path: <SRS0=YCcY=RX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64683C10F05
	for <linux-clk@archiver.kernel.org>; Wed, 20 Mar 2019 10:25:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 366AC2186A
	for <linux-clk@archiver.kernel.org>; Wed, 20 Mar 2019 10:25:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727404AbfCTKZP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Mar 2019 06:25:15 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:54192 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbfCTKZP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 20 Mar 2019 06:25:15 -0400
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id qARD1z00C3XaVaC01ARDN6; Wed, 20 Mar 2019 11:25:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h6YPJ-0005Gw-8F; Wed, 20 Mar 2019 11:25:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h6YPJ-00058A-6N; Wed, 20 Mar 2019 11:25:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: r7s9210: Always use readl()
Date:   Wed, 20 Mar 2019 11:25:12 +0100
Message-Id: <20190320102512.19677-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On arm32, there is no reason to use the (soon deprecated) clk_readl().
Hence use the generic readl() instead.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v5.2.

 drivers/clk/renesas/r7s9210-cpg-mssr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r7s9210-cpg-mssr.c b/drivers/clk/renesas/r7s9210-cpg-mssr.c
index 57c49fe8829567e1..cf65d4e0e1166647 100644
--- a/drivers/clk/renesas/r7s9210-cpg-mssr.c
+++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
@@ -11,6 +11,7 @@
 
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
+#include <linux/io.h>
 #include <dt-bindings/clock/r7s9210-cpg-mssr.h>
 #include "renesas-cpg-mssr.h"
 
@@ -119,7 +120,7 @@ static void __init r7s9210_update_clk_table(struct clk *extal_clk,
 	if (clk_get_rate(extal_clk) > 12000000)
 		cpg_mode = 1;
 
-	frqcr = clk_readl(base + CPG_FRQCR) & 0xFFF;
+	frqcr = readl(base + CPG_FRQCR) & 0xFFF;
 	if (frqcr == 0x012)
 		index = 0;
 	else if (frqcr == 0x112)
-- 
2.17.1


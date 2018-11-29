Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A2EC169D4
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 10:50:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 07AF620863
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 10:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07AF620863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728113AbeK2VzZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Nov 2018 16:55:25 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:41454 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728110AbeK2VzY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Nov 2018 16:55:24 -0500
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id 5mqS1z0043XaVaC01mqSeD; Thu, 29 Nov 2018 11:50:26 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gSJto-0002Fy-Hm; Thu, 29 Nov 2018 11:50:24 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gSJto-0002gn-GQ; Thu, 29 Nov 2018 11:50:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 13/13] clk: renesas: r8a77995: Simplify PLL3 multiplier/divider
Date:   Thu, 29 Nov 2018 11:50:08 +0100
Message-Id: <20181129105008.10239-14-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181129105008.10239-1-geert+renesas@glider.be>
References: <20181129105008.10239-1-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

116/6 can be simplified to 58/3.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
index b9745665731fac7e..eee3874865a95b1a 100644
--- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -191,14 +191,14 @@ static const unsigned int r8a77995_crit_mod_clks[] __initconst = {
  * MD19		EXTAL (MHz)	PLL0		PLL1		PLL3
  *--------------------------------------------------------------------
  * 0		48 x 1		x250/4		x100/3		x100/3
- * 1		48 x 1		x250/4		x100/3		x116/6
+ * 1		48 x 1		x250/4		x100/3		x58/3
  */
 #define CPG_PLL_CONFIG_INDEX(md)	(((md) & BIT(19)) >> 19)
 
 static const struct rcar_gen3_cpg_pll_config cpg_pll_configs[2] __initconst = {
 	/* EXTAL div	PLL1 mult/div	PLL3 mult/div */
 	{ 1,		100,	3,	100,	3,	},
-	{ 1,		100,	3,	116,	6,	},
+	{ 1,		100,	3,	58,	3,	},
 };
 
 static int __init r8a77995_cpg_mssr_init(struct device *dev)
-- 
2.17.1


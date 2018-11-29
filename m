Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8462C43610
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 10:50:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AC96E2081B
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 10:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC96E2081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727260AbeK2Vz0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Nov 2018 16:55:26 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:54612 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728107AbeK2VzX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Nov 2018 16:55:23 -0500
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id 5mqR1z01S3XaVaC01mqRpF; Thu, 29 Nov 2018 11:50:26 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gSJto-0002E1-8H; Thu, 29 Nov 2018 11:50:24 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gSJto-0002gR-6W; Thu, 29 Nov 2018 11:50:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 06/13] clk: renesas: r8a77965: Add CPEX clock
Date:   Thu, 29 Nov 2018 11:50:01 +0100
Message-Id: <20181129105008.10239-7-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181129105008.10239-1-geert+renesas@glider.be>
References: <20181129105008.10239-1-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Implement support for the CPEX clock on R-Car M3-N.  This clock can be
selected as a clock source for CMT1 (Compare Match Timer Type 1).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a77965-cpg-mssr.c b/drivers/clk/renesas/r8a77965-cpg-mssr.c
index 1fcc411502da5e5f..eb1cca58a1e1ff07 100644
--- a/drivers/clk/renesas/r8a77965-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77965-cpg-mssr.c
@@ -100,6 +100,7 @@ static const struct cpg_core_clk r8a77965_core_clks[] __initconst = {
 
 	DEF_FIXED("cl",		R8A77965_CLK_CL,	CLK_PLL1_DIV2,	48, 1),
 	DEF_FIXED("cp",		R8A77965_CLK_CP,	CLK_EXTAL,	2, 1),
+	DEF_FIXED("cpex",	R8A77965_CLK_CPEX,	CLK_EXTAL,	2, 1),
 
 	DEF_DIV6P1("canfd",	R8A77965_CLK_CANFD,	CLK_PLL1_DIV4,	0x244),
 	DEF_DIV6P1("csi0",	R8A77965_CLK_CSI0,	CLK_PLL1_DIV4,	0x00c),
-- 
2.17.1


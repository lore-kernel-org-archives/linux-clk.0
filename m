Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D27C04EBA
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 10:50:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B53A20863
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 10:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B53A20863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbeK2VzX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Nov 2018 16:55:23 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:59278 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727851AbeK2VzX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Nov 2018 16:55:23 -0500
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id 5mqS1z00C3XaVaC06mqS7x; Thu, 29 Nov 2018 11:50:26 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gSJto-0002Fc-Gd; Thu, 29 Nov 2018 11:50:24 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gSJto-0002gk-Ev; Thu, 29 Nov 2018 11:50:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 12/13] clk: renesas: r8a77995: Add missing CPEX clock
Date:   Thu, 29 Nov 2018 11:50:07 +0100
Message-Id: <20181129105008.10239-13-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181129105008.10239-1-geert+renesas@glider.be>
References: <20181129105008.10239-1-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The R-Car Gen3 HardWare Manual Errata for Rev. 0.80 (Feb 28, 2018) added
the CPEX clock on R-Car D3.  This clock can be selected as a clock
source for CMT1 (Compare Match Timer Type 1).

Add the missing clock to the DT bindings header, and implement support
for it in the clock driver.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a77995-cpg-mssr.c       | 3 ++-
 include/dt-bindings/clock/r8a77995-cpg-mssr.h | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
index f2636a34c96c08ca..b9745665731fac7e 100644
--- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -22,7 +22,7 @@
 
 enum clk_ids {
 	/* Core Clock Outputs exported to DT */
-	LAST_DT_CORE_CLK = R8A77995_CLK_CP,
+	LAST_DT_CORE_CLK = R8A77995_CLK_CPEX,
 
 	/* External Input Clocks */
 	CLK_EXTAL,
@@ -92,6 +92,7 @@ static const struct cpg_core_clk r8a77995_core_clks[] __initconst = {
 
 	DEF_FIXED("cl",        R8A77995_CLK_CL,    CLK_PLL1,      48, 1),
 	DEF_FIXED("cp",        R8A77995_CLK_CP,    CLK_EXTAL,      2, 1),
+	DEF_FIXED("cpex",      R8A77995_CLK_CPEX,  CLK_EXTAL,      4, 1),
 
 	DEF_DIV6_RO("osc",     R8A77995_CLK_OSC,   CLK_EXTAL, CPG_RCKCR,  8),
 
diff --git a/include/dt-bindings/clock/r8a77995-cpg-mssr.h b/include/dt-bindings/clock/r8a77995-cpg-mssr.h
index 80b3c5ec9118b544..fd701c4e87cf0e22 100644
--- a/include/dt-bindings/clock/r8a77995-cpg-mssr.h
+++ b/include/dt-bindings/clock/r8a77995-cpg-mssr.h
@@ -49,5 +49,6 @@
 #define R8A77995_CLK_LV0		38
 #define R8A77995_CLK_LV1		39
 #define R8A77995_CLK_CP			40
+#define R8A77995_CLK_CPEX		41
 
 #endif /* __DT_BINDINGS_CLOCK_R8A77995_CPG_MSSR_H__ */
-- 
2.17.1


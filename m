Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 784CEC04EBF
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 10:50:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F9B62081B
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 10:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F9B62081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728110AbeK2VzZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Nov 2018 16:55:25 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:54614 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728101AbeK2VzY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Nov 2018 16:55:24 -0500
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id 5mqR1z01C3XaVaC01mqRpC; Thu, 29 Nov 2018 11:50:26 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gSJto-0002DJ-2n; Thu, 29 Nov 2018 11:50:24 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gSJto-0002gF-1H; Thu, 29 Nov 2018 11:50:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 02/13] dt-bindings: clock: r8a7796: Remove CSIREF clock
Date:   Thu, 29 Nov 2018 11:49:57 +0100
Message-Id: <20181129105008.10239-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181129105008.10239-1-geert+renesas@glider.be>
References: <20181129105008.10239-1-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The R-Car Gen3 HardWare Manual Errata for Rev. 0.52 (Nov 30, 2016)
removed the CSI reference clock on R-Car M3-W.

As this definition was never used, it can just be removed.
The freed slot in the DT bindings header must not be reused, though.

Fixes: 972610fb23b08dd5 ("clk: renesas: Add r8a7796 CPG Core Clock Definitions")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/dt-bindings/clock/r8a7796-cpg-mssr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/r8a7796-cpg-mssr.h b/include/dt-bindings/clock/r8a7796-cpg-mssr.h
index e6087f2f7e3aff4a..c0957cf458403bfb 100644
--- a/include/dt-bindings/clock/r8a7796-cpg-mssr.h
+++ b/include/dt-bindings/clock/r8a7796-cpg-mssr.h
@@ -56,7 +56,7 @@
 #define R8A7796_CLK_CANFD		45
 #define R8A7796_CLK_HDMI		46
 #define R8A7796_CLK_CSI0		47
-#define R8A7796_CLK_CSIREF		48
+/* CLK_CSIREF was removed */
 #define R8A7796_CLK_CP			49
 #define R8A7796_CLK_CPEX		50
 #define R8A7796_CLK_R			51
-- 
2.17.1


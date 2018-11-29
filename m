Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21914C4161B
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 10:50:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DC66120863
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 10:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC66120863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbeK2VzY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Nov 2018 16:55:24 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:46830 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728117AbeK2VzX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Nov 2018 16:55:23 -0500
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id 5mqS1z0053XaVaC01mqSph; Thu, 29 Nov 2018 11:50:26 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gSJto-0002Er-FA; Thu, 29 Nov 2018 11:50:24 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gSJto-0002gh-DM; Thu, 29 Nov 2018 11:50:24 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 11/13] clk: renesas: r8a77995: Remove non-existent SSP clocks
Date:   Thu, 29 Nov 2018 11:50:06 +0100
Message-Id: <20181129105008.10239-12-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181129105008.10239-1-geert+renesas@glider.be>
References: <20181129105008.10239-1-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The R-Car Gen3 HardWare Manual Errata for Rev. 0.80 (Dec 22, 2017, and
Feb 28, 2018) removed the SSPSRC, SSP1, and SSP2 clocks on R-Car D3, as
this SoC does not have a Stream and Security Processor.

As these definitions were never used, they can just be removed.
The freed slots in the DT bindings header must not be reused, though.

Fixes: 714c53aa2e2d6d60 ("clk: renesas: Add r8a77995 CPG Core Clock Definitions")
Fixes: d71e851d82c6cfe5 ("clk: renesas: cpg-mssr: Add R8A77995 support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r8a77995-cpg-mssr.c       | 1 -
 include/dt-bindings/clock/r8a77995-cpg-mssr.h | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/r8a77995-cpg-mssr.c b/drivers/clk/renesas/r8a77995-cpg-mssr.c
index 5cbdabc311f73de5..f2636a34c96c08ca 100644
--- a/drivers/clk/renesas/r8a77995-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a77995-cpg-mssr.c
@@ -42,7 +42,6 @@ enum clk_ids {
 	CLK_S2,
 	CLK_S3,
 	CLK_SDSRC,
-	CLK_SSPSRC,
 	CLK_RINT,
 	CLK_OCO,
 
diff --git a/include/dt-bindings/clock/r8a77995-cpg-mssr.h b/include/dt-bindings/clock/r8a77995-cpg-mssr.h
index 1eb11acfa563dbd8..80b3c5ec9118b544 100644
--- a/include/dt-bindings/clock/r8a77995-cpg-mssr.h
+++ b/include/dt-bindings/clock/r8a77995-cpg-mssr.h
@@ -35,8 +35,8 @@
 #define R8A77995_CLK_CRD2		24
 #define R8A77995_CLK_SD0H		25
 #define R8A77995_CLK_SD0		26
-#define R8A77995_CLK_SSP2		27
-#define R8A77995_CLK_SSP1		28
+/* CLK_SSP2 was removed */
+/* CLK_SSP1 was removed */
 #define R8A77995_CLK_RPC		29
 #define R8A77995_CLK_RPCD2		30
 #define R8A77995_CLK_ZA2		31
-- 
2.17.1


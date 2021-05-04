Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC84C433ED
	for <linux-clk@archiver.kernel.org>; Tue,  4 May 2021 09:17:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D545461078
	for <linux-clk@archiver.kernel.org>; Tue,  4 May 2021 09:17:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbhEDJSb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 May 2021 05:18:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbhEDJSb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 May 2021 05:18:31 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F20DC061574
        for <linux-clk@vger.kernel.org>; Tue,  4 May 2021 02:17:31 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1ca1:e52f:3ec5:3ac5])
        by laurent.telenet-ops.be with bizsmtp
        id 0ZHV2500U3aEpPb01ZHVfw; Tue, 04 May 2021 11:17:29 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldrBJ-002jDL-7w; Tue, 04 May 2021 11:17:29 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldrBI-00H7IP-JB; Tue, 04 May 2021 11:17:28 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Hai Nguyen Pham <hai.pham.ud@renesas.com>
Subject: [PATCH 1/2] clk: renesas: cpg-mssr: Remove unused [RM]MSTPCR() definitions
Date:   Tue,  4 May 2021 11:17:21 +0200
Message-Id: <2d8bc4d9806b419ebb06030d2f31b2ea1e59b1d6.1620119700.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1620119700.git.geert+renesas@glider.be>
References: <cover.1620119700.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Realtime Module Stop Control Register definitions (RMSTPCR(i)) are
incorrect for i >= 8 on R-Car Gen2 and Gen3.

As these are unused, and not planned to be used, just like the
corresponding Modem Module Stop Control Register definitions (MMSTPCR())
on R-Mobile APE6 (they are intended for the software running on the
Real-Time and Modem CPU cores), they can just be removed.

Reported-by: Hai Nguyen Pham <hai.pham.ud@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index fc531d35b269d3cd..c3230398e1c1b596 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -100,12 +100,6 @@ static const u16 srcr_for_v3u[] = {
 	0x2C20, 0x2C24, 0x2C28, 0x2C2C, 0x2C30, 0x2C34, 0x2C38,
 };
 
-/* Realtime Module Stop Control Register offsets */
-#define RMSTPCR(i)	(smstpcr[i] - 0x20)
-
-/* Modem Module Stop Control Register offsets (r8a73a4) */
-#define MMSTPCR(i)	(smstpcr[i] + 0x20)
-
 /* Software Reset Clearing Register offsets */
 
 static const u16 srstclr[] = {
-- 
2.25.1


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01959C433DB
	for <linux-clk@archiver.kernel.org>; Fri, 26 Mar 2021 12:09:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C002E61A27
	for <linux-clk@archiver.kernel.org>; Fri, 26 Mar 2021 12:09:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbhCZMI4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Mar 2021 08:08:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbhCZMIi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Mar 2021 08:08:38 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB7B8C0613AA
        for <linux-clk@vger.kernel.org>; Fri, 26 Mar 2021 05:08:36 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:5cae:bca6:def7:9f08])
        by xavier.telenet-ops.be with bizsmtp
        id l08b2400H53vE1T0108b91; Fri, 26 Mar 2021 13:08:35 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lPlGV-00AXPT-5C; Fri, 26 Mar 2021 13:08:35 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lPlGU-006cYq-49; Fri, 26 Mar 2021 13:08:34 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jiri Kosina <trivial@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] [trivial] clk: Drop double "if" in clk_core_determine_round_nolock() comment
Date:   Fri, 26 Mar 2021 13:08:33 +0100
Message-Id: <20210326120833.1578153-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The comments for clk_core_determine_round_nolock() contain a double
"if": one at the end of a line, followed by another one at the beginning
of the next line.  Drop the former.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8c1ed844b97ea643..d181c6d31d2290b5 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1330,7 +1330,7 @@ static int clk_core_determine_round_nolock(struct clk_core *core,
 		return 0;
 
 	/*
-	 * At this point, core protection will be disabled if
+	 * At this point, core protection will be disabled
 	 * - if the provider is not protected at all
 	 * - if the calling consumer is the only one which has exclusivity
 	 *   over the provider
-- 
2.25.1


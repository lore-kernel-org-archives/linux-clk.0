Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5693C433ED
	for <linux-clk@archiver.kernel.org>; Tue,  4 May 2021 09:17:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F6C2613BA
	for <linux-clk@archiver.kernel.org>; Tue,  4 May 2021 09:17:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbhEDJSX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 May 2021 05:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbhEDJSW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 May 2021 05:18:22 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0754C061574
        for <linux-clk@vger.kernel.org>; Tue,  4 May 2021 02:17:27 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1ca1:e52f:3ec5:3ac5])
        by michel.telenet-ops.be with bizsmtp
        id 0ZHS2500H3aEpPb06ZHS6Y; Tue, 04 May 2021 11:17:26 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldrBG-002jDH-2T; Tue, 04 May 2021 11:17:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldrBF-00H7IJ-D0; Tue, 04 May 2021 11:17:25 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] clk: renesas: cpg-mssr: Small cleaups
Date:   Tue,  4 May 2021 11:17:20 +0200
Message-Id: <cover.1620119700.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

Here are two small cleanups for the Renesas CPG/MSSR driver.
I plan to queue these in renesas-clk for v5.14.

Thanks!

Geert Uytterhoeven (2):
  clk: renesas: cpg-mssr: Remove unused [RM]MSTPCR() definitions
  clk: renesas: cpg-mssr: Make srstclr[] comment block consistent

 drivers/clk/renesas/renesas-cpg-mssr.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

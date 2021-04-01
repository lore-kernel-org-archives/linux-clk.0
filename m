Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B728C433ED
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 17:57:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C23C60BD3
	for <linux-clk@archiver.kernel.org>; Thu,  1 Apr 2021 17:57:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235716AbhDAR5T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Apr 2021 13:57:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235926AbhDARx3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Apr 2021 13:53:29 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A0DDC05BD22
        for <linux-clk@vger.kernel.org>; Thu,  1 Apr 2021 06:01:43 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7c3c:adbc:7a1a:b85f])
        by xavier.telenet-ops.be with bizsmtp
        id nR1g2400J4A7w6i01R1gp5; Thu, 01 Apr 2021 15:01:40 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lRwxA-00CBkC-04; Thu, 01 Apr 2021 15:01:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lRwx9-003mt8-IY; Thu, 01 Apr 2021 15:01:39 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/5] clk: renesas: div6: .determine_rate() conversion and improvements
Date:   Thu,  1 Apr 2021 15:01:33 +0200
Message-Id: <cover.1617281699.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

This patch series converts the Renesas DIV6 clock driver from the old
.round_rate() callback to the newer .determine_rate() callback, and
improves the driver to switch parent clocks.

This has been tested on R-Car Gen2, R-Car Gen3, SH-Mobile AG5, R-Mobile
A1, and R-Mobile APE6.

I plan to queue this series in renesas-clk for v5.14.

Thanks for your comments!

Geert Uytterhoeven (5):
  clk: renesas: div6: Use clamp() instead of clamp_t()
  clk: renesas: div6: Simplify src mask handling
  clk: renesas: div6: Switch to .determine_rate()
  clk: renesas: div6: Consider all parents for requested rate
  clk: renesas: div6: Implement range checking

 drivers/clk/renesas/clk-div6.c | 80 +++++++++++++++++++++++-----------
 1 file changed, 54 insertions(+), 26 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

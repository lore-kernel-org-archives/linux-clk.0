Return-Path: <SRS0=c6wZ=R6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A513C43381
	for <linux-clk@archiver.kernel.org>; Wed, 27 Mar 2019 12:41:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A2D720700
	for <linux-clk@archiver.kernel.org>; Wed, 27 Mar 2019 12:41:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729325AbfC0Mln (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Mar 2019 08:41:43 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:51898 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728245AbfC0Mlm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Mar 2019 08:41:42 -0400
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id t0hh1z00F3XaVaC010hhT7; Wed, 27 Mar 2019 13:41:41 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h97sD-00012b-AG; Wed, 27 Mar 2019 13:41:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1h97sD-0002In-8C; Wed, 27 Mar 2019 13:41:41 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/5] clk: renesas: rcar-gen3: Errata Updates
Date:   Wed, 27 Mar 2019 13:41:35 +0100
Message-Id: <20190327124140.8800-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

This patch series updates the R-Car Gen3 and RZ/G2e clock drivers to
bring it in-line with recent revisions of the Hardware Manual.
None of these should have any run-time impact, as the clock consumers
don't care about actual clock rates or naming.

I plan to queue these in clk-renesas-for-v5.2.

Kazuya Mizuguchi (2):
  clk: renesas: rcar-gen3: Correct parent clock of EHCI/OHCI
  clk: renesas: rcar-gen3: Correct parent clock of HS-USB

Takeshi Kihara (3):
  clk: renesas: rcar-gen3: Correct parent clock of SYS-DMAC
  clk: renesas: rcar-gen3: Correct parent clock of Audio-DMAC
  clk: renesas: rcar-gen3: Rename DRIF clock names

 drivers/clk/renesas/r8a774a1-cpg-mssr.c | 14 ++++-----
 drivers/clk/renesas/r8a774c0-cpg-mssr.c |  6 ++--
 drivers/clk/renesas/r8a7795-cpg-mssr.c  | 38 ++++++++++++-------------
 drivers/clk/renesas/r8a7796-cpg-mssr.c  | 30 +++++++++----------
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 31 ++++++++++----------
 drivers/clk/renesas/r8a77990-cpg-mssr.c | 24 ++++++++--------
 drivers/clk/renesas/r8a77995-cpg-mssr.c |  2 +-
 7 files changed, 73 insertions(+), 72 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

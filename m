Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5EE5C4161D
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 10:50:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7852620863
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 10:50:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7852620863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbeK2VzY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Nov 2018 16:55:24 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:59214 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbeK2VzX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Nov 2018 16:55:23 -0500
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id 5mqR1z00P3XaVaC06mqR7d; Thu, 29 Nov 2018 11:50:25 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gSJto-0002DD-0z; Thu, 29 Nov 2018 11:50:24 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gSJtn-0002gA-UT; Thu, 29 Nov 2018 11:50:23 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 00/13] clk: renesas: Miscellaneous fixes
Date:   Thu, 29 Nov 2018 11:49:55 +0100
Message-Id: <20181129105008.10239-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen, Laurent, Kieran,

This patch series contains several fixes for the Renesas Clock drivers
and DT bindings, and a small simplification:
  - Removal of non-existent clocks,
  - Addition of the CPEX clocks, which can be used a source for a timer
    (CMT1),
  - Correction of DU parent clocks.
Most of these have been found by skimming the Hardware Manual Errata.

This has been boot-tested on Salvator-X(S) (R-Car H3, M3-W, M3-N), Eagle
(R-Car V3M), and Draak (R-Car D3), except for the DU parts.
Testing of the DU on R-Car D3 and E3 would be appreciated, as the DU
driver may have a workaround for the incorrect parent clock rates.

I intend to queue this in clk-renesas-for-v4.21.

Thanks!

Geert Uytterhoeven (12):
  dt-bindings: clock: r8a7795: Remove CSIREF clock
  dt-bindings: clock: r8a7796: Remove CSIREF clock
  clk: renesas: r8a774a1: Add CPEX clock
  clk: renesas: r8a7795: Add CPEX clock
  clk: renesas: r8a7796: Add CPEX clock
  clk: renesas: r8a77965: Add CPEX clock
  clk: renesas: r8a77970: Add CPEX clock
  clk: renesas: r8a77995: Correct parent clock of DU
  clk: renesas: r8a77995: Remove non-existent VIN5-7 module clocks
  clk: renesas: r8a77995: Remove non-existent SSP clocks
  clk: renesas: r8a77995: Add missing CPEX clock
  clk: renesas: r8a77995: Simplify PLL3 multiplier/divider

Takeshi Kihara (1):
  clk: renesas: r8a77990: Correct parent clock of DU

 drivers/clk/renesas/r8a774a1-cpg-mssr.c       |  1 +
 drivers/clk/renesas/r8a7795-cpg-mssr.c        |  1 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c        |  1 +
 drivers/clk/renesas/r8a77965-cpg-mssr.c       |  1 +
 drivers/clk/renesas/r8a77970-cpg-mssr.c       |  1 +
 drivers/clk/renesas/r8a77990-cpg-mssr.c       |  4 ++--
 drivers/clk/renesas/r8a77995-cpg-mssr.c       | 15 ++++++---------
 include/dt-bindings/clock/r8a7795-cpg-mssr.h  |  2 +-
 include/dt-bindings/clock/r8a7796-cpg-mssr.h  |  2 +-
 include/dt-bindings/clock/r8a77995-cpg-mssr.h |  5 +++--
 10 files changed, 18 insertions(+), 15 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

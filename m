Return-Path: <SRS0=cuWe=W2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB14C3A5AE
	for <linux-clk@archiver.kernel.org>; Fri, 30 Aug 2019 13:50:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6DF852341B
	for <linux-clk@archiver.kernel.org>; Fri, 30 Aug 2019 13:50:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbfH3NuW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Aug 2019 09:50:22 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:48690 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727857AbfH3NuV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Aug 2019 09:50:21 -0400
Received: from ramsan ([84.194.98.4])
        by andre.telenet-ops.be with bizsmtp
        id vRqK2000505gfCL01RqK3u; Fri, 30 Aug 2019 15:50:19 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i3hIB-0003KX-0s; Fri, 30 Aug 2019 15:50:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i3hDK-00037U-Ng; Fri, 30 Aug 2019 15:45:18 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/8] clk: renesas: rcar-gen2/gen3: Switch to .determine_rate()
Date:   Fri, 30 Aug 2019 15:45:07 +0200
Message-Id: <20190830134515.11925-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

As the .round_rate() callback returns a long clock rate, it cannot
return clock rates that do not fit in signed long, but do fit in
unsigned long.  The newer .determine_rate() callback does not suffer
from this limitation.  In addition, .determine_rate() provides the
ability to specify a rate range.

This patch series performs the customary preparatory cleanups, and
switches the Z (CPU) and SD clocks in the R-Car Gen2 and Gen3 clock
drivers from the .round_rate() to the .determine_rate() callback.
Note that the "div6" clock driver hasn't been converted yet, so div6
clocks still use .round_rate().

Changes compared to v1[1]:
  - Add preparatory arithmetic division improvements
  - Split off cpg_sd_clock_calc_div() absorption and SD clock best rate
    calculation,
  - Use div_u64() for division by unsigned long,

This has been tested on R-Car M2-W and various R-Car Gen3, and should
have no behavioral impact.

To be queued in clk-renesas-for-v5.5.

Thanks for your comments!

[1] [PATCH 0/5] clk: renesas: rcar-gen2/gen3: Switch to .determine_rate()
    https://lore.kernel.org/linux-clk/20190617125238.13761-1-geert+renesas@glider.be/

Geert Uytterhoeven (8):
  clk: renesas: rcar-gen2: Improve arithmetic divisions
  clk: renesas: rcar-gen3: Improve arithmetic divisions
  clk: renesas: rcar-gen3: Avoid double table iteration in SD
    .set_rate()
  clk: renesas: rcar-gen3: Absorb cpg_sd_clock_calc_div()
  clk: renesas: rcar-gen3: Loop to find best rate in
    cpg_sd_clock_round_rate()
  clk: renesas: rcar-gen2: Switch Z clock to .determine_rate()
  clk: renesas: rcar-gen3: Switch Z clocks to .determine_rate()
  clk: renesas: rcar-gen3: Switch SD clocks to .determine_rate()

 drivers/clk/renesas/rcar-gen2-cpg.c | 25 ++++++-----
 drivers/clk/renesas/rcar-gen3-cpg.c | 64 ++++++++++++++++-------------
 2 files changed, 49 insertions(+), 40 deletions(-)

-- 
2.17.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

Return-Path: <SRS0=jGkl=OQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A68C07E85
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 12:22:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E57AA20892
	for <linux-clk@archiver.kernel.org>; Fri,  7 Dec 2018 12:22:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E57AA20892
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726013AbeLGMWJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Dec 2018 07:22:09 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:35938 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726005AbeLGMWJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Dec 2018 07:22:09 -0500
Received: from ramsan ([84.194.111.163])
        by michel.telenet-ops.be with bizsmtp
        id 90N71z00W3XaVaC060N711; Fri, 07 Dec 2018 13:22:07 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gVF8x-0004V1-MJ; Fri, 07 Dec 2018 13:22:07 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gVF8x-00005X-Kk; Fri, 07 Dec 2018 13:22:07 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.21 (take two)
Date:   Fri,  7 Dec 2018 13:22:03 +0100
Message-Id: <20181207122203.32763-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit eb38c119dd91c61de26f67050671a84064554f7d:

  clk: renesas: r7s9210: Add USB clocks (2018-11-13 09:58:51 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.21-tag2

for you to fetch changes up to 36c4da4f552a126bb29a95dc5c9608795491e32a:

  clk: renesas: rcar-gen3: Add HS400 quirk for SD clock (2018-12-07 11:45:06 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v4.21 (take two)

  - Add support for CPEX (timer) clocks on various R-Car Gen3 and RZ/G2
    SoCs,
  - Add support for SDHI HS400 clocks on early revisions of R-Car H3 and
    M3-W,
  - Miscellaneous fixes based on the Hardware Manual Errata.

Thanks for pulling!

----------------------------------------------------------------
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

Niklas Söderlund (3):
      clk: renesas: rcar-gen3: Set state when registering SD clocks
      clk: renesas: rcar-gen3: Add documentation for SD clocks
      clk: renesas: rcar-gen3: Add HS400 quirk for SD clock

Takeshi Kihara (1):
      clk: renesas: r8a77990: Correct parent clock of DU

 drivers/clk/renesas/r8a774a1-cpg-mssr.c       |  1 +
 drivers/clk/renesas/r8a7795-cpg-mssr.c        |  1 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c        |  1 +
 drivers/clk/renesas/r8a77965-cpg-mssr.c       |  1 +
 drivers/clk/renesas/r8a77970-cpg-mssr.c       |  1 +
 drivers/clk/renesas/r8a77990-cpg-mssr.c       |  4 +-
 drivers/clk/renesas/r8a77995-cpg-mssr.c       | 15 +++-----
 drivers/clk/renesas/rcar-gen3-cpg.c           | 55 ++++++++++++++++-----------
 include/dt-bindings/clock/r8a7795-cpg-mssr.h  |  2 +-
 include/dt-bindings/clock/r8a7796-cpg-mssr.h  |  2 +-
 include/dt-bindings/clock/r8a77995-cpg-mssr.h |  5 ++-
 11 files changed, 51 insertions(+), 37 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

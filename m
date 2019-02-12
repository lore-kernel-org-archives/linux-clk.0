Return-Path: <SRS0=E6RW=QT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F08BC282CA
	for <linux-clk@archiver.kernel.org>; Tue, 12 Feb 2019 10:48:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F76D214DA
	for <linux-clk@archiver.kernel.org>; Tue, 12 Feb 2019 10:48:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727961AbfBLKsr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Feb 2019 05:48:47 -0500
Received: from baptiste.telenet-ops.be ([195.130.132.51]:35524 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728149AbfBLKsr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Feb 2019 05:48:47 -0500
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id bmol1z00H3XaVaC01molsm; Tue, 12 Feb 2019 11:48:45 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gtVcL-0004PJ-Bt; Tue, 12 Feb 2019 11:48:45 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gtVBP-0008OZ-Cn; Tue, 12 Feb 2019 11:20:55 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v5.1 (take two)
Date:   Tue, 12 Feb 2019 11:20:50 +0100
Message-Id: <20190212102050.32229-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit d9286d9743b6e8cfbf1a13f8db84e9c65c0b09c7:

  clk: renesas: r8a774c0: Correct parent clock of DU (2019-01-24 16:01:08 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v5.1-tag2

for you to fetch changes up to d1de227de8145e661e940377e050286098197eeb:

  clk: renesas: r8a774c0: Add TMU clock (2019-02-05 10:40:05 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v5.1 (take two)

  - Add RPC (QSPI/HyperFLASH) clocks on R-Car V3H,
  - Add TMU (timer) clocks on RZ/G2E,
  - Small fixes and cleanups.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (1):
      clk: renesas: r8a774c0: Add TMU clock

Sergei Shtylyov (4):
      clk: renesas: rcar-gen3: Factor out cpg_reg_modify()
      clk: renesas: rcar-gen3: Add spinlock
      clk: renesas: rcar-gen3: Add RPC clocks
      clk: renesas: r8a77980: Add RPC clocks

 drivers/clk/renesas/r8a774c0-cpg-mssr.c |   5 ++
 drivers/clk/renesas/r8a77980-cpg-mssr.c |   8 ++
 drivers/clk/renesas/rcar-gen3-cpg.c     | 147 ++++++++++++++++++++++++++++----
 drivers/clk/renesas/rcar-gen3-cpg.h     |   4 +
 4 files changed, 146 insertions(+), 18 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

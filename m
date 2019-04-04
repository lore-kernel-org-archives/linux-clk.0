Return-Path: <SRS0=Ee6+=SG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4706C10F0C
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 11:37:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8C97F206C0
	for <linux-clk@archiver.kernel.org>; Thu,  4 Apr 2019 11:37:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728905AbfDDLh2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Apr 2019 07:37:28 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:49378 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbfDDLh2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Apr 2019 07:37:28 -0400
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id wBdS1z0083XaVaC01BdSdA; Thu, 04 Apr 2019 13:37:26 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hC0gQ-0008Mj-3K; Thu, 04 Apr 2019 13:37:26 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hC0gQ-0005No-1H; Thu, 04 Apr 2019 13:37:26 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v5.2
Date:   Thu,  4 Apr 2019 13:37:22 +0200
Message-Id: <20190404113722.20634-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v5.2-tag1

for you to fetch changes up to b953eaaeb58efc944f51cffd3f6838657958f0f8:

  clk: renesas: rcar-gen3: Fix cpg_sd_clock_round_rate() return value (2019-04-04 11:54:46 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v5.2

  - Add missing PCI USB clock on RZ/N1,
  - Add Z2 (Cortex-A53) clocks on R-Car E3 and RZ/G2E, incl. a new
    helper in <linux/math64.h>,
  - Small fixes and cleanups.

Thanks for pulling!

----------------------------------------------------------------
Gareth Williams (1):
      clk: renesas: r9a06g032: Add missing PCI USB clock

Geert Uytterhoeven (2):
      clk: renesas: rcar-gen3: Pass name/offset to cpg_sd_clk_register()
      clk: renesas: r7s9210: Always use readl()

Kazuya Mizuguchi (2):
      clk: renesas: rcar-gen3: Correct parent clock of EHCI/OHCI
      clk: renesas: rcar-gen3: Correct parent clock of HS-USB

Sergei Shtylyov (1):
      clk: renesas: r8a77980: Fix RPC-IF module clock's parent

Simon Horman (5):
      clk: renesas: rcar-gen3: Parameterise Z and Z2 clock offset
      clk: renesas: rcar-gen3: Remove CLK_TYPE_GEN3_Z2
      math64: New DIV64_U64_ROUND_CLOSEST helper
      clk: renesas: rcar-gen3: Support Z and Z2 clocks with high frequency parents
      clk: renesas: r8a774c0: Add Z2 clock

Takeshi Kihara (6):
      clk: renesas: rcar-gen3: Parameterise Z and Z2 clock fixed divisor
      clk: renesas: r8a77990: Add Z2 clock
      clk: renesas: rcar-gen3: Correct parent clock of SYS-DMAC
      clk: renesas: rcar-gen3: Correct parent clock of Audio-DMAC
      clk: renesas: rcar-gen3: Rename DRIF clocks
      clk: renesas: rcar-gen3: Fix cpg_sd_clock_round_rate() return value

 drivers/clk/renesas/r7s9210-cpg-mssr.c  |  3 +-
 drivers/clk/renesas/r8a774a1-cpg-mssr.c | 18 ++++-----
 drivers/clk/renesas/r8a774c0-cpg-mssr.c |  7 ++--
 drivers/clk/renesas/r8a7795-cpg-mssr.c  | 41 +++++++++----------
 drivers/clk/renesas/r8a7796-cpg-mssr.c  | 35 +++++++++--------
 drivers/clk/renesas/r8a77965-cpg-mssr.c | 33 ++++++++--------
 drivers/clk/renesas/r8a77980-cpg-mssr.c |  2 +-
 drivers/clk/renesas/r8a77990-cpg-mssr.c | 25 ++++++------
 drivers/clk/renesas/r8a77995-cpg-mssr.c |  2 +-
 drivers/clk/renesas/r9a06g032-clocks.c  |  1 +
 drivers/clk/renesas/rcar-gen3-cpg.c     | 70 ++++++++++++++++-----------------
 drivers/clk/renesas/rcar-gen3-cpg.h     |  5 ++-
 include/linux/math64.h                  | 13 ++++++
 13 files changed, 137 insertions(+), 118 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

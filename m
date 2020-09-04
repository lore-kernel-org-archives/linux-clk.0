Return-Path: <SRS0=GDCy=CN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1DE7C43461
	for <linux-clk@archiver.kernel.org>; Fri,  4 Sep 2020 11:48:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9760920709
	for <linux-clk@archiver.kernel.org>; Fri,  4 Sep 2020 11:48:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729977AbgIDLsr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Sep 2020 07:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728118AbgIDLsn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Sep 2020 07:48:43 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41E6C061245
        for <linux-clk@vger.kernel.org>; Fri,  4 Sep 2020 04:48:41 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id Pnoh230084C55Sk06nohUf; Fri, 04 Sep 2020 13:48:41 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kEACv-0004ep-6E; Fri, 04 Sep 2020 13:48:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kEACv-0007u5-4p; Fri, 04 Sep 2020 13:48:41 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.10
Date:   Fri,  4 Sep 2020 13:48:38 +0200
Message-Id: <20200904114838.30339-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v5.10-tag1

for you to fetch changes up to e41cb217932969a20cea9c44299c449236058e43:

  clk: renesas: rcar-gen2: Rename vsp1-(sy|rt) clocks to vsp(s|r) (2020-09-04 09:42:01 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v5.10

  - Add support for the VSP for Resizing clock on RZ/G1H,
  - Fix VSP clock names to match corrected hardware documentation.

Thanks for pulling!
----------------------------------------------------------------
Lad Prabhakar (2):
      clk: renesas: r8a7742: Add clk entry for VSPR
      clk: renesas: rcar-gen2: Rename vsp1-(sy|rt) clocks to vsp(s|r)

 drivers/clk/renesas/r8a7742-cpg-mssr.c  | 3 ++-
 drivers/clk/renesas/r8a7743-cpg-mssr.c  | 2 +-
 drivers/clk/renesas/r8a7745-cpg-mssr.c  | 2 +-
 drivers/clk/renesas/r8a77470-cpg-mssr.c | 2 +-
 drivers/clk/renesas/r8a7790-cpg-mssr.c  | 4 ++--
 drivers/clk/renesas/r8a7791-cpg-mssr.c  | 2 +-
 drivers/clk/renesas/r8a7792-cpg-mssr.c  | 2 +-
 drivers/clk/renesas/r8a7794-cpg-mssr.c  | 2 +-
 8 files changed, 10 insertions(+), 9 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

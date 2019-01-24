Return-Path: <SRS0=VLoV=QA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7F6C282C3
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 15:26:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF48221855
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 15:26:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728721AbfAXP0P (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jan 2019 10:26:15 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:50874 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728669AbfAXP0P (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Jan 2019 10:26:15 -0500
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id UFSD1z00Q3XaVaC01FSDPA; Thu, 24 Jan 2019 16:26:13 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gmgtR-0007W5-5c; Thu, 24 Jan 2019 16:26:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gmgtR-00083P-3s; Thu, 24 Jan 2019 16:26:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v5.1
Date:   Thu, 24 Jan 2019 16:26:07 +0100
Message-Id: <20190124152607.30916-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v5.1-tag1

for you to fetch changes up to d9286d9743b6e8cfbf1a13f8db84e9c65c0b09c7:

  clk: renesas: r8a774c0: Correct parent clock of DU (2019-01-24 16:01:08 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v5.1

  - Add missing CANFD clocks on RZ/G2M and RZ/G2E,
  - Correct the DU (display unit) parent clock on RZ/G2E.

Thanks for pulling!

----------------------------------------------------------------
Fabrizio Castro (2):
      clk: renesas: r8a774c0: Add missing CANFD clock
      clk: renesas: r8a774a1: Add missing CANFD clock

Geert Uytterhoeven (1):
      clk: renesas: r8a774c0: Correct parent clock of DU

 drivers/clk/renesas/r8a774a1-cpg-mssr.c       | 2 ++
 drivers/clk/renesas/r8a774c0-cpg-mssr.c       | 8 ++++++--
 include/dt-bindings/clock/r8a774a1-cpg-mssr.h | 1 +
 include/dt-bindings/clock/r8a774c0-cpg-mssr.h | 1 +
 4 files changed, 10 insertions(+), 2 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

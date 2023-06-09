Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1BABC7EE37
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jun 2023 10:16:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241375AbjFIKQG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Jun 2023 06:16:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241826AbjFIKPG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jun 2023 06:15:06 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34B063C34
        for <linux-clk@vger.kernel.org>; Fri,  9 Jun 2023 03:07:01 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed30:a1e2:1b31:cba3:390d])
        by michel.telenet-ops.be with bizsmtp
        id 6y6z2A00E12zQ4r06y6zT5; Fri, 09 Jun 2023 12:06:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q7Z0u-008L2e-Es;
        Fri, 09 Jun 2023 12:06:59 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1q7Z1H-00G43g-Fe;
        Fri, 09 Jun 2023 12:06:59 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.5 (take two)
Date:   Fri,  9 Jun 2023 12:06:58 +0200
Message-Id: <cover.1686304777.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit d1c20885d3b01e6a62e920af4b227abd294d22f3:

  clk: renesas: rzg2l: Fix CPG_SIPLL5_CLK1 register write (2023-05-23 09:06:50 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.5-tag2

for you to fetch changes up to 7df8eea64a417f1db6777cddc1d7eda3634b7175:

  clk: renesas: rzg2l: Convert to readl_poll_timeout_atomic() (2023-06-05 15:41:43 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v6.5 (take two)

  - Convert the Renesas clock drivers to readl_poll_timeout_atomic().

Note that the conversion to readl_poll_timeout_atomic() depends
on iopoll improvements, which are thus included through an immutable
branch in multiple pull requests:

  "[GIT PULL 2/3] Renesas driver updates for v6.5 (take two)" (for soc),
  "[GIT PULL] clk: renesas: Updates for v6.5 (take two)" (for clk).

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (6):
      iopoll: Call cpu_relax() in busy loops
      iopoll: Do not use timekeeping in read_poll_timeout_atomic()
      Merge tag 'iopoll-busy-loop-timeout-tag' into renesas-clk-for-v6.5
      clk: renesas: cpg-mssr: Convert to readl_poll_timeout_atomic()
      clk: renesas: mstp: Convert to readl_poll_timeout_atomic()
      clk: renesas: rzg2l: Convert to readl_poll_timeout_atomic()

 drivers/clk/renesas/clk-mstp.c         | 18 +++++++-----------
 drivers/clk/renesas/renesas-cpg-mssr.c | 31 +++++++++++--------------------
 drivers/clk/renesas/rzg2l-cpg.c        | 16 +++++-----------
 include/linux/iopoll.h                 | 24 +++++++++++++++++++-----
 4 files changed, 42 insertions(+), 47 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

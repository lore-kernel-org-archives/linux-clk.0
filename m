Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42FDFC61D97
	for <linux-clk@archiver.kernel.org>; Fri, 27 Jan 2023 16:28:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234312AbjA0Q2p (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 27 Jan 2023 11:28:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234068AbjA0Q2p (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Jan 2023 11:28:45 -0500
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C128421A20
        for <linux-clk@vger.kernel.org>; Fri, 27 Jan 2023 08:28:43 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:a160:4e65:21d4:30bf])
        by laurent.telenet-ops.be with bizsmtp
        id DsUh2900s2rBNjs01sUhzl; Fri, 27 Jan 2023 17:28:41 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pLRaX-007Zl4-Rb;
        Fri, 27 Jan 2023 17:28:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pLRaj-005TbS-K8;
        Fri, 27 Jan 2023 17:28:41 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v6.3 (take two)
Date:   Fri, 27 Jan 2023 17:28:38 +0100
Message-Id: <cover.1674815598.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit fbfd614aeaa2853c2c575299dfe2458db8eff67e:

  clk: renesas: cpg-mssr: Fix use after free if cpg_mssr_common_init() failed (2023-01-12 17:18:48 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/renesas-clk-for-v6.3-tag2

for you to fetch changes up to bd176e46e9c23f669b28630cc8f3fb1b89fd610e:

  clk: renesas: r8a779g0: Add CAN-FD clocks (2023-01-26 15:13:53 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v6.3 (take two)

  - Add support for USB host/device configuration on RZ/N1,
  - Add PLL2 programming support, and CAN-FD clocks on R-Car V4H,
  - Miscellaneous fixes and improvements.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (3):
      clk: renesas: cpg-mssr: Remove superfluous check in resume code
      clk: renesas: r8a779g0: Add custom clock for PLL2
      clk: renesas: r8a779g0: Add CAN-FD clocks

Herve Codina (1):
      clk: renesas: r9a06g032: Handle h2mode setting based on USBF presence

Kuninori Morimoto (2):
      clk: renesas: r8a779a0: Tidy up DMAC name on SYS-DMAC
      clk: renesas: r8a779g0: Tidy up DMAC name on SYS-DMAC

 drivers/clk/renesas/r8a779a0-cpg-mssr.c |   4 +-
 drivers/clk/renesas/r8a779g0-cpg-mssr.c |  20 ++--
 drivers/clk/renesas/r9a06g032-clocks.c  |  28 ++++++
 drivers/clk/renesas/rcar-gen4-cpg.c     | 156 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen4-cpg.h     |   1 +
 drivers/clk/renesas/renesas-cpg-mssr.c  |   5 +-
 6 files changed, 200 insertions(+), 14 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

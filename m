Return-Path: <SRS0=Qq/y=WT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B322C3A5A4
	for <linux-clk@archiver.kernel.org>; Fri, 23 Aug 2019 12:58:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2187C2339D
	for <linux-clk@archiver.kernel.org>; Fri, 23 Aug 2019 12:58:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395111AbfHWM6U (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Aug 2019 08:58:20 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:41578 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395109AbfHWM6U (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Aug 2019 08:58:20 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id scyH2000d05gfCL01cyH0Z; Fri, 23 Aug 2019 14:58:18 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i198z-0006dZ-NK; Fri, 23 Aug 2019 14:58:17 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i198z-0005bo-LJ; Fri, 23 Aug 2019 14:58:17 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v5.4
Date:   Fri, 23 Aug 2019 14:58:16 +0200
Message-Id: <20190823125816.21519-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v5.4-tag1

for you to fetch changes up to f787216f33ce5b5a2567766398f44ab62157114c:

  clk: renesas: cpg-mssr: Set GENPD_FLAG_ALWAYS_ON for clock domain (2019-08-23 11:09:57 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v5.4

  - Fix "always-on" Clock Domains on R-Car M1A, RZ/A1, RZ/A2, and RZ/N1,
  - Minor cleanups.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (4):
      clk: renesas: rcar-usb2-clock-sel: Use devm_platform_ioremap_resource() helper
      clk: renesas: mstp: Set GENPD_FLAG_ALWAYS_ON for clock domain
      clk: renesas: r9a06g032: Set GENPD_FLAG_ALWAYS_ON for clock domain
      clk: renesas: cpg-mssr: Set GENPD_FLAG_ALWAYS_ON for clock domain

Simon Horman (1):
      dt-bindings: clk: emev2: Rename bindings documentation file

 .../bindings/clock/{emev2-clock.txt => renesas,emev2-smu.txt}         | 0
 drivers/clk/renesas/clk-mstp.c                                        | 3 ++-
 drivers/clk/renesas/r9a06g032-clocks.c                                | 3 ++-
 drivers/clk/renesas/rcar-usb2-clock-sel.c                             | 4 +---
 drivers/clk/renesas/renesas-cpg-mssr.c                                | 3 ++-
 5 files changed, 7 insertions(+), 6 deletions(-)
 rename Documentation/devicetree/bindings/clock/{emev2-clock.txt => renesas,emev2-smu.txt} (100%)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

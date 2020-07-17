Return-Path: <SRS0=WyPy=A4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E9FC433E4
	for <linux-clk@archiver.kernel.org>; Fri, 17 Jul 2020 10:58:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E1BE20768
	for <linux-clk@archiver.kernel.org>; Fri, 17 Jul 2020 10:58:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726059AbgGQK6p (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Jul 2020 06:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgGQK6p (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Jul 2020 06:58:45 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4292C08C5C0
        for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2020 03:58:44 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by albert.telenet-ops.be with bizsmtp
        id 4Ayg2300f4C55Sk06AygVh; Fri, 17 Jul 2020 12:58:40 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jwO4e-0001Kd-Gk; Fri, 17 Jul 2020 12:58:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jwNJ8-00048y-St; Fri, 17 Jul 2020 12:09:34 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.9 (take two)
Date:   Fri, 17 Jul 2020 12:09:31 +0200
Message-Id: <20200717100931.15885-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 52bc5ea6edde35bc65ed6ecd7639534e78002c74:

  clk: renesas: rzg2: Mark RWDT clocks as critical (2020-06-22 16:54:32 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v5.9-tag2

for you to fetch changes up to c8a53fa1d211936ddcabf82ff991c18672b3d63a:

  clk: renesas: cpg-mssr: Add r8a774e1 support (2020-07-13 10:36:33 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v5.9 (take two)

  - Add support for the new RZ/G2H (R8A774E1) SoC.

Note that the new Renesas RZ/G2H DT Binding Definitions are shared by
driver and DT source files, and thus included in multiple pull requests:
  - "[GIT PULL 1/3] Renesas ARM DT updates for v5.9 (take two)" (for arm-soc),
  - "[GIT PULL 2/3] Renesas driver updates for v5.9" (for arm-soc),
  - "[GIT PULL] clk: renesas: Updates for v5.9 (take two)" (for clk).

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (1):
      Merge tag 'renesas-r8a774e1-dt-binding-defs-tag' into clk-renesas-for-v5.9

Marian-Cristian Rotariu (4):
      dt-bindings: power: Add r8a774e1 SYSC power domain definitions
      clk: renesas: Add r8a774e1 CPG Core Clock Definitions
      dt-bindings: clock: renesas,cpg-mssr: Document r8a774e1
      clk: renesas: cpg-mssr: Add r8a774e1 support

 .../bindings/clock/renesas,cpg-mssr.yaml           |   1 +
 drivers/clk/renesas/Kconfig                        |   5 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r8a774e1-cpg-mssr.c            | 349 +++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c             |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |   1 +
 include/dt-bindings/clock/r8a774e1-cpg-mssr.h      |  59 ++++
 include/dt-bindings/power/r8a774e1-sysc.h          |  36 +++
 8 files changed, 458 insertions(+)
 create mode 100644 drivers/clk/renesas/r8a774e1-cpg-mssr.c
 create mode 100644 include/dt-bindings/clock/r8a774e1-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a774e1-sysc.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

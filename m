Return-Path: <SRS0=t0pr=6O=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9818C8300A
	for <linux-clk@archiver.kernel.org>; Thu, 30 Apr 2020 08:49:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B179820838
	for <linux-clk@archiver.kernel.org>; Thu, 30 Apr 2020 08:49:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgD3ItF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Apr 2020 04:49:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726420AbgD3ItF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Apr 2020 04:49:05 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12DA3C035494
        for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2020 01:49:04 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:182a:142e:a95f:66c2])
        by laurent.telenet-ops.be with bizsmtp
        id Ywp32200g0w8ZL601wp3Ki; Thu, 30 Apr 2020 10:49:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jU4sR-0002le-JT; Thu, 30 Apr 2020 10:49:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jU4sR-0000Pb-ID; Thu, 30 Apr 2020 10:49:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL] clk: renesas: Updates for v5.8
Date:   Thu, 30 Apr 2020 10:49:02 +0200
Message-Id: <20200430084902.1540-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit 8f3d9f354286745c751374f5f1fcafee6b3f3136:

  Linux 5.7-rc1 (2020-04-12 12:35:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v5.8-tag1

for you to fetch changes up to e2f022c10ed3b50ba1d2bb1f037b0e7a84cb1c3e:

  clk: renesas: rcar-gen2: Remove superfluous CLK_RENESAS_DIV6 selects (2020-04-30 09:39:06 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v5.8

  - Add support for the USB 2.0 clock selector on R-Car M3-W+,
  - Add support for the new RZ/G1H (R8A7742) SoC,
  - Minor fixes and cleanups.

Note that the new Renesas RZ/G1H DT Binding Definitions are shared by
driver and DT source files, and thus included in multiple pull requests:
  - "[GIT PULL 4/5] Renesas driver updates for v5.8" (for arm-soc),
  - "[GIT PULL] clk: renesas: Updates for v5.8" (for clk).

Thanks for pulling!
----------------------------------------------------------------
Christophe JAILLET (1):
      clk: renesas: r9a06g032: Fix some typo in comments

Geert Uytterhoeven (3):
      MAINTAINERS: Add DT Bindings for Renesas Clock Generators
      Merge tag 'renesas-r8a7742-dt-binding-defs-tag' into clk-renesas-for-v5.8
      clk: renesas: rcar-gen2: Remove superfluous CLK_RENESAS_DIV6 selects

Lad Prabhakar (4):
      dt-bindings: power: rcar-sysc: Add r8a7742 power domain index macros
      clk: renesas: Add r8a7742 CPG Core Clock Definitions
      dt-bindings: clock: renesas: cpg-mssr: Document r8a7742 binding
      clk: renesas: cpg-mssr: Add R8A7742 support

Yoshihiro Shimoda (1):
      dt-bindings: clock: renesas: rcar-usb2-clock-sel: Add r8a77961 support

 .../bindings/clock/renesas,cpg-mssr.yaml           |   1 +
 .../bindings/clock/renesas,rcar-usb2-clock-sel.txt |   4 +-
 MAINTAINERS                                        |   1 +
 drivers/clk/renesas/Kconfig                        |   8 +-
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r8a7742-cpg-mssr.c             | 275 +++++++++++++++++++++
 drivers/clk/renesas/r9a06g032-clocks.c             |   6 +-
 drivers/clk/renesas/renesas-cpg-mssr.c             |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |   1 +
 include/dt-bindings/clock/r8a7742-cpg-mssr.h       |  42 ++++
 include/dt-bindings/power/r8a7742-sysc.h           |  29 +++
 11 files changed, 367 insertions(+), 7 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a7742-cpg-mssr.c
 create mode 100644 include/dt-bindings/clock/r8a7742-cpg-mssr.h
 create mode 100644 include/dt-bindings/power/r8a7742-sysc.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

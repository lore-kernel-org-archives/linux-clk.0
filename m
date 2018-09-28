Return-Path: <SRS0=udJu=MK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169C3C43382
	for <linux-clk@archiver.kernel.org>; Fri, 28 Sep 2018 08:41:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B64CB2170E
	for <linux-clk@archiver.kernel.org>; Fri, 28 Sep 2018 08:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B64CB2170E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728901AbeI1PE1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Sep 2018 11:04:27 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:57128 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbeI1PE1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Sep 2018 11:04:27 -0400
Received: from ramsan.of.borg ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id gwhk1y00C3XaVaC01whk81; Fri, 28 Sep 2018 10:41:45 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.86_2)
        (envelope-from <geert@linux-m68k.org>)
        id 1g5oLI-0001VP-Iu; Fri, 28 Sep 2018 10:41:44 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1g5oLI-0005FG-Gf; Fri, 28 Sep 2018 10:41:44 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.20 (take two)
Date:   Fri, 28 Sep 2018 10:41:39 +0200
Message-Id: <20180928084139.20016-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

	Hi Mike, Stephen,

The following changes since commit b30c862f2a72002c06df23d05c2ca6b49148c4d4:

  clk: renesas: r8a77990: Add missing I2C7 clock (2018-08-31 10:33:59 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.20-tag2

for you to fetch changes up to a53a28dca4124048c90b4a8de457668ede57e67c:

  clk: renesas: r7s9210: Add SPI clocks (2018-09-28 09:57:09 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v4.20 (take two)

  - Add support for CMT timer clocks on R-Car V3H,
  - Add support for SHDI and various timer clocks on R-Car V3M,
  - Add support for the new RZ/A2 (R7S9210) SoC, including early clock
    support for the Renesas CPG/MSSR driver,
  - Add support for the new RZ/G1N (R8A7744) and RZ/G2E (R8A774C0) SoCs,
  - Convert DT binding includes to SPDX license identifiers,
  - Small fixes and clean ups.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (3):
      dt-bindings: clock: renesas: cpg-mssr: Document r8a7744 binding
      clk: renesas: Add r8a7744 CPG Core Clock Definitions
      clk: renesas: r8a7743: Add r8a7744 support

Chris Brandt (5):
      clk: renesas: cpg-mssr: Add R7S9210 support
      clk: renesas: cpg-mssr: Add early clock support
      clk: renesas: r7s9210: Convert some clocks to early
      clk: renesas: r7s9210: Move table update to separate function
      clk: renesas: r7s9210: Add SPI clocks

Fabrizio Castro (3):
      clk: renesas: Add r8a774c0 CPG Core Clock Definitions
      clk: renesas: cpg-mssr: Add r8a774c0 support
      dt-bindings: clock: renesas: cpg-mssr: Document r8a774c0

Geert Uytterhoeven (1):
      clk: renesas: r8a77990: Fix incorrect PLL0 divider in comment

Kuninori Morimoto (1):
      dt-bindings: clock: renesas: Convert to SPDX identifiers

Phil Edworthy (1):
      clk: renesas: r9a06g032: Fix UART34567 clock rate

Sergei Shtylyov (5):
      clk: renesas: r8a77980: Add CMT clocks
      clk: renesas: r8a77970: Add SD0H/SD0 clocks for SDHI
      clk: renesas: r8a77970: Add CMT clocks
      clk: renesas: r8a77970: Add TMU clocks
      clk: renesas: r8a77970: Add TPU clock

 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |  14 +-
 drivers/clk/renesas/Kconfig                        |  12 +-
 drivers/clk/renesas/Makefile                       |   2 +
 drivers/clk/renesas/r7s9210-cpg-mssr.c             | 217 ++++++++++++++++
 drivers/clk/renesas/r8a7743-cpg-mssr.c             |  13 +-
 drivers/clk/renesas/r8a774c0-cpg-mssr.c            | 286 +++++++++++++++++++++
 drivers/clk/renesas/r8a77970-cpg-mssr.c            |  76 +++++-
 drivers/clk/renesas/r8a77980-cpg-mssr.c            |   4 +
 drivers/clk/renesas/r8a77990-cpg-mssr.c            |   4 +-
 drivers/clk/renesas/r9a06g032-clocks.c             |   3 +-
 drivers/clk/renesas/rcar-gen3-cpg.h                |   3 +
 drivers/clk/renesas/renesas-cpg-mssr.c             | 189 +++++++++++---
 drivers/clk/renesas/renesas-cpg-mssr.h             |  27 ++
 include/dt-bindings/clock/r7s72100-clock.h         |   7 +-
 include/dt-bindings/clock/r7s9210-cpg-mssr.h       |  20 ++
 include/dt-bindings/clock/r8a7743-cpg-mssr.h       |   8 +-
 include/dt-bindings/clock/r8a7744-cpg-mssr.h       |  39 +++
 include/dt-bindings/clock/r8a7745-cpg-mssr.h       |   8 +-
 include/dt-bindings/clock/r8a774c0-cpg-mssr.h      |  60 +++++
 include/dt-bindings/clock/r8a7790-cpg-mssr.h       |   8 +-
 include/dt-bindings/clock/r8a7791-cpg-mssr.h       |   8 +-
 include/dt-bindings/clock/r8a7792-cpg-mssr.h       |   8 +-
 include/dt-bindings/clock/r8a7793-clock.h          |  12 +-
 include/dt-bindings/clock/r8a7793-cpg-mssr.h       |   8 +-
 include/dt-bindings/clock/r8a7794-clock.h          |   8 +-
 include/dt-bindings/clock/r8a7794-cpg-mssr.h       |   8 +-
 include/dt-bindings/clock/r8a7795-cpg-mssr.h       |   8 +-
 include/dt-bindings/clock/r8a7796-cpg-mssr.h       |   8 +-
 include/dt-bindings/clock/r8a77970-cpg-mssr.h      |   8 +-
 include/dt-bindings/clock/r8a77995-cpg-mssr.h      |   8 +-
 include/dt-bindings/clock/renesas-cpg-mssr.h       |   8 +-
 31 files changed, 954 insertions(+), 138 deletions(-)
 create mode 100644 drivers/clk/renesas/r7s9210-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/r8a774c0-cpg-mssr.c
 create mode 100644 include/dt-bindings/clock/r7s9210-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/r8a7744-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/r8a774c0-cpg-mssr.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

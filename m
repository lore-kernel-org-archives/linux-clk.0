Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.10 (take three)
Date: Wed, 16 Nov 2016 10:47:22 +0100
Message-Id: <1479289642-13421-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit 1936be95e013802291201c1ed193e04fd1ed3d13:

  Merge branch 'rzg-clock-defs' into clk-renesas-for-v4.10 (2016-11-07 15:15:33 +0100)

are available in the git repository at:


  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.10-tag3

for you to fetch changes up to 9127d54bb89471592b3c8af6c6273c21db6de6a6:

  clk: renesas: cpg-mssr: Add R8A7745 support (2016-11-10 15:29:30 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v4.10 (take three)

  - CSI2 and VIN clocks for R-Car M3-W,
  - Clock drivers for new RZ/G1M and RZ/G1E SoCs,
  - Minor bug fix for R-Car H3.

This pull request depends on the pull request for
tags/clk-renesas-for-v4.10-tag2 ("clk: renesas: Updates for v4.10 (take
two)"), which I sent last week.

Thanks for pulling!
----------------------------------------------------------------
Niklas Söderlund (2):
      clk: renesas: r8a7796: Add CSI2 clocks
      clk: renesas: r8a7796: Add VIN clocks

Sergei Shtylyov (3):
      clk: renesas: cpg-mssr: Add common R-Car Gen2 support
      clk: renesas: cpg-mssr: Add R8A7743 support
      clk: renesas: cpg-mssr: Add R8A7745 support

Takeshi Kihara (1):
      clk: renesas: r8a7795: Fix HDMI parent clock

 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   5 +-
 drivers/clk/renesas/Kconfig                        |   2 +
 drivers/clk/renesas/Makefile                       |   2 +
 drivers/clk/renesas/r8a7743-cpg-mssr.c             | 270 +++++++++++++++
 drivers/clk/renesas/r8a7745-cpg-mssr.c             | 259 ++++++++++++++
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |   2 +-
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |  12 +
 drivers/clk/renesas/rcar-gen2-cpg.c                | 371 +++++++++++++++++++++
 drivers/clk/renesas/rcar-gen2-cpg.h                |  43 +++
 drivers/clk/renesas/renesas-cpg-mssr.c             |  12 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |   2 +
 11 files changed, 978 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a7743-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/r8a7745-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/rcar-gen2-cpg.c
 create mode 100644 drivers/clk/renesas/rcar-gen2-cpg.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.11 (take two)
Date: Fri, 27 Jan 2017 10:21:38 +0100
Message-Id: <1485508898-22923-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit e6bdf28eff475a026b922abe78ae710e7179bdf7:

  clk: renesas: r8a7796: Add MSIOF controller clocks (2016-12-27 10:56:08 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.11-tag2

for you to fetch changes up to d963654e109565cf73399815d7585917f2d69a30:

  clk: renesas: r8a7796: Add IIC-DVFS clock (2017-01-27 08:59:24 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v4.11 (take two)

  - Use CLK_IS_CRITICAL to handle critical clocks,
  - Add Reset Control Support for R-Car Gen2 and Gen3, and RZ/G1,
  - Add IIC-DVFS clocks for R-Car H3 and M3-W,
  - Minor cleanups.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (7):
      clk: renesas: cpg-mssr: Migrate to CLK_IS_CRITICAL
      clk: renesas: mstp: Make INTC-SYS a critical clock
      clk: renesas: mstp: Reformat cpg_mstp_clock_register() for git diff
      dt-bindings: clock: renesas: cpg-mssr: Document reset control support
      clk: renesas: cpg-mssr: Document suitability for RZ/G1
      clk: renesas: cpg-mssr: Rename cpg_mssr_priv.mstp_lock
      clk: renesas: cpg-mssr: Add support for reset control

Keita Kobayashi (1):
      clk: renesas: r8a7795: Add IIC-DVFS clock

Khiem Nguyen (1):
      clk: renesas: r8a7796: Add IIC-DVFS clock

 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   6 +
 drivers/clk/renesas/clk-mstp.c                     |  11 +-
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |   1 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |   1 +
 drivers/clk/renesas/renesas-cpg-mssr.c             | 149 ++++++++++++++++++---
 5 files changed, 150 insertions(+), 18 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

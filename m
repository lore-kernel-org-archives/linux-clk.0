Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.20
Date: Fri, 31 Aug 2018 15:09:58 +0200
Message-Id: <20180831130958.6744-1-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.20-tag1

for you to fetch changes up to b30c862f2a72002c06df23d05c2ca6b49148c4d4:

  clk: renesas: r8a77990: Add missing I2C7 clock (2018-08-31 10:33:59 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v4.20

  - Improve OSC and RCLK (watchdog) handling on R-Car Gen3 SoCs,
  - Add support for SATA and Fine Display Processor (FDP) clocks on
    R-Car M3-N,
  - Add support for the new RZ/G2M (r8a774a1) SoC,
  - Small fixes and clean ups.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (2):
      clk: renesas: Add r8a774a1 CPG Core Clock Definitions
      clk: renesas: cpg-mssr: Add r8a774a1 support

Geert Uytterhoeven (13):
      clk: renesas: rcar-gen3: Rename rint to .r
      clk: renesas: rcar-gen3: Add support for OSC EXTAL predivider
      clk: renesas: r8a7795: Add OSC EXTAL predivider configuration
      clk: renesas: r8a7796: Add OSC EXTAL predivider configuration
      clk: renesas: r8a77965: Add OSC EXTAL predivider configuration
      clk: renesas: r8a77980: Add OSC predivider configuration and clock
      clk: renesas: cpg-mssr: Add support for fixed rate clocks
      clk: renesas: rcar-gen3: Add support for RCKSEL clock selection
      clk: renesas: r8a77990: Correct RCLK handling
      clk: renesas: r8a77995: Correct RCLK handling
      clk: renesas: rcar-gen3: Add support for mode pin clock selection
      clk: renesas: r8a77980: Add RCLK for watchdog timer
      clk: renesas: r8a77990: Add missing I2C7 clock

Hoan Nguyen An (1):
      clk: renesas: r8a77965: Add FDP clock

Takeshi Kihara (1):
      clk: renesas: r8a77965: Add SATA clock

 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   9 +-
 drivers/clk/renesas/Kconfig                        |   5 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r8a774a1-cpg-mssr.c            | 323 +++++++++++++++++++++
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |  67 ++---
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |  67 ++---
 drivers/clk/renesas/r8a77965-cpg-mssr.c            |  69 ++---
 drivers/clk/renesas/r8a77980-cpg-mssr.c            |  28 +-
 drivers/clk/renesas/r8a77990-cpg-mssr.c            |  13 +-
 drivers/clk/renesas/r8a77995-cpg-mssr.c            |  12 +-
 drivers/clk/renesas/rcar-gen3-cpg.c                |  40 ++-
 drivers/clk/renesas/rcar-gen3-cpg.h                |  24 +-
 drivers/clk/renesas/renesas-cpg-mssr.c             |  11 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |   4 +
 include/dt-bindings/clock/r8a774a1-cpg-mssr.h      |  58 ++++
 15 files changed, 599 insertions(+), 132 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a774a1-cpg-mssr.c
 create mode 100644 include/dt-bindings/clock/r8a774a1-cpg-mssr.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

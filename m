Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.18
Date: Wed,  9 May 2018 18:52:34 +0200
Message-Id: <1525884754-21253-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.18-tag1

for you to fetch changes up to 3570a2af473789c5d5f5b9e04f72295102967824:

  clk: renesas: cpg-mssr: Add support for R-Car E3 (2018-05-09 18:43:57 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v4.18

  - Add support for the MSIOF module clocks on R-Car M3-N,
  - Add support for the new RZ/G1C and R-Car E3 SoCs,
  - Small fixes and cleanups.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (2):
      clk: renesas: Add r8a77470 CPG Core Clock Definitions
      clk: renesas: cpg-mssr: Add r8a77470 support

Geert Uytterhoeven (7):
      clk: renesas: r8a7743: Fix LB clock divider
      clk: renesas: r8a7745: Fix LB clock divider
      clk: renesas: r8a7791/r8a7793: Fix LB clock divider
      clk: renesas: r8a7792: Fix LB clock divider
      clk: renesas: r8a7794: Fix LB clock divider
      clk: renesas: r8a77980: Correct parent clock of PCIEC0
      clk: renesas: rcar-gen2: Centralize quirks handling

Takeshi Kihara (2):
      clk: renesas: r8a77965: Add MSIOF controller clocks
      clk: renesas: Add r8a77990 CPG Core Clock Definitions

Yoshihiro Shimoda (1):
      clk: renesas: cpg-mssr: Add support for R-Car E3

 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |  10 +-
 drivers/clk/renesas/Kconfig                        |  10 +
 drivers/clk/renesas/Makefile                       |   2 +
 drivers/clk/renesas/r8a7743-cpg-mssr.c             |   2 +-
 drivers/clk/renesas/r8a7745-cpg-mssr.c             |   2 +-
 drivers/clk/renesas/r8a77470-cpg-mssr.c            | 229 ++++++++++++++++
 drivers/clk/renesas/r8a7791-cpg-mssr.c             |   2 +-
 drivers/clk/renesas/r8a7792-cpg-mssr.c             |   2 +-
 drivers/clk/renesas/r8a7794-cpg-mssr.c             |   2 +-
 drivers/clk/renesas/r8a77965-cpg-mssr.c            |   4 +
 drivers/clk/renesas/r8a77980-cpg-mssr.c            |   2 +-
 drivers/clk/renesas/r8a77990-cpg-mssr.c            | 289 +++++++++++++++++++++
 drivers/clk/renesas/rcar-gen2-cpg.c                |  24 ++
 drivers/clk/renesas/renesas-cpg-mssr.c             |  12 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |   2 +
 include/dt-bindings/clock/r8a77470-cpg-mssr.h      |  36 +++
 include/dt-bindings/clock/r8a77990-cpg-mssr.h      |  62 +++++
 17 files changed, 683 insertions(+), 9 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a77470-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/r8a77990-cpg-mssr.c
 create mode 100644 include/dt-bindings/clock/r8a77470-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/r8a77990-cpg-mssr.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

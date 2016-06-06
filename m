Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Simon Horman <horms+renesas@verge.net.au>,
	Magnus Damm <damm+renesas@opensource.se>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Add support for R-Car M3-W
Date: Mon,  6 Jun 2016 13:33:24 +0200
Message-Id: <1465212804-21391-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.8-tag1

for you to fetch changes up to e4e2d7c388350eba8b1dbc2569441ac9b545a8c4:

  clk: renesas: cpg-mssr: Add support for R-Car M3-W (2016-06-06 11:58:35 +0200)

----------------------------------------------------------------
clk: renesas: Add support for R-Car M3-W

Add initial support for the Clock Pulse Generator and Module Standby and
Software Reset modules on the Renesas R-Car M3-W SoC:
  - Basic core clocks,
  - SCIF2 (console) module clock,
  - INTC-AP (GIC) module clock.

As <dt-bindings/clock/r8a7796-cpg-mssr.h> is a hard dependency for the
initial r8a7796.dtsi file, I would appreciate if you could pull this
sooner rather than later, so Simon can pull it as well, and start
queueing up the DT files for R-Car M3-W.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (4):
      clk: renesas: cpg-mssr: Document r8a7796 support
      clk: renesas: Add r8a7796 CPG Core Clock Definitions
      clk: renesas: cpg-mssr: Extract common R-Car Gen3 support code
      clk: renesas: cpg-mssr: Add support for R-Car M3-W

 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   7 +-
 drivers/clk/renesas/Kconfig                        |   1 +
 drivers/clk/renesas/Makefile                       |   3 +-
 drivers/clk/renesas/r8a7795-cpg-mssr.c             | 360 +--------------------
 drivers/clk/renesas/r8a7796-cpg-mssr.c             | 192 +++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.c                | 359 ++++++++++++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.h                |  43 +++
 drivers/clk/renesas/renesas-cpg-mssr.c             |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |   1 +
 include/dt-bindings/clock/r8a7796-cpg-mssr.h       |  69 ++++
 10 files changed, 682 insertions(+), 359 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a7796-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/rcar-gen3-cpg.c
 create mode 100644 drivers/clk/renesas/rcar-gen3-cpg.h
 create mode 100644 include/dt-bindings/clock/r8a7796-cpg-mssr.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

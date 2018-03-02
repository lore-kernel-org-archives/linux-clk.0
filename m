Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.17
Date: Fri,  2 Mar 2018 11:17:52 +0100
Message-Id: <1519985872-3809-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.17-tag1

for you to fetch changes up to 7ce36da900c0a2ff4777d9ba51c4f1cb74205463:

  clk: renesas: cpg-mssr: Add support for R-Car M3-N (2018-02-26 09:13:29 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v4.17

  - Update legacy DT Kconfig default,
  - Add support for CPU (Z/Z2) clocks on R-Car H3 and M3-W,
  - Add support for the watchdog module clocks on R-Car Gen2 and RZ/G1,
  - Add support for the new R-Car M3-N and V3H SoCs.

Thanks for pulling!

----------------------------------------------------------------
Fabrizio Castro (5):
      clk: renesas: r8a7743: Add rwdt clock
      clk: renesas: r8a7745: Add rwdt clock
      clk: renesas: r8a7790: Add rwdt clock
      clk: renesas: r8a7791/r8a7793: Add rwdt clock
      clk: renesas: r8a7794: Add rwdt clock

Geert Uytterhoeven (2):
      clk: renesas: Stop enabling legacy DT clock support by default
      clk: renesas: r8a7792: Add rwdt clock

Jacopo Mondi (1):
      clk: renesas: cpg-mssr: Add support for R-Car M3-N

Sergei Shtylyov (2):
      dt-bindings: clock: add R8A77980 CPG core clock definitions
      clk: renesas: cpg-mssr: add R8A77980 support

Takeshi Kihara (6):
      clk: renesas: rcar-gen3: Add Z clock divider support
      clk: renesas: rcar-gen3: Add Z2 clock divider support
      clk: renesas: r8a7795: Add Z clock
      clk: renesas: r8a7795: Add Z2 clock
      clk: renesas: r8a7796: Add Z clock
      clk: renesas: r8a7796: Add Z2 clock

 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   6 +-
 drivers/clk/renesas/Kconfig                        |  13 +-
 drivers/clk/renesas/Makefile                       |   2 +
 drivers/clk/renesas/r8a7743-cpg-mssr.c             |   2 +
 drivers/clk/renesas/r8a7745-cpg-mssr.c             |   2 +
 drivers/clk/renesas/r8a7790-cpg-mssr.c             |   2 +
 drivers/clk/renesas/r8a7791-cpg-mssr.c             |   2 +
 drivers/clk/renesas/r8a7792-cpg-mssr.c             |   2 +
 drivers/clk/renesas/r8a7794-cpg-mssr.c             |   2 +
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |   2 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |   2 +
 drivers/clk/renesas/r8a77965-cpg-mssr.c            | 334 +++++++++++++++++++++
 drivers/clk/renesas/r8a77980-cpg-mssr.c            | 227 ++++++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.c                | 143 +++++++++
 drivers/clk/renesas/rcar-gen3-cpg.h                |   2 +
 drivers/clk/renesas/renesas-cpg-mssr.c             |  12 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |   2 +
 include/dt-bindings/clock/r8a77965-cpg-mssr.h      |  62 ++++
 include/dt-bindings/clock/r8a77980-cpg-mssr.h      |  51 ++++
 19 files changed, 867 insertions(+), 3 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a77965-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/r8a77980-cpg-mssr.c
 create mode 100644 include/dt-bindings/clock/r8a77965-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/r8a77980-cpg-mssr.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

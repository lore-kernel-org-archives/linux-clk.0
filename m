Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] clk: renesas: Add R-Car D3 support
Date: Thu, 20 Jul 2017 14:40:05 +0200
Message-Id: <1500554409-22423-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

This patch series adds support for clocks on the R-Car D3 SoC.

As usual, this is meant to be queued up in clk-renesas-for-v4.14.

Thanks!

Geert Uytterhoeven (4):
  clk: renesas: Add r8a77995 CPG Core Clock Definitions
  clk: renesas: rcar-gen3: Add divider support for PLL1 and PLL3
  clk: renesas: rcar-gen3: Add support for SCCG/Clean peripheral clocks
  clk: renesas: cpg-mssr: Add R8A77995 support

 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   3 +-
 drivers/clk/renesas/Kconfig                        |   5 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |  34 +--
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |  34 +--
 drivers/clk/renesas/r8a77995-cpg-mssr.c            | 236 +++++++++++++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.c                |  22 +-
 drivers/clk/renesas/rcar-gen3-cpg.h                |  15 +-
 drivers/clk/renesas/renesas-cpg-mssr.c             |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |   1 +
 include/dt-bindings/clock/r8a77995-cpg-mssr.h      |  57 +++++
 11 files changed, 375 insertions(+), 39 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a77995-cpg-mssr.c
 create mode 100644 include/dt-bindings/clock/r8a77995-cpg-mssr.h

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

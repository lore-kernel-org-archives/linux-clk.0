Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/7] clk: renesas: rcar-gen3: Misc fixes and cleanups
Date: Mon, 13 Mar 2017 17:19:47 +0100
Message-Id: <1489421994-19707-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

This patch series contains miscellaneous fixes and cleanups for the
Renesas R-Car Gen3 (H3 and M3-W) clock drivers:
  - Correct parent clock for Audio DMACs,
  - Correct names of watchdog clocks,
  - Reformat core clock tables for easier comparisons between drivers,
  - Add workaround for PLL0/2/4 errata on R-Car H3 ES1.0.

I plan to queue these up in clk-renesas-for-v4.12.

Thanks for your comments!

Geert Uytterhoeven (7):
  clk: renesas: r8a7795: Correct parent clock and sort order for Audio
    DMACs
  clk: renesas: r8a7795: Correct name of watchdog clock
  clk: renesas: r8a7796: Correct name of watchdog clock
  clk: renesas: r8a7795: Reformat core clock table
  clk: renesas: r8a7796: Reformat core clock table
  clk: renesas: rcar-gen3-cpg: Pass mode pins to rcar_gen3_cpg_init()
  clk: renesas: rcar-gen3: Add workaround for PLL0/2/4 errata on H3
    ES1.0

 drivers/clk/renesas/r8a7795-cpg-mssr.c | 28 ++++++++++++++--------------
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 16 ++++++++--------
 drivers/clk/renesas/rcar-gen3-cpg.c    | 28 +++++++++++++++++++++++++++-
 drivers/clk/renesas/rcar-gen3-cpg.h    |  2 +-
 4 files changed, 50 insertions(+), 24 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

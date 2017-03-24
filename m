Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.11
Date: Fri, 24 Mar 2017 10:39:13 +0100
Message-Id: <1490348353-10989-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.12-tag1

for you to fetch changes up to cecbe87d73006cb321dec79b349e3fefd1a80962:

  clk: renesas: rcar-gen3: Add workaround for PLL0/2/4 errata on H3 ES1.0 (2017-03-21 11:12:23 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v4.12

  - Add IMR clocks for R-Car H3 and M3-W,
  - Add workaround for PLL0/2/4 errata on R-Car H3 ES1.0,
  - Small fixes and cleanups.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (7):
      clk: renesas: r8a7795: Correct parent clock and sort order for Audio DMACs
      clk: renesas: r8a7795: Correct name of watchdog clock
      clk: renesas: r8a7796: Correct name of watchdog clock
      clk: renesas: r8a7795: Reformat core clock table
      clk: renesas: r8a7796: Reformat core clock table
      clk: renesas: rcar-gen3-cpg: Pass mode pins to rcar_gen3_cpg_init()
      clk: renesas: rcar-gen3: Add workaround for PLL0/2/4 errata on H3 ES1.0

Sergei Shtylyov (2):
      clk: renesas: r8a7795: Add IMR clocks
      clk: renesas: r8a7796: Add IMR clocks

 drivers/clk/renesas/r8a7795-cpg-mssr.c | 32 ++++++++++++++++++--------------
 drivers/clk/renesas/r8a7796-cpg-mssr.c | 18 ++++++++++--------
 drivers/clk/renesas/rcar-gen3-cpg.c    | 28 +++++++++++++++++++++++++++-
 drivers/clk/renesas/rcar-gen3-cpg.h    |  2 +-
 4 files changed, 56 insertions(+), 24 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

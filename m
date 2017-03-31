Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.12 (take two)
Date: Fri, 31 Mar 2017 11:24:13 +0200
Message-Id: <1490952253-10963-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit cecbe87d73006cb321dec79b349e3fefd1a80962:

  clk: renesas: rcar-gen3: Add workaround for PLL0/2/4 errata on H3 ES1.0 (2017-03-21 11:12:23 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.12-tag2

for you to fetch changes up to bb1953067c05be30a605ee1d5b05a2677735bb37:

  clk: renesas: rcar-gen3-cpg: Add support for RCLK on R-Car H3 ES2.0 (2017-03-30 13:26:02 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v4.12 (take two)

  - Add support for the Clock Pulse Generator / Module Standby and
    Software Reset module on revision ES2.0 of the R-Car H3 SoC, which
    differs from ES1.x in some areas.

Note that this pull request is on top of my previous pull request for
v4.12, which accidentally had a wrong version number in the subject
line, and which I believe you haven't pulled yet.

Thanks for pulling (both)!
----------------------------------------------------------------
Geert Uytterhoeven (4):
      clk: renesas: cpg-mssr: Add support for fixing up clock tables
      clk: renesas: Add r8a7795 ES2.0 CPG Core Clock Definitions
      clk: renesas: r8a7795: Add support for R-Car H3 ES2.0
      clk: renesas: rcar-gen3-cpg: Add support for RCLK on R-Car H3 ES2.0

 drivers/clk/renesas/r8a7795-cpg-mssr.c       | 201 ++++++++++++++++++++-------
 drivers/clk/renesas/rcar-gen3-cpg.c          |  38 +++--
 drivers/clk/renesas/renesas-cpg-mssr.c       |  50 +++++++
 drivers/clk/renesas/renesas-cpg-mssr.h       |  22 +++
 include/dt-bindings/clock/r8a7795-cpg-mssr.h |   7 +
 5 files changed, 257 insertions(+), 61 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

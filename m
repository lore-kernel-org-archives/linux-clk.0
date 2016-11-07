Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.10 (take one)
Date: Mon,  7 Nov 2016 16:34:28 +0100
Message-Id: <1478532868-5508-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.10-tag1

for you to fetch changes up to dbdcc4f996df280eb2758095b4774ea62da8a2a7:

  clk: renesas: r8a7796: Add DU and LVDS clocks (2016-11-02 20:40:08 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v4.10 (take one)

  - SYS-DMAC, (H)SCIF, I2C, DRIF, and graphics related clocks for R-Car
    M3-W,
  - Minor fixes and cleanups.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (4):
      clk: renesas: cpg-mssr: Always use readl()/writel()
      clk: renesas: rcar-gen3-cpg: Always use readl()/writel()
      clk: renesas: cpg-mssr: Fix inverted debug check
      clk: renesas: cpg-mssr: Remove bogus commas from error messages

Laurent Pinchart (3):
      clk: renesas: r8a7796: Add FCP clocks
      clk: renesas: r8a7796: Add VSP clocks
      clk: renesas: r8a7796: Add DU and LVDS clocks

Ramesh Shanmugasundaram (1):
      clk: renesas: r8a7796: Add DRIF clock

Ulrich Hecht (4):
      clk: renesas: r8a7796: Add SYS-DMAC clocks
      clk: renesas: r8a7796: Add SCIF clocks
      clk: renesas: r8a7796: Add HSCIF clocks
      clk: renesas: r8a7796: Add I2C clocks

 drivers/clk/renesas/r8a7796-cpg-mssr.c | 45 ++++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.c    | 14 +++++------
 drivers/clk/renesas/renesas-cpg-mssr.c | 17 ++++++-------
 3 files changed, 60 insertions(+), 16 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

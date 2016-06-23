Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Simon Horman <horms+renesas@verge.net.au>,
	Magnus Damm <damm+renesas@opensource.se>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.8 (take two)
Date: Thu, 23 Jun 2016 16:04:43 +0200
Message-Id: <1466690683-28949-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit e4e2d7c388350eba8b1dbc2569441ac9b545a8c4:

  clk: renesas: cpg-mssr: Add support for R-Car M3-W (2016-06-06 11:58:35 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.8-tag2

for you to fetch changes up to e4c82863fd17bacb60080481c11eb0303d3f83d0:

  clk: renesas: r8a7795: Add THS/TSC clock (2016-06-21 09:21:06 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v4.8 (take two)

  - Add support for R-Car V2H,
  - Add FDP1, DRIF, and thermal clocks on R-Car H3,
  - Correct a wrong parent clock.

This pull request is based on my previous request "[git pull] clk:
renesas: Add support for R-Car M3-W".
For proper merge history (auto-grabbing the commit message from the
signed tag), you should pull tags/clk-renesas-for-v4.8-tag1 first.
As <dt-bindings/clock/r8a7796-cpg-mssr.h> is a hard dependency for the
initial r8a7796.dtsi file, I would appreciate if you could do that
sooner rather than later, so Simon can pull it as well, and start
queueing up the DT files for R-Car M3-W, which need to go through
arm-soc.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (1):
      clk: renesas: r8a7795: Correct lvds clock parent

Khiem Nguyen (1):
      clk: renesas: r8a7795: Add THS/TSC clock

Kieran Bingham (1):
      clk: renesas: r8a7795: Provide FDP1 clocks

Ramesh Shanmugasundaram (1):
      clk: renesas: r8a7795: Add DRIF clock

Sergei Shtylyov (3):
      clk: renesas: rcar-gen2: Document R8A7792 support
      clk: renesas: mstp: Document R8A7792 support
      clk: renesas: Add R8A7792 support

 .../devicetree/bindings/clock/renesas,cpg-mstp-clocks.txt  |  1 +
 .../bindings/clock/renesas,rcar-gen2-cpg-clocks.txt        |  1 +
 drivers/clk/renesas/Kconfig                                |  1 +
 drivers/clk/renesas/Makefile                               |  1 +
 drivers/clk/renesas/r8a7795-cpg-mssr.c                     | 14 +++++++++++++-
 5 files changed, 17 insertions(+), 1 deletion(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

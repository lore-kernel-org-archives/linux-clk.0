Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.9 (take three)
Date: Wed, 14 Sep 2016 09:59:46 +0200
Message-Id: <1473839986-7934-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit 074969813350cda4c624a585489cc1b3550414bc:

  clk: renesas: r8a7796: Add SDIF clocks (2016-08-23 10:30:41 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.9-tag3

for you to fetch changes up to 5fad71f58f4c236118358c98f65a7251e9c718f7:

  clk: renesas: r8a7796: Add CMT clocks (2016-09-12 11:08:01 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v4.9 (take three)

  - External crystal selection for RZ/A1,
  - CMT clocks for R-Car H3 and M3-W,
  - RAVB and Thermal clocks for R-Car M3-W.

Thanks for pulling!
----------------------------------------------------------------
Bui Duc Phuc (2):
      clk: renesas: r8a7795: Add CMT clocks
      clk: renesas: r8a7796: Add CMT clocks

Chris Brandt (1):
      clk: renesas: rz: Select EXTAL vs USB clock

Khiem Nguyen (1):
      clk: renesas: r8a7796: Add THS/TSC clock

Laurent Pinchart (1):
      clk: renesas: r8a7796: Add RAVB clock

 drivers/clk/renesas/clk-rz.c           | 24 ++++++++++++++++++++++--
 drivers/clk/renesas/r8a7795-cpg-mssr.c |  4 ++++
 drivers/clk/renesas/r8a7796-cpg-mssr.c |  6 ++++++
 3 files changed, 32 insertions(+), 2 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.9
Date: Wed, 17 Aug 2016 17:00:32 +0200
Message-Id: <1471446032-15206-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.9-tag1

for you to fetch changes up to b51d5275016c6edbf4656eaee30d836fef127016:

  clk: renesas: r8a7796: Add watchdog module clock (2016-08-09 09:53:47 +0200)

----------------------------------------------------------------
clk: renesas: r8a7796: Add watchdog clocks

Add all clocks related to the Watchdog Timer (WDT) controller on the
Renesas R-Car M3-W (r8a7796) SoC.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (2):
      clk: renesas: r8a7796: Add watchdog core clocks
      clk: renesas: r8a7796: Add watchdog module clock

 drivers/clk/renesas/r8a7796-cpg-mssr.c | 7 +++++++
 1 file changed, 7 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

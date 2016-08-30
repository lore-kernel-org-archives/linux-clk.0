Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.9 (take two)
Date: Tue, 30 Aug 2016 16:56:53 +0200
Message-Id: <1472569013-3003-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit b51d5275016c6edbf4656eaee30d836fef127016:

  clk: renesas: r8a7796: Add watchdog module clock (2016-08-09 09:53:47 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.9-tag2

for you to fetch changes up to 074969813350cda4c624a585489cc1b3550414bc:

  clk: renesas: r8a7796: Add SDIF clocks (2016-08-23 10:30:41 +0200)

----------------------------------------------------------------
clk: renesas: r8a7796: Add SDHI clocks

Add all clocks needed to use the SDHI interfaces on the Renesas R-Car M3-W
(r8a7796) SoC.

Thanks for pulling!
----------------------------------------------------------------
Simon Horman (1):
      clk: renesas: r8a7796: Add SDIF clocks

Takeshi Kihara (1):
      clk: renesas: r8a7796: Add GPIO clocks

 drivers/clk/renesas/r8a7796-cpg-mssr.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

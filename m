Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/3] clk: renesas: rcar-gen3: Correct parent clock of INTC-AP
Date: Wed, 11 Oct 2017 10:29:49 +0200
Message-Id: <1507710592-13740-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

This patch series corrects the parent clock of the INTC-AP module clock
on R-Car H3 ES2.0, M3-W, and D3 SoCs, cfr. R-Car Gen3 Hardware Manual
Errata for Rev 0.55 of September 8, 2017.

These changes have no functional impact.

As usual, I plan to queue these up in clk-renesas-for-v4.15.

Thanks!

Geert Uytterhoeven (3):
  clk: renesas: r8a7795: Correct parent clock of INTC-AP
  clk: renesas: r8a7796: Correct parent clock of INTC-AP
  clk: renesas: r8a77995: Correct parent clock of INTC-AP

 drivers/clk/renesas/r8a7795-cpg-mssr.c  | 3 ++-
 drivers/clk/renesas/r8a7796-cpg-mssr.c  | 2 +-
 drivers/clk/renesas/r8a77995-cpg-mssr.c | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/5] clk: renesas: r-car gen2: Fix LB clock divider
Date: Thu, 29 Mar 2018 19:33:05 +0200
Message-Id: <1522344790-20061-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi all,

The CLK_TYPE_GEN2_LB clock type is meant for SoCs like R-Car H2, where
the LB clock divider depends on the value of the MD18 pin.

However, on most RZ/G1 and R-Car Gen2 SoCs, the LB clock divider is
fixed to 24.  Hence this series corrects the LB clock on affected SoCs
by modelling it as a fixed factor clock instead.

This doesn't have much impact, as no kernel code relies on the rate of
the LB clock.

To be queued in clk-renesas-for-v4.18.

Geert Uytterhoeven (5):
  clk: renesas: r8a7743: Fix LB clock divider
  clk: renesas: r8a7745: Fix LB clock divider
  clk: renesas: r8a7791/r8a7793: Fix LB clock divider
  clk: renesas: r8a7792: Fix LB clock divider
  clk: renesas: r8a7794: Fix LB clock divider

 drivers/clk/renesas/r8a7743-cpg-mssr.c | 2 +-
 drivers/clk/renesas/r8a7745-cpg-mssr.c | 2 +-
 drivers/clk/renesas/r8a7791-cpg-mssr.c | 2 +-
 drivers/clk/renesas/r8a7792-cpg-mssr.c | 2 +-
 drivers/clk/renesas/r8a7794-cpg-mssr.c | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

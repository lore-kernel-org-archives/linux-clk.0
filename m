Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] clk: renesas: cpg-mssr: Always use readl()/writel()
Date: Fri, 23 Sep 2016 10:32:30 +0200
Message-Id: <1474619552-29703-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

The Renesas CPG/MSSR clock drivers use a mix of clk_readl()/clk_writel()
and readl()/writel() to access the clock registers. Settle on the
generic readl()/writel().

I plan to queue this up in clk-renesas-for-v4.10.

Geert Uytterhoeven (2):
  clk: renesas: cpg-mssr: Always use readl()/writel()
  clk: renesas: rcar-gen3-cpg: Always use readl()/writel()

 drivers/clk/renesas/rcar-gen3-cpg.c    | 14 +++++++-------
 drivers/clk/renesas/renesas-cpg-mssr.c |  9 ++++-----
 2 files changed, 11 insertions(+), 12 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

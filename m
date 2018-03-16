Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/8] clk: renesas: Always use readl()/writel()
Date: Fri, 16 Mar 2018 14:40:14 +0100
Message-Id: <1521207622-3311-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

On arm32/arm64, there is no reason to use the (soon deprecated)
clk_readl()/clk_writel(), and the generic readl()/writel() should be
used in instead.

Commit 30ad3cf00e94f4a7 ("clk: renesas: rcar-gen3-cpg: Always use
readl()/writel()") already got rid of them in the R-Car Gen3 clock
driver, but Stephen noticed that a few new users crept in recently.

Hence this series fixes that, and replaces all other uses in the Renesas
clock drivers as a bonus.

I plan to queue these up in clk-renesas-for-v4.17.

Thanks!

Geert Uytterhoeven (8):
  clk: renesas: div6: Always use readl()/writel()
  clk: renesas: mstp: Always use readl()/writel()
  clk: renesas: r8a73a4: Always use readl()/writel()
  clk: renesas: r8a7740: Always use readl()/writel()
  clk: renesas: rcar-gen2: Always use readl()/writel()
  clk: renesas: rza1: Always use readl()/writel()
  clk: renesas: sh73a0: Always use readl()/writel()
  clk: renesas: rcar-gen3: Always use readl()/writel()

 drivers/clk/renesas/clk-div6.c      | 22 +++++++++++-----------
 drivers/clk/renesas/clk-mstp.c      |  4 ++--
 drivers/clk/renesas/clk-r8a73a4.c   | 11 +++++------
 drivers/clk/renesas/clk-r8a7740.c   |  8 ++++----
 drivers/clk/renesas/clk-rcar-gen2.c | 17 ++++++++---------
 drivers/clk/renesas/clk-rz.c        |  4 ++--
 drivers/clk/renesas/clk-sh73a0.c    | 14 +++++++-------
 drivers/clk/renesas/rcar-gen3-cpg.c | 14 +++++++-------
 8 files changed, 46 insertions(+), 48 deletions(-)

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

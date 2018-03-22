Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.17 (take two)
Date: Thu, 22 Mar 2018 18:09:20 +0100
Message-Id: <1521738560-14797-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit 7ce36da900c0a2ff4777d9ba51c4f1cb74205463:

  clk: renesas: cpg-mssr: Add support for R-Car M3-N (2018-02-26 09:13:29 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.17-tag2

for you to fetch changes up to 472f5f391819b4b22ec040f227aea26f515b6ae2:

  clk: renesas: cpg-mssr: Adjust r8a77980 ifdef (2018-03-21 17:35:02 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v4.17 (take two)

  - Fix the incorrect display clock on R-Car M3-N,
  - Always use readl()/writel(),
  - Small fixes.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (8):
      clk: renesas: div6: Always use readl()/writel()
      clk: renesas: mstp: Always use readl()/writel()
      clk: renesas: r8a73a4: Always use readl()/writel()
      clk: renesas: r8a7740: Always use readl()/writel()
      clk: renesas: rcar-gen2: Always use readl()/writel()
      clk: renesas: rza1: Always use readl()/writel()
      clk: renesas: sh73a0: Always use readl()/writel()
      clk: renesas: rcar-gen3: Always use readl()/writel()

Jacopo Mondi (1):
      clk: renesas: r8a77965: Replace DU2 clock

Magnus Damm (1):
      clk: renesas: cpg-mssr: Adjust r8a77980 ifdef

 drivers/clk/renesas/clk-div6.c          | 22 +++++++++++-----------
 drivers/clk/renesas/clk-mstp.c          |  4 ++--
 drivers/clk/renesas/clk-r8a73a4.c       | 11 +++++------
 drivers/clk/renesas/clk-r8a7740.c       |  8 ++++----
 drivers/clk/renesas/clk-rcar-gen2.c     | 17 ++++++++---------
 drivers/clk/renesas/clk-rz.c            |  4 ++--
 drivers/clk/renesas/clk-sh73a0.c        | 14 +++++++-------
 drivers/clk/renesas/r8a77965-cpg-mssr.c |  2 +-
 drivers/clk/renesas/rcar-gen3-cpg.c     | 14 +++++++-------
 drivers/clk/renesas/renesas-cpg-mssr.c  |  2 +-
 10 files changed, 48 insertions(+), 50 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

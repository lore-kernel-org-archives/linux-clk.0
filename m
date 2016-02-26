Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: shmobile: Updates for v4.6 (take two)
Date: Fri, 26 Feb 2016 16:58:24 +0100
Message-Id: <1456502304-24631-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit f099aa075749c6fadb79554ce175fbdc31c45d7a:

  clk: shmobile: r8a7795: Add INTC-EX clock (2016-02-18 09:01:46 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git clk-shmobile-for-v4.6

for you to fetch changes up to a080c8c346d650c84adfd5ff16ac2160b646d73e:

  clk: shmobile: r8a7795: Add CAN FD peripheral clock (2016-02-26 12:04:30 +0100)

Summary:
  - Fix a bug in the div6 clock driver that was exposed by CAN support
    on R-Car H3,
  - Add more module clocks for R-Car H3.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      clk: shmobile: div6: Fix .recalc_rate() using a stale divisor

Laurent Pinchart (2):
      clk: shmobile: r8a7795: Add FCP clocks
      clk: shmobile: r8a7795: Add LVDS module clock

Ramesh Shanmugasundaram (3):
      clk: shmobile: r8a7795: Add CAN peripheral clock
      clk: shmobile: r8a7795: Add CANFD clock
      clk: shmobile: r8a7795: Add CAN FD peripheral clock

 drivers/clk/shmobile/clk-div6.c         |  3 +--
 drivers/clk/shmobile/r8a7795-cpg-mssr.c | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

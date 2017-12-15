Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.16
Date: Fri, 15 Dec 2017 10:38:37 +0100
Message-Id: <1513330717-16712-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.16-tag1

for you to fetch changes up to 7aff266552d6042b43d3d5a9b13f0009ef862033:

  clk: renesas: cpg-mssr: Keep wakeup sources active during system suspend (2017-12-14 16:40:36 +0100)

----------------------------------------------------------------
clk: renesas: Updates for v4.16

  - Add support for the LVDS module clock on R-Car V3M,
  - Keep wakeup sources in Clock Domains active during system suspend,
    which will allow removing workarounds from drivers later.

Thanks for pulling!

P.S. There seems to be issues with kernel.org mirrorring. I can't see my
     tag in the public repo, but the clk-renesas-for-v4.16 branch is
     up-to-date (last change 18 hours ago).
----------------------------------------------------------------
Geert Uytterhoeven (2):
      clk: renesas: mstp: Keep wakeup sources active during system suspend
      clk: renesas: cpg-mssr: Keep wakeup sources active during system suspend

Sergei Shtylyov (1):
      clk: renesas: r8a77970: Add LVDS clock

 drivers/clk/renesas/clk-mstp.c          | 2 +-
 drivers/clk/renesas/r8a77970-cpg-mssr.c | 1 +
 drivers/clk/renesas/renesas-cpg-mssr.c  | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

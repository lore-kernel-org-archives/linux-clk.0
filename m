Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.7 (take three)
Date: Mon,  2 May 2016 13:47:34 +0200
Message-Id: <1462189654-31767-1-git-send-email-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

	Hi Mike, Stephen,

The following changes since commit 2066390ad47b374f3d35075a32325b47d15bf735:

  clk: renesas: cpg-mssr: Export cpg_mssr_{at,de}tach_dev() (2016-04-20 09:17:07 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.7-tag3

for you to fetch changes up to d04a75af450782db2937603bb6706bf6fa7c6f37:

  clk: renesas: cpg-mssr: Use always-on governor for Clock Domain (2016-04-28 10:32:55 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v4.7 (take three)

  - Support for CSI2 and VIN module clocks on R-Car H3,
  - Renesas CPG/MSTP and CPG/MSSR Clock Domain fixes.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (4):
      clk: renesas: mstp: Postpone call to pm_genpd_init()
      clk: renesas: mstp: Use always-on governor for Clock Domain
      clk: renesas: cpg-mssr: Postpone call to pm_genpd_init()
      clk: renesas: cpg-mssr: Use always-on governor for Clock Domain

Niklas Söderlund (2):
      clk: renesas: r8a7795: Add CSI2 clocks
      clk: renesas: r8a7795: Add VIN clocks

 drivers/clk/renesas/clk-mstp.c         |  3 +--
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 13 +++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c |  2 +-
 3 files changed, 15 insertions(+), 3 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

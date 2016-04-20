Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: R-Car SYSC PM Domain Preparation
Date: Wed, 20 Apr 2016 14:01:25 +0200
Message-Id: <1461153685-614-1-git-send-email-geert@linux-m68k.org>
List-ID: <linux-clk.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>

	Hi Mike, Stephen,

The following changes since commit 12a56817b329d8a73ab53bad09aa976aeea46db9:

  clk: renesas: mstp: Clarify cpg_mstp_{at,de}tach_dev() domain parameter (2016-04-07 17:27:13 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.7-tag2

for you to fetch changes up to 2066390ad47b374f3d35075a32325b47d15bf735:

  clk: renesas: cpg-mssr: Export cpg_mssr_{at,de}tach_dev() (2016-04-20 09:17:07 +0200)

----------------------------------------------------------------
clk: renesas: R-Car SYSC PM Domain Preparation

  - Export the CPG/MSSR and CPG/MSTP attach/detach_dev callbacks, so
    they can be called by the R-Car SYSC PM Domain driver.

As this is a hard dependency for R-Car SYSC PM Domains, I would
appreciate if you could pull this sooner rather than later, so Simon can
pull it as well, and queue on top of it the bulk of the R-Car SYSC PM
Domain work, and enablement of DU and VSP on R-Car H3 which depends on
these PM Domains.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (3):
      clk: renesas: Provide Kconfig symbols for CPG/MSSR and CPG/MSTP support
      clk: renesas: mstp: Provide dummy attach/detach_dev callbacks
      clk: renesas: cpg-mssr: Export cpg_mssr_{at,de}tach_dev()

 drivers/clk/Kconfig                    |  1 +
 drivers/clk/renesas/Kconfig            | 16 ++++++++++++++++
 drivers/clk/renesas/Makefile           | 26 ++++++++++++++------------
 drivers/clk/renesas/renesas-cpg-mssr.c | 18 ++++++++++++------
 include/linux/clk/renesas.h            | 12 ++++++++++++
 5 files changed, 55 insertions(+), 18 deletions(-)
 create mode 100644 drivers/clk/renesas/Kconfig

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

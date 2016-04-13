Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.7
Date: Wed, 13 Apr 2016 10:55:28 +0200
Message-Id: <1460537728-29502-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git clk-renesas-for-v4.7

for you to fetch changes up to 12a56817b329d8a73ab53bad09aa976aeea46db9:

  clk: renesas: mstp: Clarify cpg_mstp_{at,de}tach_dev() domain parameter (2016-04-07 17:27:13 +0200)

Summary:
  - Support for the PWM module clock and watchdog related clocks on R-Car H3,
  - Cleanups and clarifications.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (3):
      clk: renesas: mstp: Drop check for CONFIG_PM_GENERIC_DOMAINS_OF
      clk: renesas: cpg-mssr: Drop check for CONFIG_PM_GENERIC_DOMAINS_OF
      clk: renesas: mstp: Clarify cpg_mstp_{at,de}tach_dev() domain parameter

Ulrich Hecht (1):
      clk: renesas: r8a7795: add PWM clock

Wolfram Sang (5):
      clk: renesas: r8a7795: make SD clk definition specific for GEN3
      clk: renesas: cpg-mssr: add generic support for read-only DIV6 clocks
      clk: renesas: r8a7795: add OSC and RINT clocks
      clk: renesas: r8a7795: add R clk
      clk: renesas: r8a7795: add RWDT clock

 drivers/clk/renesas/clk-mstp.c         |  7 ++-----
 drivers/clk/renesas/r8a7795-cpg-mssr.c | 34 ++++++++++++++++++++++++++++++----
 drivers/clk/renesas/renesas-cpg-mssr.c | 29 ++++++++++++-----------------
 drivers/clk/renesas/renesas-cpg-mssr.h |  6 +++---
 include/linux/clk/renesas.h            |  8 ++------
 5 files changed, 49 insertions(+), 35 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

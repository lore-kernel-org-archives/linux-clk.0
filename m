Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 0/4] clk: renesas: R-Car SYSC PM Domain Preparation
Date: Wed, 13 Apr 2016 16:44:14 +0200
Message-Id: <1460558657-10128-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen, Simon, Magnus,

This patch series prepares the Renesas CPG/MSSR and CPG/MSTP drivers for
the advent of R-Car SYSC PM Domains.

Support for the latter will be introduced in 3 patch series:
  1. "[PATCH v5 0/7] PM / Domains: Add DT bindings for the R-Car System
      Controller",
  2. "[PATCH v5 00/11] soc: renesas: Add R-Car SYSC PM Domain Support",
  3. "[PATCH v5 00/12] ARM/arm64: dts: rcar: Add SYSC PM domains".

This patch series is against the pull request I've sent earlier today
("[git pull] clk: renesas: Updates for v4.7").

Changes compared to v1:
  - Drop cleanups that are already included in the pull request,
  - Provide Kconfig symbols for CPG/MSSR and CPG/MSTP support,
  - Provide dummy attach/detach_dev callbacks, so the rcar-sysc driver
    won't have to care about support being included or not.

As this series is a hard dependency for the second R-Car SYSC series, I
think it's best that I just queue this series in my clk-renesas-for-v4.7
branch, and ask both Mike/Stephen and Simon to pull from it.
Would that be OK for you?

Thanks!

Geert Uytterhoeven (3):
  clk: renesas: Provide Kconfig symbols for CPG/MSSR and CPG/MSTP
    support
  clk: renesas: mstp: Provide dummy attach/detach_dev callbacks
  clk: renesas: cpg-mssr: Export cpg_mssr_{at,de}tach_dev()

 drivers/clk/Kconfig                    |  1 +
 drivers/clk/renesas/Kconfig            | 16 ++++++++++++++++
 drivers/clk/renesas/Makefile           | 26 ++++++++++++++------------
 drivers/clk/renesas/renesas-cpg-mssr.c | 18 ++++++++++++------
 include/linux/clk/renesas.h            | 12 ++++++++++++
 5 files changed, 55 insertions(+), 18 deletions(-)
 create mode 100644 drivers/clk/renesas/Kconfig

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

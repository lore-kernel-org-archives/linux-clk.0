Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Simon Horman <horms+renesas@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] clk: renesas: PM Domain Cleanups and Preparation
Date: Wed,  9 Mar 2016 20:18:30 +0100
Message-Id: <1457551114-21764-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

This patch series performs some cleanups related to PM Domains on the
Renesas clock drivers, and prepares the CPG/MSSR driver for the advent
of R-Car SYSC PM Domains.

Support for the latter will be introduced in 3 patch series:
  - "[PATCH v3 0/7] PM / Domains: Add DT bindings for the R-Car System
    Controller",
  - "[PATCH v3 00/11] soc: renesas: Add R-Car SYSC PM Domain Support",
  - "[PATCH v3 0/6] ARM/arm64: dts: rcar: Add SYSC PM domains".

This patch series is against clk/clk-next with "[PATCH v2] clk: renesas:
Rename header file renesas.h" applied.

Thanks for your comments!

Geert Uytterhoeven (4):
  clk: renesas: mstp: Drop check for CONFIG_PM_GENERIC_DOMAINS_OF
  clk: renesas: cpg-mssr: Drop check for CONFIG_PM_GENERIC_DOMAINS_OF
  clk: renesas: mstp: Clarify cpg_mstp_{at,de}tach_dev() domain
    parameter
  clk: renesas: cpg-mssr: Export cpg_mssr_{at,de}tach_dev()

 drivers/clk/renesas/clk-mstp.c         |  6 ++----
 drivers/clk/renesas/renesas-cpg-mssr.c | 27 ++++++++++++---------------
 include/linux/clk/renesas.h            | 10 ++++------
 3 files changed, 18 insertions(+), 25 deletions(-)

-- 
1.9.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

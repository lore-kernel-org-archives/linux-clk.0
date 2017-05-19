Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 00/10] clk: renesas: rcar-gen2: Add new CPG/MSSR drivers
Date: Fri, 19 May 2017 10:45:55 +0200
Message-Id: <1495183565-21679-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

	Hi all,

Currently Renesas R-Car Gen2 SoCs use the common clk-rcar-gen2,
clk-mstp, and clk-div6 drivers, which depend on most clocks being
described in DT.  Especially the module (MSTP) clocks are cumbersome and
error prone, due to 3 arrays (clocks, clock-indices, and
clock-output-names) to be kept in sync. In addition, the clk-mstp driver
cannot be extended easily to also support module resets, which are
provided by the same hardware module.

Hence when developing support for R-Car Gen3 SoCs, another approach was
chosen, which led to the CPG/MSSR driver core, and SoC-specific
subdrivers (initially for R-Car Gen3, but later also for RZ/G1).

This series introduces new clock drivers for all supported R-Car Gen2
SoCs, using the CPG/MSSR driver core, and the support for RZ/G1.  They
provide all clocks supported by the old driver, plus a few more.
The old driver can still be used through a Kconfig option, to preserve
backward compatibility with old DTBs.

This series does not include the corresponding DTS updates.  These will
be posted as a separate series later.

Changes compared to v1:
  - Add Acked-by, Reviewed-by,
  - Add more rationale to the clock driver patch descriptions.

This series depends on "[PATCH v2] clk: renesas: Rework Kconfig and
Makefile logic", which I posted before.

For testing, this patch series, incl. all dependencies and the DTS
updates, are available in the topic/rcar2-cpg-mssr-v2 branch of my
renesas-drivers git repository at
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git.

This has been tested on r8a7790/lager, r8a7791/koelsch, r8a7792/blanche,
r8a7793/gose, and r8a7794/alt.  /sys/kernel/debug/clk/clk_summary has
been compared before and after the conversion.

I plan to queue this up in clk-renesas-for-v4.13, so the DTS updates can
be queued for v4.14 later.

Thanks!

Geert Uytterhoeven (10):
  clk: renesas: cpg-mssr: Document R-Car Gen2 support
  clk: renesas: Add r8a7790 CPG Core Clock Definitions
  clk: renesas: Add r8a7791 CPG Core Clock Definitions
  clk: renesas: Add r8a7792 CPG Core Clock Definitions
  clk: renesas: Add r8a7793 CPG Core Clock Definitions
  clk: renesas: Add r8a7794 CPG Core Clock Definitions
  clk: renesas: r8a7790: Add new CPG/MSSR driver
  clk: renesas: r8a7791/r8a7793: Add new CPG/MSSR driver
  clk: renesas: r8a7792: Add new CPG/MSSR driver
  clk: renesas: r8a7794: Add new CPG/MSSR driver

 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |  10 +-
 drivers/clk/renesas/Kconfig                        |  22 +-
 drivers/clk/renesas/Makefile                       |   4 +
 drivers/clk/renesas/r8a7790-cpg-mssr.c             | 278 ++++++++++++++++++++
 drivers/clk/renesas/r8a7791-cpg-mssr.c             | 286 +++++++++++++++++++++
 drivers/clk/renesas/r8a7792-cpg-mssr.c             | 221 ++++++++++++++++
 drivers/clk/renesas/r8a7794-cpg-mssr.c             | 255 ++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c             |  29 +++
 drivers/clk/renesas/renesas-cpg-mssr.h             |   4 +
 include/dt-bindings/clock/r8a7790-cpg-mssr.h       |  52 ++++
 include/dt-bindings/clock/r8a7791-cpg-mssr.h       |  48 ++++
 include/dt-bindings/clock/r8a7792-cpg-mssr.h       |  43 ++++
 include/dt-bindings/clock/r8a7793-cpg-mssr.h       |  48 ++++
 include/dt-bindings/clock/r8a7794-cpg-mssr.h       |  47 ++++
 14 files changed, 1341 insertions(+), 6 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a7790-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/r8a7791-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/r8a7792-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/r8a7794-cpg-mssr.c
 create mode 100644 include/dt-bindings/clock/r8a7790-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/r8a7791-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/r8a7792-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/r8a7793-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/r8a7794-cpg-mssr.h

-- 
2.7.4

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

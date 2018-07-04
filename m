Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.19
Date: Wed,  4 Jul 2018 11:45:52 +0200
Message-Id: <20180704094552.16235-1-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:

  Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.19-tag1

for you to fetch changes up to 4c3d88526eba214357150764a0e3e5308acbef4a:

  clk: renesas: Renesas R9A06G032 clock driver (2018-06-25 11:17:13 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v4.19

  - Add support for Crypto Engine clocks on R-Car H3,
  - Add support for the new RZ/N1D SoC.

Thanks for pulling!

----------------------------------------------------------------
Geert Uytterhoeven (1):
      clk: renesas: r8a7795: Add CR clock

Gilad Ben-Yossef (1):
      clk: renesas: r8a7795: Add CCREE clock

Michel Pollet (3):
      dt-bindings: clock: Add the r9a06g032-sysctrl.h file
      dt-bindings: clock: renesas,r9a06g032-sysctrl: documentation
      clk: renesas: Renesas R9A06G032 clock driver

 .../bindings/clock/renesas,r9a06g032-sysctrl.txt   |  43 +
 drivers/clk/renesas/Kconfig                        |   6 +
 drivers/clk/renesas/Makefile                       |   1 +
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |   2 +
 drivers/clk/renesas/r9a06g032-clocks.c             | 893 +++++++++++++++++++++
 include/dt-bindings/clock/r9a06g032-sysctrl.h      | 148 ++++
 6 files changed, 1093 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt
 create mode 100644 drivers/clk/renesas/r9a06g032-clocks.c
 create mode 100644 include/dt-bindings/clock/r9a06g032-sysctrl.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

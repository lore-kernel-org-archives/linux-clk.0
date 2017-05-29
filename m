Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.13
Date: Mon, 29 May 2017 13:47:02 +0200
Message-Id: <1496058422-12058-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.13-tag1

for you to fetch changes up to 2d75588a28c6bbbb7a026087aa61be1492b3d6ac:

  clk: renesas: r8a7794: Add new CPG/MSSR driver (2017-05-24 10:20:03 +0200)

----------------------------------------------------------------
clk: renesas: Updates for v4.13

  - Add more module clocks for R-Car H3 ES2.0 and M3-W,
  - Add CPG/MSSR drivers for all supported R-Car Gen2 SoCs, enabling support
    for module resets, which are not supported by the existing driver,
  - Rework Kconfig and Makefile logic,
  - Small fixes and cleanups.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (18):
      clk: renesas: rcar-gen2: Fix PLL0 on R-Car V2H and E2
      clk: renesas: r8a7745: Remove nonexisting scu-src[0789] clocks
      clk: renesas: r8a7745: Remove PLL configs for MD19=0
      clk: renesas: Do not build clk-div6 for R8A7792
      clk: renesas: Use pm_clk_no_clocks() helper i.s.o. direct access
      clk: renesas: r8a7795: Correct pwm, gpio, and i2c parent clocks on ES2.0
      clk: renesas: cpg-mssr: Initialize error pointer using ERR_PTR()
      clk: renesas: Rework Kconfig and Makefile logic
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

Harunobu Kurokawa (1):
      clk: renesas: r8a7796: Add PCIe clocks

Hiromitsu Yamasaki (2):
      clk: renesas: r8a7796: Add Audio-DMAC clocks
      clk: renesas: r8a7796: Add USB-DMAC clocks

Kazuya Mizuguchi (5):
      clk: renesas: r8a7796: Add EHCI/OHCI clocks
      clk: renesas: r8a7796: Add Sound SSI clock
      clk: renesas: r8a7796: Add Sound SRC clock
      clk: renesas: r8a7796: Add Sound DVC clocks
      clk: renesas: r8a7796: Add HS-USB clock

Koji Matsuoka (1):
      clk: renesas: r8a7796: Add HDMI clock

Ryo Kodama (1):
      clk: renesas: r8a7796: Add PWM clock

Takeshi Kihara (4):
      clk: renesas: r8a7795: Add EHCI/OHCI ch3 clock
      clk: renesas: r8a7795: Add USB-DMAC ch3 clock
      clk: renesas: r8a7795: Add HS-USB ch3 clock
      clk: renesas: r8a7796: Add INTC-EX clock

 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |  10 +-
 drivers/clk/Makefile                               |   2 +-
 drivers/clk/renesas/Kconfig                        | 139 ++++++++--
 drivers/clk/renesas/Makefile                       |  41 +--
 drivers/clk/renesas/clk-mstp.c                     |   2 +-
 drivers/clk/renesas/clk-rcar-gen2.c                |  23 +-
 drivers/clk/renesas/r8a7745-cpg-mssr.c             |  17 +-
 drivers/clk/renesas/r8a7790-cpg-mssr.c             | 278 ++++++++++++++++++++
 drivers/clk/renesas/r8a7791-cpg-mssr.c             | 286 +++++++++++++++++++++
 drivers/clk/renesas/r8a7792-cpg-mssr.c             | 221 ++++++++++++++++
 drivers/clk/renesas/r8a7794-cpg-mssr.c             | 255 ++++++++++++++++++
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |  43 +++-
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |  39 +++
 drivers/clk/renesas/renesas-cpg-mssr.c             |  41 ++-
 drivers/clk/renesas/renesas-cpg-mssr.h             |   4 +
 include/dt-bindings/clock/r8a7790-cpg-mssr.h       |  52 ++++
 include/dt-bindings/clock/r8a7791-cpg-mssr.h       |  48 ++++
 include/dt-bindings/clock/r8a7792-cpg-mssr.h       |  43 ++++
 include/dt-bindings/clock/r8a7793-cpg-mssr.h       |  48 ++++
 include/dt-bindings/clock/r8a7794-cpg-mssr.h       |  47 ++++
 20 files changed, 1565 insertions(+), 74 deletions(-)
 create mode 100644 drivers/clk/renesas/r8a7790-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/r8a7791-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/r8a7792-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/r8a7794-cpg-mssr.c
 create mode 100644 include/dt-bindings/clock/r8a7790-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/r8a7791-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/r8a7792-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/r8a7793-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/r8a7794-cpg-mssr.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

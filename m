Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.14
Date: Thu, 17 Aug 2017 10:29:02 +0200
Message-Id: <1502958542-2900-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.14-tag1

for you to fetch changes up to c29f82951b974f27e0bc4ce2525db164f86f2e4d:

  clk: renesas: r8a7796: Add USB3.0 clock (2017-08-17 09:22:26 +0200)

----------------------------------------------------------------
A bit delayed due to holidays, but here they are!

clk: renesas: Updates for v4.14

  - Add more module clocks for R-Car V2H and M3-W,
  - Add support for the R-Car Gen3 USB 2.0 clock selector PHY,
  - Add support for the new R-Car D3 SoC,
  - Allow compile-testing of all (sub)drivers now all dummy infrastructure
    is available,
  - Small fixes and cleanups.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (7):
      clk: renesas: div6: Document fields used for parent selection
      clk: renesas: r8a7792: Add IMR-LX3/LSX3 clocks
      clk: renesas: Allow compile-testing of all (sub)drivers
      clk: renesas: Add r8a77995 CPG Core Clock Definitions
      clk: renesas: rcar-gen3: Add divider support for PLL1 and PLL3
      clk: renesas: rcar-gen3: Add support for SCCG/Clean peripheral clocks
      clk: renesas: cpg-mssr: Add R8A77995 support

Hiromitsu Yamasaki (1):
      clk: renesas: r8a7796: Add USB3.0 clock

Wolfram Sang (2):
      clk: renesas: rcar-gen3-cpg: Drop superfluous variable
      clk: renesas: rcar-gen3-cpg: Refactor checks for accessing the div table

Yoshihiro Shimoda (1):
      clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0 clock selector PHY

 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   3 +-
 .../bindings/clock/renesas,rcar-usb2-clock-sel.txt |  55 +++++
 drivers/clk/renesas/Kconfig                        |  48 +++--
 drivers/clk/renesas/Makefile                       |   2 +
 drivers/clk/renesas/clk-div6.c                     |   3 +
 drivers/clk/renesas/r8a7792-cpg-mssr.c             |   7 +
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |  34 +--
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |  35 +--
 drivers/clk/renesas/r8a77995-cpg-mssr.c            | 236 +++++++++++++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.c                |  69 +++---
 drivers/clk/renesas/rcar-gen3-cpg.h                |  15 +-
 drivers/clk/renesas/rcar-usb2-clock-sel.c          | 188 ++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.c             |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |   1 +
 include/dt-bindings/clock/r8a77995-cpg-mssr.h      |  57 +++++
 15 files changed, 674 insertions(+), 85 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
 create mode 100644 drivers/clk/renesas/r8a77995-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/rcar-usb2-clock-sel.c
 create mode 100644 include/dt-bindings/clock/r8a77995-cpg-mssr.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

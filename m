Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Simon Horman <horms@verge.net.au>
Cc: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [git pull] clk: renesas: Updates for v4.10 (take two)
Date: Mon,  7 Nov 2016 16:35:04 +0100
Message-Id: <1478532904-5604-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

	Hi Mike, Stephen,

The following changes since commit dbdcc4f996df280eb2758095b4774ea62da8a2a7:

  clk: renesas: r8a7796: Add DU and LVDS clocks (2016-11-02 20:40:08 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v4.10-tag2

for you to fetch changes up to 1936be95e013802291201c1ed193e04fd1ed3d13:

  Merge branch 'rzg-clock-defs' into clk-renesas-for-v4.10 (2016-11-07 15:15:33 +0100)

----------------------------------------------------------------

clk: renesas: Updates for v4.10 (take two)

  - Add R-Car RST driver for obtaining mode pin state, and move the
    related functionality from platform code to DT,
  - Add r8a7743 and r8a7745 CPG Core Clock Definitions.

After this:
  - Simon can pull from

	git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git rcar-rst

    and queue up more cleanups in platform code, which depend on the
    clock drivers using the RST driver,

  - Simon can pull from

	git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git zg-clock-defs

    and queue up the RZ/G1M and RZ/G1E DTS files, which depend on the
    CPG Core Clock Definitions.

  - I can queue up the RZ/G1M and RZ/G1E clock drivers, which depend on
    both.

Thanks for pulling!
----------------------------------------------------------------
Geert Uytterhoeven (25):
      reset: Add renesas,rst DT bindings
      soc: renesas: Add R-Car RST driver
      ARM: dts: r8a7778: Add device node for RESET/WDT module
      ARM: dts: r8a7779: Add device node for RESET/WDT module
      ARM: dts: r8a7790: Add device node for RST module
      ARM: dts: r8a7791: Add device node for RST module
      ARM: dts: r8a7792: Add device node for RST module
      ARM: dts: r8a7793: Add device node for RST module
      ARM: dts: r8a7794: Add device node for RST module
      arm64: renesas: r8a7795 dtsi: Add device node for RST module
      arm64: renesas: r8a7796 dtsi: Add device node for RST module
      clk: renesas: r8a7778: Obtain mode pin values using R-Car RST driver
      clk: renesas: r8a7779: Obtain mode pin values from R-Car RST driver
      clk: renesas: rcar-gen2: Obtain mode pin values using RST driver
      clk: renesas: r8a7795: Obtain mode pin values from R-Car RST driver
      clk: renesas: r8a7796: Obtain mode pin values from R-Car RST driver
      clk: renesas: rcar-gen3-cpg: Remove obsolete rcar_gen3_read_mode_pins()
      ARM: shmobile: r8a7778: Stop passing mode pins state to clock driver
      ARM: shmobile: r8a7779: Stop passing mode pins state to clock driver
      ARM: shmobile: rcar-gen2: Stop passing mode pins state to clock driver
      clk: renesas: r8a7778: Remove obsolete r8a7778_clocks_init()
      clk: renesas: r8a7779: Remove obsolete r8a7779_clocks_init()
      clk: renesas: rcar-gen2: Remove obsolete rcar_gen2_clocks_init()
      Merge branch 'rcar-rst' into clk-renesas-for-v4.10
      Merge branch 'rzg-clock-defs' into clk-renesas-for-v4.10

Sergei Shtylyov (2):
      clk: renesas: Add r8a7743 CPG Core Clock Definitions
      clk: renesas: Add r8a7745 CPG Core Clock Definitions

 .../devicetree/bindings/reset/renesas,rst.txt      | 37 +++++++++
 arch/arm/boot/dts/r8a7778.dtsi                     |  5 ++
 arch/arm/boot/dts/r8a7779.dtsi                     |  5 ++
 arch/arm/boot/dts/r8a7790.dtsi                     |  5 ++
 arch/arm/boot/dts/r8a7791.dtsi                     |  5 ++
 arch/arm/boot/dts/r8a7792.dtsi                     |  5 ++
 arch/arm/boot/dts/r8a7793.dtsi                     |  5 ++
 arch/arm/boot/dts/r8a7794.dtsi                     |  5 ++
 arch/arm/mach-shmobile/setup-r8a7778.c             | 15 ----
 arch/arm/mach-shmobile/setup-r8a7779.c             | 27 -------
 arch/arm/mach-shmobile/setup-rcar-gen2.c           |  5 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |  5 ++
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           |  5 ++
 drivers/clk/renesas/clk-r8a7778.c                  | 26 +++---
 drivers/clk/renesas/clk-r8a7779.c                  | 18 ++---
 drivers/clk/renesas/clk-rcar-gen2.c                | 32 ++++++--
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |  8 +-
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |  8 +-
 drivers/clk/renesas/rcar-gen3-cpg.c                | 17 ----
 drivers/clk/renesas/rcar-gen3-cpg.h                |  1 -
 drivers/soc/renesas/Makefile                       |  5 ++
 drivers/soc/renesas/rcar-rst.c                     | 92 ++++++++++++++++++++++
 include/dt-bindings/clock/r8a7743-cpg-mssr.h       | 43 ++++++++++
 include/dt-bindings/clock/r8a7745-cpg-mssr.h       | 44 +++++++++++
 include/linux/clk/renesas.h                        |  4 -
 include/linux/soc/renesas/rcar-rst.h               |  6 ++
 26 files changed, 333 insertions(+), 100 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/renesas,rst.txt
 create mode 100644 drivers/soc/renesas/rcar-rst.c
 create mode 100644 include/dt-bindings/clock/r8a7743-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/r8a7745-cpg-mssr.h
 create mode 100644 include/linux/soc/renesas/rcar-rst.h

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: changes for v4.9
Date: Mon,  3 Oct 2016 18:07:42 -0700
Message-Id: <20161004010742.23610-1-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit e4abe2b9ab3ac79537d99dfceff7302739a586bc:

  Merge tag 'sunxi-clk-fixes-for-4.8' of https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux into clk-fixes (2016-09-08 12:54:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

for you to fetch changes up to b4626a7f489238a59f08f0b216e883bac07260d7:

  CLK: Add Loongson1C clock support (2016-09-23 14:49:21 -0700)

----------------------------------------------------------------
The core clk framework changes are small again. They're mostly minor fixes
that weren't causing enough problems (or any problems when we're just
clarifying things) to warrant sending outside the merge window. The
majority of changes are in drivers for various SoCs. Full details
are in the logs, but here's the summary.

Core:

 - Better support for DeviceTree overlays with the addition of the
   CLK_OF_DECLARE_DRIVER macro. Now we won't probe a clk driver
   for a device node that matched during of_clk_init(), unless
   the driver uses CLK_OF_DECLARE_DRIVER instead of CLK_OF_DECLARE.
   This allows overlays to work cleanly for drivers that must probe
   before the device model is ready, and also after it's ready
   when an overlay is loaded.

 - Clarification in the code around how clk_hw pointers are returned
   from of clk providers

 - Proper migration of prepare/enable counts to parents when the
   clk tree is constructed

New Drivers:

 - Socionext's UniPhier SoCs
 - Loongson1C
 - ZTE ZX296718
 - Qualcomm MDM9615
 - Amlogic GXBB AO clocks and resets
 - Broadcom BCM53573 ILP
 - Maxim MAX77620

Updates:

 - Four Allwinner SoCs are migrated to the new style clk driver (A31, A31s,
   A23 and A33)
 - Exynos 5xxx audio and DRAM clks
 - Loongson1B AC97, DMA and NAND clks
 - Rockchip DDR clks and rk3399 driver tweaks
 - Renesas R-Car M3-W (r8a7796) SoC SDHI interface and Watchdog timer clks
 - Renasas R-Car H3 and M3-W CMT clks and RAVB+Thermal clks for M3-W
 - Amlogic GXBB MMC gate clks
 - at91 sama5d4 sckc
 - Removal of STiH415 and STiH416 clk support as the SoC is being removed
 - Rework of STiH4xx clk support for new style bindings
 - Continuation of driver migration to clk_hw based registration APIs
 - xgene PMD support
 - bcm2835 critical clk markings
 - ARM versatile ICST

----------------------------------------------------------------
Alexander Müller (6):
      clk: meson: Rename meson8b-clkc.c to reflect gxbb naming convention
      meson: clk: Move register definitions to meson8b.h
      meson: clk: Rename register names according to Amlogic datasheet
      clk: meson: Copy meson8b CLKID defines to private header file
      gxbb: clk: Adjust MESON_GATE macro to be shared with meson8b
      meson: clk: Add support for clock gates

Alexandre Belloni (3):
      clk: at91: move slow clock controller clocks to sckc.c
      clk: at91: Add sama5d4 sckc support
      clk: at91: sckc: optimize boot time

Arnd Bergmann (2):
      clk: meson: fix CLKID_GCLK_VENCI_INT typo
      clk: zx: fix pointer case warnings

Arvind Yadav (3):
      clk: rockchip: handle of_iomap failures in legacy clock driver
      clk: mediatek: clk-mt8173: Unmap region obtained by of_iomap
      clk: nxp: clk-lpc32xx: Unmap region obtained by of_iomap

Baoyou Xie (1):
      clk: mmp: add missing header dependencies

Bui Duc Phuc (2):
      clk: renesas: r8a7795: Add CMT clocks
      clk: renesas: r8a7796: Add CMT clocks

Chanwoo Choi (5):
      clk: samsung: Add clock IDs for the CMU_CDREX (DRAM Express Controller)
      MAINTAINERS: Add myself as Samsung SoC clock drivers co-maintainer
      clk: samsung: exynos5260: Move struct samsung_cmu_info to init section
      clk: samsung: exynos5410: Use samsung_cmu_register_one() to simplify code
      clk: samsung: exynos5420: Add clocks for CMU_CDREX domain

Chen-Yu Tsai (9):
      clk: sunxi-ng: mux: Increase fixed pre-divider div size
      clk: sunxi-ng: nkm: Add mux to support multiple parents
      clk: sunxi-ng: mux: Add support for mux tables
      clk: sunxi-ng: mux: support fixed pre-dividers on multiple parents
      clk: sunxi-ng: mux: Add clk notifier functions
      clk: sunxi-ng: Add A31/A31s clocks
      clk: sunxi-ng: sun6i-a31: Set CLK_SET_RATE_PARENT for display output clocks
      clk: sunxi-ng: sun6i-a31: set CLK_SET_RATE_UNGATE for all PLLs
      clk: sunxi-ng: sun6i-a31: Fix register offset for mipi-csi clk

Chris Brandt (1):
      clk: renesas: rz: Select EXTAL vs USB clock

Chris Zhong (1):
      clk: rockchip: mark rk3399 hdcp_noc and vio_noc as critical

Douglas Anderson (1):
      clk: rockchip: drop CLK_SET_RATE_PARENT from rk3399 fractional dividers

Elaine Zhang (1):
      clk: rockchip: delete the CLK_IGNORE_UNUSED from aclk_pcie on rk3399

Eric Anholt (4):
      clk: bcm2835: Mark the VPU clock as critical
      clk: bcm2835: Mark GPIO clocks enabled at boot as critical
      clk: bcm2835: Mark the CM SDRAM clock's parent as critical
      clk: bcm2835: Skip PLLC clocks when deciding on a new clock parent

Fabio Estevam (5):
      clk: imx7d: do not set the parent of IMX7D_ENET_AXI_ROOT_SRC
      clk: imx7d: Add the clock for SDMA
      clk: imx: Introduce clk_register_gate2()
      clk: imx7d: Add SAI IPG clocks
      clk: imx7d: Add PLL_AUDIO_TEST_DIV/POST_DIV clocks

Gabriel Fernandez (5):
      drivers: clk: st: Remove stih415-416 clock support
      drivers: clk: st: Simplify clock binding of STiH4xx platforms
      drivers: clk: st: Add fs660c32 synthesizer algorithm
      drivers: clk: st: Add clock propagation for audio clocks
      drivers: clk: st: Handle clk synchronous mode for video clocks

Geert Uytterhoeven (4):
      clk: renesas: r8a7796: Add watchdog core clocks
      clk: renesas: r8a7796: Add watchdog module clock
      clk: divider: Fix clk_divider_round_rate() to use clk_readl()
      MAINTAINERS: Add section for Renesas clock drivers

Gregory CLEMENT (6):
      dt-bindings: clock: add DT binding for the Xtal clock on Armada 3700
      clk: mvebu: Add the xtal clock for Armada 3700 SoC
      dt-bindings: clock: add DT binding for the TBG clocks on Armada 3700
      clk: mvebu Add the time base generator clocks for Armada 3700
      dt-bindings: clock: add DT binding for the peripheral clocks on Armada 3700
      clk: mvebu: Add the peripheral clock driver for Armada 3700

Grzegorz Jaszczyk (1):
      clk: mvebu: armada-39x: add clk description for supported interfaces

Heiko Stuebner (2):
      Merge branch 'v4.9-shared/sip-hdr' into v4.9-clk/next
      Merge branch 'v4.9-shared/clkids' into v4.9-clk/next

Heiko Stübner (1):
      clk: rockchip: use general clock flag when registering pll

Hoan Tran (2):
      Documentation: dt: xgene: Add PMD clock binding
      clk: xgene: Add PMD clock

James Liao (3):
      clk: mediatek: remove __init from clk registration functions
      clk: mediatek: Refine the makefile to support multiple clock drivers
      dt-bindings: ARM: Mediatek: Document bindings for MT2701

Jean Delvare (1):
      clk: sunxi-ng: Add hardware dependency

Jean-Francois Moine (1):
      clk: core: Force setting the phase delay when no change

Jon Mason (1):
      clk: iproc: Make clocks visible options

Jun Nie (4):
      clk: zx: reform pll config info to ease code extension
      clk: zx: register ZX296718 clocks
      clk: zx: reform pll config info to ease code extension
      clk: zx: register ZX296718 clocks

Kalle Kankare (1):
      clk: imx53: Add clocks configuration

Kelvin Cheung (3):
      clk: Loongson1: Refactor Loongson1 clock
      clk: Loongson1: Update clocks of Loongson1B
      clk: Loongson1: Make use of GENMASK

Kevin Hilman (1):
      clk: gxbb: add MMC gate clocks, and expose for DT

Khiem Nguyen (1):
      clk: renesas: r8a7796: Add THS/TSC clock

Laurent Pinchart (1):
      clk: renesas: r8a7796: Add RAVB clock

Laxman Dewangan (4):
      clk: max77686: Combine Maxim max77686 and max77802 driver
      clk: Combine DT binding doc for max77686 and max77802
      clk: max77686: Add DT binding details for PMIC MAX77620
      clk: max77686: Add support for MAX77620 clocks

Lin Huang (4):
      clk: rockchip: add SCLK_DDRC id for rk3399 ddrc
      soc: rockchip: add header for ddr rate SIP interface
      clk: rockchip: add new clock-type for the ddrclk
      clk: rockchip: add rk3399 ddr clock support

Linus Walleij (3):
      clk: versatile add DT bindings for the ICST CM variants
      clk: versatile/icst: add Integrator core module clocks
      clk: versatile/icst: support for AP baseboard clocks

Lucas Stach (2):
      clk: imx6: fix i.MX6DL clock tree to reflect reality
      clk: imx6: initialize GPU clocks

Marcin Wojtas (2):
      clk: mvebu: fix setting unwanted flags in CP110 gate clock
      clk: mvebu: dynamically allocate resources in Armada CP110 system controller

Markus Elfring (3):
      clk: gcc-ipq4019: Delete unnecessary assignment for the field "owner"
      clk-kona-setup: Use kmalloc_array() in parent_process()
      clk/Renesas-MSTP: Use kmalloc_array() in cpg_mstp_clocks_init()

Masahiro Yamada (4):
      clk: use ERR_CAST() for __clk_create_clk()
      clk: uniphier: add core support code for UniPhier clock driver
      clk: uniphier: add clock data for UniPhier SoCs
      clk: change the type of clk_hw_onecell_data.num to unsigned int

Maxime Ripard (9):
      clk: sunxi-ng: mux: Rename mux macro to be consistent
      clk: sunxi-ng: div: Add mux table macros
      clk: sunxi-ng: div: Add kerneldoc for the _ccu_div structure
      clk: sunxi-ng: div: Allow to set a maximum
      clk: sunxi-ng: mux: Add mux table macro
      clk: sunxi-ng: Add N-class clocks support
      clk: sunxi-ng: Add A33 CCU support
      clk: sunxi-ng: Add A23 CCU
      clk: sunxi-ng: Fix reset offset for the A23 and A33

Michael Turquette (3):
      clk: migrate ref counts when orphans are reunited
      Merge remote-tracking branch 'clk/clk-meson-gxbb-ao' into clk-meson-gxbb
      Merge branch 'clk-meson-gxbb' into clk-next

Neil Armstrong (6):
      dt-bindings: Add MDM9615 DT bindings include files for GCC and LCC
      clk: mdm9615: Add support for MDM9615 Clock Controllers
      dt-bindings: clock: Update bindings for MDM9615 GCC and LCC
      dt-bindings: clock: reset: Add GXBB AO Clock and Reset Bindings
      clk: meson: Add GXBB AO Clock and Reset controller driver
      clk: meson-gxbb: Export PWM related clocks for DT

Peter Ujfalusi (3):
      clk: twl6040: Correct clk_ops
      clk: twl6040: Register the clock as of_clk_provider
      clk: twl6040: Rename the driver and use consistent names in the code

Purna Chandra Mandal (2):
      clk: microchip: use readl_poll_timeout() in pbclk_set_rate().
      clk: microchip: Initialize SOSC clock rate for PIC32MZDA.

Rafał Miłecki (2):
      clk: return unsigned int in dummy non-OF of_clk_get_parent_count()
      clk: bcm: Add driver for BCM53573 ILP clock

Rajendra Nayak (1):
      clk: qcom: gdsc: Add the missing BIMC gdsc for msm8996

Ricardo Ribalda Delgado (8):
      clk: core: New macro CLK_OF_DECLARE_DRIVER
      clk: axis: Use new macro CLK_OF_DECLARE_DRIVER
      clk: nxp: Use new macro CLK_OF_DECLARE_DRIVER
      clk: sunxi: mod0: Use new macro CLK_OF_DECLARE_DRIVER
      clk: sunxi: apb0: Use new macro CLK_OF_DECLARE_DRIVER
      clk: core: Avoid double initialization of clocks
      clk: fixed-factor: Convert into a module platform driver
      clk: fixed-rate: Convert into a module platform driver

Shawn Guo (1):
      clk: zx296718: register driver earlier with core_initcall

Shunli Wang (2):
      clk: mediatek: Add dt-bindings for MT2701 clocks
      reset: mediatek: Add MT2701 reset controller dt-binding file

Shunqian Zheng (1):
      clk: rockchip: add 2016M to big cpu clk rate table on rk3399

Simon Horman (1):
      clk: renesas: r8a7796: Add SDIF clocks

Srinivas Kandagatla (3):
      clk: qcom: select GDSC for msm8996 gcc and mmcc
      clk: gcc-msm8996: Fix pcie 2 pipe register offset
      clk: gcc-msm8996: add missing pcie phy reset lines

Stephen Boyd (49):
      MAINTAINERS: Add linux-clk patchwork URL
      clk: Return errors from clk providers in __of_clk_get_from_provider()
      clk: fixed-factor: Remove export symbol on setup function
      clk: fixed-rate: Remove export symbol on setup function
      Merge branch 'clk-meson-gxbb' into clk-next
      Merge branch 'clk-qcom-9615' into clk-next
      clk: qcom: Sort Makefile alphabetically
      clk: berlin: Migrate to clk_hw based registration and OF APIs
      Merge tag 'clk-renesas-for-v4.9-tag1' of git://git.kernel.org/.../geert/renesas-drivers into clk-next
      clk: max77686: Migrate to clk_hw based OF and registration APIs
      clk: ls1x: Migrate to clk_hw based OF and registration APIs
      Merge branch 'clk-meson-gxbb-ao' into clk-next
      Merge branch 'clk-meson-gxbb-ao' into clk-next
      clk: bcm: kona: Migrate to clk_hw based registration and OF APIs
      clk: asm9260: Migrate to clk_hw based registration and OF APIs
      clk: axi-clkgen: Migrate to clk_hw based OF and registration APIs
      clk: axm5516: Migrate to clk_hw based OF and registration APIs
      clk: cdce: Migrate to clk_hw based OF and registration APIs
      clk: cdce925: Migrate to clk_hw based OF and provider APIs
      clk: clps711x: Migrate to clk_hw based OF and registration APIs
      clk: cs2000: Migrate to clk_hw based OF and registration APIs
      clk: efm32gg: Migrate to clk_hw based OF and registration APIs
      clk: mb86s7x: Migrate to clk_hw based OF and registration APIs
      clk: moxart: Migrate to clk_hw based OF and registration APIs
      clk: nspire: Migrate to clk_hw based OF and registration APIs
      clk: palmas: Migrate to clk_hw based OF and registration APIs
      clk: pwm: Migrate to clk_hw based OF and registration APIs
      clk: rk808: Migrate to clk_hw based OF and registration APIs
      clk: scpi: Migrate to clk_hw based OF and registration APIs
      clk: si514: Migrate to clk_hw based OF and registration APIs
      clk: si5351: Migrate to clk_hw based OF and registration APIs
      clk: si570: Migrate to clk_hw based OF and registration APIs
      clk: twl6040: Migrate to clk_hw based registration APIs
      clk: vt8500: Migrate to clk_hw based registration APIs
      clk: wm831x: Migrate to clk_hw based registration APIs
      clk: qcom: Migrate to clk_hw based registration and OF APIs
      clk: h8300: Migrate to clk_hw based registration APIs
      Merge branch 'clk-fixes' into clk-next
      clk: Simplify __of_clk_get_hw_from_provider()
      Merge branch 'clk-fixes' into clk-next
      Merge tag 'clk-renesas-for-v4.9-tag2' of git://git.kernel.org/.../geert/renesas-drivers into clk-next
      Merge tag 'v4.9-rockchip-clk1' of git://git.kernel.org/.../mmind/linux-rockchip into clk-next
      Merge branch 'clk-fixes' into clk-next
      Merge tag 'clk-v4.9-samsung' of git://linuxtv.org/snawrocki/samsung into clk-next
      Merge tag 'sunxi-clk-for-4.9' of https://git.kernel.org/.../mripard/linux into clk-next
      Merge tag 'clk-renesas-for-v4.9-tag3' of git://git.kernel.org/.../geert/renesas-drivers into clk-next
      Merge branch 'clk-zte' into clk-next
      clk: bcm2835: Migrate to clk_hw based registration and OF APIs
      clk: at91: Migrate to clk_hw based registration and OF APIs

Sylwester Nawrocki (7):
      clk: samsung: exynos5410: Add clock IDs for PDMA and EPLL clocks
      clk: samsung: exynos5410: Expose the peripheral DMA gate clocks
      clk: samsung: Use common registration function for pll2550x
      clk: samsung: clk-exynos-audss: controller variant handling rework
      clk: samsung: clk-exynos-audss: Add exynos5410 compatible
      clk: samsung: clk-exynos-audss: Whitespace and debug trace cleanup
      clk: samsung: Add support for EPLL on exynos5410

Takeshi Kihara (1):
      clk: renesas: r8a7796: Add GPIO clocks

Tang Yuantian (1):
      clk: qoriq: fix a register offset error

Tomeu Vizoso (1):
      clk: rk808: Pass the right pointer as the get_hw context

Uwe Kleine-König (2):
      ARM: clk-imx35: fix name for ckil clk
      ARM: clk-imx35: annotate clk enum with number values

Vivek Gautam (1):
      clk: Add USB3 PHY reset lines

Wei Yongjun (5):
      clk: gxbb: use builtin_platform_driver to simplify the code
      clk: meson: Fix invalid use of sizeof in gxbb_aoclkc_probe()
      clk: mvebu: Remove redundant dev_err call in armada_3700_periph_clock_probe()
      meson: clk: Use builtin_platform_driver to simplify the code
      clk: zx296718: use builtin_platform_driver to simplify the code

Xing Zheng (1):
      clk: rockchip: add 65MHz and 106.5MHz rates to rk3399 plls used for HDMI

Yakir Yang (2):
      clk: rockchip: add dclk_vop_frac ids for rk3399 vop
      clk: rockchip: use the dclk_vop_frac clock ids on rk3399

Yang Ling (1):
      CLK: Add Loongson1C clock support

 .../bindings/arm/mediatek/mediatek,apmixedsys.txt  |    3 +-
 .../bindings/arm/mediatek/mediatek,bdpsys.txt      |   22 +
 .../bindings/arm/mediatek/mediatek,ethsys.txt      |   22 +
 .../bindings/arm/mediatek/mediatek,hifsys.txt      |   24 +
 .../bindings/arm/mediatek/mediatek,imgsys.txt      |    3 +-
 .../bindings/arm/mediatek/mediatek,infracfg.txt    |    3 +-
 .../bindings/arm/mediatek/mediatek,mmsys.txt       |    3 +-
 .../bindings/arm/mediatek/mediatek,pericfg.txt     |    3 +-
 .../bindings/arm/mediatek/mediatek,topckgen.txt    |    3 +-
 .../bindings/arm/mediatek/mediatek,vdecsys.txt     |    3 +-
 .../bindings/clock/amlogic,gxbb-aoclkc.txt         |   45 +
 .../devicetree/bindings/clock/arm-syscon-icst.txt  |   34 +-
 .../bindings/clock/armada3700-periph-clock.txt     |   70 +
 .../bindings/clock/armada3700-tbg-clock.txt        |   27 +
 .../bindings/clock/armada3700-xtal-clock.txt       |   28 +
 .../devicetree/bindings/clock/at91-clock.txt       |    3 +-
 .../bindings/clock/brcm,bcm53573-ilp.txt           |   36 +
 .../devicetree/bindings/clock/clk-exynos-audss.txt |    4 +-
 .../devicetree/bindings/clock/exynos5410-clock.txt |   21 +-
 .../devicetree/bindings/clock/maxim,max77686.txt   |  118 +-
 .../devicetree/bindings/clock/maxim,max77802.txt   |   44 -
 .../bindings/clock/mvebu-gated-clock.txt           |    2 +
 .../devicetree/bindings/clock/qcom,gcc.txt         |    1 +
 .../devicetree/bindings/clock/qcom,lcc.txt         |    1 +
 .../bindings/clock/st/st,clkgen-divmux.txt         |   49 -
 .../devicetree/bindings/clock/st/st,clkgen-mux.txt |   20 +-
 .../devicetree/bindings/clock/st/st,clkgen-pll.txt |   35 +-
 .../bindings/clock/st/st,clkgen-prediv.txt         |   36 -
 .../devicetree/bindings/clock/st/st,clkgen-vcc.txt |   61 -
 .../devicetree/bindings/clock/st/st,clkgen.txt     |   54 +-
 .../devicetree/bindings/clock/st/st,flexgen.txt    |    4 +
 .../devicetree/bindings/clock/st/st,quadfs.txt     |   31 +-
 .../devicetree/bindings/clock/sunxi-ccu.txt        |    5 +-
 .../devicetree/bindings/clock/uniphier-clock.txt   |  134 ++
 Documentation/devicetree/bindings/clock/xgene.txt  |   18 +
 .../devicetree/bindings/clock/zx296718-clk.txt     |   35 +
 MAINTAINERS                                        |   11 +
 arch/arm/mach-bcm/Kconfig                          |    1 -
 drivers/clk/Kconfig                                |   20 +-
 drivers/clk/Makefile                               |    5 +-
 drivers/clk/at91/clk-generated.c                   |   30 +-
 drivers/clk/at91/clk-h32mx.c                       |    8 +-
 drivers/clk/at91/clk-main.c                        |   88 +-
 drivers/clk/at91/clk-master.c                      |   21 +-
 drivers/clk/at91/clk-peripheral.c                  |   39 +-
 drivers/clk/at91/clk-pll.c                         |   21 +-
 drivers/clk/at91/clk-plldiv.c                      |   24 +-
 drivers/clk/at91/clk-programmable.c                |   22 +-
 drivers/clk/at91/clk-slow.c                        |  375 +----
 drivers/clk/at91/clk-smd.c                         |   22 +-
 drivers/clk/at91/clk-system.c                      |   22 +-
 drivers/clk/at91/clk-usb.c                         |   69 +-
 drivers/clk/at91/clk-utmi.c                        |   22 +-
 drivers/clk/at91/sckc.c                            |  464 +++++-
 drivers/clk/at91/sckc.h                            |   22 -
 drivers/clk/axis/clk-artpec6.c                     |    4 +-
 drivers/clk/bcm/Kconfig                            |   30 +-
 drivers/clk/bcm/Makefile                           |    8 +-
 drivers/clk/bcm/clk-bcm2835-aux.c                  |   28 +-
 drivers/clk/bcm/clk-bcm2835.c                      |  146 +-
 drivers/clk/bcm/clk-bcm53573-ilp.c                 |  148 ++
 drivers/clk/bcm/clk-kona-setup.c                   |   80 +-
 drivers/clk/bcm/clk-kona.c                         |    9 +-
 drivers/clk/bcm/clk-kona.h                         |    7 +-
 drivers/clk/berlin/berlin2-avpll.c                 |   12 +-
 drivers/clk/berlin/berlin2-avpll.h                 |    8 +-
 drivers/clk/berlin/berlin2-div.c                   |    4 +-
 drivers/clk/berlin/berlin2-div.h                   |    4 +-
 drivers/clk/berlin/berlin2-pll.c                   |    6 +-
 drivers/clk/berlin/berlin2-pll.h                   |    9 +-
 drivers/clk/berlin/bg2.c                           |   98 +-
 drivers/clk/berlin/bg2q.c                          |   39 +-
 drivers/clk/clk-asm9260.c                          |   31 +-
 drivers/clk/clk-axi-clkgen.c                       |   12 +-
 drivers/clk/clk-axm5516.c                          |   39 +-
 drivers/clk/clk-cdce706.c                          |   40 +-
 drivers/clk/clk-cdce925.c                          |   42 +-
 drivers/clk/clk-clps711x.c                         |   78 +-
 drivers/clk/clk-cs2000-cp.c                        |   16 +-
 drivers/clk/clk-divider.c                          |    2 +-
 drivers/clk/clk-efm32gg.c                          |   63 +-
 drivers/clk/clk-fixed-factor.c                     |   74 +-
 drivers/clk/clk-fixed-rate.c                       |   72 +-
 drivers/clk/clk-ls1x.c                             |  161 --
 drivers/clk/clk-max-gen.c                          |  194 ---
 drivers/clk/clk-max-gen.h                          |   32 -
 drivers/clk/clk-max77686.c                         |  262 ++-
 drivers/clk/clk-max77802.c                         |   96 --
 drivers/clk/clk-mb86s7x.c                          |   16 +-
 drivers/clk/clk-moxart.c                           |   22 +-
 drivers/clk/clk-nspire.c                           |   19 +-
 drivers/clk/clk-palmas.c                           |   12 +-
 drivers/clk/clk-pwm.c                              |    9 +-
 drivers/clk/clk-qoriq.c                            |    6 +-
 drivers/clk/clk-rk808.c                            |   44 +-
 drivers/clk/clk-scpi.c                             |   33 +-
 drivers/clk/clk-si514.c                            |   11 +-
 drivers/clk/clk-si5351.c                           |   71 +-
 drivers/clk/clk-si570.c                            |   13 +-
 drivers/clk/clk-twl6040.c                          |   87 +-
 drivers/clk/clk-vt8500.c                           |   22 +-
 drivers/clk/clk-wm831x.c                           |   21 +-
 drivers/clk/clk-xgene.c                            |  221 +++
 drivers/clk/clk.c                                  |   49 +-
 drivers/clk/h8300/clk-div.c                        |   10 +-
 drivers/clk/h8300/clk-h8s2678.c                    |   12 +-
 drivers/clk/imx/clk-imx35.c                        |   32 +-
 drivers/clk/imx/clk-imx51-imx53.c                  |   20 +
 drivers/clk/imx/clk-imx6q.c                        |   46 +-
 drivers/clk/imx/clk-imx7d.c                        |  117 +-
 drivers/clk/imx/clk.h                              |    9 +
 drivers/clk/loongson1/Makefile                     |    3 +
 drivers/clk/loongson1/clk-loongson1b.c             |  122 ++
 drivers/clk/loongson1/clk-loongson1c.c             |   97 ++
 drivers/clk/loongson1/clk.c                        |   43 +
 drivers/clk/loongson1/clk.h                        |   19 +
 drivers/clk/mediatek/Kconfig                       |   21 +
 drivers/clk/mediatek/Makefile                      |    6 +-
 drivers/clk/mediatek/clk-gate.c                    |    2 +-
 drivers/clk/mediatek/clk-mt8173.c                  |    4 +-
 drivers/clk/mediatek/clk-mtk.c                     |   12 +-
 drivers/clk/mediatek/clk-pll.c                     |    2 +-
 drivers/clk/meson/Makefile                         |    4 +-
 drivers/clk/meson/clkc.h                           |    2 +-
 drivers/clk/meson/gxbb-aoclk.c                     |  191 +++
 drivers/clk/meson/gxbb.c                           |  177 +-
 drivers/clk/meson/gxbb.h                           |   13 +-
 drivers/clk/meson/{meson8b-clkc.c => meson8b.c}    |  299 +++-
 drivers/clk/meson/meson8b.h                        |  151 ++
 drivers/clk/microchip/clk-core.c                   |    6 +-
 drivers/clk/microchip/clk-pic32mzda.c              |    1 +
 drivers/clk/mmp/clk-mmp2.c                         |    1 +
 drivers/clk/mvebu/Kconfig                          |    3 +
 drivers/clk/mvebu/Makefile                         |    3 +
 drivers/clk/mvebu/armada-37xx-periph.c             |  447 +++++
 drivers/clk/mvebu/armada-37xx-tbg.c                |  158 ++
 drivers/clk/mvebu/armada-37xx-xtal.c               |   91 ++
 drivers/clk/mvebu/armada-39x.c                     |    2 +
 drivers/clk/mvebu/cp110-system-controller.c        |   31 +-
 drivers/clk/nxp/clk-lpc18xx-creg.c                 |    3 +-
 drivers/clk/nxp/clk-lpc32xx.c                      |    1 +
 drivers/clk/qcom/Kconfig                           |   19 +
 drivers/clk/qcom/Makefile                          |    5 +-
 drivers/clk/qcom/clk-regmap.c                      |    5 +-
 drivers/clk/qcom/clk-regmap.h                      |    3 +-
 drivers/clk/qcom/common.c                          |   58 +-
 drivers/clk/qcom/gcc-ipq4019.c                     |    1 -
 drivers/clk/qcom/gcc-mdm9615.c                     | 1727 ++++++++++++++++++++
 drivers/clk/qcom/gcc-msm8996.c                     |   17 +-
 drivers/clk/qcom/lcc-mdm9615.c                     |  580 +++++++
 drivers/clk/qcom/mmcc-msm8996.c                    |   18 +-
 drivers/clk/renesas/clk-mstp.c                     |    2 +-
 drivers/clk/renesas/clk-rz.c                       |   24 +-
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |    4 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |   31 +
 drivers/clk/rockchip/Makefile                      |    1 +
 drivers/clk/rockchip/clk-ddr.c                     |  154 ++
 drivers/clk/rockchip/clk-pll.c                     |    4 +-
 drivers/clk/rockchip/clk-rk3399.c                  |   56 +-
 drivers/clk/rockchip/clk-rockchip.c                |    7 +-
 drivers/clk/rockchip/clk.c                         |   11 +-
 drivers/clk/rockchip/clk.h                         |   35 +-
 drivers/clk/samsung/clk-exynos-audss.c             |   84 +-
 drivers/clk/samsung/clk-exynos5260.c               |  350 ++--
 drivers/clk/samsung/clk-exynos5410.c               |   61 +-
 drivers/clk/samsung/clk-exynos5420.c               |   37 +
 drivers/clk/samsung/clk-exynos5440.c               |    9 +-
 drivers/clk/samsung/clk-pll.c                      |  154 +-
 drivers/clk/samsung/clk-pll.h                      |    2 +
 drivers/clk/st/clk-flexgen.c                       |   63 +-
 drivers/clk/st/clkgen-fsyn.c                       |  481 ++----
 drivers/clk/st/clkgen-mux.c                        |  748 +--------
 drivers/clk/st/clkgen-pll.c                        |  472 +-----
 drivers/clk/sunxi-ng/Kconfig                       |   39 +
 drivers/clk/sunxi-ng/Makefile                      |    4 +
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c               | 1239 ++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun6i-a31.h               |   72 +
 drivers/clk/sunxi-ng/ccu-sun8i-a23-a33.h           |   63 +
 drivers/clk/sunxi-ng/ccu-sun8i-a23.c               |  737 +++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c               |  780 +++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c                |   10 +-
 drivers/clk/sunxi-ng/ccu_div.h                     |   66 +-
 drivers/clk/sunxi-ng/ccu_mp.c                      |   23 +-
 drivers/clk/sunxi-ng/ccu_mp.h                      |    2 +-
 drivers/clk/sunxi-ng/ccu_mult.c                    |  133 ++
 drivers/clk/sunxi-ng/ccu_mult.h                    |   35 +
 drivers/clk/sunxi-ng/ccu_mux.c                     |   56 +-
 drivers/clk/sunxi-ng/ccu_mux.h                     |   68 +-
 drivers/clk/sunxi-ng/ccu_nkm.c                     |   44 +-
 drivers/clk/sunxi-ng/ccu_nkm.h                     |   23 +
 drivers/clk/sunxi-ng/ccu_nkmp.c                    |   21 +-
 drivers/clk/sunxi-ng/ccu_nm.c                      |   16 +-
 drivers/clk/sunxi/clk-mod0.c                       |    3 +-
 drivers/clk/sunxi/clk-sun8i-apb0.c                 |    4 +-
 drivers/clk/uniphier/Kconfig                       |    9 +
 drivers/clk/uniphier/Makefile                      |    8 +
 drivers/clk/uniphier/clk-uniphier-core.c           |  214 +++
 drivers/clk/uniphier/clk-uniphier-fixed-factor.c   |   48 +
 drivers/clk/uniphier/clk-uniphier-fixed-rate.c     |   47 +
 drivers/clk/uniphier/clk-uniphier-gate.c           |   97 ++
 drivers/clk/uniphier/clk-uniphier-mio.c            |  101 ++
 drivers/clk/uniphier/clk-uniphier-mux.c            |   95 ++
 drivers/clk/uniphier/clk-uniphier-peri.c           |   57 +
 drivers/clk/uniphier/clk-uniphier-sys.c            |  151 ++
 drivers/clk/uniphier/clk-uniphier.h                |  122 ++
 drivers/clk/versatile/clk-icst.c                   |  310 +++-
 drivers/clk/zte/Makefile                           |    1 +
 drivers/clk/zte/clk-zx296718.c                     |  924 +++++++++++
 drivers/clk/zte/clk.c                              |   21 +-
 drivers/clk/zte/clk.h                              |  129 ++
 include/dt-bindings/clock/exynos5410.h             |    3 +
 include/dt-bindings/clock/exynos5420.h             |   11 +-
 include/dt-bindings/clock/exynos5440.h             |    2 +
 include/dt-bindings/clock/gxbb-aoclkc.h            |   66 +
 include/dt-bindings/clock/gxbb-clkc.h              |    7 +
 include/dt-bindings/clock/imx5-clock.h             |   15 +-
 include/dt-bindings/clock/imx6qdl-clock.h          |    4 +-
 include/dt-bindings/clock/maxim,max77620.h         |   21 +
 include/dt-bindings/clock/meson8b-clkc.h           |    2 -
 include/dt-bindings/clock/mt2701-clk.h             |  486 ++++++
 include/dt-bindings/clock/qcom,gcc-mdm9615.h       |  327 ++++
 include/dt-bindings/clock/qcom,gcc-msm8996.h       |    5 +
 include/dt-bindings/clock/qcom,lcc-mdm9615.h       |   52 +
 include/dt-bindings/clock/qcom,mmcc-msm8996.h      |    1 +
 include/dt-bindings/clock/rk3399-cru.h             |    3 +
 include/dt-bindings/clock/sun6i-a31-ccu.h          |  187 +++
 include/dt-bindings/clock/sun8i-a23-a33-ccu.h      |  127 ++
 include/dt-bindings/clock/zx296718-clock.h         |  163 ++
 include/dt-bindings/reset/gxbb-aoclkc.h            |   66 +
 include/dt-bindings/reset/mt2701-resets.h          |   83 +
 include/dt-bindings/reset/qcom,gcc-mdm9615.h       |  136 ++
 include/dt-bindings/reset/sun6i-a31-ccu.h          |  106 ++
 include/dt-bindings/reset/sun8i-a23-a33-ccu.h      |   87 +
 include/linux/clk-provider.h                       |   16 +-
 include/soc/rockchip/rockchip_sip.h                |   27 +
 235 files changed, 15747 insertions(+), 4213 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,bdpsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,hifsys.txt
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,gxbb-aoclkc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/armada3700-tbg-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/armada3700-xtal-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/maxim,max77802.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/st/st,clkgen-divmux.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/st/st,clkgen-prediv.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/st/st,clkgen-vcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/uniphier-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/zx296718-clk.txt
 delete mode 100644 drivers/clk/at91/sckc.h
 create mode 100644 drivers/clk/bcm/clk-bcm53573-ilp.c
 delete mode 100644 drivers/clk/clk-ls1x.c
 delete mode 100644 drivers/clk/clk-max-gen.c
 delete mode 100644 drivers/clk/clk-max-gen.h
 delete mode 100644 drivers/clk/clk-max77802.c
 create mode 100644 drivers/clk/loongson1/Makefile
 create mode 100644 drivers/clk/loongson1/clk-loongson1b.c
 create mode 100644 drivers/clk/loongson1/clk-loongson1c.c
 create mode 100644 drivers/clk/loongson1/clk.c
 create mode 100644 drivers/clk/loongson1/clk.h
 create mode 100644 drivers/clk/mediatek/Kconfig
 create mode 100644 drivers/clk/meson/gxbb-aoclk.c
 rename drivers/clk/meson/{meson8b-clkc.c => meson8b.c} (51%)
 create mode 100644 drivers/clk/meson/meson8b.h
 create mode 100644 drivers/clk/mvebu/armada-37xx-periph.c
 create mode 100644 drivers/clk/mvebu/armada-37xx-tbg.c
 create mode 100644 drivers/clk/mvebu/armada-37xx-xtal.c
 create mode 100644 drivers/clk/qcom/gcc-mdm9615.c
 create mode 100644 drivers/clk/qcom/lcc-mdm9615.c
 create mode 100644 drivers/clk/rockchip/clk-ddr.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun6i-a31.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun6i-a31.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-a23-a33.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-a23.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-a33.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_mult.c
 create mode 100644 drivers/clk/uniphier/Kconfig
 create mode 100644 drivers/clk/uniphier/Makefile
 create mode 100644 drivers/clk/uniphier/clk-uniphier-core.c
 create mode 100644 drivers/clk/uniphier/clk-uniphier-fixed-factor.c
 create mode 100644 drivers/clk/uniphier/clk-uniphier-fixed-rate.c
 create mode 100644 drivers/clk/uniphier/clk-uniphier-gate.c
 create mode 100644 drivers/clk/uniphier/clk-uniphier-mio.c
 create mode 100644 drivers/clk/uniphier/clk-uniphier-mux.c
 create mode 100644 drivers/clk/uniphier/clk-uniphier-peri.c
 create mode 100644 drivers/clk/uniphier/clk-uniphier-sys.c
 create mode 100644 drivers/clk/uniphier/clk-uniphier.h
 create mode 100644 drivers/clk/zte/clk-zx296718.c
 create mode 100644 include/dt-bindings/clock/gxbb-aoclkc.h
 create mode 100644 include/dt-bindings/clock/maxim,max77620.h
 create mode 100644 include/dt-bindings/clock/mt2701-clk.h
 create mode 100644 include/dt-bindings/clock/qcom,gcc-mdm9615.h
 create mode 100644 include/dt-bindings/clock/qcom,lcc-mdm9615.h
 create mode 100644 include/dt-bindings/clock/sun6i-a31-ccu.h
 create mode 100644 include/dt-bindings/clock/sun8i-a23-a33-ccu.h
 create mode 100644 include/dt-bindings/clock/zx296718-clock.h
 create mode 100644 include/dt-bindings/reset/gxbb-aoclkc.h
 create mode 100644 include/dt-bindings/reset/mt2701-resets.h
 create mode 100644 include/dt-bindings/reset/qcom,gcc-mdm9615.h
 create mode 100644 include/dt-bindings/reset/sun6i-a31-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-a23-a33-ccu.h
 create mode 100644 include/soc/rockchip/rockchip_sip.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

Return-Path: <sboyd@codeaurora.org>
Date: Wed, 4 Nov 2015 15:05:31 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>
Subject: [GIT PULL] clk: changes for 4.4
Message-ID: <20151104230531.GA26852@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit e79b202c632f24f49f2eb9459b88b5fd9e332263:

  Partially revert "clk: mvebu: Convert to clk_hw based provider APIs" (2015-10-14 11:28:17 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus-20151104

for you to fetch changes up to e5bf1991ea62b4f4fc906d0828f7eed988fc3835:

  clk: qcom: msm8960: Fix dsi1/2 halt bits (2015-10-27 13:10:13 -0700)

----------------------------------------------------------------
The majority of the changes are driver updates and new device
support. The core framework is mostly unchanged this time
around, with only a couple patches to expose a clk provider
API and make getting clk parent names from DT more robust.

Driver updates:

- Support for clock controllers found on Broadcom Northstar
  SoCs and bcm2835 SoC

- Support for Allwinner audio clocks

- A few cleanup patches for Tegra drivers and support for the
  highest DFLL frequencies on Tegra124

- Samsung exynos7 fixes and improvements

- i.Mx SoC updates to add a few missing clocks and keep debug
  uart clocks on during kernel intialization

- Some mediatek cleanups and support for more subsystem clocks

- Support for msm8916 gpu/audio clocks and qcom's GDSC power domain
  controllers

- A new driver for the Silabs si514 clock chip

----------------------------------------------------------------
Alexander Stein (2):
      clk: imx35: Do not call mxc_timer_init twice when booting with DT
      clk: imx31: Do not call mxc_timer_init twice when booting with DT

Alexandre Belloni (2):
      clk: at91: utmi: use pmc_read when the at91_pmc is available
      clk: at91: system: don't try to free_irq when there is no IRQ

Alim Akhtar (16):
      clk: samsung: exynos7: Fix CMU TOPC block clock
      clk: samsung: exynos7: Fix CMU TOP1 block
      clk: samsung: exynos7: Correct nr_clk_ids for fsys0
      clk: samsung: exynos7: Correct nr_clk_ids for fsys1
      clk: samsung: exynos7: Change the CMU_TOPC block clock names
      clk: samsung: exynos7: Adds missing clocks gates of CMU_TOPC
      clk: samsung: exynos7: Correct CMU_TOP0 clocks names
      clk: samsung: exynos7: Correct CMU_TOP1 clocks names
      clk: samsung: exynos7: Correct CMU_CCORE clocks names
      clk: samsung: exynos7: Correct CMU_PERIC0 clocks names
      clk: samsung: exynos7: Correct CMU_PERIC1 clocks names
      clk: samsung: exynos7: Correct CMU_PERIS clocks names
      clk: samsung: exynos7: Correct CMU_FSYS0 clocks names
      clk: samsung: exynos7: Correct CMU_FSYS1 clocks names
      clk: samsung: exynos7: Add missing fixed_clks to cmu_info
      clk: samsung: exynos7: Add required clock tree for UFS

Andrzej Hajda (1):
      clk: st: fix handling result of of_property_count_strings

Andy Shevchenko (5):
      clk: fractional-divider: rename prate -> parent_rate
      clk: fractional-divider: keep mwidth and nwidth internally
      clk: rockchip: save width in struct clk_fractional_divider
      clk: fractional-divider: switch to rational best approximation
      serial: 8250_dw: allow lower reference frequencies

Anson Huang (1):
      clk: imx: increase AXI clock rate to 264MHz for i.MX6UL

Archit Taneja (2):
      clk: qcom: clk-rcg: Add customized clk_ops for DSI RCGs
      clk: qcom: mmcc-8960: Add DSI related clocks

Arnd Bergmann (1):
      ARM: cygnus: fix link failures when CONFIG_COMMON_CLK_IPROC is disabled

Brian Norris (1):
      clk: divider: handle integer overflow when dividing large clock rates

Emilio López (2):
      clk: sunxi: codec clock support
      clk: sunxi: mod1 clock support

Eric Anholt (3):
      clk: bcm2835: Move under bcm/ with other Broadcom SoC clk drivers.
      clk: bcm2835: Add binding docs for the new platform clock driver.
      clk: bcm2835: Add support for programming the audio domain clocks

Gabriel Fernandez (3):
      drivers: clk: st: Support for enable/disable in Clockgen PLLs
      drivers: clk: st: PLL rate change implementation for DVFS
      drivers: clk: st: Correct the pll-type for A9 for stih418

Geert Uytterhoeven (7):
      clk: shmobile: div6: Grammar s/They/Their/
      clk: Use %u to format unsigned int in of_clk_src_onecell_get()
      clk: shmobile: r8a7778: Make r8a7778_rates[] and r8a7778_divs[] static const
      clk: shmobile: mstp: Drop bogus closing parenthesis in error message
      clk: Make clk input parameter of __clk_get_name() const
      clk: shmobile: Add new Renesas CPG/MSSR DT bindings
      clk: shmobile: Add r8a7795 CPG Core Clock Definitions

Geliang Tang (1):
      clk: keystone: fix a trivial typo

Georgi Djakov (4):
      clk: qcom: Add MSM8916 iommu clocks
      clk: qcom: Add support for RCGs with shared branches
      clk: qcom: Add MSM8916 gpu clocks
      clk: qcom: Add MSM8916 audio clocks

Guo Zeng (2):
      clk: atlas7: move variable-definition together
      clk: atlas7: fix noc/socket disconnect/reconnect for unit clks

Haibo Chen (1):
      clk: imx7d: add ADC root clock

Heiko Stübner (1):
      clk: rockchip: don't use clk_ APIs in the pll init-callback

James Liao (8):
      clk: mediatek: Removed unused dpi_ck clock from MT8173
      clk: mediatek: Remove unused code from MT8173.
      clk: mediatek: Add __initdata and __init for data and functions
      clk: mediatek: Add fixed clocks support for Mediatek SoC.
      clk: mediatek: Fix rate and dependency of MT8173 clocks
      dt-bindings: ARM: Mediatek: Document devicetree bindings for clock controllers
      clk: mediatek: Add subsystem clocks of MT8173
      clk: mediatek: Add USB clock support in MT8173 APMIXEDSYS

Javier Martinez Canillas (3):
      clk: Remove unneeded semicolons
      clk: max77802: Update MODULE_AUTHOR() email address
      clk: Allow drivers to build if COMPILE_TEST is enabled

Jisheng Zhang (2):
      clk: berlin: bg2q: remove CLK_IGNORE_UNUSED flag for sdio clk
      clk: berlin: bg2: remove CLK_IGNORE_UNUSED flag for sdio clk

Joachim Eastwood (3):
      clk: Add clk_hw_is_enabled() for use by clk providers
      clk: lpc18xx-ccu: fix potential system hang when disabling unused clocks
      clk: lpc18xx-cgu: fix potential system hang when disabling unused clocks

Joe.C (1):
      clk: mediatek: add 13mhz clock for MT8173

Jon Mason (9):
      clk: cygnus: Convert all macros to all caps
      clk: iproc: Add PWRCTRL support
      clk: nsp: add clock support for Broadcom Northstar Plus SoC
      clk: iproc: Add PLL base write function
      clk: iproc: Split off dig_filter
      clk: iproc: Separate status and control variables
      clk: ns2: add clock support for Broadcom Northstar 2 SoC
      clk: iproc: define Broadcom NSP iProc clock binding
      clk: iproc: define Broadcom NS2 iProc clock binding

Julia Lawall (5):
      clk: tegra: delete unneeded of_node_put
      clk: add missing of_node_put
      clk: si5351: add missing of_node_put
      clk: imx27: add missing of_node_put
      clk: imx31: add missing of_node_put

Linus Walleij (1):
      clk: versatile-icst: fix memory leak

Lucas Stach (8):
      clk: imx: add common logic to detect early UART usage
      clk: imx25: retain early UART clocks during kernel init
      clk: imx27: retain early UART clocks during kernel init
      clk: imx31: retain early UART clocks during kernel init
      clk: imx35: retain early UART clocks during kernel init
      clk: imx5: retain early UART clocks during kernel init
      clk: imx6: retain early UART clocks during kernel init
      clk: imx7d: retain early UART clocks during kernel init

Luis de Bethencourt (5):
      clk: sunxi: sun6i-apb0: Fix module autoload for OF platform driver
      clk: sunxi: sun6i-apb0-gates: Fix module autoload for OF platform driver
      clk: sunxi: sun6i-ar100: Fix module autoload for OF platform driver
      clk: sunxi: sun8i-apb0: Fix module autoload for OF platform driver
      clk: sunxi: sun9i-mmc: Fix module autoload for OF platform driver

Martin Kepplinger (1):
      clk: imx: use sign_extend32() and abs()

Maxime Ripard (4):
      clk: sunxi: Add A33 gates support
      clk: Add a basic multiplier clock
      clk: sunxi: Add a driver for the PLL2
      clk: sunxi: pll2: Add A13 support

Michael Turquette (2):
      Merge tag 'tegra-for-4.4-clk' of git://git.kernel.org/.../tegra/linux into clk-next
      Merge branch 'clk-shmobile-for-v4.4' of git://git.kernel.org/.../geert/renesas-drivers into clk-next

Mike Looijmans (1):
      Add driver for the si514 clock generator chip

Mikko Perttunen (1):
      clk: tegra: Unlock top rates for Tegra124 DFLL clock

Nicolas Ferre (4):
      clk: at91: cleanup PMC header file for PCR register fields
      clk: at91: modify PMC peripheral clock to deal with newer register layout
      clk: at91: add PMC sama5d2 support
      clk: at91: add generated clock driver

Rajendra Nayak (6):
      clk: qcom: gdsc: Prepare common clk probe to register gdscs
      clk: qcom: gdsc: Add support for Memory RET/OFF
      clk: qcom: gdsc: Add support for ON only state
      clk: qcom: gdsc: Add GDSCs in msm8916 GCC
      clk: qcom: gdsc: Add GDSCs in apq8084 GCC
      clk: qcom: create virtual child device for TSENS

Rhyland Klein (2):
      clk: tegra: Fix comments for structure definitions
      clk: tegra: Modify tegra_audio_clk_init to accept more plls

Sanchayan Maity (1):
      clk: clk-vf610: Add clock for Vybrid OCOTP controller

Shawn Lin (1):
      clk: rockchip: reset init state before mmc card initialization

Shengjiu Wang (1):
      clk: imx6: Add SPDIF_GCLK clock in clock tree

Simran Rai (1):
      clk: iproc: Fix PLL output frequency calculation

Stephane Viau (1):
      clk: qcom: gdsc: Add GDSCs in apq8084 MMCC

Stephen Boyd (27):
      Merge branch 'clk-next' into v4.3-rc1
      clk: qcom: Allow clk_set_parent() to work on display clocks
      clk: qcom: Add support for GDSCs
      clk: qcom: gdsc: Add GDSCs in msm8974 GCC
      clk: qcom: gdsc: Add GDSCs in msm8974 MMCC
      Merge branch 'clk-fixes' into clk-next
      Merge branch 'clk-fixes' into clk-next
      Merge branch 'clk-fixes' into clk-next
      Merge tag 'clk-samsung-4.4' of git://linuxtv.org/snawrocki/samsung into clk-next
      clk: samsung: exynos7: Staticize file scope symbols
      Merge branch 'v4.3-rc3-clk' of https://github.com/jamesjjliao/linux into clk-next
      PM / Domains: Make pm_genpd_{add,remove}_subdomain() available to modules
      clk: qcom: Make oxili GDSC parent of oxili_cx GDSC
      qcom: clk: Make qcom_cc_probe() fully devm safe
      clk: qcom: Drop calls to qcom_cc_remove()
      clk: qcom: Move gdsc config outside COMMON_CLK_QCOM config
      Merge branch 'clk-bcm2835' into clk-next
      Merge branch 'clk-fixes' into clk-next
      clk: Make of_clk_get_parent_name() robust with #clock-cells = 1
      Merge tag 'imx-clk-4.4' of git://git.kernel.org/.../shawnguo/linux into clk-next
      clk: xgene: Remove unused setup.h include
      clk: mvebu: Use of_clk_get_parent_name()
      Merge tag 'sunxi-clocks-for-4.4' of https://git.kernel.org/.../mripard/linux into clk-next
      Merge branch 'clk-iproc' into clk-next
      clk: Remove clk_{register,unregister}_multiplier()
      clk: Add stubs for of_clk_*() APIs when CONFIG_OF=n
      clk: qcom: msm8960: Fix dsi1/2 halt bits

Thierry Reding (2):
      clk: tegra: dfll: Monitor code is DEBUG_FS only
      clk: tegra: Update struct tegra_clk_pll_params kerneldoc

Victorien Vedrine (1):
      clk:mxs: Fix bug on frequency divider

 .../bindings/arm/mediatek/mediatek,imgsys.txt      |   22 +
 .../bindings/arm/mediatek/mediatek,mmsys.txt       |   22 +
 .../bindings/arm/mediatek/mediatek,vdecsys.txt     |   22 +
 .../bindings/arm/mediatek/mediatek,vencltsys.txt   |   22 +
 .../bindings/arm/mediatek/mediatek,vencsys.txt     |   22 +
 .../devicetree/bindings/clock/at91-clock.txt       |   35 +
 .../bindings/clock/brcm,bcm2835-cprman.txt         |   45 +
 .../bindings/clock/brcm,iproc-clocks.txt           |   78 +
 .../bindings/clock/renesas,cpg-div6-clocks.txt     |    2 +-
 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   69 +
 .../devicetree/bindings/clock/silabs,si514.txt     |   24 +
 .../devicetree/bindings/clock/st/st,clkgen-pll.txt |    1 +
 arch/arm/mach-at91/Kconfig                         |    3 +
 arch/arm/mach-bcm/Kconfig                          |    2 +-
 drivers/base/power/domain.c                        |    2 +
 drivers/clk/Kconfig                                |   19 +-
 drivers/clk/Makefile                               |    5 +-
 drivers/clk/at91/Makefile                          |    1 +
 drivers/clk/at91/clk-generated.c                   |  306 ++++
 drivers/clk/at91/clk-peripheral.c                  |   24 +-
 drivers/clk/at91/clk-system.c                      |    3 +-
 drivers/clk/at91/clk-utmi.c                        |    4 +-
 drivers/clk/at91/pmc.c                             |   21 +
 drivers/clk/at91/pmc.h                             |    3 +
 drivers/clk/bcm/Kconfig                            |    6 +-
 drivers/clk/bcm/Makefile                           |    4 +
 drivers/clk/bcm/clk-bcm2835.c                      | 1575 ++++++++++++++++++++
 drivers/clk/bcm/clk-cygnus.c                       |  155 +-
 drivers/clk/bcm/clk-iproc-pll.c                    |  196 +--
 drivers/clk/bcm/clk-iproc.h                        |   22 +-
 drivers/clk/bcm/clk-ns2.c                          |  288 ++++
 drivers/clk/bcm/clk-nsp.c                          |  139 ++
 drivers/clk/berlin/bg2.c                           |    4 +-
 drivers/clk/berlin/bg2q.c                          |    2 +-
 drivers/clk/clk-bcm2835.c                          |   55 -
 drivers/clk/clk-divider.c                          |   20 +-
 drivers/clk/clk-fractional-divider.c               |   53 +-
 drivers/clk/clk-max77802.c                         |    2 +-
 drivers/clk/clk-multiplier.c                       |  130 ++
 drivers/clk/clk-si514.c                            |  379 +++++
 drivers/clk/clk-si5351.c                           |   17 +-
 drivers/clk/clk-xgene.c                            |    1 -
 drivers/clk/clk.c                                  |   38 +-
 drivers/clk/hisilicon/clk-hi6220-stub.c            |    2 +-
 drivers/clk/imx/clk-imx25.c                        |   12 +
 drivers/clk/imx/clk-imx27.c                        |   17 +-
 drivers/clk/imx/clk-imx31.c                        |   39 +-
 drivers/clk/imx/clk-imx35.c                        |   59 +-
 drivers/clk/imx/clk-imx51-imx53.c                  |   16 +
 drivers/clk/imx/clk-imx6q.c                        |   12 +-
 drivers/clk/imx/clk-imx6sl.c                       |   12 +-
 drivers/clk/imx/clk-imx6sx.c                       |    9 +
 drivers/clk/imx/clk-imx6ul.c                       |   18 +
 drivers/clk/imx/clk-imx7d.c                        |   14 +
 drivers/clk/imx/clk-pllv2.c                        |   12 +-
 drivers/clk/imx/clk-vf610.c                        |    1 +
 drivers/clk/imx/clk.c                              |   38 +
 drivers/clk/imx/clk.h                              |    1 +
 drivers/clk/keystone/pll.c                         |    2 +-
 drivers/clk/mediatek/Makefile                      |    2 +-
 drivers/clk/mediatek/clk-apmixed.c                 |  107 ++
 drivers/clk/mediatek/clk-gate.c                    |    2 +-
 drivers/clk/mediatek/clk-mt8173.c                  |  347 ++++-
 drivers/clk/mediatek/clk-mtk.c                     |   36 +-
 drivers/clk/mediatek/clk-mtk.h                     |   24 +-
 drivers/clk/mediatek/clk-pll.c                     |    7 +-
 drivers/clk/mvebu/clk-cpu.c                        |    4 +-
 drivers/clk/mvebu/common.c                         |    2 +-
 drivers/clk/mxs/clk-frac.c                         |   12 +-
 drivers/clk/nxp/clk-lpc18xx-ccu.c                  |   17 +-
 drivers/clk/nxp/clk-lpc18xx-cgu.c                  |   42 +-
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-rcg.c                         |  230 +++
 drivers/clk/qcom/clk-rcg.h                         |    8 +-
 drivers/clk/qcom/clk-rcg2.c                        |  170 ++-
 drivers/clk/qcom/common.c                          |   42 +-
 drivers/clk/qcom/common.h                          |    4 +-
 drivers/clk/qcom/gcc-apq8084.c                     |   49 +-
 drivers/clk/qcom/gcc-ipq806x.c                     |    7 -
 drivers/clk/qcom/gcc-msm8660.c                     |    7 -
 drivers/clk/qcom/gcc-msm8916.c                     |  569 ++++++-
 drivers/clk/qcom/gcc-msm8960.c                     |   20 +-
 drivers/clk/qcom/gcc-msm8974.c                     |   22 +-
 drivers/clk/qcom/gdsc.c                            |  237 +++
 drivers/clk/qcom/gdsc.h                            |   68 +
 drivers/clk/qcom/lcc-ipq806x.c                     |    7 -
 drivers/clk/qcom/lcc-msm8960.c                     |    7 -
 drivers/clk/qcom/mmcc-apq8084.c                    |  111 +-
 drivers/clk/qcom/mmcc-msm8960.c                    |  411 ++++-
 drivers/clk/qcom/mmcc-msm8974.c                    |   92 +-
 drivers/clk/rockchip/clk-mmc-phase.c               |   11 +
 drivers/clk/rockchip/clk-pll.c                     |  135 +-
 drivers/clk/rockchip/clk.c                         |    6 +-
 drivers/clk/samsung/clk-exynos7.c                  |  467 ++++--
 drivers/clk/shmobile/clk-mstp.c                    |    2 +-
 drivers/clk/shmobile/clk-r8a7778.c                 |    8 +-
 drivers/clk/sirf/clk-atlas7.c                      |  358 +++--
 drivers/clk/st/clk-flexgen.c                       |    7 +-
 drivers/clk/st/clkgen-mux.c                        |    3 +
 drivers/clk/st/clkgen-pll.c                        |  469 +++++-
 drivers/clk/st/clkgen.h                            |    2 +
 drivers/clk/sunxi/Makefile                         |    3 +
 drivers/clk/sunxi/clk-a10-codec.c                  |   44 +
 drivers/clk/sunxi/clk-a10-mod1.c                   |   81 +
 drivers/clk/sunxi/clk-a10-pll2.c                   |  216 +++
 drivers/clk/sunxi/clk-simple-gates.c               |    2 +
 drivers/clk/sunxi/clk-sun6i-apb0-gates.c           |    1 +
 drivers/clk/sunxi/clk-sun6i-apb0.c                 |    1 +
 drivers/clk/sunxi/clk-sun6i-ar100.c                |    1 +
 drivers/clk/sunxi/clk-sun8i-apb0.c                 |    1 +
 drivers/clk/sunxi/clk-sun9i-mmc.c                  |    1 +
 drivers/clk/tegra/clk-dfll.c                       |  114 +-
 drivers/clk/tegra/clk-emc.c                        |    4 +-
 drivers/clk/tegra/clk-tegra-audio.c                |   25 +-
 drivers/clk/tegra/clk-tegra114.c                   |    8 +-
 drivers/clk/tegra/clk-tegra124.c                   |    8 +-
 drivers/clk/tegra/clk-tegra30.c                    |    8 +-
 drivers/clk/tegra/clk.h                            |  106 +-
 drivers/clk/tegra/cvb.c                            |    7 -
 drivers/clk/versatile/Kconfig                      |    2 +-
 drivers/clk/versatile/clk-icst.c                   |    4 +-
 drivers/tty/serial/8250/8250_dw.c                  |    4 -
 include/dt-bindings/clock/at91.h                   |    1 +
 include/dt-bindings/clock/bcm-ns2.h                |   72 +
 include/dt-bindings/clock/bcm-nsp.h                |   51 +
 include/dt-bindings/clock/bcm2835.h                |   47 +
 include/dt-bindings/clock/exynos7-clk.h            |   43 +-
 include/dt-bindings/clock/imx6qdl-clock.h          |    3 +-
 include/dt-bindings/clock/imx6sl-clock.h           |    3 +-
 include/dt-bindings/clock/imx6sx-clock.h           |    3 +-
 include/dt-bindings/clock/imx7d-clock.h            |    3 +-
 include/dt-bindings/clock/mt8173-clk.h             |  104 +-
 include/dt-bindings/clock/qcom,gcc-apq8084.h       |    6 +
 include/dt-bindings/clock/qcom,gcc-msm8916.h       |   30 +
 include/dt-bindings/clock/qcom,gcc-msm8974.h       |    3 +
 include/dt-bindings/clock/qcom,mmcc-apq8084.h      |   10 +
 include/dt-bindings/clock/qcom,mmcc-msm8974.h      |    8 +
 include/dt-bindings/clock/r8a7795-cpg-mssr.h       |   63 +
 include/dt-bindings/clock/renesas-cpg-mssr.h       |   15 +
 include/dt-bindings/clock/sun4i-a10-pll2.h         |   53 +
 include/dt-bindings/clock/vf610-clock.h            |    3 +-
 include/linux/clk-provider.h                       |   50 +-
 include/linux/clk/at91_pmc.h                       |   22 +-
 144 files changed, 8452 insertions(+), 1030 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,imgsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vdecsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vencltsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,vencsys.txt
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt
 create mode 100644 Documentation/devicetree/bindings/clock/silabs,si514.txt
 create mode 100644 drivers/clk/at91/clk-generated.c
 create mode 100644 drivers/clk/bcm/clk-bcm2835.c
 create mode 100644 drivers/clk/bcm/clk-ns2.c
 create mode 100644 drivers/clk/bcm/clk-nsp.c
 delete mode 100644 drivers/clk/clk-bcm2835.c
 create mode 100644 drivers/clk/clk-multiplier.c
 create mode 100644 drivers/clk/clk-si514.c
 create mode 100644 drivers/clk/mediatek/clk-apmixed.c
 create mode 100644 drivers/clk/qcom/gdsc.c
 create mode 100644 drivers/clk/qcom/gdsc.h
 create mode 100644 drivers/clk/sunxi/clk-a10-codec.c
 create mode 100644 drivers/clk/sunxi/clk-a10-mod1.c
 create mode 100644 drivers/clk/sunxi/clk-a10-pll2.c
 create mode 100644 include/dt-bindings/clock/bcm-ns2.h
 create mode 100644 include/dt-bindings/clock/bcm-nsp.h
 create mode 100644 include/dt-bindings/clock/bcm2835.h
 create mode 100644 include/dt-bindings/clock/r8a7795-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/renesas-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/sun4i-a10-pll2.h
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

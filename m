Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: changes for v4.7
Date: Fri, 20 May 2016 18:07:56 -0700
Message-Id: <20160521010756.25058-1-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 3358d2d9f47af86bdd71edb24b361f72a54ec04e:

  clk: tegra: Add interface to enable hardware control of SATA/XUSB PLLs (2016-04-28 12:41:44 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

for you to fetch changes up to ef56b79b66faeeb0dc14213d3cc9e0534a960dee:

  clk: fix critical clock locking (2016-05-19 14:09:30 -0700)

----------------------------------------------------------------
It's the usual big pile of driver updates and additions, but we
do have a couple core changes in here as well.

Core:

 - CLK_IS_CRITICAL support has been added. This should allow drivers
   to properly express that a certain clk should stay on even if
   their prepare/enable count drops to 0 (and in turn the parents of
   these clks should stay enabled).

 - A clk registration API has been added, clk_hw_register(), and
   an OF clk provider API has been added, of_clk_add_hw_provider().
   These APIs have been put in place to further split clk providers
   from clk consumers, with the goal being to have clk providers
   never deal with struct clk pointers at all. Conversion of provider
   drivers is on going. clkdev has also gained support for registering
   clk_hw pointers directly so we can convert drivers that don't use
   devicetree.

New Drivers:

 - Marvell ap806 and cp110 system controllers (with clks inside!)
 - Hisilicon Hi3519 clock and reset controller
 - Axis ARTPEC-6 clock controllers
 - Oxford Semiconductor OXNAS clock controllers
 - AXS10X I2S PLL
 - Rockchip RK3399 clock and reset controller

Updates:

 - MMC2 and UART2 clks on Samsung Exynos 3250, ACLK on Samsung Exynos 542x
   SoCs, and some more clk ID exporting for bus frequency scaling
 - Proper BCM2835 PCM clk support and various other clks
 - i.MX clk updates for i.MX6SX, i.MX7, and VF610
 - Renesas updates for R-Car H3
 - Tegra210 got updates for DisplayPort and HDMI 2.0
 - Rockchip driver refactorings and fixes due to adding RK3399 support

----------------------------------------------------------------
Alexander Kurz (1):
      ARM: dts: imx35: restore existing used clock enumeration

Andrea Venturi (1):
      clk: sunxi: mod1 clock should modify it's parent

Andy Gross (1):
      clk: qcom: msm8916: Fix crypto clock flags

Archit Taneja (1):
      clk: qcom: mmcc-8996: Remove clocks that should be controlled by RPM

Chanwoo Choi (2):
      dt-bindings: clock: Add the clock id for ACLK clock of Exynos542x SoC
      clk: samsung: exynos542x: Add the clock id for ACLK

Colin Ian King (1):
      clk: rockchip: fix of spelling mistake on unsuccessful in pll clock type

Douglas Anderson (1):
      clk: rockchip: fix the rk3399 sdmmc sample / drv name

Eric Anholt (2):
      clk: bcm2835: Fix compiler warnings on 64-bit builds
      clk: bcm2835: Fix PLL poweron

Fabio Estevam (1):
      clk: imx6sx: Register SAI clocks as shared clocks

Finley Xiao (1):
      clk: Add clk_composite_set_rate_and_parent

Gary Bisson (1):
      clk: imx: add ckil clock for i.MX7

Geert Uytterhoeven (4):
      clk: renesas: mstp: Postpone call to pm_genpd_init()
      clk: renesas: mstp: Use always-on governor for Clock Domain
      clk: renesas: cpg-mssr: Postpone call to pm_genpd_init()
      clk: renesas: cpg-mssr: Use always-on governor for Clock Domain

Grygorii Strashko (1):
      clk: ti: dra7: fix kernel boot with arg 'clocksource=gp_timer'

Harvey Hunt (1):
      clk: ingenic: Allow divider value to be divided

Heiko Stuebner (9):
      Merge branch 'v4.7-shared/clkids' into v4.7-clk/next
      Merge branch 'v4.7-shared/clkids' into v4.7-clk/next
      clk: rockchip: reign in some overly long lines in the rk3399 controller
      clk: rockchip: drop unnecessary header comment
      clk: rockchip: fix checkpatch warning in core code
      Merge branch 'v4.7-shared/clkids' into v4.7-clk/next
      clk: rockchip: lookup General Register Files in rockchip_clk_init
      clk: rockchip: simplify GRF handling in pll clocks
      clk: rockchip: drop old_rate calculation on pll rate changes

Jean-Francois Moine (1):
      clk: sunxi: Add sun6i/8i display support

Jens Kuske (1):
      clk: sunxi: Let divs clocks read the base factor clock name from devicetree

Jiancheng Xue (3):
      reset: hisilicon: add reset controller driver for hisilicon SOCs
      clk: hisilicon: export some hisilicon APIs to modules
      clk: hisilicon: add CRG driver for hi3519 soc

Jose Abreu (1):
      clk/axs10x: Add I2S PLL clock driver

Julia Lawall (1):
      clk: qoriq: add __init attribute

Lars Persson (2):
      clk: add device tree binding for Artpec-6 clock controller
      clk: add artpec-6 clock controller

Lee Jones (3):
      clk: Allow clocks to be marked as CRITICAL
      clk: WARN_ON about to disable a critical clock
      clk: Provide OF helper to mark clocks as CRITICAL

Lucas Stach (2):
      clk: tegra: Initialize PLL_C to sane rate on Tegra30
      clk: tegra: Fix PLL_U post divider and initial rate on Tegra30

Marc Gonzalez (1):
      clk: tango4: improve clkgen driver

Martin Sperl (11):
      clk: bcm2835: pll_off should only update CM_PLL_ANARST
      clk: bcm2835: add locking to pll*_on/off methods
      clk: bcm2835: divider value has to be 1 or more
      clk: bcm2835: correctly enable fractional clock support
      clk: bcm2835: clean up coding style issues
      clk: bcm2835: expose raw clock-registers via debugfs
      clk: bcm2835: remove use of BCM2835_CLOCK_COUNT in driver
      clk: bcm2835: reorganize bcm2835_clock_array assignment
      clk: bcm2835: enable management of PCM clock
      clk: bcm2835: add missing PLL clock dividers
      clk: bcm2835: add missing osc and per clocks

Masahiro Yamada (1):
      clk: fix comment of devm_clk_hw_register()

Maxime Ripard (6):
      clk: composite: Add unregister function
      dt-bindings: clk: sun5i: add DRAM gates compatible
      clk: sunxi: Add PLL3 clock
      clk: sunxi: Add TCON channel1 clock
      clk: sunxi: Add display and TCON0 clocks driver
      clk: fix critical clock locking

Neil Armstrong (2):
      clk: Add Oxford Semiconductor OXNAS Standard Clocks
      dt-bindings: Add Oxford Semiconductor OXNAS Standard Clocks bindings

Niklas Söderlund (2):
      clk: renesas: r8a7795: Add CSI2 clocks
      clk: renesas: r8a7795: Add VIN clocks

Peter Ujfalusi (1):
      clk: ti: dra7-atl-clock: Fix of_node reference counting

Rhyland Klein (1):
      clk: tegra: Fix pllre Tegra210 and add pll_re_out1

Shawn Guo (1):
      clk: imx: vf610: fix whitespace in vf610-clock.h

Shawn Lin (4):
      clk: rockchip: remove mux_core_reg from rockchip_cpuclk_reg_data
      clk: rockchip: fix warning reported by kernel-doc
      clk: rockchip: remove redundant checking of device_node
      clk: rockchip: release io resource when failing to init clk

Stefan Agner (8):
      clk: imx: clk-gate2: allow custom gate configuration
      clk: imx: vf610: leave DDR clock on
      clk: imx: vf610: add WKPU unit
      clk: imx: vf610: add suspend/resume support
      clk: imx: vf610: fix DCU clock tree
      clk: imx: vf610: add TCON ipg clock
      clk: imx: return correct frequency for Ethernet PLL
      clk: imx7d: fix ahb clock mux 1

Stephen Boyd (45):
      Merge tag 'bcm2835-clk-next-2016-03-17' of git://github.com/anholt/linux into clk-next
      Merge tag 'clk-v4.7-samsung' of git://linuxtv.org/snawrocki/samsung into clk-next
      Merge tag 'imx-clk-4.7' of git://git.kernel.org/.../shawnguo/linux into clk-next
      Merge branch 'clk-renesas-for-v4.7' of git://git.kernel.org/.../geert/renesas-drivers into clk-next
      Merge tag 'v4.7-rockchip-clk1' of git://git.kernel.org/.../mmind/linux-rockchip into clk-next
      Merge branch 'clk-artpec6' into clk-next
      clk: meson: Remove CLK_IS_ROOT
      clk: mmp: Remove CLK_IS_ROOT
      clk: sirf: Remove CLK_IS_ROOT
      clk: sunxi: Remove CLK_IS_ROOT
      clk: zte: Remove CLK_IS_ROOT
      clk: clps711x: Remove CLK_IS_ROOT
      clk: ls1x: Remove CLK_IS_ROOT
      clk: nspire: Remove CLK_IS_ROOT
      clk: palmas: Remove CLK_IS_ROOT
      clk: qoriq: Remove CLK_IS_ROOT
      clk: rk808: Remove CLK_IS_ROOT
      clk: twl6040: Remove CLK_IS_ROOT
      clk: wm831x: Remove CLK_IS_ROOT
      clk: xgene: Remove CLK_IS_ROOT
      clkdev: Remove clk_register_clkdevs()
      clk: Add {devm_}clk_hw_{register,unregister}() APIs
      clk: Add clk_hw OF clk providers
      clkdev: Add clk_hw based registration APIs
      clk: divider: Add hw based registration APIs
      clk: gate: Add hw based registration APIs
      clk: mux: Add hw based registration APIs
      clk: fixed-factor: Add hw based registration APIs
      clk: fractional-divider: Add hw based registration APIs
      clk: composite: Add hw based registration APIs
      clk: gpio: Add hw based registration APIs
      clk: fixed-rate: Add hw based registration APIs
      Merge tag 'v4.7-rockchip-clk2' of git://git.kernel.org/.../mmind/linux-rockchip into clk-next
      Merge tag 'clk-renesas-for-v4.7-tag2' of git://git.kernel.org/.../geert/renesas-drivers into clk-next
      Merge branch 'clk-composite-unregister' into clk-next
      Merge branch 'clk-hw-register' (early part) into clk-next
      Merge tag 'v4.7-rockchip-clk3' of git://git.kernel.org/.../mmind/linux-rockchip into clk-next
      Merge tag 'tegra-for-4.7-clk' of git://git.kernel.org/.../tegra/linux into clk-next
      Merge tag 'sunxi-clocks-for-4.7' of https://git.kernel.org/.../mripard/linux into clk-next
      Merge tag 'clk-renesas-for-v4.7-tag3' of git://git.kernel.org/.../geert/renesas-drivers into clk-next
      clk: nxp: lpc18xx: Initialize clk_init_data::flags to 0
      Merge tag 'imx-clk-4.7-2' of git://git.kernel.org/.../shawnguo/linux into clk-next
      Merge branch 'clk-hi3519' into clk-next
      Merge tag 'v4.7-rockchip-clk4' of git://git.kernel.org/.../mmind/linux-rockchip into clk-next
      Merge tag 'imx-clk-fixes-4.6-2' of git://git.kernel.org/.../shawnguo/linux into clk-next

Suman Anna (1):
      clk: ti: dflt: remove redundant unlikely

Sylwester Nawrocki (1):
      Merge branch 'for-v4.7/clk/exynos542x' into for-v4.7/clk/next

Tero Kristo (2):
      clk: ti: dpll: add support for specifying max rate for DPLLs
      clk: ti: amx3xx: limit the maximum frequency of DPLLs based on spec

Thierry Reding (13):
      clk: tegra: Constify peripheral clock registers
      clk: tegra: Remove trailing blank line
      clk: tegra: Special-case mipi-cal parent on Tegra114
      clk: tegra: Add fixed factor peripheral clock type
      clk: tegra: Use correct parent for dpaux clock
      clk: tegra: Add dpaux1 clock
      clk: tegra: dpaux and dpaux1 are fixed factor clocks
      clk: tegra: Add sor_safe clock
      clk: tegra: dfll: Update kerneldoc
      clk: tegra: dfll: Reference CVB table instead of copying data
      clk: tegra: dfll: Make code more comprehensible
      clk: tegra: dfll: Properly clean up on failure and removal
      clk: tegra: dfll: Reformat CVB frequency table

Thomas Petazzoni (5):
      clk: unconditionally recurse into clk/mvebu/
      dt-bindings: arm: add DT binding for Marvell AP806 system controller
      clk: mvebu: new driver for Armada AP806 system controller
      dt-bindings: arm: add DT binding for Marvell CP110 system controller
      clk: mvebu: new driver for Armada CP110 system controller

Vaishali Thakkar (2):
      clk: sunxi: Use resource_size
      clk: bcm/kona: Do not use sizeof on pointer type

Vladimir Zapolskiy (1):
      clk: at91: fix check of clk_register() returned value

Xing Zheng (11):
      clk: rockchip: add a COMPOSITE_FRACMUX_NOGATE type
      clk: rockchip: allow varying mux parameters for cpuclk pll-sources
      clk: rockchip: Add support for multiple clock providers
      clk: rockchip: add new pll-type for rk3399 and similar socs
      dt-bindings: add bindings for rk3399 clock controller
      clk: rockchip: add clock controller for the RK3399
      clk: rockchip: fix the gate bit for i2c4 and i2c8 on rk3399
      clk: rockchip: assign more necessary rk3399 clock ids
      clk: rockchip: add some frequencies on the rk3399 PLL table
      clk: rockchip: drop unnecessary CLK_IGNORE_UNUSED flags from rk3399
      clk: rockchip: fix the rk3399 cifout clock

 .../arm/marvell/ap806-system-controller.txt        |   35 +
 .../arm/marvell/cp110-system-controller0.txt       |   83 ++
 .../devicetree/bindings/clock/artpec6.txt          |   41 +
 .../bindings/clock/axs10x-i2s-pll-clock.txt        |   25 +
 .../devicetree/bindings/clock/hi3519-crg.txt       |   46 +
 .../devicetree/bindings/clock/imx35-clock.txt      |    1 +
 .../devicetree/bindings/clock/oxnas,stdclk.txt     |   35 +
 .../bindings/clock/rockchip,rk3399-cru.txt         |   62 +
 Documentation/devicetree/bindings/clock/sunxi.txt  |    6 +
 Documentation/driver-model/devres.txt              |    1 +
 MAINTAINERS                                        |    2 +-
 drivers/clk/Kconfig                                |    7 +
 drivers/clk/Makefile                               |    5 +-
 drivers/clk/at91/clk-h32mx.c                       |    2 +-
 drivers/clk/axis/Makefile                          |    1 +
 drivers/clk/axis/clk-artpec6.c                     |  242 +++
 drivers/clk/axs10x/Makefile                        |    1 +
 drivers/clk/axs10x/i2s_pll_clock.c                 |  228 +++
 drivers/clk/bcm/clk-bcm2835.c                      | 1215 +++++++++------
 drivers/clk/bcm/clk-kona-setup.c                   |    3 +-
 drivers/clk/clk-clps711x.c                         |   19 +-
 drivers/clk/clk-composite.c                        |   93 +-
 drivers/clk/clk-divider.c                          |   91 +-
 drivers/clk/clk-fixed-factor.c                     |   42 +-
 drivers/clk/clk-fixed-rate.c                       |   44 +-
 drivers/clk/clk-fractional-divider.c               |   40 +-
 drivers/clk/clk-gate.c                             |   43 +-
 drivers/clk/clk-gpio.c                             |   52 +-
 drivers/clk/clk-ls1x.c                             |    3 +-
 drivers/clk/clk-mux.c                              |   57 +-
 drivers/clk/clk-nspire.c                           |    3 +-
 drivers/clk/clk-oxnas.c                            |  195 +++
 drivers/clk/clk-palmas.c                           |    4 +-
 drivers/clk/clk-qoriq.c                            |    5 +-
 drivers/clk/clk-rk808.c                            |    1 -
 drivers/clk/clk-tango4.c                           |   73 +-
 drivers/clk/clk-twl6040.c                          |    1 -
 drivers/clk/clk-wm831x.c                           |    1 -
 drivers/clk/clk-xgene.c                            |    2 +-
 drivers/clk/clk.c                                  |  222 ++-
 drivers/clk/clkdev.c                               |   75 +-
 drivers/clk/hisilicon/Kconfig                      |   15 +
 drivers/clk/hisilicon/Makefile                     |    2 +
 drivers/clk/hisilicon/clk-hi3519.c                 |  131 ++
 drivers/clk/hisilicon/clk.c                        |   23 +-
 drivers/clk/hisilicon/clk.h                        |   14 +-
 drivers/clk/hisilicon/reset.c                      |  134 ++
 drivers/clk/hisilicon/reset.h                      |   36 +
 drivers/clk/imx/clk-gate2.c                        |    7 +-
 drivers/clk/imx/clk-imx35.c                        |    4 +-
 drivers/clk/imx/clk-imx6q.c                        |    2 +-
 drivers/clk/imx/clk-imx6sx.c                       |   10 +-
 drivers/clk/imx/clk-imx7d.c                        |    5 +-
 drivers/clk/imx/clk-pllv3.c                        |    9 +-
 drivers/clk/imx/clk-vf610.c                        |   60 +-
 drivers/clk/imx/clk.h                              |   13 +-
 drivers/clk/ingenic/cgu.c                          |   11 +-
 drivers/clk/ingenic/cgu.h                          |    6 +-
 drivers/clk/ingenic/jz4740-cgu.c                   |   24 +-
 drivers/clk/ingenic/jz4780-cgu.c                   |   40 +-
 drivers/clk/mediatek/reset.c                       |    2 +-
 drivers/clk/meson/meson8b-clkc.c                   |    6 +-
 drivers/clk/mmp/clk-mmp2.c                         |   14 +-
 drivers/clk/mmp/clk-of-mmp2.c                      |   10 +-
 drivers/clk/mmp/clk-of-pxa168.c                    |    8 +-
 drivers/clk/mmp/clk-of-pxa1928.c                   |   12 +-
 drivers/clk/mmp/clk-of-pxa910.c                    |    8 +-
 drivers/clk/mmp/clk-pxa168.c                       |    8 +-
 drivers/clk/mmp/clk-pxa910.c                       |    8 +-
 drivers/clk/mmp/reset.c                            |    2 +-
 drivers/clk/mvebu/Kconfig                          |    6 +
 drivers/clk/mvebu/Makefile                         |    2 +
 drivers/clk/mvebu/ap806-system-controller.c        |  168 +++
 drivers/clk/mvebu/cp110-system-controller.c        |  406 +++++
 drivers/clk/nxp/clk-lpc18xx-creg.c                 |    1 +
 drivers/clk/qcom/gcc-ipq4019.c                     |   70 +-
 drivers/clk/qcom/gcc-msm8916.c                     |    2 +
 drivers/clk/qcom/mmcc-msm8996.c                    |   32 -
 drivers/clk/qcom/reset.c                           |    2 +-
 drivers/clk/qcom/reset.h                           |    2 +-
 drivers/clk/renesas/Kconfig                        |   16 +
 drivers/clk/renesas/Makefile                       |   26 +-
 drivers/clk/renesas/clk-mstp.c                     |   10 +-
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |   47 +-
 drivers/clk/renesas/renesas-cpg-mssr.c             |   49 +-
 drivers/clk/renesas/renesas-cpg-mssr.h             |    6 +-
 drivers/clk/rockchip/Makefile                      |    1 +
 drivers/clk/rockchip/clk-cpu.c                     |   29 +-
 drivers/clk/rockchip/clk-mmc-phase.c               |    3 +-
 drivers/clk/rockchip/clk-pll.c                     |  336 ++++-
 drivers/clk/rockchip/clk-rk3036.c                  |   21 +-
 drivers/clk/rockchip/clk-rk3188.c                  |   51 +-
 drivers/clk/rockchip/clk-rk3228.c                  |   21 +-
 drivers/clk/rockchip/clk-rk3288.c                  |   23 +-
 drivers/clk/rockchip/clk-rk3368.c                  |   28 +-
 drivers/clk/rockchip/clk-rk3399.c                  | 1573 ++++++++++++++++++++
 drivers/clk/rockchip/clk.c                         |  151 +-
 drivers/clk/rockchip/clk.h                         |  104 +-
 drivers/clk/rockchip/softrst.c                     |    2 +-
 drivers/clk/samsung/clk-exynos3250.c               |   15 +
 drivers/clk/samsung/clk-exynos5420.c               |   77 +-
 drivers/clk/sirf/clk-atlas6.c                      |    7 +-
 drivers/clk/sirf/clk-atlas7.c                      |    2 +-
 drivers/clk/sirf/clk-prima2.c                      |    7 +-
 drivers/clk/sunxi/Makefile                         |    3 +
 drivers/clk/sunxi/clk-a10-hosc.c                   |    3 +-
 drivers/clk/sunxi/clk-a10-mod1.c                   |    2 +-
 drivers/clk/sunxi/clk-a10-ve.c                     |    2 +-
 drivers/clk/sunxi/clk-sun4i-display.c              |  261 ++++
 drivers/clk/sunxi/clk-sun4i-pll3.c                 |   98 ++
 drivers/clk/sunxi/clk-sun4i-tcon-ch1.c             |  300 ++++
 drivers/clk/sunxi/clk-sun9i-mmc.c                  |    4 +-
 drivers/clk/sunxi/clk-sunxi.c                      |   79 +-
 drivers/clk/sunxi/clk-usb.c                        |    2 +-
 drivers/clk/tegra/Makefile                         |    1 +
 drivers/clk/tegra/clk-dfll.c                       |   11 +-
 drivers/clk/tegra/clk-dfll.h                       |   22 +-
 drivers/clk/tegra/clk-id.h                         |    2 +
 drivers/clk/tegra/clk-periph-fixed.c               |  120 ++
 drivers/clk/tegra/clk-periph-gate.c                |    2 +-
 drivers/clk/tegra/clk-periph.c                     |    2 +-
 drivers/clk/tegra/clk-pll.c                        |   46 +
 drivers/clk/tegra/clk-tegra-fixed.c                |    1 -
 drivers/clk/tegra/clk-tegra-periph.c               |    5 +-
 drivers/clk/tegra/clk-tegra114.c                   |    6 +-
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c         |  103 +-
 drivers/clk/tegra/clk-tegra124.c                   |    4 +
 drivers/clk/tegra/clk-tegra210.c                   |   29 +-
 drivers/clk/tegra/clk-tegra30.c                    |   12 +-
 drivers/clk/tegra/clk.c                            |    6 +-
 drivers/clk/tegra/clk.h                            |   27 +-
 drivers/clk/tegra/cvb.c                            |   71 +-
 drivers/clk/tegra/cvb.h                            |   15 +-
 drivers/clk/ti/clk-54xx.c                          |    1 +
 drivers/clk/ti/clk-7xx.c                           |    1 +
 drivers/clk/ti/clk-dra7-atl.c                      |    2 +
 drivers/clk/ti/clkt_dflt.c                         |    2 +-
 drivers/clk/ti/clkt_dpll.c                         |    3 +
 drivers/clk/ti/dpll.c                              |    5 +
 drivers/clk/zte/clk-zx296702.c                     |    3 +-
 include/dt-bindings/clock/axis,artpec6-clkctrl.h   |   38 +
 include/dt-bindings/clock/bcm2835.h                |   20 +-
 include/dt-bindings/clock/exynos3250.h             |   11 +-
 include/dt-bindings/clock/exynos5420.h             |   24 +-
 include/dt-bindings/clock/hi3519-clock.h           |   40 +
 include/dt-bindings/clock/imx7d-clock.h            |    3 +-
 include/dt-bindings/clock/rk3399-cru.h             |  755 ++++++++++
 include/dt-bindings/clock/tegra210-car.h           |    2 +-
 include/dt-bindings/clock/vf610-clock.h            |    8 +-
 include/linux/clk-provider.h                       |  103 +-
 include/linux/clk/renesas.h                        |   16 +-
 include/linux/clk/ti.h                             |    2 +
 include/linux/clkdev.h                             |    7 +-
 153 files changed, 8092 insertions(+), 1220 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
 create mode 100644 Documentation/devicetree/bindings/clock/artpec6.txt
 create mode 100644 Documentation/devicetree/bindings/clock/axs10x-i2s-pll-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/hi3519-crg.txt
 create mode 100644 Documentation/devicetree/bindings/clock/oxnas,stdclk.txt
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt
 create mode 100644 drivers/clk/axis/Makefile
 create mode 100644 drivers/clk/axis/clk-artpec6.c
 create mode 100644 drivers/clk/axs10x/Makefile
 create mode 100644 drivers/clk/axs10x/i2s_pll_clock.c
 create mode 100644 drivers/clk/clk-oxnas.c
 create mode 100644 drivers/clk/hisilicon/clk-hi3519.c
 create mode 100644 drivers/clk/hisilicon/reset.c
 create mode 100644 drivers/clk/hisilicon/reset.h
 create mode 100644 drivers/clk/mvebu/ap806-system-controller.c
 create mode 100644 drivers/clk/mvebu/cp110-system-controller.c
 create mode 100644 drivers/clk/renesas/Kconfig
 create mode 100644 drivers/clk/rockchip/clk-rk3399.c
 create mode 100644 drivers/clk/sunxi/clk-sun4i-display.c
 create mode 100644 drivers/clk/sunxi/clk-sun4i-pll3.c
 create mode 100644 drivers/clk/sunxi/clk-sun4i-tcon-ch1.c
 create mode 100644 drivers/clk/tegra/clk-periph-fixed.c
 create mode 100644 include/dt-bindings/clock/axis,artpec6-clkctrl.h
 create mode 100644 include/dt-bindings/clock/hi3519-clock.h
 create mode 100644 include/dt-bindings/clock/rk3399-cru.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

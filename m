Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
From: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org
To: torvalds@linux-foundation.org
Message-ID: <20150831192125.11508.92473@quantum>
Subject: [GIT PULL] clk: changes for 4.3
Date: Mon, 31 Aug 2015 12:21:25 -0700
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit d770e558e21961ad6cfdf0ff7df0eb5d7d4f0754:

  Linux 4.2-rc1 (2015-07-05 11:01:52 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-=
linus-4.3

for you to fetch changes up to ba30011577330b7e29ecb5916d89c6db9fbc5b3d:

  clk: s5pv210: add missing call to samsung_clk_of_add_provider() (2015-08-=
27 12:03:21 -0700)

----------------------------------------------------------------
The clk framework changes for 4.3 are mostly updates to existing drivers
and the addition of new clock drivers. Stephen Boyd has also done a lot
of subsystem-wide driver clean-ups (thanks!). There are also fixes to
the framework core and changes to better split clock provider drivers
from clock consumer drivers.

----------------------------------------------------------------
Andrzej Hajda (1):
      clk/mmp: use kmemdup rather than duplicating its implementation

Andy Shevchenko (1):
      clk: socfpga: switch to GENMASK()

Axel Lin (3):
      clk: h8300: Fix signness bug
      clk: s2mps11: Simplify s2mps11_clk_probe unwind paths
      clk: twl6040: Convert to use devm_clk_register

Boris Brezillon (2):
      clk: change clk_ops' ->determine_rate() prototype
      clk: fix some determine_rate implementations

Chanwoo Choi (1):
      clk: exynos3250: Add cpu clock configuration data and instaniate cpu =
clock

Chen-Yu Tsai (1):
      clk: Add missing header for 'bool' definition to clk-conf.h

Damien.Horsley (1):
      clk: pistachio: correct critical clock list

Dan Carpenter (1):
      clk: versatile: off by one in clk_sp810_timerclken_of_get()

Daniel Thompson (1):
      clk: stm32: Fix out-by-one error path in the index lookup

David Dueck (1):
      clk: at91: do not leak resources

Dinh Nguyen (6):
      clk: at91: make use of of_clk_parent_fill helper function
      clk: keystone: make use of of_clk_parent_fill helper function
      clk: st: make use of of_clk_parent_fill helper function
      clk: sunxi: make use of of_clk_parent_fill helper function
      clk: ti: make use of of_clk_parent_fill helper function
      clk: socfpga: Add a second parent option for the dbg_base_clk

Dong Aisheng (1):
      clk: remove duplicated code with __clk_set_parent_after

Douglas Anderson (1):
      clk: rockchip: Fix PLL bandwidth

Eric Anholt (1):
      clk: bcm2835: Drop the fixed sys_pclk.

Fabio Estevam (1):
      clk: imx: clk-imx6q: Provide initial IPU clock settings for mx6dl

Frank Li (1):
      clk: imx: add imx6ul clk tree support

Gabriel Fernandez (3):
      drivers: clk: st: Remove unused code
      drivers: clk: st: Fix FSYN channel values
      drivers: clk: st: Fix mux bit-setting for Cortex A9 clocks

Geert Uytterhoeven (1):
      clk: shmobile: Remove unneeded #include <linux/clkdev.h>

Georgi Djakov (3):
      clk: qcom: Constify the parent names arrays
      clk: qcom: Add support for SR2 PLLs
      clk: qcom: Fix MSM8916 prng clock enable bit

Giuseppe Cavallaro (1):
      drivers: clk: st: Fix flexgen lock init

Guo Zeng (4):
      clk: atlas7: add lost pwm unit clks
      clk: atlas7: export mux clks so that consumers can get them
      clk: atlas7: fix bit field and its root clk for coresight_tpiu
      clk: atlas7: fix pll missed divide NR in fraction mode

Hai Li (1):
      clk: qcom: Use parent rate when set rate to pixel RCG clock

Heiko Stuebner (13):
      clk: rockchip: rk3288: add CLK_SET_RATE_PARENT to sclk_mac
      clk: rockchip: fix faulty vip parent name on rk3288
      clk: rockchip: protect register macros against multipart values
      clk: rockchip: add COMPOSITE_NOGATE_DIVTBL variant
      clk: rockchip: add support for phase inverters
      clk: rockchip: fix issues in the mmc-phase clock
      clk: rockchip: define the inverters of rk3066/rk3188 and rk3288
      dt-bindings: add documentation of rk3668 clock controller
      clk: rockchip: add dt-binding header for rk3368
      clk: rockchip: add missing include guards
      clk: rockchip: add rk3368 clock controller
      clk: track the orphan status of clocks and their children
      clk: rockchip: register pll mux before pll itself

James Liao (3):
      clk: mediatek: Fix PLL registers setting flow
      clk: mediatek: Fix calculation of PLL rate settings
      clk: mediatek: Add MT8173 MMPLL change rate support

Jim Quinlan (1):
      clk: allow a clk divider with max divisor when zero

Jun Nie (3):
      clk: zx: Add audio div clock method for zx296702
      clk: zx: Add audio and GPIO clock for zx296702
      clk: zx: Constify parent names in clock init data

Krzysztof Kozlowski (1):
      clk: exynos4: Fix wrong clock for Exynos4x12 ADC

Leo Yan (4):
      clk: hisi: refine parameter checking for init
      dt-bindings: arm: Hi6220: add doc for SRAM controller
      dt-bindings: clk: Hi6220: Document stub clock driver
      clk: Hi6220: add stub clock driver

Linus Walleij (3):
      clk: ux500: delete the non-DT U8500 clock implementation
      clk/ARM: move Ux500 PRCC bases to the device tree
      clk: add bindings for the Ux500 clocks

Marek Szyprowski (1):
      clk: s5pv210: add missing call to samsung_clk_of_add_provider()

Matthias Brugger (1):
      clk: xgene: Delete duplicated name field

Maxime Ripard (7):
      ARM: sun4i: Add clock indices
      ARM: sun5i: Add clock indices
      ARM: sun6i: Add clock indices
      ARM: sun7i: Add clock indices
      ARM: sun8i: Add clock indices
      ARM: sun9i: Wrap the clock-indices
      clk: sunxi: Add a simple gates driver

Michael Turquette (2):
      Merge branch 'v4.3-topic/clk-samsung' of git://git.kernel.org/.../kge=
ne/linux-samsung into clk-next
      Merge tag 'imx-clk-4.3' of git://git.kernel.org/.../shawnguo/linux in=
to clk-next

Mikko Perttunen (1):
      clk: tegra: Introduce ability for SoC-specific reset control callbacks

Nicolas Pitre (1):
      drivers/clk: appropriate __init annotation for const data

Pankaj Dev (2):
      drivers: clk: st: Add CLK_GET_RATE_NOCACHE flag to clocks
      drivers: clk: st: Incorrect register offset used for lock_status

Paul Walmsley (1):
      clk: tegra: Add DFLL DVCO reset control for Tegra124

Pawel Moll (1):
      clk: versatile: Add SP810 device tree bindings document

Philippe Reynes (2):
      clk: imx31: add a second rtc clock
      clk: imx35: define two clocks for rtc

Ray Jui (2):
      clk: iproc: fix memory leak from clock name
      clk: iproc: fix bit manipulation arithmetic

Rob Herring (1):
      clk: kill off set_irq_flags usage

Robert Jarzmik (1):
      clk: pxa: fix core frequency reporting unit

Sascha Hauer (1):
      clk: mediatek: mt8173: Fix enabling of critical clocks

Sergej Sawazki (4):
      clk: gpio-gate: Include export.h instead of module.h
      clk: gpio-gate: Stay silent on EPROBE_DEFER
      clk: add gpio controlled clock multiplexer
      clk: Rename clk-gpio-gate.c to clk-gpio.c

Sjoerd Simons (1):
      clk: rockchip: Fix SPIF special clock definition

Stephen Boyd (113):
      Merge branch 'clk-fixes' into clk-next
      clk: at91: Silence warnings and cleanup __init/extern usage
      Merge branch 'clk-rk3368' into clk-next
      clk: Check for allocation errors in of_clk_init()
      clk: Move clk_provider_list to scope of function using it
      Merge branch 'clk-fixes' into clk-next
      clk: st: Fix error paths and allocation style
      ARM: at91: Remove clk-provider.h include
      ARM: hisi: Remove clk-provider.h include
      ARM: keystone: Remove clk-provider.h include
      ARM: mvebu: Remove clk-provider.h include
      ARM: orion5x: Remove clk-provider.h include
      ARM: s3c64xx: Remove clk-provider.h include
      ARM: OMAP2+: Include clk.h
      arm64: Remove clk-provider.h include
      MIPS: Alchemy: Include clk.h
      powerpc/512x: clk: Include clk.h
      staging: clocking-wizard: Include clk.h
      spi: spi-pxa2xx: Remove clk.h include
      clocksource: cadence_ttc: Remove clk-provider.h include
      ACPI: Remove clk.h include
      simplefb: Include clk.h
      lib/vsprintf.c: Include clk.h
      clk: i.MX: Remove clk.h include
      clk: axi-clkgen: Remove clk.h include
      clk: cdce706: Include clk.h
      clk: clps711x: Remove clk.h include
      clk: efm32gg: Remove clk.h include
      clk: mux: Remove clk.h include
      clk: nomadik: Remove clk.h and clkdev.h includes
      clk: palmas: Remove clkdev.h includes
      clk: rk808: Remove clk.h include
      clk: si5351: Include clk.h
      clk: twl6040: Remove clk.h include
      clk: u300: Remove clk.h include
      clk: wm831x: Remove clk.h include
      clk: hisilicon: Remove clk.h include
      clk: keystone: Remove clk.h include
      clk: mediatek: Properly include clk.h
      clk: meson8b: Properly include clk.h
      clk: mmp: Remove clk.h include
      clk: mvebu: Remove clk.h include
      clk: mxs: Include clk.h in C files that use it
      clk: nxp: Remove clk.h include
      clk: rockchip: Properly include clk.h
      clk: samsung: Properly include clk.h and clkdev.h
      clk: sirf: Properly include clk.h
      clk: socfpga: Remove clk.h and clkdev.h includes
      clk: spear: Remove clk.h include
      clk: tegra: Properly include clk.h
      clk: ux500: Remove clk.h and clkdev.h includes
      clk: versatile: Remove clk.h and clkdev.h includes
      clk: bcm: Include clk.h
      clk: highbank: Include clk.h
      clk: qcom: Include clk.h
      clk: st: Include clk.h
      clk: sunxi: Include clk.h and remove unused clkdev.h includes
      clk: ti: Include clk.h
      clk: zynq: Include clk.h
      clk: Include clk.h in clk.c
      clk: cdce925: Include clk.h
      clk: moxart: Include clk.h
      clk: si570: Include clk.h
      clk: ingenic: Include clk.h
      clk: pistachio: Include clk.h
      clk: ti: Switch clk-provider.h include to clk.h
      clk: at91: Include clk.h and slab.h
      clk: h8300: Remove clk.h and clkdev.h includes
      clk: Remove clk.h from clk-provider.h
      Merge branch 'clk-determine-rate-struct' into clk-next
      clk: h8300: Drop allocation printk and cleanup sizeof style
      clk: h8300: Use standard Linux I/O accessors
      clk: gpio: Unlock mutex on error path
      clk: qcom: Set CLK_SET_RATE_PARENT on ce1 clocks
      Merge branch 'for-4.2/ti-clk-move' of https://github.com/t-kristo/lin=
ux-pm into clk-next
      clk: ti: Check kzalloc() for failures
      clk: ti: Mark ti_clk_features static
      clk: ti: clk-3xxx: Remove unused structures
      clk: ti: Force pointer to be __iomem
      clk: Allow providers to configure min/max rates
      Merge branch 'cleanup-clk-h-includes' into clk-next
      clk: gpio: Mark parent_names array const
      clk: qcom: Give clk-qcom.ko module a GPLv2 license
      clk: basic-type: Silence warnings about lock imbalances
      clk: Silence warnings about lock imbalances
      clk: Add clk_hw_*() APIs for use by clk providers
      clk: Replace __clk_get_num_parents with clk_hw_get_num_parents()
      clk: Convert __clk_get_flags() to clk_hw_get_flags()
      clk: ti: Remove CLK_IS_BASIC check
      ARM: OMAP: Convert __clk_get_rate() to provider/consumer APIs
      MIPS: alchemy: Convert to clk_hw based provider APIs
      clk: at91: Convert to clk_hw based provider APIs
      clk: bcm: Convert to clk_hw based provider APIs
      clk: Convert basic types to clk_hw based provider APIs
      clk: mmp: Convert to clk_hw based provider APIs
      clk: mvebu: Convert to clk_hw based provider APIs
      clk: stm32f4: Convert to clk_hw based provider APIs
      clk: qcom: Convert to clk_hw based provider APIs
      clk: rockchip: Convert to clk_hw based provider APIs
      clk: samsung: Convert to clk_hw based provider APIs
      clk: sirf: Convert to clk_hw based provider APIs
      clk: spear: Convert to clk_hw based provider APIs
      clk: sunxi: Convert to clk_hw based provider APIs
      clk: tegra: Convert to clk_hw based provider APIs
      clk: ti: Convert to clk_hw based provider APIs
      clk: versatile: Switch to assigned clock parents
      drm/msm/dsi: Convert to clk_hw based provider APIs
      clk: si5351: Convert __clk_get_name() to clk_hw_get_name()
      clk: Remove unused provider APIs
      clk: Constify clk_hw argument to provider APIs
      clk: Convert __clk_get_name(hw->clk) to clk_hw_get_name(hw)
      Merge tag 'tegra-for-4.3-clk' of git://git.kernel.org/.../tegra/linux=
 into clk-next
      clk: tegra: Fix some static checker problems

Tero Kristo (27):
      ARM: OMAP2+: clock: export driver API to setup/get clock features
      clk: ti: move generic OMAP DPLL implementation under drivers/clk
      clk: ti: move OMAP4+ DPLL implementation under drivers/clk
      clk: ti: move interface clock implementation under drivers/clk
      ARM: OMAP3: dpll3-m2: get rid of obsolete clksel access
      ARM: OMAP2+: clk: remove obsolete clksel support code
      ARM: OMAP2+: clock: remove clock_common_data.c file
      ARM: OMAP36xx: remove clock36xx.c/.h files
      clk: ti: autoidle: move generic autoidle handling code to clock driver
      clk: ti: move omap2_clk_enable_init_clocks under clock driver
      ARM: OMAP2+: clock: remove support for legacy mpurate command line pa=
ram
      ARM: OMAP2+: clock: add support for clkdm ops to the low level clk ops
      ARM: OMAP2+: clock: add support for specific CM ops to ti_clk_ll_ops
      clk: ti: dpll: move omap3 DPLL functionality to clock driver
      ARM: OMAP3: clock: remove clock3xxx.c file
      ARM: OMAP2+: clock: remove clkdm_control static boolean from code
      clk: ti: dflt: move support for default gate clock to clock driver
      clk: ti: omap2430: move clock support code under clock driver
      clk: ti: clkdm: move clkdm gate clock support code to clock driver
      clk: ti: omap34xx: move omap34xx clock type support code to clock dri=
ver
      ARM: OMAP4: clock: remove clock44xx.h header
      clk: ti: am3517: move remaining am3517 clock support code to clock dr=
iver
      clk: ti: move some public definitions to private header
      ARM: OMAP2+: clock: remove dead definitions from the clock header file
      clk: ti: remove exported ll_ops struct, instead add an API for regist=
ration
      ARM: OMAP2+: clock: remove legacy omap2_clk_readl/writel APIs
      clk: ti: move low-level access and init code under clock driver

Thomas Abraham (1):
      clk: exynos5250: add cpu clock configuration data and instantiate cpu=
 clock

Tuomas Tynkkynen (7):
      clk: tegra: Add binding for the Tegra124 DFLL clocksource
      clk: tegra: Add library for the DFLL clock source (open-loop mode)
      clk: tegra: Add closed loop support for the DFLL
      clk: tegra: Add functions for parsing CVB tables
      clk: tegra: Add Tegra124 DFLL clocksource platform driver
      clk: tegra: Save/restore CCLKG_BURST_POLICY on suspend
      clk: tegra: Add the DFLL as a possible parent of the cclk_g clock

Vaibhav Hiremath (1):
      clk: s2mps11: Use kcalloc instead of kzalloc for array allocation

Yibo Cai (2):
      clk: atlas7: fix integer overflow in dto rate calculation
      clk: atlas7: replace dto resolution magic number by macro

Zdenko Pulitika (3):
      clk: pistachio: Fix 32bit integer overflows
      clk: pistachio: Fix override of clk-pll settings from boot loader
      clk: pistachio: Fix PLL rate calculation in integer mode

 Documentation/clk.txt                              |    8 +-
 .../bindings/arm/hisilicon/hisilicon.txt           |   18 +
 Documentation/devicetree/bindings/arm/sp810.txt    |   46 +
 .../devicetree/bindings/clock/gpio-mux-clock.txt   |   19 +
 .../devicetree/bindings/clock/hi6220-clock.txt     |   19 +-
 .../bindings/clock/nvidia,tegra124-dfll.txt        |   79 +
 .../bindings/clock/rockchip,rk3368-cru.txt         |   61 +
 Documentation/devicetree/bindings/clock/ux500.txt  |   64 +
 arch/arm/boot/dts/ste-dbx5x0.dtsi                  |    7 +
 arch/arm/boot/dts/sun4i-a10.dtsi                   |   69 +-
 arch/arm/boot/dts/sun5i-a10s.dtsi                  |   23 +-
 arch/arm/boot/dts/sun5i-a13.dtsi                   |   18 +-
 arch/arm/boot/dts/sun5i.dtsi                       |    1 +
 arch/arm/boot/dts/sun6i-a31.dtsi                   |   24 +
 arch/arm/boot/dts/sun7i-a20.dtsi                   |   23 +
 arch/arm/boot/dts/sun8i-a23-a33.dtsi               |   15 +
 arch/arm/boot/dts/sun9i-a80.dtsi                   |   32 +-
 arch/arm/mach-at91/at91rm9200.c                    |    1 -
 arch/arm/mach-hisi/hisilicon.c                     |    1 -
 arch/arm/mach-keystone/pm_domain.c                 |    1 -
 arch/arm/mach-mvebu/board-v7.c                     |    1 -
 arch/arm/mach-omap2/Makefile                       |   22 +-
 arch/arm/mach-omap2/clkt34xx_dpll3m2.c             |   13 +-
 arch/arm/mach-omap2/clkt_clksel.c                  |  466 ------
 arch/arm/mach-omap2/clkt_iclk.c                    |   68 -
 arch/arm/mach-omap2/clock.c                        |  676 +-------
 arch/arm/mach-omap2/clock.h                        |  205 +--
 arch/arm/mach-omap2/clock2430.c                    |   57 -
 arch/arm/mach-omap2/clock2xxx.c                    |   57 -
 arch/arm/mach-omap2/clock34xx.c                    |  138 --
 arch/arm/mach-omap2/clock34xx.h                    |   18 -
 arch/arm/mach-omap2/clock3517.c                    |  118 --
 arch/arm/mach-omap2/clock3517.h                    |   14 -
 arch/arm/mach-omap2/clock36xx.c                    |   69 -
 arch/arm/mach-omap2/clock36xx.h                    |   13 -
 arch/arm/mach-omap2/clock3xxx.c                    |  135 --
 arch/arm/mach-omap2/clock44xx.h                    |   20 -
 arch/arm/mach-omap2/clock_common_data.c            |  115 --
 arch/arm/mach-omap2/io.c                           |    3 +-
 arch/arm/mach-omap2/omap_hwmod.c                   |    1 +
 arch/arm/mach-omap2/pm24xx.c                       |    1 +
 arch/arm/mach-orion5x/board-dt.c                   |    1 -
 arch/arm/mach-s3c64xx/common.c                     |    1 -
 arch/arm/mach-tegra/Kconfig                        |    1 +
 arch/arm/mach-ux500/cpu.c                          |   21 +-
 arch/arm64/kernel/setup.c                          |    1 -
 arch/mips/alchemy/common/clock.c                   |   76 +-
 arch/powerpc/platforms/512x/clock-commonclk.c      |    1 +
 drivers/acpi/acpi_apd.c                            |    1 -
 drivers/acpi/acpi_lpss.c                           |    1 -
 drivers/clk/Makefile                               |    2 +-
 drivers/clk/at91/clk-h32mx.c                       |    4 +-
 drivers/clk/at91/clk-main.c                        |   11 +-
 drivers/clk/at91/clk-master.c                      |   15 +-
 drivers/clk/at91/clk-peripheral.c                  |    6 +-
 drivers/clk/at91/clk-pll.c                         |    8 +-
 drivers/clk/at91/clk-programmable.c                |   40 +-
 drivers/clk/at91/clk-slow.c                        |   16 +-
 drivers/clk/at91/clk-smd.c                         |    7 +-
 drivers/clk/at91/clk-system.c                      |    8 +-
 drivers/clk/at91/clk-usb.c                         |   47 +-
 drivers/clk/at91/clk-utmi.c                        |    8 +-
 drivers/clk/at91/pmc.c                             |    1 -
 drivers/clk/at91/pmc.h                             |  124 +-
 drivers/clk/bcm/clk-iproc-asiu.c                   |    6 +-
 drivers/clk/bcm/clk-iproc-pll.c                    |   13 +-
 drivers/clk/bcm/clk-kona.c                         |   53 +-
 drivers/clk/berlin/berlin2-pll.c                   |    4 +-
 drivers/clk/clk-axi-clkgen.c                       |    1 -
 drivers/clk/clk-bcm2835.c                          |    5 -
 drivers/clk/clk-cdce706.c                          |    3 +-
 drivers/clk/clk-cdce925.c                          |    1 +
 drivers/clk/clk-clps711x.c                         |    1 -
 drivers/clk/clk-composite.c                        |   61 +-
 drivers/clk/clk-divider.c                          |   28 +-
 drivers/clk/clk-efm32gg.c                          |    1 -
 drivers/clk/clk-fixed-factor.c                     |    5 +-
 drivers/clk/clk-fractional-divider.c               |    8 +
 drivers/clk/clk-gate.c                             |    4 +
 drivers/clk/clk-gpio-gate.c                        |  207 ---
 drivers/clk/clk-gpio.c                             |  325 ++++
 drivers/clk/clk-highbank.c                         |    1 +
 drivers/clk/clk-moxart.c                           |    1 +
 drivers/clk/clk-mux.c                              |    7 +-
 drivers/clk/clk-nomadik.c                          |    3 +-
 drivers/clk/clk-palmas.c                           |    1 -
 drivers/clk/clk-rk808.c                            |    1 -
 drivers/clk/clk-s2mps11.c                          |   32 +-
 drivers/clk/clk-si5351.c                           |   22 +-
 drivers/clk/clk-si570.c                            |    1 +
 drivers/clk/clk-stm32f4.c                          |    7 +-
 drivers/clk/clk-twl6040.c                          |   13 +-
 drivers/clk/clk-u300.c                             |    2 +-
 drivers/clk/clk-wm831x.c                           |    1 -
 drivers/clk/clk-xgene.c                            |   28 +-
 drivers/clk/clk.c                                  |  346 ++--
 drivers/clk/h8300/clk-div.c                        |    4 +-
 drivers/clk/h8300/clk-h8s2678.c                    |   20 +-
 drivers/clk/hisilicon/Kconfig                      |    2 +-
 drivers/clk/hisilicon/Makefile                     |    2 +-
 drivers/clk/hisilicon/clk-hi3620.c                 |   41 +-
 drivers/clk/hisilicon/clk-hi6220-stub.c            |  276 +++
 drivers/clk/hisilicon/clk-hip04.c                  |    2 -
 drivers/clk/hisilicon/clk.c                        |   14 +-
 drivers/clk/hisilicon/clkgate-separated.c          |    2 -
 drivers/clk/imx/Makefile                           |    1 +
 drivers/clk/imx/clk-imx1.c                         |    1 -
 drivers/clk/imx/clk-imx21.c                        |    1 -
 drivers/clk/imx/clk-imx31.c                        |    3 +-
 drivers/clk/imx/clk-imx35.c                        |    6 +-
 drivers/clk/imx/clk-imx6q.c                        |    4 +
 drivers/clk/imx/clk-imx6ul.c                       |  432 +++++
 drivers/clk/imx/clk-pfd.c                          |    1 -
 drivers/clk/imx/clk-pllv1.c                        |    1 -
 drivers/clk/imx/clk-pllv3.c                        |    1 -
 drivers/clk/ingenic/cgu.c                          |    1 +
 drivers/clk/keystone/gate.c                        |    1 -
 drivers/clk/keystone/pll.c                         |    4 +-
 drivers/clk/mediatek/clk-gate.h                    |    3 +-
 drivers/clk/mediatek/clk-mt8135.c                  |    1 +
 drivers/clk/mediatek/clk-mt8173.c                  |   51 +-
 drivers/clk/mediatek/clk-mtk.h                     |    9 +-
 drivers/clk/mediatek/clk-pll.c                     |   39 +-
 drivers/clk/meson/clk-cpu.c                        |    1 +
 drivers/clk/meson/clkc.c                           |    1 -
 drivers/clk/mmp/clk-apbc.c                         |    1 -
 drivers/clk/mmp/clk-apmu.c                         |    1 -
 drivers/clk/mmp/clk-gate.c                         |    3 +-
 drivers/clk/mmp/clk-mix.c                          |   71 +-
 drivers/clk/mmp/clk.c                              |    3 +-
 drivers/clk/mvebu/clk-cpu.c                        |    9 +-
 drivers/clk/mvebu/common.c                         |    2 +-
 drivers/clk/mxs/clk-div.c                          |    1 -
 drivers/clk/mxs/clk-frac.c                         |    1 -
 drivers/clk/mxs/clk-imx23.c                        |    3 +-
 drivers/clk/mxs/clk-imx28.c                        |    2 +-
 drivers/clk/mxs/clk-pll.c                          |    1 -
 drivers/clk/mxs/clk-ref.c                          |    1 -
 drivers/clk/mxs/clk.h                              |    3 +-
 drivers/clk/nxp/clk-lpc18xx-cgu.c                  |    1 -
 drivers/clk/pistachio/clk-pistachio.c              |   19 +-
 drivers/clk/pistachio/clk-pll.c                    |   81 +-
 drivers/clk/pistachio/clk.c                        |    1 +
 drivers/clk/pistachio/clk.h                        |   14 +-
 drivers/clk/pxa/clk-pxa25x.c                       |    2 +-
 drivers/clk/pxa/clk-pxa27x.c                       |    2 +-
 drivers/clk/pxa/clk-pxa3xx.c                       |    2 +-
 drivers/clk/qcom/clk-branch.c                      |    2 +-
 drivers/clk/qcom/clk-pll.c                         |   93 +-
 drivers/clk/qcom/clk-pll.h                         |    1 +
 drivers/clk/qcom/clk-rcg.c                         |   63 +-
 drivers/clk/qcom/clk-rcg2.c                        |  106 +-
 drivers/clk/qcom/common.c                          |    5 +-
 drivers/clk/qcom/gcc-apq8084.c                     |   13 +-
 drivers/clk/qcom/gcc-ipq806x.c                     |   10 +-
 drivers/clk/qcom/gcc-msm8660.c                     |    8 +-
 drivers/clk/qcom/gcc-msm8916.c                     |   26 +-
 drivers/clk/qcom/gcc-msm8960.c                     |   12 +-
 drivers/clk/qcom/gcc-msm8974.c                     |    5 +-
 drivers/clk/qcom/lcc-ipq806x.c                     |    6 +-
 drivers/clk/qcom/lcc-msm8960.c                     |    8 +-
 drivers/clk/qcom/mmcc-apq8084.c                    |   20 +-
 drivers/clk/qcom/mmcc-msm8960.c                    |   27 +-
 drivers/clk/qcom/mmcc-msm8974.c                    |   16 +-
 drivers/clk/rockchip/Makefile                      |    2 +
 drivers/clk/rockchip/clk-cpu.c                     |    1 +
 drivers/clk/rockchip/clk-inverter.c                |  116 ++
 drivers/clk/rockchip/clk-mmc-phase.c               |    9 +-
 drivers/clk/rockchip/clk-pll.c                     |  100 +-
 drivers/clk/rockchip/clk-rk3188.c                  |   18 +-
 drivers/clk/rockchip/clk-rk3288.c                  |   15 +-
 drivers/clk/rockchip/clk-rk3368.c                  |  881 ++++++++++
 drivers/clk/rockchip/clk.c                         |    7 +
 drivers/clk/rockchip/clk.h                         |   82 +-
 drivers/clk/samsung/clk-cpu.c                      |    7 +-
 drivers/clk/samsung/clk-exynos-audss.c             |    3 +-
 drivers/clk/samsung/clk-exynos-clkout.c            |    2 +-
 drivers/clk/samsung/clk-exynos3250.c               |   34 +-
 drivers/clk/samsung/clk-exynos4.c                  |    4 +-
 drivers/clk/samsung/clk-exynos4415.c               |    2 -
 drivers/clk/samsung/clk-exynos5250.c               |   33 +-
 drivers/clk/samsung/clk-exynos5260.c               |    2 -
 drivers/clk/samsung/clk-exynos5410.c               |    2 -
 drivers/clk/samsung/clk-exynos5420.c               |    3 +-
 drivers/clk/samsung/clk-exynos5433.c               |    2 -
 drivers/clk/samsung/clk-exynos5440.c               |    2 -
 drivers/clk/samsung/clk-exynos7.c                  |    2 -
 drivers/clk/samsung/clk-pll.c                      |   20 +-
 drivers/clk/samsung/clk-s3c2410-dclk.c             |    6 +-
 drivers/clk/samsung/clk-s3c2410.c                  |    2 -
 drivers/clk/samsung/clk-s3c2412.c                  |    2 -
 drivers/clk/samsung/clk-s3c2443.c                  |    2 -
 drivers/clk/samsung/clk-s3c64xx.c                  |    3 +-
 drivers/clk/samsung/clk-s5pv210-audss.c            |    2 +-
 drivers/clk/samsung/clk-s5pv210.c                  |    4 +-
 drivers/clk/samsung/clk.c                          |    4 +
 drivers/clk/samsung/clk.h                          |    3 +-
 drivers/clk/shmobile/clk-div6.c                    |    8 +-
 drivers/clk/shmobile/clk-r8a73a4.c                 |    2 +-
 drivers/clk/shmobile/clk-r8a7740.c                 |    2 +-
 drivers/clk/shmobile/clk-r8a7778.c                 |    2 +-
 drivers/clk/shmobile/clk-r8a7779.c                 |    2 +-
 drivers/clk/shmobile/clk-rcar-gen2.c               |    2 +-
 drivers/clk/shmobile/clk-sh73a0.c                  |    2 +-
 drivers/clk/sirf/clk-atlas6.c                      |    1 -
 drivers/clk/sirf/clk-atlas7.c                      |   25 +-
 drivers/clk/sirf/clk-common.c                      |   14 +-
 drivers/clk/sirf/clk-prima2.c                      |    1 -
 drivers/clk/socfpga/clk-gate-a10.c                 |    3 +-
 drivers/clk/socfpga/clk-gate.c                     |    5 +-
 drivers/clk/socfpga/clk-periph-a10.c               |    3 +-
 drivers/clk/socfpga/clk-periph.c                   |   23 +-
 drivers/clk/socfpga/clk-pll-a10.c                  |    1 +
 drivers/clk/socfpga/clk-pll.c                      |    3 +-
 drivers/clk/socfpga/clk.h                          |    3 +-
 drivers/clk/spear/clk-vco-pll.c                    |    2 +-
 drivers/clk/spear/spear1310_clock.c                |    1 -
 drivers/clk/spear/spear1340_clock.c                |    1 -
 drivers/clk/spear/spear6xx_clock.c                 |    1 -
 drivers/clk/st/clk-flexgen.c                       |   17 +-
 drivers/clk/st/clkgen-fsyn.c                       |   31 +-
 drivers/clk/st/clkgen-mux.c                        |  103 +-
 drivers/clk/st/clkgen-pll.c                        |   11 +-
 drivers/clk/sunxi/Makefile                         |    1 +
 drivers/clk/sunxi/clk-a20-gmac.c                   |    4 +-
 drivers/clk/sunxi/clk-factors.c                    |   39 +-
 drivers/clk/sunxi/clk-mod0.c                       |    3 +-
 drivers/clk/sunxi/clk-simple-gates.c               |  158 ++
 drivers/clk/sunxi/clk-sun6i-ar100.c                |   36 +-
 drivers/clk/sunxi/clk-sun8i-mbus.c                 |    2 +-
 drivers/clk/sunxi/clk-sun9i-core.c                 |    2 +-
 drivers/clk/sunxi/clk-sun9i-mmc.c                  |    3 +-
 drivers/clk/sunxi/clk-sunxi.c                      |  227 +--
 drivers/clk/sunxi/clk-usb.c                        |    3 +-
 drivers/clk/tegra/Makefile                         |    3 +
 drivers/clk/tegra/clk-dfll.c                       | 1757 ++++++++++++++++=
++++
 drivers/clk/tegra/clk-dfll.h                       |   54 +
 drivers/clk/tegra/clk-divider.c                    |    1 -
 drivers/clk/tegra/clk-emc.c                        |   36 +-
 drivers/clk/tegra/clk-periph-gate.c                |    1 -
 drivers/clk/tegra/clk-periph.c                     |    1 -
 drivers/clk/tegra/clk-pll-out.c                    |    1 -
 drivers/clk/tegra/clk-pll.c                        |   20 +-
 drivers/clk/tegra/clk-super.c                      |    1 -
 drivers/clk/tegra/clk-tegra-audio.c                |    1 -
 drivers/clk/tegra/clk-tegra-fixed.c                |    1 -
 drivers/clk/tegra/clk-tegra-periph.c               |    1 -
 drivers/clk/tegra/clk-tegra-pmc.c                  |    1 -
 drivers/clk/tegra/clk-tegra-super-gen4.c           |    5 +-
 drivers/clk/tegra/clk-tegra114.c                   |    2 -
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c         |  166 ++
 drivers/clk/tegra/clk-tegra124.c                   |   83 +-
 drivers/clk/tegra/clk-tegra20.c                    |    1 -
 drivers/clk/tegra/clk-tegra30.c                    |    1 -
 drivers/clk/tegra/clk.c                            |   40 +-
 drivers/clk/tegra/clk.h                            |    3 +
 drivers/clk/tegra/cvb.c                            |  140 ++
 drivers/clk/tegra/cvb.h                            |   67 +
 drivers/clk/ti/Makefile                            |   17 +-
 drivers/clk/ti/apll.c                              |   11 +-
 drivers/clk/ti/autoidle.c                          |  115 +-
 drivers/clk/ti/clk-2xxx.c                          |    4 +-
 drivers/clk/ti/clk-33xx.c                          |    3 +
 drivers/clk/ti/clk-3xxx-legacy.c                   |    1 +
 drivers/clk/ti/clk-3xxx.c                          |  235 +++
 drivers/clk/ti/clk-43xx.c                          |    3 +
 drivers/clk/ti/clk-44xx.c                          |    2 +
 drivers/clk/ti/clk-54xx.c                          |    2 +
 drivers/clk/ti/clk-7xx.c                           |    3 +-
 drivers/clk/ti/clk-816x.c                          |    2 +
 drivers/clk/ti/clk-dra7-atl.c                      |    1 +
 drivers/clk/ti/clk.c                               |  154 +-
 drivers/clk/ti/clkt_dflt.c                         |  316 ++++
 .../arm/mach-omap2 =3D> drivers/clk/ti}/clkt_dpll.c  |   36 +-
 drivers/clk/ti/clkt_iclk.c                         |  101 ++
 drivers/clk/ti/clock.h                             |  105 ++
 drivers/clk/ti/clockdomain.c                       |   83 +-
 drivers/clk/ti/composite.c                         |    4 +-
 drivers/clk/ti/divider.c                           |    8 +-
 drivers/clk/ti/dpll.c                              |    9 +-
 {arch/arm/mach-omap2 =3D> drivers/clk/ti}/dpll3xxx.c |  217 ++-
 {arch/arm/mach-omap2 =3D> drivers/clk/ti}/dpll44xx.c |   55 +-
 drivers/clk/ti/fapll.c                             |    4 +-
 drivers/clk/ti/fixed-factor.c                      |    2 +
 drivers/clk/ti/gate.c                              |    6 +-
 drivers/clk/ti/interface.c                         |    2 +-
 drivers/clk/ti/mux.c                               |    6 +-
 drivers/clk/ux500/Makefile                         |    1 -
 drivers/clk/ux500/abx500-clk.c                     |    1 -
 drivers/clk/ux500/clk-prcmu.c                      |   16 +-
 drivers/clk/ux500/clk-sysctrl.c                    |    2 +-
 drivers/clk/ux500/clk.h                            |    3 +-
 drivers/clk/ux500/u8500_clk.c                      |  526 ------
 drivers/clk/ux500/u8500_of_clk.c                   |  165 +-
 drivers/clk/ux500/u8540_clk.c                      |  198 ++-
 drivers/clk/ux500/u9540_clk.c                      |    5 +-
 drivers/clk/versatile/clk-icst.c                   |    5 +-
 drivers/clk/versatile/clk-impd1.c                  |    1 -
 drivers/clk/versatile/clk-realview.c               |    5 +-
 drivers/clk/versatile/clk-sp810.c                  |   83 +-
 drivers/clk/versatile/clk-versatile.c              |    4 +-
 drivers/clk/zte/Makefile                           |    2 +-
 drivers/clk/zte/clk-zx296702.c                     |  126 +-
 drivers/clk/zte/{clk-pll.c =3D> clk.c}               |  141 +-
 drivers/clk/zte/clk.h                              |    9 +
 drivers/clk/zynq/clkc.c                            |    1 +
 drivers/clocksource/cadence_ttc_timer.c            |    1 -
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c         |    4 +-
 drivers/spi/spi-pxa2xx-pci.c                       |    1 -
 .../clocking-wizard/clk-xlnx-clock-wizard.c        |    1 +
 drivers/video/fbdev/simplefb.c                     |    1 +
 include/dt-bindings/clock/exynos3250.h             |    1 +
 include/dt-bindings/clock/exynos5250.h             |    1 +
 include/dt-bindings/clock/imx6ul-clock.h           |  240 +++
 include/dt-bindings/clock/rk3066a-cru.h            |    5 +
 include/dt-bindings/clock/rk3188-cru-common.h      |    5 +
 include/dt-bindings/clock/rk3188-cru.h             |    5 +
 include/dt-bindings/clock/rk3288-cru.h             |    5 +
 include/dt-bindings/clock/rk3368-cru.h             |  384 +++++
 include/dt-bindings/clock/zx296702-clock.h         |   17 +-
 include/dt-bindings/reset/tegra124-car.h           |   12 +
 include/linux/clk-provider.h                       |   89 +-
 include/linux/clk/clk-conf.h                       |    2 +
 include/linux/clk/tegra.h                          |    3 +-
 include/linux/clk/ti.h                             |  157 +-
 include/linux/platform_data/clk-ux500.h            |   12 +-
 lib/vsprintf.c                                     |    1 +
 327 files changed, 9170 insertions(+), 4991 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/sp810.txt
 create mode 100644 Documentation/devicetree/bindings/clock/gpio-mux-clock.=
txt
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124=
-dfll.txt
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3368=
-cru.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ux500.txt
 delete mode 100644 arch/arm/mach-omap2/clkt_clksel.c
 delete mode 100644 arch/arm/mach-omap2/clkt_iclk.c
 delete mode 100644 arch/arm/mach-omap2/clock2430.c
 delete mode 100644 arch/arm/mach-omap2/clock2xxx.c
 delete mode 100644 arch/arm/mach-omap2/clock34xx.c
 delete mode 100644 arch/arm/mach-omap2/clock34xx.h
 delete mode 100644 arch/arm/mach-omap2/clock3517.c
 delete mode 100644 arch/arm/mach-omap2/clock3517.h
 delete mode 100644 arch/arm/mach-omap2/clock36xx.c
 delete mode 100644 arch/arm/mach-omap2/clock36xx.h
 delete mode 100644 arch/arm/mach-omap2/clock3xxx.c
 delete mode 100644 arch/arm/mach-omap2/clock44xx.h
 delete mode 100644 arch/arm/mach-omap2/clock_common_data.c
 delete mode 100644 drivers/clk/clk-gpio-gate.c
 create mode 100644 drivers/clk/clk-gpio.c
 create mode 100644 drivers/clk/hisilicon/clk-hi6220-stub.c
 create mode 100644 drivers/clk/imx/clk-imx6ul.c
 create mode 100644 drivers/clk/rockchip/clk-inverter.c
 create mode 100644 drivers/clk/rockchip/clk-rk3368.c
 create mode 100644 drivers/clk/sunxi/clk-simple-gates.c
 create mode 100644 drivers/clk/tegra/clk-dfll.c
 create mode 100644 drivers/clk/tegra/clk-dfll.h
 create mode 100644 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c
 create mode 100644 drivers/clk/tegra/cvb.c
 create mode 100644 drivers/clk/tegra/cvb.h
 create mode 100644 drivers/clk/ti/clkt_dflt.c
 rename {arch/arm/mach-omap2 =3D> drivers/clk/ti}/clkt_dpll.c (92%)
 create mode 100644 drivers/clk/ti/clkt_iclk.c
 rename {arch/arm/mach-omap2 =3D> drivers/clk/ti}/dpll3xxx.c (79%)
 rename {arch/arm/mach-omap2 =3D> drivers/clk/ti}/dpll44xx.c (79%)
 delete mode 100644 drivers/clk/ux500/u8500_clk.c
 rename drivers/clk/zte/{clk-pll.c =3D> clk.c} (55%)
 create mode 100644 include/dt-bindings/clock/imx6ul-clock.h
 create mode 100644 include/dt-bindings/clock/rk3368-cru.h
 create mode 100644 include/dt-bindings/reset/tegra124-car.h

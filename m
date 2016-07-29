Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
From: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <146983006055.47257.1929784699094903416@resonance>
Subject: [GIT PULL] clk: changes for v4.8
Date: Fri, 29 Jul 2016 15:07:41 -0700
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-=
linus-4.8

for you to fetch changes up to d22527fed2f094c2e4f9a66f35b68a090c3d906a:

  Merge branch 'clk-fixes' into clk-next (2016-07-21 17:30:54 -0700)

----------------------------------------------------------------
The bulk of the changes are updates and fixes to existing clk provider
drivers, along with a pretty standard number of new drivers. The core
recieved a small number of updates as well.

Core changes of note:
* Removed CLK_IS_ROOT flag

New clk provider drivers:
* Renesas r8a7796 Clock Pulse Generator / Module Standby and Software
  Reset
* Allwinner sun8i H3 Clock Controller Unit
* AmLogic meson8b clock controller (rewritten)
* AmLogic gxbb clock controller
* Support for some new ICs was added by simple changes to static data
  tables for chips sharing the same family

Driver updates of note:
* the Allwinner sunxi clock driver infrastucture was rewritten to
  comform to the state of the art at drivers/clk/sunxi-ng. The old
  implementation is still supported for backwards compatibility with the
  DT ABI

----------------------------------------------------------------
Alim Akhtar (1):
      clk: samsung: exynos7: Don't gate CMU_{CCORE, FSYS0} blocks clock

Andi Shyti (1):
      clk: exynos5433: remove CLK_IGNORE_UNUSED flag from SPI clocks

Andrew Bresticker (1):
      clk: tegra: Initialize UTMI PLL when enabling PLLU

Anson Huang (3):
      clk: imx: correct AV PLL rate formula
      clk: imx7d: correct dram root clk parent select
      clk: imx7d: correct dram pll type

Arnd Bergmann (2):
      clk: sunxi: remove unused variable
      clk: vt8500: fix gcc-4.9 warnings

Bartlomiej Zolnierkiewicz (3):
      clk: samsung: exynos5433: prepare for adding CPU clocks
      clk: samsung: cpu: prepare for adding Exynos5433 CPU clocks
      clk: samsung: exynos5433: add CPU clocks configuration data and insta=
ntiate CPU clocks

Ben Dooks (3):
      clk: at91: make of_sama5d2_clk_generated_setup() static
      clk: iproc: fix missing include of clk-iproc.h
      clk: hi6220: fix missing clk.h include

Beomho Seo (1):
      clk: samsung: exynos5433: Add CLK_IGNORE_UNUSED flag for AUD UART

Boris Brezillon (1):
      clk: at91: fix clk_programmable_set_parent()

Brian Norris (1):
      clk: rockchip: mark rk3399 GIC clocks as critical

Christophe JAILLET (1):
      clk: stm32f4: fix error handling

Dong Aisheng (12):
      clk: imx: fix pll clock parents
      clk: imx: clk-pllv3: fix incorrect handle of enet powerdown bit
      clk: imx: refine the powerdown bit of clk-pllv3
      clk: imx6ul: fix gpt2 clock names
      clk: introduce clk_core_enable_lock and clk_core_disable_lock functio=
ns
      clk: move clk_disable_unused after clk_core_disable_unprepare function
      clk: core: support clocks which requires parents enable (part 1)
      clk: core: support clocks which requires parents enable (part 2)
      clk: imx: re-order and concentrate the same type of clk api
      clk: imx: add clk api for supporting CLK_OPS_PARENT_ENABLE clocks
      clk: imx7d: using api with flag CLK_OPS_PARENT_ENABLE
      clk: imx7d: only enable minimum required clocks

Douglas Anderson (1):
      clk: rockchip: Revert "clk: rockchip: reset init state before mmc car=
d initialization"

Ezequiel Garcia (1):
      clk: nxp: Select MFD_SYSCON for creg driver

Geert Uytterhoeven (6):
      MAINTAINERS: Add file patterns for clock device tree bindings
      clk: renesas: cpg-mssr: Document r8a7796 support
      clk: renesas: Add r8a7796 CPG Core Clock Definitions
      clk: renesas: cpg-mssr: Extract common R-Car Gen3 support code
      clk: renesas: cpg-mssr: Add support for R-Car M3-W
      clk: renesas: r8a7795: Correct lvds clock parent

Heiko Stuebner (2):
      clk: rockchip: initialize flags of clk_init_data in mmc-phase clock
      Merge branch 'v4.8-shared/clkids' into v4.8-clk/next

Jaehoon Chung (1):
      clk: samsung: exynos5433: Add CLK_IGNORE_UNUSED flag to PCIE device

Javier Martinez Canillas (1):
      clk: samsung: exynos5420: Set ID for aclk333 gate clock

Jean Delvare (1):
      clk: oxnas: Add hardware dependencies

Jiancheng Xue (5):
      reset: hisilicon: change the definition of hisi_reset_init
      clk: hisilicon: add hisi_clk_alloc function.
      clk: hisilicon: add error processing for hisi_clk_register_* functions
      clk: hisilicon: add hisi_clk_unregister_* functions
      clk: hisilicon: hi3519: add driver remove path and fix some issues

Jonghwa Lee (1):
      clk: samsung: exynos5433: Add CLK_IGNORE_UNUSED flags to avoid hang d=
uring S2R

Kevin Hilman (1):
      clk: gxbb: expose CLKID_MMC_PCLK

Khiem Nguyen (1):
      clk: renesas: r8a7795: Add THS/TSC clock

Kieran Bingham (1):
      clk: renesas: r8a7795: Provide FDP1 clocks

Krzysztof Kozlowski (32):
      dt-bindings: clock: Add license and reformat Exynos5410 clock IDs
      dt-bindings: clock: Add PWM and USB clock IDs to Exynos5410
      dt-bindings: clock: Add I2C, HSI2C and RTC clock IDs to Exynos5410
      dt-bindings: clock: Add TMU clock ID to Exynos5410
      dt-bindings: clock: Add watchdog and SSS clock IDs to Exynos5410
      clk: samsung: Remove useless check for return value of samsung_clk_in=
it
      clk: samsung: clkout: Add support for Exynos5410
      clk: samsung: Constify clock init data with clock arrays
      clk: samsung: exynos3250: Move platform driver and of_device_id to in=
it section
      clk: samsung: exynos3250: Constify all clock initializers
      clk: samsung: exynos4: Move local function to init section
      clk: samsung: exynos4: Constify all clock initializers
      clk: samsung: exynos4415: Constify all clock initializers
      clk: samsung: exynos4415: Move PLL rates data to init section
      clk: samsung: exynos5250: Constify all clock initializers
      clk: samsung: exynos5260: Constify all clock initializers
      clk: samsung: exynos5410: Constify all clock initializers
      clk: samsung: exynos5420: Constify all clock initializers
      clk: samsung: exynos5440: Constify all clock initializers
      clk: samsung: exynos7: Constify all clock initializers
      clk: samsung: exynos5433: Constify all clock initializers
      clk: samsung: exynos5433: Move PLL rates data to init section
      clk: samsung: exynos5420: Move sleep init function and PLL data to in=
it section
      clk: samsung: exynos5250: Move sleep init function to init section
      clk: samsung: Fully constify mux parent names
      clk: samsung: exynos3250: Move PLL rates data to init section
      clk: samsung: exynos5410: Add serial3, USB and PWM clocks
      clk: samsung: exynos5410: Add I2C, HSI2C and RTC clocks
      clk: samsung: exynos5410: Add TMU clock
      clk: samsung: Suppress unbinding to prevent theoretical attacks
      clk: samsung: exynos5410: Add WDT, ACLK266 and SSS clocks
      clk: Provide notifier stubs when !COMMON_CLK

Lee Jones (4):
      clk: Remove unused variable
      clk: st: clk-flexgen: Detect critical clocks
      clk: st: clkgen-fsyn: Detect critical clocks
      clk: st: clkgen-pll: Detect critical clocks

Linus Walleij (1):
      clk: qcom: add EBI2 clocks to the MSM8660 GCC

Masahiro Yamada (1):
      clk: fixed-rate: add clk_hw_unregister_fixed_rate()

Matthew Leach (2):
      clk: samsung: fixup endian in pll clk
      clk: samsung: exynos4: fixup reg access on be

Maxime Ripard (20):
      clk: sunxi: tcon-ch1: Do not return a negative error in get_parent
      clk: sunxi: display: Add per-clock flags
      clk: multiplier: Prevent the multiplier from under / over flowing
      clk: fixed-factor: Allow for a few clocks to change the parent rate
      dt-bindings: sunxi: Add CCU binding documentation
      clk: sunxi-ng: Add common infrastructure
      clk: sunxi-ng: Add fractional lib
      clk: sunxi-ng: Add gate clock support
      clk: sunxi-ng: Add mux clock support
      clk: sunxi-ng: Add phase clock support
      clk: sunxi-ng: Add divider
      clk: sunxi-ng: Add M-P factor clock support
      clk: sunxi-ng: Add N-K-factor clock support
      clk: sunxi-ng: Add N-M-factor clock support
      clk: sunxi-ng: Add N-K-M Factor clock
      clk: sunxi-ng: Add N-K-M-P factor clock
      clk: sunxi-ng: Add H3 clocks
      clk: sunxi-ng: h3: Fix audio clock divider offset
      clk: sunxi-ng: h3: Fix Kconfig symbol typo
      ARM: dt: sun8i: switch the H3 to the new CCU driver

Michael Turquette (25):
      Merge commit 'f17a0dd1c2e0' into clk-next
      clk: meson8b: rectify reg offsets with datasheet
      clk: meson8b: clean up fixed rate clocks
      clk: meson8b: clean up pll clocks
      clk: meson8b: clean up fixed factor clocks
      clk: meson8b: clean up cpu clocks
      clk: meson8b: remove mali clk
      clk: meson8b: clean up composite clocks
      clk: meson8b: convert to platform_driver
      clk: meson: only build selected platforms
      clk: meson: add peripheral gate macro
      clk: meson: add mpll support
      clk: meson: fractional pll support
      clk: gxbb: Document bindings for the GXBB clock controller
      clk: gxbb: add AmLogic GXBB clk controller driver
      Merge remote-tracking branch 'clk/clk-s905' into clk-next
      Merge tag 'sunxi-clk-fixes-for-4.7' of https://git.kernel.org/.../mri=
pard/linux into clk-fixes
      Merge branch 'clk-lpc32xx' into clk-next
      Merge branch 'clk-s905' into clk-next
      Merge branch 'clk-sunxi-ng' into clk-next
      Merge branch 'clk-sunxi-ng' into clk-next
      Revert "clk: gxbb: expose CLKID_MMC_PCLK"
      Merge branch 'clk-s905' into clk-next
      clk: Makefile: re-sort and clean up
      Merge branch 'clk-fixes' into clk-next

Paul E. McKenney (2):
      clk: Add _rcuidle tracepoints to allow clk_core_disable() use from id=
le
      clk: Use _rcuidle suffix to allow clk_core_enable() to used from idle

Paul Gortmaker (5):
      clk: meson8b: make it explicitly non-modular
      clk: meson: make gxbb explicitly non-modular
      clk: oxnas: make it explicitly non-modular
      clk: sunxi: make clk-* explicitly non-modular
      clk: samsung: make clk-s5pv210-audss explicitly non-modular

Peng Fan (1):
      clk: correct comments for __clk_determine_rate

Ramesh Shanmugasundaram (1):
      clk: renesas: r8a7795: Add DRIF clock

Roman Volkov (1):
      clk: vt8500: rework wm8650_find_pll_bits()

Sergei Shtylyov (3):
      clk: renesas: rcar-gen2: Document R8A7792 support
      clk: renesas: mstp: Document R8A7792 support
      clk: renesas: Add R8A7792 support

Shawn Lin (1):
      clk: rockchip: release io resource when failing to init clk on rk3399

Stefan Agner (2):
      clk: imx: vf610: Disable automatic clock gating for lpuart in LPSTOP =
mode
      clk: imx7d: do not set parent of ethernet time/ref clocks

Stephen Boyd (23):
      vexpress/spc: Remove CLK_IS_ROOT
      powerpc/512x: clk: Remove CLK_IS_ROOT
      clk: microchip: Remove CLK_IS_ROOT
      clk: Remove CLK_IS_ROOT flag
      Merge tag 'v4.7-rockchip-clk-fixes1' of git://git.kernel.org/.../mmin=
d/linux-rockchip into clk-fixes
      Merge branch 'clk-fixes' into clk-next
      Merge tag 'clk-samsung-4.8' of git://linuxtv.org/snawrocki/samsung in=
to clk-next
      clk: qcom: Remove gcc_aggre1_pnoc_ahb_clk from msm8996
      Merge tag 'clk-renesas-for-v4.8-tag1' of git://git.kernel.org/.../gee=
rt/renesas-drivers into clk-next
      Merge tag 'clk-renesas-for-v4.8-tag2' of git://git.kernel.org/.../gee=
rt/renesas-drivers into clk-next
      Merge 'clk-notify' into clk-next
      Merge branch 'clk-hi6220-rtc' into clk-next
      Merge branch 'clk-st-critical' into clk-next
      clk: highbank: Migrate to clk_hw based registration and OF APIs
      clk: nomadik: Migrate to clk_hw based OF and registration APIs
      clk: u300: Migrate to clk_hw based registration APIs
      clk: bcm: iproc: Migrate to clk_hw based registration and OF APIs
      clk: stm32f4: Migrate to clk_hw based OF and registration APIs
      clk: s2mps11: Migrate to clk_hw based OF and registration APIs
      Merge branch 'clk-hw-unregister-fixed-rate' into clk-next
      Merge tag 'imx-clk-4.8' of git://git.kernel.org/.../shawnguo/linux in=
to clk-next
      Merge tag 'tegra-for-4.8-clk' of git://git.kernel.org/.../tegra/linux=
 into clk-next
      Merge tag 'v4.8-rockchip-clk1' of git://git.kernel.org/.../mmind/linu=
x-rockchip into clk-next

Sylvain Lemieux (1):
      clk: lpc32xx: allow peripheral clock selection in device tree

Sylwester Nawrocki (1):
      clk: samsung: Allow modular build of the Audio Subsystem CLKCON driver

Thierry Reding (7):
      clk: tegra: Fixup post dividers on Tegra210
      clk: tegra: Disable spread spectrum on pll_d2
      clk: tegra: Squash sor1 safe/brick/src into a single mux
      clk: tegra: Enable sor1 and sor1_src on Tegra210
      clk: tegra: Mark timer clock as critical
      clk: tegra: Make sor_safe the parent of dpaux and dpaux1
      clk: tegra: Micro-optimize Tegra210 clock setup

Tomeu Vizoso (1):
      clk: clk-conf: Fix error message when clock isn't found

Wadim Egorov (1):
      clk: Kconfig: Name RK818 in Kconfig for COMMON_CLK_RK808

Wei Yongjun (1):
      clk: Fix return value check in oxnas_stdclk_probe()

Xing Zheng (11):
      clk: rockchip: fix incorrect parent for rk3399's {c,g}pll_aclk_perihp=
_src
      clk: rockchip: fix cpuclk registration error handling
      clk: rockchip: add a dummy clock for the watchdog pclk on rk3399
      clk: rockchip: add clock-ids for rk3228 audio clocks
      clk: rockchip: add clock-ids for rk3228 MAC clocks
      clk: rockchip: fix incorrect rk3228 clock registers
      clk: rockchip: include rk3228 downstream muxes into fractional divide=
rs
      clk: rockchip: export rk3228 audio clocks
      clk: rockchip: rename rk3228 sclk_macphy_50m to sclk_mac_extclk
      clk: rockchip: export rk3228 MAC clocks
      clk: rockchip: fix incorrect rk3399 spdif-DPTX divider bits

Xinliang Liu (1):
      clk: hi6220: Change syspll and media_syspll clk to 1.19GHz

Zhangfei Gao (1):
      clk: hi6220: Add RTC clock for pl031

 .../bindings/clock/amlogic,gxbb-clkc.txt           |  36 +
 .../bindings/clock/fixed-factor-clock.txt          |   4 +
 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   7 +-
 .../bindings/clock/renesas,cpg-mstp-clocks.txt     |   1 +
 .../clock/renesas,rcar-gen2-cpg-clocks.txt         |   1 +
 .../devicetree/bindings/clock/sunxi-ccu.txt        |  24 +
 MAINTAINERS                                        |   1 +
 arch/arm/boot/dts/sun8i-h3.dtsi                    | 312 ++-----
 arch/arm/mach-vexpress/spc.c                       |   2 +-
 arch/powerpc/platforms/512x/clock-commonclk.c      |   2 +-
 drivers/clk/Kconfig                                |   8 +-
 drivers/clk/Makefile                               |  21 +-
 drivers/clk/at91/clk-generated.c                   |   2 +-
 drivers/clk/at91/clk-programmable.c                |   2 +-
 drivers/clk/bcm/clk-iproc-armpll.c                 |  11 +-
 drivers/clk/bcm/clk-iproc-asiu.c                   |  27 +-
 drivers/clk/bcm/clk-iproc-pll.c                    |  32 +-
 drivers/clk/clk-conf.c                             |   2 +-
 drivers/clk/clk-fixed-factor.c                     |  11 +-
 drivers/clk/clk-fixed-rate.c                       |  11 +
 drivers/clk/clk-highbank.c                         |   9 +-
 drivers/clk/clk-multiplier.c                       |  20 +-
 drivers/clk/clk-nomadik.c                          |  48 +-
 drivers/clk/clk-oxnas.c                            |  19 +-
 drivers/clk/clk-s2mps11.c                          |  21 +-
 drivers/clk/clk-stm32f4.c                          |  14 +-
 drivers/clk/clk-u300.c                             |  59 +-
 drivers/clk/clk-vt8500.c                           |  99 +--
 drivers/clk/clk.c                                  | 347 ++++----
 drivers/clk/hisilicon/clk-hi3519.c                 | 116 ++-
 drivers/clk/hisilicon/clk-hi6220.c                 |   6 +-
 drivers/clk/hisilicon/clk.c                        |  89 +-
 drivers/clk/hisilicon/clk.h                        |  34 +-
 drivers/clk/hisilicon/clkdivider-hi6220.c          |   2 +
 drivers/clk/hisilicon/reset.c                      |  19 +-
 drivers/clk/hisilicon/reset.h                      |   5 +-
 drivers/clk/imx/clk-imx6q.c                        |  14 +-
 drivers/clk/imx/clk-imx6sl.c                       |  14 +-
 drivers/clk/imx/clk-imx6sx.c                       |  14 +-
 drivers/clk/imx/clk-imx6ul.c                       |  18 +-
 drivers/clk/imx/clk-imx7d.c                        | 755 ++++++++--------
 drivers/clk/imx/clk-pllv3.c                        |  28 +-
 drivers/clk/imx/clk-vf610.c                        |  12 +-
 drivers/clk/imx/clk.h                              |  90 +-
 drivers/clk/meson/Kconfig                          |  19 +
 drivers/clk/meson/Makefile                         |   5 +-
 drivers/clk/meson/clk-cpu.c                        |  73 +-
 drivers/clk/meson/clk-mpll.c                       |  94 ++
 drivers/clk/meson/clk-pll.c                        | 104 +--
 drivers/clk/meson/clkc.c                           | 249 ------
 drivers/clk/meson/clkc.h                           | 179 ++--
 drivers/clk/meson/gxbb.c                           | 944 +++++++++++++++++=
++++
 drivers/clk/meson/gxbb.h                           | 271 ++++++
 drivers/clk/meson/meson8b-clkc.c                   | 425 ++++++++--
 drivers/clk/microchip/clk-pic32mzda.c              |  10 +-
 drivers/clk/nxp/clk-lpc32xx.c                      |   3 +-
 drivers/clk/qcom/gcc-msm8660.c                     |  28 +
 drivers/clk/qcom/gcc-msm8996.c                     |  16 -
 drivers/clk/renesas/Kconfig                        |   2 +
 drivers/clk/renesas/Makefile                       |   4 +-
 drivers/clk/renesas/r8a7795-cpg-mssr.c             | 374 +-------
 drivers/clk/renesas/r8a7796-cpg-mssr.c             | 192 +++++
 drivers/clk/renesas/rcar-gen3-cpg.c                | 359 ++++++++
 drivers/clk/renesas/rcar-gen3-cpg.h                |  43 +
 drivers/clk/renesas/renesas-cpg-mssr.c             |   6 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |   1 +
 drivers/clk/rockchip/clk-cpu.c                     |   4 +-
 drivers/clk/rockchip/clk-mmc-phase.c               |  12 +-
 drivers/clk/rockchip/clk-rk3228.c                  | 125 +--
 drivers/clk/rockchip/clk-rk3399.c                  |  19 +-
 drivers/clk/samsung/Kconfig                        |   9 +
 drivers/clk/samsung/Makefile                       |   2 +-
 drivers/clk/samsung/clk-cpu.c                      | 131 ++-
 drivers/clk/samsung/clk-cpu.h                      |   4 +-
 drivers/clk/samsung/clk-exynos-audss.c             |  12 +-
 drivers/clk/samsung/clk-exynos-clkout.c            |   2 +
 drivers/clk/samsung/clk-exynos3250.c               |  41 +-
 drivers/clk/samsung/clk-exynos4.c                  |  64 +-
 drivers/clk/samsung/clk-exynos4415.c               |  30 +-
 drivers/clk/samsung/clk-exynos5250.c               |  27 +-
 drivers/clk/samsung/clk-exynos5260.c               | 114 +--
 drivers/clk/samsung/clk-exynos5410.c               |  58 +-
 drivers/clk/samsung/clk-exynos5420.c               |  40 +-
 drivers/clk/samsung/clk-exynos5433.c               | 437 ++++++----
 drivers/clk/samsung/clk-exynos5440.c               |  12 +-
 drivers/clk/samsung/clk-exynos7.c                  | 119 +--
 drivers/clk/samsung/clk-pll.c                      | 122 +--
 drivers/clk/samsung/clk-s3c2410-dclk.c             |   5 +-
 drivers/clk/samsung/clk-s3c2410.c                  |   2 -
 drivers/clk/samsung/clk-s3c2412.c                  |   2 -
 drivers/clk/samsung/clk-s3c2443.c                  |   2 -
 drivers/clk/samsung/clk-s3c64xx.c                  |   2 -
 drivers/clk/samsung/clk-s5pv210-audss.c            |  29 +-
 drivers/clk/samsung/clk-s5pv210.c                  |   2 -
 drivers/clk/samsung/clk.c                          |  14 +-
 drivers/clk/samsung/clk.h                          |  22 +-
 drivers/clk/st/clk-flexgen.c                       |   4 +-
 drivers/clk/st/clkgen-fsyn.c                       |  10 +-
 drivers/clk/st/clkgen-pll.c                        |  27 +-
 drivers/clk/sunxi-ng/Kconfig                       |  65 ++
 drivers/clk/sunxi-ng/Makefile                      |  20 +
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c                | 826 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-h3.h                |  62 ++
 drivers/clk/sunxi-ng/ccu_common.c                  |  90 ++
 drivers/clk/sunxi-ng/ccu_common.h                  |  85 ++
 drivers/clk/sunxi-ng/ccu_div.c                     | 136 +++
 drivers/clk/sunxi-ng/ccu_div.h                     | 133 +++
 drivers/clk/sunxi-ng/ccu_frac.c                    | 110 +++
 drivers/clk/sunxi-ng/ccu_frac.h                    |  53 ++
 drivers/clk/sunxi-ng/ccu_gate.c                    |  82 ++
 drivers/clk/sunxi-ng/ccu_gate.h                    |  52 ++
 drivers/clk/sunxi-ng/ccu_mp.c                      | 158 ++++
 drivers/clk/sunxi-ng/ccu_mp.h                      |  77 ++
 drivers/clk/sunxi-ng/ccu_mult.h                    |  15 +
 drivers/clk/sunxi-ng/ccu_mux.c                     | 187 ++++
 drivers/clk/sunxi-ng/ccu_mux.h                     |  91 ++
 drivers/clk/sunxi-ng/ccu_nk.c                      | 147 ++++
 drivers/clk/sunxi-ng/ccu_nk.h                      |  71 ++
 drivers/clk/sunxi-ng/ccu_nkm.c                     | 153 ++++
 drivers/clk/sunxi-ng/ccu_nkm.h                     |  68 ++
 drivers/clk/sunxi-ng/ccu_nkmp.c                    | 167 ++++
 drivers/clk/sunxi-ng/ccu_nkmp.h                    |  71 ++
 drivers/clk/sunxi-ng/ccu_nm.c                      | 114 +++
 drivers/clk/sunxi-ng/ccu_nm.h                      |  91 ++
 drivers/clk/sunxi-ng/ccu_phase.c                   | 126 +++
 drivers/clk/sunxi-ng/ccu_phase.h                   |  50 ++
 drivers/clk/sunxi-ng/ccu_reset.c                   |  55 ++
 drivers/clk/sunxi-ng/ccu_reset.h                   |  40 +
 drivers/clk/sunxi/clk-factors.c                    |   1 -
 drivers/clk/sunxi/clk-sun4i-display.c              |   5 +-
 drivers/clk/sunxi/clk-sun4i-tcon-ch1.c             |   4 -
 drivers/clk/sunxi/clk-sun6i-apb0-gates.c           |   9 +-
 drivers/clk/sunxi/clk-sun6i-apb0.c                 |   9 +-
 drivers/clk/sunxi/clk-sun6i-ar100.c                |  21 +-
 drivers/clk/sunxi/clk-sun8i-apb0.c                 |   9 +-
 drivers/clk/sunxi/clk-sun9i-mmc.c                  |  28 +-
 drivers/clk/tegra/clk-id.h                         |   1 -
 drivers/clk/tegra/clk-pll.c                        | 505 +++++++++++
 drivers/clk/tegra/clk-tegra-periph.c               |  25 +-
 drivers/clk/tegra/clk-tegra114.c                   | 156 +---
 drivers/clk/tegra/clk-tegra124.c                   | 156 +---
 drivers/clk/tegra/clk-tegra210.c                   | 295 ++-----
 drivers/clk/tegra/clk-tegra30.c                    | 113 +--
 drivers/clk/tegra/clk.h                            |  17 +
 include/dt-bindings/clock/exynos5410.h             |  76 +-
 include/dt-bindings/clock/exynos5433.h             |   3 +-
 include/dt-bindings/clock/gxbb-clkc.h              |  12 +
 include/dt-bindings/clock/hi6220-clock.h           |   5 +-
 include/dt-bindings/clock/lpc32xx-clock.h          |   1 +
 include/dt-bindings/clock/meson8b-clkc.h           |   4 +-
 include/dt-bindings/clock/r8a7796-cpg-mssr.h       |  69 ++
 include/dt-bindings/clock/rk3228-cru.h             |  15 +
 include/dt-bindings/clock/sun8i-h3-ccu.h           | 145 ++++
 include/dt-bindings/clock/tegra210-car.h           |   2 +-
 include/dt-bindings/reset/sun8i-h3-ccu.h           | 103 +++
 include/linux/clk-provider.h                       |   5 +-
 include/linux/clk.h                                |  16 +-
 157 files changed, 9030 insertions(+), 3450 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,gxbb-cl=
kc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/sunxi-ccu.txt
 create mode 100644 drivers/clk/meson/Kconfig
 create mode 100644 drivers/clk/meson/clk-mpll.c
 delete mode 100644 drivers/clk/meson/clkc.c
 create mode 100644 drivers/clk/meson/gxbb.c
 create mode 100644 drivers/clk/meson/gxbb.h
 create mode 100644 drivers/clk/renesas/r8a7796-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/rcar-gen3-cpg.c
 create mode 100644 drivers/clk/renesas/rcar-gen3-cpg.h
 create mode 100644 drivers/clk/sunxi-ng/Kconfig
 create mode 100644 drivers/clk/sunxi-ng/Makefile
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-h3.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-h3.h
 create mode 100644 drivers/clk/sunxi-ng/ccu_common.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_common.h
 create mode 100644 drivers/clk/sunxi-ng/ccu_div.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_div.h
 create mode 100644 drivers/clk/sunxi-ng/ccu_frac.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_frac.h
 create mode 100644 drivers/clk/sunxi-ng/ccu_gate.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_gate.h
 create mode 100644 drivers/clk/sunxi-ng/ccu_mp.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_mp.h
 create mode 100644 drivers/clk/sunxi-ng/ccu_mult.h
 create mode 100644 drivers/clk/sunxi-ng/ccu_mux.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_mux.h
 create mode 100644 drivers/clk/sunxi-ng/ccu_nk.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_nk.h
 create mode 100644 drivers/clk/sunxi-ng/ccu_nkm.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_nkm.h
 create mode 100644 drivers/clk/sunxi-ng/ccu_nkmp.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_nkmp.h
 create mode 100644 drivers/clk/sunxi-ng/ccu_nm.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_nm.h
 create mode 100644 drivers/clk/sunxi-ng/ccu_phase.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_phase.h
 create mode 100644 drivers/clk/sunxi-ng/ccu_reset.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_reset.h
 create mode 100644 include/dt-bindings/clock/gxbb-clkc.h
 create mode 100644 include/dt-bindings/clock/r8a7796-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/sun8i-h3-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-h3-ccu.h

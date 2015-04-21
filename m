Return-Path: <mturquette@linaro.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
From: Michael Turquette <mturquette@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org
To: torvalds@linux-foundation.org
Message-ID: <20150421032413.19585.19126@quantum>
Subject: [GIT PULL] clk: changes for 4.1
Date: Mon, 20 Apr 2015 20:24:13 -0700
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit c517d838eb7d07bbe9507871fab3931deccff539:

  Linux 4.0-rc1 (2015-02-22 18:21:14 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-=
linus-4.1

for you to fetch changes up to 03bc10ab5b0f9b8f81bffbe6e40c944f9d3dbcc5:

  clk: check ->determine/round_rate() return value in clk_calc_new_rates (2=
015-04-12 21:09:49 -0700)

----------------------------------------------------------------
The changes to the common clock framework for 4.0 are mostly new clock
drivers and updates to existing ones for feature enhancements and bug
fixes. There is more churn than usual in the framework core due to the
change to introduce per-user unique struct clk pointers in 4.0. This
caused several regressions to surface, some of which were sent as fixes
to 4.0. New generic clock drivers were added for GPIO- and PWM-based
clock controllers. Additionally the common clk-divider code recieved
several fixes to the way it rounds rates.

----------------------------------------------------------------
Archit Taneja (2):
      clk: qcom: fix RCG M/N counter configuration
      clk: qcom: Add EBI2 clocks for IPQ806x

Bartlomiej Zolnierkiewicz (2):
      clk: qcom: fix driver dependencies
      clk: samsung: exynos4: Disable ARMCLK down feature on Exynos4210 SoC

Ben Dooks (1):
      clk: at91: change to using endian agnositc IO

Boris Brezillon (2):
      clk: at91: usb: propagate rate modification to the parent clk
      clk: check ->determine/round_rate() return value in clk_calc_new_rates

Chanwoo Choi (22):
      clk: samsung: exynos5433: Add binding document for Exynos5433 clock d=
omains
      clk: samsung: exynos5433: Add clocks using common clock framework
      clk: samsung: exynos5433: Add MUX clocks of CMU_TOP domain
      clk: samsung: exynos5433: Add clocks for CMU_PERIC domain
      clk: samsung: exynos5433: Add clocks for CMU_PERIS domain
      clk: samsung: exynos5433: Add clocks for CMU_G2D domain
      clk: samsung: exynos5433: Add clocks for CMU_MIF domain
      clk: samsung: exynos5433: Add clocks for CMU_DISP domain
      clk: samsung: exynos5433: Add clocks for CMU_AUD domain
      clk: samsung: exynos5433: Add clocks for CMU_BUS{0|1|2} domains
      clk: samsung: exynos5433: Add missing clocks for CMU_FSYS domain
      clk: samsung: exynos5433: Add clocks for CMU_G3D domain
      clk: samsung: exynos5433: Add clocks for CMU_GSCL domain
      clk: samsung: exynos5433: Add clocks for CMU_APOLLO domain
      clk: samsung: exynos5433: Add clocks for CMU_ATLAS domain
      clk: samsung: exynos5433: Add clocks for CMU_MSCL domain
      clk: samsung: exynos5433: Add clocks for CMU_MFC domain
      clk: samsung: exynos5433: Add clocks for CMU_HEVC domain
      clk: samsung: exynos5433: Add clocks for CMU_ISP domain
      clk: samsung: exynos5433: Add clocks for CMU_CAM0 domain
      clk: samsung: exynos5433: Add clocks for CMU_CAM1 domain
      clk: samsung: exynos5433: Move CLK_SCLK_HDMI_SPDIF_DISP clock to CMU_=
TOP domain

Chen-Yu Tsai (7):
      clk: sunxi: Move USB clocks to separate file
      clk: sunxi: Add support for sun9i A80 USB clocks and resets
      clk: sunxi: Add muxable ahb factors clock for sun5i and sun7i
      clk: sunxi: Add "cpu" to list of protected clocks for sun5i
      clk: sunxi: Register divs clocks before factor clocks
      clk: sunxi: Make divs clocks specify which output is the base factor =
clock
      clk: sunxi: Add pll6 / 4 clock output to sun4i-a10-pll6

Dylan Reid (1):
      clk: tegra: Enable HDA to HDMI clocks on Tegra124

Fabian Frederick (1):
      clk: constify of_device_id array

Fengguang Wu (1):
      clk: qcom: fix simple_return.cocci warnings

Georgi Djakov (6):
      clk: qcom: Fix clk_get_parent function return value
      clk: qcom: Do some error handling in configure_bank()
      clk: qcom: Introduce parent_map tables
      dt-bindings: Add #defines for MSM8916 clocks and resets
      clk: qcom: Add MSM8916 Global Clock Controller support
      clk: qcom: Fix parent_map translations

Heikki Krogerus (1):
      clk: fractional-divider: support for divider bypassing

Heiko St=C3=BCbner (1):
      clk: divider: return real rate instead of divider value

Inha Song (2):
      clk: samsung: Add CLKOUT driver support for Exynos5433 SoC
      clk: samsung: Add CLKOUT driver support for Exynos3250 SoC

Jassi Brar (1):
      clk: Add clock driver for mb86s7x

Julia Lawall (2):
      clk: don't export static symbol
      clk: versatile: test returned value

Krzysztof Kozlowski (4):
      clk: Use lockdep asserts to find missing hold of prepare_lock
      clk: si5351: Constify clock names and struct regmap_config
      clk: si570: Constify struct regmap_config
      clk: cdce706: Constify struct regmap_config

Martin Fuzzey (1):
      clk: clk-gpio-gate: Fix active low

Michael Turquette (6):
      clk: introduce clk_is_match
      Merge tag 'v3.20-exynos5433-clk' of git://linuxtv.org/snawrocki/samsu=
ng into clk-next
      Merge tag 'mvebu-clk-4.1' of git://git.infradead.org/linux-mvebu into=
 clk-next
      Merge branch 'for-4.1-clk-ti' of github.com:t-kristo/linux-pm into cl=
k-next
      Merge tag 'sunxi-clocks-for-4.1' of https://git.kernel.org/.../mripar=
d/linux into clk-next
      Merge tag 'clk/for-4.1' of git://git.kernel.org/.../tegra/linux into =
clk-next

Paul Walmsley (1):
      MAINTAINERS: clk: discuss on the linux-clk@vger.kernel.org list

Peter Ujfalusi (2):
      clk: ti: clk-3xxx: Correct McBSP related DT clock definitions
      clk: ti: clk-3xxx-legacy: Correct McBSP related clock aliases

Philipp Zabel (1):
      clk: Add PWM clock driver

Robert Jarzmik (1):
      clk: pxa: pxa3xx: add missing os timer clock

Shawn Guo (3):
      ARM: imx: fix struct clk pointer comparing
      ASoC: fsl_spdif: fix struct clk pointer comparing
      ASoC: kirkwood: fix struct clk pointer comparing

Stephen Boyd (12):
      clk: qcom: Fix slimbus n and m val offsets
      clk: qcom: lcc-msm8960: Fix PLL rate detection
      clk: qcom: Add PLL4 vote clock
      clk: Missing set_phase op is an error
      clk: Add tracepoints for hardware operations
      clk: clk_set_parent() with current parent shouldn't fail
      clk: qcom: Fix i2c frequency table
      clk: qcom: Properly change rates for ahbix clock
      clk: Rename child_node to clks_node to avoid confusion
      clk: Replace of_clk_get_by_clkspec() with of_clk_get_from_provider()
      Merge branch 'clk-fixes' into clk-next
      clk: qcom: Fix ipq806x LCC frequency tables

Suman Anna (4):
      clk: ti: OMAP4: Remove the legacy timer DT clock aliases
      clk: ti: OMAP5: Correct the DT clock aliases for timers
      clk: ti: DRA7: Correct timer_sys_ck clock aliases for Timers
      clk: ti: DRA7: Add timer_sys_ck aliases for Timers 13 through 16

Tero Kristo (1):
      clk: ti: fix ti_clk_get_reg_addr error handling

Thierry Reding (10):
      clk: tegra: Fix typo tabel -> table
      clk: tegra: Fix a bunch of sparse warnings
      clk: tegra: Various whitespace cleanups
      clk: tegra: Use consistent indentation
      clk: tegra: Remove needless initializations
      clk: tegra: Register the proper number of resets
      clk: tegra: Add peripheral registers for bank Y
      clk: tegra: Model oscillator as clock
      clk: tegra: Use generic tegra_osc_clk_init() on Tegra114
      clk: tegra: Use the proper parent for plld_dsi

Thomas Petazzoni (3):
      devicetree: bindings: update DT bindings for Marvell EBU clock support
      clk: mvebu: extend common code to allow an optional refclk
      clk: mvebu: add Marvell Armada 39x driver

Tomasz Figa (1):
      clk: samsung: exynos3250: Add driver for CMU_ISP clock domain

Tony Lindgren (4):
      clk: ti: Fix FAPLL parent enable bit handling
      clk: ti: Fix FAPLL recalc_rate for rounding errors
      clk: ti: Implement FAPLL set_rate for the synthesizer
      clk: ti: Implement FAPLL set_rate for the PLL

Uwe Kleine-K=C3=B6nig (4):
      clk: divider: fix calculation of maximal parent rate for a given divi=
der
      clk: divider: fix selection of divider when rounding to closest
      clk: divider: fix calculation of initial best divider when rounding t=
o closest
      clk: don't use __initconst for non-const arrays

kbuild test robot (2):
      clk: qcom: fix platform_no_drv_owner.cocci warnings
      clk: qcom: fix platform_no_drv_owner.cocci warnings

 .../devicetree/bindings/clock/exynos3250-clock.txt |    8 +
 .../devicetree/bindings/clock/exynos5433-clock.txt |  462 ++
 .../bindings/clock/fujitsu,mb86s70-crg11.txt       |   26 +
 .../devicetree/bindings/clock/mvebu-core-clock.txt |    9 +
 .../bindings/clock/mvebu-gated-clock.txt           |   15 +-
 .../devicetree/bindings/clock/pwm-clock.txt        |   26 +
 .../devicetree/bindings/clock/qcom,gcc.txt         |    1 +
 Documentation/devicetree/bindings/clock/sunxi.txt  |    3 +
 MAINTAINERS                                        |    3 +-
 arch/arm/mach-imx/mach-imx6q.c                     |    5 +-
 drivers/clk/Kconfig                                |    7 +
 drivers/clk/Makefile                               |    2 +
 drivers/clk/at91/clk-usb.c                         |   64 +-
 drivers/clk/clk-cdce706.c                          |    2 +-
 drivers/clk/clk-conf.c                             |    7 +-
 drivers/clk/clk-divider.c                          |   29 +-
 drivers/clk/clk-fractional-divider.c               |    3 +
 drivers/clk/clk-gpio-gate.c                        |   31 +-
 drivers/clk/clk-mb86s7x.c                          |  386 ++
 drivers/clk/clk-palmas.c                           |    2 +-
 drivers/clk/clk-pwm.c                              |  136 +
 drivers/clk/clk-si5351.c                           |   10 +-
 drivers/clk/clk-si570.c                            |    2 +-
 drivers/clk/clk.c                                  |  184 +-
 drivers/clk/clk.h                                  |    3 -
 drivers/clk/clkdev.c                               |   30 +-
 drivers/clk/hisilicon/clk-hi3620.c                 |   70 +-
 drivers/clk/hisilicon/clk-hix5hd2.c                |    6 +-
 drivers/clk/mvebu/Kconfig                          |    4 +
 drivers/clk/mvebu/Makefile                         |    1 +
 drivers/clk/mvebu/armada-39x.c                     |  156 +
 drivers/clk/mvebu/common.c                         |   17 +
 drivers/clk/mvebu/common.h                         |    1 +
 drivers/clk/mxs/clk-imx23.c                        |   12 +-
 drivers/clk/mxs/clk-imx28.c                        |   18 +-
 drivers/clk/pxa/clk-pxa.h                          |    2 +-
 drivers/clk/pxa/clk-pxa3xx.c                       |    3 +
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-pll.c                         |    6 +-
 drivers/clk/qcom/clk-rcg.c                         |  188 +-
 drivers/clk/qcom/clk-rcg.h                         |   15 +-
 drivers/clk/qcom/clk-rcg2.c                        |   43 +-
 drivers/clk/qcom/common.c                          |   12 +
 drivers/clk/qcom/common.h                          |    4 +
 drivers/clk/qcom/gcc-apq8084.c                     |   62 +-
 drivers/clk/qcom/gcc-ipq806x.c                     |   80 +-
 drivers/clk/qcom/gcc-msm8660.c                     |   22 +-
 drivers/clk/qcom/gcc-msm8916.c                     | 2868 +++++++++++
 drivers/clk/qcom/gcc-msm8960.c                     |   45 +-
 drivers/clk/qcom/gcc-msm8974.c                     |   30 +-
 drivers/clk/qcom/lcc-ipq806x.c                     |   36 +-
 drivers/clk/qcom/lcc-msm8960.c                     |   19 +-
 drivers/clk/qcom/mmcc-apq8084.c                    |  168 +-
 drivers/clk/qcom/mmcc-msm8960.c                    |   49 +-
 drivers/clk/qcom/mmcc-msm8974.c                    |  134 +-
 drivers/clk/rockchip/clk-rk3188.c                  |    2 +-
 drivers/clk/rockchip/clk-rk3288.c                  |    2 +-
 drivers/clk/rockchip/clk.c                         |    3 +-
 drivers/clk/rockchip/clk.h                         |    4 +-
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos-clkout.c            |    4 +
 drivers/clk/samsung/clk-exynos3250.c               |  163 +
 drivers/clk/samsung/clk-exynos4.c                  |   11 +-
 drivers/clk/samsung/clk-exynos5433.c               | 5423 ++++++++++++++++=
++++
 drivers/clk/samsung/clk-s5pv210.c                  |   56 +-
 drivers/clk/st/clkgen-fsyn.c                       |    2 +-
 drivers/clk/st/clkgen-mux.c                        |    8 +-
 drivers/clk/st/clkgen-pll.c                        |    4 +-
 drivers/clk/sunxi/Makefile                         |    1 +
 drivers/clk/sunxi/clk-sunxi.c                      |  185 +-
 drivers/clk/sunxi/clk-usb.c                        |  233 +
 drivers/clk/tegra/clk-pll.c                        |    7 +-
 drivers/clk/tegra/clk-tegra-fixed.c                |   24 +-
 drivers/clk/tegra/clk-tegra-periph.c               |    2 +-
 drivers/clk/tegra/clk-tegra114.c                   |   36 +-
 drivers/clk/tegra/clk-tegra124.c                   |   22 +-
 drivers/clk/tegra/clk-tegra30.c                    |   23 +-
 drivers/clk/tegra/clk.c                            |   16 +-
 drivers/clk/tegra/clk.h                            |   10 +-
 drivers/clk/ti/apll.c                              |    5 +-
 drivers/clk/ti/autoidle.c                          |    2 +-
 drivers/clk/ti/clk-3xxx-legacy.c                   |   16 +-
 drivers/clk/ti/clk-3xxx.c                          |   19 +-
 drivers/clk/ti/clk-44xx.c                          |   11 -
 drivers/clk/ti/clk-54xx.c                          |   22 +-
 drivers/clk/ti/clk-7xx.c                           |   18 +-
 drivers/clk/ti/clk-dra7-atl.c                      |    2 +-
 drivers/clk/ti/clk.c                               |    7 +-
 drivers/clk/ti/clockdomain.c                       |    2 +-
 drivers/clk/ti/composite.c                         |    2 +-
 drivers/clk/ti/divider.c                           |    4 +-
 drivers/clk/ti/dpll.c                              |    6 +-
 drivers/clk/ti/fapll.c                             |  276 +-
 drivers/clk/ti/gate.c                              |    4 +-
 drivers/clk/ti/interface.c                         |    2 +-
 drivers/clk/ti/mux.c                               |    4 +-
 drivers/clk/versatile/clk-versatile.c              |    2 +-
 drivers/clk/versatile/clk-vexpress-osc.c           |    2 +-
 drivers/clk/zynq/clkc.c                            |   24 +-
 include/dt-bindings/clock/exynos3250.h             |   61 +
 include/dt-bindings/clock/exynos5433.h             | 1403 +++++
 include/dt-bindings/clock/qcom,gcc-ipq806x.h       |    1 +
 include/dt-bindings/clock/qcom,gcc-msm8916.h       |  156 +
 include/dt-bindings/clock/tegra124-car-common.h    |    2 +-
 include/dt-bindings/reset/qcom,gcc-msm8916.h       |  108 +
 include/linux/clk-provider.h                       |    2 +-
 include/linux/clk.h                                |   18 +
 include/linux/clk/at91_pmc.h                       |    4 +-
 include/trace/events/clk.h                         |  198 +
 sound/soc/fsl/fsl_spdif.c                          |    4 +-
 sound/soc/kirkwood/kirkwood-i2s.c                  |    2 +-
 112 files changed, 13300 insertions(+), 868 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/exynos5433-cloc=
k.txt
 create mode 100644 Documentation/devicetree/bindings/clock/fujitsu,mb86s70=
-crg11.txt
 create mode 100644 Documentation/devicetree/bindings/clock/pwm-clock.txt
 create mode 100644 drivers/clk/clk-mb86s7x.c
 create mode 100644 drivers/clk/clk-pwm.c
 create mode 100644 drivers/clk/mvebu/armada-39x.c
 create mode 100644 drivers/clk/qcom/gcc-msm8916.c
 create mode 100644 drivers/clk/samsung/clk-exynos5433.c
 create mode 100644 drivers/clk/sunxi/clk-usb.c
 create mode 100644 include/dt-bindings/clock/exynos5433.h
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8916.h
 create mode 100644 include/dt-bindings/reset/qcom,gcc-msm8916.h
 create mode 100644 include/trace/events/clk.h

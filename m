Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk changes for v4.6
Date: Tue, 22 Mar 2016 18:49:54 -0700
Message-Id: <1458697794-16652-1-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit a0d54c3899aaeb047969d9479263c6bcf385c331:

  clk: ti: omap3+: dpll: use non-locking version of clk_get_rate (2016-02-22 14:03:02 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

for you to fetch changes up to 4d3ac6662452060721599a3392bc2f524af984cb:

  clk: bcm2835: fix check of error code returned by devm_ioremap_resource() (2016-03-15 18:14:11 -0700)

----------------------------------------------------------------
The clk changes for this release cycle are mostly dominated by
new device support in terms of LoC, but there has been some cleanup
in the core as well as the usual minor clk additions to various
drivers.

Core:

 - parent tracking has been simplified

 - CLK_IS_ROOT is now a no-op flag, cleaning up drivers has started

 - of_clk_init() doesn't consider disabled DT nodes anymore

 - clk_unregister() had an error path bug squashed

 - of_clk_get_parent_count() has been fixed to only return unsigned ints

 - HAVE_MACH_CLKDEV is removed now that the last arch user (ARM) is gone

New Drivers:

 - NXP LPC18xx creg

 - QCOM IPQ4019 GCC

 - TI dm814x ADPLL

 - i.MX6QP

Updates:

 - Cyngus audio clks found on Broadcom iProc devices

 - Non-critical fixes for BCM2385 PLLs

 - Samsung exynos5433 updates for clk id errors, HDMI support,
   suspend/resume simplifications

 - USB, CAN, LVDS, and FCP clks on shmobile devices

 - sunxi got support for more clks on new SoCs and went through a minor
   refactoring/rewrite to use a simpler factor clk construct

 - rockchip added some more clk ids and added suport for fraction dividers

 - QCOM GDSCs in msm8996

 - A new devm helper to make adding custom actions simpler (acked by Greg)

----------------------------------------------------------------
Alexander Kochetkov (2):
      clk: rockchip: add hclk_cpubus to the list of rk3188 critical clocks
      clk: rockchip: Allow sclk_i2s0 and i2s0_frac to change their parents rate on rk3188

Anatolij Gustschin (1):
      clk: imx: correct pwm7 clock name in driver for i.MX6UL

Andre Przywara (4):
      clk: sunxi: improve error reporting for the mux clock
      clk: sunxi: improve mux_clk error handling and reporting
      clk: sunxi: improve divider_clk error handling and reporting
      clk: sunxi: Improve divs_clk error handling and reporting

Andreas Färber (1):
      clk: meson: Fix meson_clk_register_clks() signature type mismatch

Andrew F. Davis (1):
      clk: Make of_clk_get_from_provider() available to modules

Andrzej Hajda (3):
      clk: vt8500: fix sign of possible PLL values
      clk/samsung: exynos5433: add definitions of HDMI-PHY output clocks
      clk/samsung: exynos5433: add pclk_decon clock

Archit Taneja (1):
      clk: qcom: Fix pre-divider usage for pixel RCG

Arnd Bergmann (4):
      clk: st: avoid uninitialized variable use
      clk: sunxi: don't mark sun6i_ar100_data __initconst
      clk: vt8500: don't return possibly uninitialized data
      clk: socfpga: fix __init annotation

Bai Ping (1):
      clk: imx: Add clock support for imx6qp

Caesar Wang (2):
      clk: rockchip: add id of the tsadc clock found on rk3228 SoCs
      clk: rockchip: add the tsadc clocks found on rk3228 SoCs

Chen-Yu Tsai (11):
      clk: sunxi: usb: Sort clk providers by chip family and name
      clk: sunxi: factors: Make struct clk_factors_config table const
      clk: sunxi: factors: Add clk cleanup in sunxi_factors_register() error path
      clk: sunxi: factors: Add unregister function
      clk: sunxi: factors: Consolidate get_factors parameters into a struct
      clk: sunxi: factors: Support custom formulas
      clk: sunxi: factors: Drop round_rate from clk ops
      clk: sunxi: rewrite sun6i-a31-ahb1-clk using factors clk with custom recalc
      clk: sunxi: rewrite sun6i-ar100 using factors clk
      clk: sunxi: rewrite sun8i-a23-mbus-clk using the simpler composite clk
      clk: sunxi: Fix sun8i-a23-apb0-clk divider flags

Dinh Nguyen (1):
      clk: socfpga: allow for multiple parents on Arria10 periph clocks

Dirk Behme (1):
      clk: shmobile: r8a7795: Add SD divider support

Elaine Zhang (1):
      clk: rockchip: include downstream muxes into fractional dividers on rk3368

Eric Anholt (2):
      clk: bcm2835: Fix setting of PLL divider clock rates
      clk: bcm2835: Reuse CLK_DIVIDER_MAX_AT_ZERO for recalc_rate()

Geert Uytterhoeven (3):
      clk: shmobile: cpg-mssr: Update serial port clock in example
      clk: shmobile: div6: Fix .recalc_rate() using a stale divisor
      clk: Ignore disabled DT clock providers

Heiko Stuebner (10):
      clk: rockchip: rk3368: fix cpuclk mux bit of big cpu-cluster
      clk: rockchip: rk3368: fix cpuclk core dividers
      clk: rockchip: rk3368: fix parents of video encoder/decoder
      clk: rockchip: rk3368: fix hdmi_cec gate-register
      clk: rockchip: fix usbphy-related clocks
      Merge branch 'v4.6-shared/clkids' into v4.6-clk/next
      clk: rockchip: fix parent of hclk_vcodec on rk3036
      clk: rockchip: add a factor clock type
      clk: rockchip: convert manually created factor clocks to the new type
      Merge branch 'v4.6-shared/clkids' into v4.6-clk/next

Insu Yun (1):
      clk: unlock for handling unregistered clock

Joachim Eastwood (2):
      clk: add lpc18xx creg clk driver
      doc: dt: add documentation for lpc1850-creg-clk driver

Jonghwa Lee (1):
      clk: samsung: exynos5433: Fix wrong registers of PCLK_GSCL_SMMU clocks

Kevin Smith (2):
      clk: mvebu: Remove corediv clock from Armada XP
      clk: mvebu: Move corediv config to mvebu config

Krzysztof Adamski (1):
      clk: sunxi: Add apb0 gates for H3

LABBE Corentin (2):
      clk: palmas: constify the palmas_clks_of_match_data structure
      clk: palmas: fix a possible NULL dereference

Lars-Peter Clausen (2):
      clk: axi-clkgen: Remove version 1 support
      clk: axi-clkgen: Add multi-parent support

Laurent Pinchart (2):
      clk: shmobile: r8a7795: Add FCP clocks
      clk: shmobile: r8a7795: Add LVDS module clock

Linus Walleij (1):
      clk: versatile: sp810: support reentrance

Loc Ho (1):
      clk: xgene: Add missing parenthesis when clearing divider value

Lothar Waßmann (2):
      clk: imx: whitespace cleanup; no functional change
      clk: imx: add kpp clock for i.MX6UL

Magnus Damm (1):
      clk: shmobile: r8a7795: Add INTC-EX clock

Marek Szyprowski (1):
      clk: samsung: exynos5433: Fix definitions of SCLK ISP SENSOR0 clocks

Martin Sperl (1):
      clk: bcm2835: added missing clock register definitions

Masahiro Yamada (20):
      clk: add clk_unregister_fixed_factor()
      clk: add clk_unregister_fixed_rate()
      clk: optimize the divider walk in clk_divider_bestdiv()
      clk: remove unused first argument of __clk_init()
      clk: change the argument of __clk_init() into pointer to clk_core
      clk: rename __clk_init() into __clk_core_init()
      clk: remove unnecessary !core->parents conditional
      clk: change sizeof(struct clk *) to sizeof(*core->parents)
      clk: move core->parents allocation to clk_register()
      clk: simplify clk_core_get_parent_by_index()
      clk: drop the initial core->parents look-ups from __clk_core_init()
      clk: replace pr_warn() with pr_err() for fatal cases
      clk: move checking .get_parent to __clk_core_init()
      clk: simplify __clk_init_parent()
      clk: avoid circular clock topology
      clk: walk the orphan clock list more simply
      clk: make sure parent is not NULL in clk_fetch_parent_index()
      clk: simplify clk_fetch_parent_index() function
      clk: slightly optimize clk_core_set_parent()
      clk: fix __clk_init_parent() for single parent clocks

Maxime Ripard (5):
      clk: sunxi: Make clocks setup functions return their clock
      clk: sunxi: Make clocks setup functions take const pointer
      clk: sunxi: convert current clocks registration to CLK_OF_DECLARE
      clk: sunxi: Remove old probe and protection code
      clk: sunxi: Remove clk_register_clkdev calls

Michael Turquette (5):
      Merge tag 'v4.6-rockchip-clk1' of git://git.kernel.org/.../mmind/linux-rockchip into clk-next
      Merge branch 'clk-bcm2835' into clk-next
      Merge branch 'clk-shmobile-for-v4.6' of git://git.kernel.org/.../geert/renesas-drivers into clk-next
      Merge branch 'clk-samsung' into clk-next
      Merge branch 'clk-ti' into clk-next

Mike Looijmans (2):
      drivers/clk/Kconfig: Fix typo "Sypport" instead of "Support"
      drivers/clk/Kconfig: Move the TI CDCE chips close together

Paweł Jarosz (1):
      clk: rockchip: add tsadc clock on rk3066

Rajendra Nayak (6):
      clk: qcom: gdsc: Add support for hierarchical power domains
      clk: qcom: gdsc: Add support for gdscs with gds hw controller
      clk: qcom: gdsc: Add support for votable gdscs
      clk: qcom: gdsc: Add GDSCs in msm8996 GCC
      clk: qcom: gdsc: Add mmcc gdscs for msm8996 family
      clk: qcom: mmcc8974: Use gdscs .parent and remove genpd calls

Ramesh Shanmugasundaram (3):
      clk: shmobile: r8a7795: Add CAN peripheral clock
      clk: shmobile: r8a7795: Add CANFD clock
      clk: shmobile: r8a7795: Add CAN FD peripheral clock

Ray Jui (1):
      clk: iproc: Remove __init from header

Shawn Lin (8):
      clk: rockchip: fix wrong mmc phase shift for rk3228
      clk: rockchip: free memory in error cases when registering clock branches
      clk: rockchip: disable alt_parent clk in err cases when registering cpuclk
      clk: rockchip: check grf when waiting pll lock
      clk: rockchip: don't return NULL when registering inverter fails
      clk: rockchip: don't return NULL when registering mmc branch fails
      clk: rockchip: fix coding style for clk-cpu.c
      clk: skip unnecessary set_phase if nothing to do

Simon Horman (4):
      clk: shmobile: Remove ARCH_SHMOBILE_MULTI
      clk: renesas: move drivers to renesas directory
      clk: renesas: Rename header file renesas.h
      clk: renesas: div6: use RENESAS for #define

Simran Rai (2):
      Documentation: dt-bindings: Add DT bindings for Cygnus audio clock
      clk: iproc: Add support for Cygnus audio clocks

Srinivas Kandagatla (2):
      clk:gcc-msm8916: add missing mss_q6_bimc_axi clock
      clk: qcom: msm8960: fix ce3_core clk enable register

Stephen Boyd (61):
      clk: sunxi: Drop clk.h include
      Merge branch 'clk-iproc' into clk-next
      clk: axi-clkgen: Remove sometimes impossible check
      Merge branch 'clk-fixes' into clk-next
      clk: gpio: Make into a platform driver
      clk: Deprecate CLK_IS_ROOT
      clk: provider: Remove of_gpio_{gate,mux}_clk_setup() prototypes
      Merge branch 'clk-fixes' into clk-next
      Merge branch 'clk-fixes' into clk-next
      Merge branch 'clk-fixes' into clk-next
      Merge branch 'clk-fixes' into clk-next
      Revert "clk: avoid circular clock topology"
      clk: Update some outdated comments
      clk: shmobile: Free 'clock' on error path
      Merge branch 'clk-ipq4019' into clk-next
      clk: Get rid of HAVE_MACH_CLKDEV
      Merge tag 'clk-samsung-4.6' of git://linuxtv.org/snawrocki/samsung into clk-next
      clk: Make of_clk_get_parent_count() return unsigned ints
      clk: at91: Remove impossible checks for of_clk_get_parent_count()
      clk: gpio: Remove impossible check for of_clk_get_parent_count() < 0
      clk: h8300: Remove impossible check for of_clk_get_parent_count()
      clk: st: Remove impossible check for of_clk_get_parent_count() < 0
      clk: sunxi: Use proper type for of_clk_get_parent_count() return value
      clk: ti: Update for of_clk_get_parent_count() returning unsigned int
      usb: dwc3: Remove impossible check for of_clk_get_parent_count() < 0
      simplefb: Remove impossible check for of_clk_get_parent_count() < 0
      clk: h8300: Properly cast to __iomem pointer
      clk: ti: Fix some errors found by static checkers
      clk: qcom: msm8960: Fix ce3_src register offset
      Merge tag 'sunxi-clocks-for-4.6' of https://git.kernel.org/.../mripard/linux into clk-next
      Merge tag 'imx-clk-4.6' of git://git.kernel.org/.../shawnguo/linux into clk-next
      clk: bcm: Remove CLK_IS_ROOT
      clk: at91: Remove CLK_IS_ROOT
      clk: hisilicon: Remove CLK_IS_ROOT
      clk: mediatek: Remove CLK_IS_ROOT
      clk: imx: Remove CLK_IS_ROOT
      clk: mxs: Remove CLK_IS_ROOT
      clk: nxp: Remove CLK_IS_ROOT
      clk: pxa: Remove CLK_IS_ROOT
      clk: samsung: Remove CLK_IS_ROOT
      clk: spear: Remove CLK_IS_ROOT
      clk: tegra: Remove CLK_IS_ROOT
      clk: ti: Remove CLK_IS_ROOT
      clk: ux500: Remove CLK_IS_ROOT
      clk: zynq: Remove CLK_IS_ROOT
      clk: efm32gg: Remove CLK_IS_ROOT
      clk: pwm: Remove CLK_IS_ROOT
      clk: s2mps11: Remove CLK_IS_ROOT
      clk: scpi: Remove CLK_IS_ROOT
      clk: si5{14,351,70}: Remove CLK_IS_ROOT
      Merge branch 'clk-shmobile-for-v4.6' of git://git.kernel.org/.../geert/renesas-drivers into clk-next
      clk: mvebu: Remove CLK_IS_ROOT
      clk: x86: Remove CLK_IS_ROOT
      clk: x86: Remove clkdev.h and clk.h includes
      clk: mb86s7x: Remove CLK_IS_ROOT
      Merge tag 'v4.6-rockchip-clk2' of git://git.kernel.org/.../mmind/linux-rockchip into clk-next
      clk: qcom: Remove CLK_IS_ROOT
      clk: fixed-rate: Remove CLK_IS_ROOT
      clk: sunxi: Remove use of variable length array
      clk: versatile: Remove CLK_IS_ROOT
      clk: max77{686,802}: Remove CLK_IS_ROOT

Sudip Mukherjee (3):
      devm: add helper devm_add_action_or_reset()
      clk: qcom: common: check for failure
      clk: shmobile: check for failure

Sylvain Lemieux (3):
      clk: lpc32xx: do not register clock "0"
      clk: lpc32xx: add HCLK PLL output configuration
      clk: lpc32xx: fix compilation warning

Sylwester Nawrocki (4):
      clk: samsung: exynos5433: Fix typos in *_ISP_MPWM clock names
      clk: samsung: exynos5433: Fix definitions of MUX_SEL_CAM04 clocks
      clk: samsung: exynos5433: Drop RO registers from the save/restore lists
      clk: samsung: exynos5433: Fix mout_aclk_cam1*_user clocks definition

Tero Kristo (1):
      clk: ti: dpll: convert DPLL support code to use clk_hw instead of clk ptrs

Tony Lindgren (2):
      clk: ti: Add support for dm814x ADPLL
      clk: ti: Allow COMPILE_TEST to build selected drivers

Varadarajan Narayanan (1):
      clk: qcom: Add IPQ4019 Global Clock Controller support

Vishnu Patekar (2):
      clk: sunxi: Add apb0 gates for A83T
      clk: sunxi: add bus gates for A83T

Vladimir Zapolskiy (1):
      clk: bcm2835: fix check of error code returned by devm_ioremap_resource()

Yakir Yang (5):
      clk: rockchip: rk3036: enable the CLK_IGNORE_UNUSED flag for hclk_vio_bus
      clk: rockchip: add the new clock ids for RK3228 VOP
      clk: rockchip: add the new clock ids for RK3228 HDMI
      clk: rockchip: set the clock ids for RK3228 VOP
      clk: rockchip: set the clock ids for RK3228 HDMI

Yoshihiro Shimoda (2):
      clk: shmobile: r8a7795: Add USB3.0 clocks
      clk: shmobile: r8a7795: Add USB-DMAC clocks

zhangqing (3):
      clk: rockchip: rk3368: fix edp_24m parent
      clk: rockchip: rk3368: enable the CLK_SET_RATE_PARENT flag for spdif_8ch
      clk: rockchip: rk3368: enable the CLK_SET_RATE_PARENT flag for i2s_2ch

 .../devicetree/bindings/clock/axi-clkgen.txt       |    5 +-
 .../bindings/clock/brcm,iproc-clocks.txt           |    6 +
 .../devicetree/bindings/clock/lpc1850-creg-clk.txt |   52 +
 .../devicetree/bindings/clock/qcom,gcc.txt         |    1 +
 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |    2 +-
 Documentation/devicetree/bindings/clock/sunxi.txt  |    4 +
 .../devicetree/bindings/clock/ti/adpll.txt         |   41 +
 Documentation/devicetree/bindings/clock/xgene.txt  |    2 +
 arch/arm/boot/dts/rk3288-veyron.dtsi               |    2 +-
 arch/arm/mach-mvebu/Kconfig                        |    3 +
 arch/arm/mach-s3c24xx/Kconfig                      |    1 +
 arch/arm/mach-shmobile/pm-rmobile.c                |    2 +-
 arch/arm/mach-shmobile/setup-r8a7778.c             |    2 +-
 arch/arm/mach-shmobile/setup-r8a7779.c             |    2 +-
 arch/arm/mach-shmobile/setup-rcar-gen2.c           |    2 +-
 arch/mips/Kconfig                                  |    2 -
 arch/mips/pic32/Kconfig                            |    1 -
 drivers/clk/Kconfig                                |   30 +-
 drivers/clk/Makefile                               |    5 +-
 drivers/clk/at91/clk-generated.c                   |    4 +-
 drivers/clk/at91/clk-main.c                        |    6 +-
 drivers/clk/at91/clk-master.c                      |    4 +-
 drivers/clk/at91/clk-programmable.c                |    4 +-
 drivers/clk/at91/clk-slow.c                        |    8 +-
 drivers/clk/at91/clk-smd.c                         |    4 +-
 drivers/clk/at91/clk-usb.c                         |    4 +-
 drivers/clk/bcm/clk-bcm2835-aux.c                  |    4 +-
 drivers/clk/bcm/clk-bcm2835.c                      |   47 +-
 drivers/clk/bcm/clk-cygnus.c                       |   59 +
 drivers/clk/bcm/clk-iproc-pll.c                    |   41 +-
 drivers/clk/bcm/clk-iproc.h                        |   43 +-
 drivers/clk/clk-axi-clkgen.c                       |  170 +--
 drivers/clk/clk-composite.c                        |    2 -
 drivers/clk/clk-divider.c                          |   18 +-
 drivers/clk/clk-efm32gg.c                          |    2 +-
 drivers/clk/clk-fixed-factor.c                     |   15 +-
 drivers/clk/clk-fixed-rate.c                       |   18 +-
 drivers/clk/clk-fractional-divider.c               |    2 -
 drivers/clk/clk-gate.c                             |    2 -
 drivers/clk/clk-gpio.c                             |  163 +--
 drivers/clk/clk-max77686.c                         |    3 -
 drivers/clk/clk-max77802.c                         |    2 -
 drivers/clk/clk-mb86s7x.c                          |    4 +-
 drivers/clk/clk-multiplier.c                       |    2 -
 drivers/clk/clk-mux.c                              |    2 -
 drivers/clk/clk-palmas.c                           |   16 +-
 drivers/clk/clk-pwm.c                              |    2 +-
 drivers/clk/clk-s2mps11.c                          |  111 +-
 drivers/clk/clk-scpi.c                             |    2 +-
 drivers/clk/clk-si514.c                            |    2 +-
 drivers/clk/clk-si5351.c                           |    2 +-
 drivers/clk/clk-si570.c                            |    2 +-
 drivers/clk/clk-vt8500.c                           |  100 +-
 drivers/clk/clk-xgene.c                            |  109 +-
 drivers/clk/clk.c                                  |  221 ++--
 drivers/clk/h8300/clk-div.c                        |    6 +-
 drivers/clk/h8300/clk-h8s2678.c                    |    4 +-
 drivers/clk/hisilicon/clk-hi3620.c                 |   18 +-
 drivers/clk/hisilicon/clk-hi6220-stub.c            |    2 +-
 drivers/clk/hisilicon/clk-hi6220.c                 |   26 +-
 drivers/clk/hisilicon/clk-hip04.c                  |    6 +-
 drivers/clk/hisilicon/clk-hix5hd2.c                |   60 +-
 drivers/clk/imx/clk-busy.c                         |    4 +-
 drivers/clk/imx/clk-fixup-div.c                    |    5 +-
 drivers/clk/imx/clk-fixup-mux.c                    |    2 -
 drivers/clk/imx/clk-gate-exclusive.c               |    2 +-
 drivers/clk/imx/clk-imx6q.c                        |  132 +-
 drivers/clk/imx/clk-imx6ul.c                       |   65 +-
 drivers/clk/imx/clk.h                              |    2 +-
 drivers/clk/mediatek/clk-gate.c                    |    8 +-
 drivers/clk/mediatek/clk-gate.h                    |    2 +-
 drivers/clk/mediatek/clk-mtk.c                     |   10 +-
 drivers/clk/meson/clkc.c                           |    2 +-
 drivers/clk/mvebu/Kconfig                          |    2 -
 drivers/clk/mvebu/common.c                         |   13 +-
 drivers/clk/mvebu/dove-divider.c                   |    3 +-
 drivers/clk/mvebu/kirkwood.c                       |    2 -
 drivers/clk/mxs/clk-div.c                          |    2 +-
 drivers/clk/mxs/clk.h                              |    2 +-
 drivers/clk/nxp/Makefile                           |    1 +
 drivers/clk/nxp/clk-lpc18xx-ccu.c                  |    4 +-
 drivers/clk/nxp/clk-lpc18xx-cgu.c                  |    2 +-
 drivers/clk/nxp/clk-lpc18xx-creg.c                 |  226 ++++
 drivers/clk/nxp/clk-lpc32xx.c                      |   15 +-
 drivers/clk/pxa/clk-pxa25x.c                       |    8 +-
 drivers/clk/pxa/clk-pxa27x.c                       |    6 +-
 drivers/clk/pxa/clk-pxa3xx.c                       |    8 +-
 drivers/clk/qcom/Kconfig                           |    8 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-rcg.c                         |    4 +-
 drivers/clk/qcom/common.c                          |   30 +-
 drivers/clk/qcom/gcc-ipq4019.c                     | 1354 ++++++++++++++++++++
 drivers/clk/qcom/gcc-ipq806x.c                     |   37 -
 drivers/clk/qcom/gcc-msm8660.c                     |   32 -
 drivers/clk/qcom/gcc-msm8916.c                     |   18 +
 drivers/clk/qcom/gcc-msm8960.c                     |   46 +-
 drivers/clk/qcom/gcc-msm8974.c                     |    1 -
 drivers/clk/qcom/gcc-msm8996.c                     |   98 +-
 drivers/clk/qcom/gdsc.c                            |   89 +-
 drivers/clk/qcom/gdsc.h                            |   34 +-
 drivers/clk/qcom/mmcc-msm8960.c                    |   35 -
 drivers/clk/qcom/mmcc-msm8974.c                    |   15 +-
 drivers/clk/qcom/mmcc-msm8996.c                    |  157 +++
 drivers/clk/{shmobile => renesas}/Makefile         |    0
 drivers/clk/{shmobile => renesas}/clk-div6.c       |    3 +-
 drivers/clk/{shmobile => renesas}/clk-div6.h       |    4 +-
 drivers/clk/{shmobile => renesas}/clk-emev2.c      |    0
 drivers/clk/{shmobile => renesas}/clk-mstp.c       |    2 +-
 drivers/clk/{shmobile => renesas}/clk-r8a73a4.c    |    2 +-
 drivers/clk/{shmobile => renesas}/clk-r8a7740.c    |    2 +-
 drivers/clk/{shmobile => renesas}/clk-r8a7778.c    |    2 +-
 drivers/clk/{shmobile => renesas}/clk-r8a7779.c    |    2 +-
 drivers/clk/{shmobile => renesas}/clk-rcar-gen2.c  |    2 +-
 drivers/clk/{shmobile => renesas}/clk-rz.c         |    2 +-
 drivers/clk/{shmobile => renesas}/clk-sh73a0.c     |    2 +-
 .../clk/{shmobile => renesas}/r8a7795-cpg-mssr.c   |  255 ++++
 .../clk/{shmobile => renesas}/renesas-cpg-mssr.c   |    7 +-
 .../clk/{shmobile => renesas}/renesas-cpg-mssr.h   |    2 +
 drivers/clk/rockchip/clk-cpu.c                     |    8 +-
 drivers/clk/rockchip/clk-inverter.c                |    8 +-
 drivers/clk/rockchip/clk-mmc-phase.c               |    8 +-
 drivers/clk/rockchip/clk-pll.c                     |    5 +
 drivers/clk/rockchip/clk-rk3036.c                  |   33 +-
 drivers/clk/rockchip/clk-rk3188.c                  |   27 +-
 drivers/clk/rockchip/clk-rk3228.c                  |   56 +-
 drivers/clk/rockchip/clk-rk3288.c                  |   38 +-
 drivers/clk/rockchip/clk-rk3368.c                  |  175 +--
 drivers/clk/rockchip/clk.c                         |   68 +-
 drivers/clk/rockchip/clk.h                         |   28 +
 drivers/clk/samsung/Kconfig                        |   19 +-
 drivers/clk/samsung/Makefile                       |    4 +-
 drivers/clk/samsung/clk-exynos4.c                  |   12 +-
 drivers/clk/samsung/clk-exynos4415.c               |    2 +-
 drivers/clk/samsung/clk-exynos5250.c               |   10 +-
 drivers/clk/samsung/clk-exynos5260.c               |   36 +-
 drivers/clk/samsung/clk-exynos5420.c               |   12 +-
 drivers/clk/samsung/clk-exynos5433.c               |  208 +--
 drivers/clk/samsung/clk-exynos5440.c               |   12 +-
 drivers/clk/samsung/clk-exynos7.c                  |   12 +-
 drivers/clk/samsung/clk-s3c2410.c                  |    2 +-
 drivers/clk/samsung/clk-s3c2412.c                  |    4 +-
 drivers/clk/samsung/clk-s3c2443.c                  |    8 +-
 drivers/clk/samsung/clk-s3c64xx.c                  |    8 +-
 drivers/clk/samsung/clk-s5pv210.c                  |   10 +-
 drivers/clk/socfpga/clk-gate-a10.c                 |    6 +-
 drivers/clk/socfpga/clk-periph-a10.c               |    7 +-
 drivers/clk/socfpga/clk-pll-a10.c                  |    2 +-
 drivers/clk/spear/spear1310_clock.c                |   21 +-
 drivers/clk/spear/spear1340_clock.c                |   16 +-
 drivers/clk/spear/spear3xx_clock.c                 |    8 +-
 drivers/clk/spear/spear6xx_clock.c                 |    6 +-
 drivers/clk/st/clk-flexgen.c                       |    4 +-
 drivers/clk/st/clkgen-fsyn.c                       |    8 +-
 drivers/clk/st/clkgen-mux.c                        |   13 +-
 drivers/clk/sunxi/clk-a10-hosc.c                   |    3 +-
 drivers/clk/sunxi/clk-a20-gmac.c                   |    2 -
 drivers/clk/sunxi/clk-factors.c                    |  123 +-
 drivers/clk/sunxi/clk-factors.h                    |   26 +-
 drivers/clk/sunxi/clk-mod0.c                       |   23 +-
 drivers/clk/sunxi/clk-simple-gates.c               |    4 +
 drivers/clk/sunxi/clk-sun6i-apb0-gates.c           |    2 -
 drivers/clk/sunxi/clk-sun6i-ar100.c                |  235 +---
 drivers/clk/sunxi/clk-sun8i-apb0.c                 |    2 +-
 drivers/clk/sunxi/clk-sun8i-bus-gates.c            |    3 +-
 drivers/clk/sunxi/clk-sun8i-mbus.c                 |  132 +-
 drivers/clk/sunxi/clk-sun9i-core.c                 |   86 +-
 drivers/clk/sunxi/clk-sunxi.c                      |  863 ++++++-------
 drivers/clk/sunxi/clk-usb.c                        |   24 +-
 drivers/clk/tegra/clk-audio-sync.c                 |    2 +-
 drivers/clk/tegra/clk-dfll.c                       |    1 -
 drivers/clk/tegra/clk-tegra-fixed.c                |    6 +-
 drivers/clk/tegra/clk-tegra114.c                   |    3 +-
 drivers/clk/tegra/clk-tegra20.c                    |   10 +-
 drivers/clk/ti/Kconfig                             |    6 +
 drivers/clk/ti/Makefile                            |    6 +
 drivers/clk/ti/adpll.c                             |  983 ++++++++++++++
 drivers/clk/ti/apll.c                              |   20 +-
 drivers/clk/ti/clk-814x.c                          |   53 +
 drivers/clk/ti/clk.c                               |    4 +-
 drivers/clk/ti/clkt_dpll.c                         |    6 +-
 drivers/clk/ti/clockdomain.c                       |    2 +-
 drivers/clk/ti/composite.c                         |   10 +-
 drivers/clk/ti/divider.c                           |    2 -
 drivers/clk/ti/dpll.c                              |   27 +-
 drivers/clk/ti/dpll3xxx.c                          |   17 +-
 drivers/clk/ti/dpll44xx.c                          |    8 +-
 drivers/clk/ti/gate.c                              |    2 -
 drivers/clk/ti/mux.c                               |    6 +-
 drivers/clk/ux500/abx500-clk.c                     |    5 +-
 drivers/clk/ux500/u8500_of_clk.c                   |   74 +-
 drivers/clk/ux500/u8540_clk.c                      |   80 +-
 drivers/clk/versatile/clk-icst.c                   |    2 +-
 drivers/clk/versatile/clk-impd1.c                  |    3 +-
 drivers/clk/versatile/clk-realview.c               |    8 +-
 drivers/clk/versatile/clk-sp810.c                  |    4 +-
 drivers/clk/versatile/clk-vexpress-osc.c           |    2 +-
 drivers/clk/x86/clk-lpt.c                          |    4 +-
 drivers/clk/zynq/clkc.c                            |    3 +-
 drivers/usb/dwc3/dwc3-of-simple.c                  |    9 +-
 drivers/video/fbdev/simplefb.c                     |    4 +-
 include/dt-bindings/clock/bcm-cygnus.h             |    6 +
 include/dt-bindings/clock/exynos5433.h             |    9 +-
 include/dt-bindings/clock/imx6qdl-clock.h          |   16 +-
 include/dt-bindings/clock/imx6ul-clock.h           |  149 +--
 include/dt-bindings/clock/lpc32xx-clock.h          |    1 +
 include/dt-bindings/clock/qcom,gcc-ipq4019.h       |  158 +++
 include/dt-bindings/clock/qcom,gcc-msm8916.h       |    1 +
 include/dt-bindings/clock/qcom,gcc-msm8996.h       |   11 +
 include/dt-bindings/clock/qcom,mmcc-msm8996.h      |   17 +
 include/dt-bindings/clock/rk3188-cru-common.h      |    1 +
 include/dt-bindings/clock/rk3228-cru.h             |   12 +
 include/linux/clk-provider.h                       |   30 +-
 include/linux/clk/{shmobile.h => renesas.h}        |    4 +-
 include/linux/clk/ti.h                             |    8 +-
 include/linux/device.h                             |   12 +
 215 files changed, 5853 insertions(+), 2647 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/lpc1850-creg-clk.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti/adpll.txt
 create mode 100644 drivers/clk/nxp/clk-lpc18xx-creg.c
 create mode 100644 drivers/clk/qcom/gcc-ipq4019.c
 rename drivers/clk/{shmobile => renesas}/Makefile (100%)
 rename drivers/clk/{shmobile => renesas}/clk-div6.c (98%)
 rename drivers/clk/{shmobile => renesas}/clk-div6.h (68%)
 rename drivers/clk/{shmobile => renesas}/clk-emev2.c (100%)
 rename drivers/clk/{shmobile => renesas}/clk-mstp.c (99%)
 rename drivers/clk/{shmobile => renesas}/clk-r8a73a4.c (99%)
 rename drivers/clk/{shmobile => renesas}/clk-r8a7740.c (99%)
 rename drivers/clk/{shmobile => renesas}/clk-r8a7778.c (99%)
 rename drivers/clk/{shmobile => renesas}/clk-r8a7779.c (99%)
 rename drivers/clk/{shmobile => renesas}/clk-rcar-gen2.c (99%)
 rename drivers/clk/{shmobile => renesas}/clk-rz.c (98%)
 rename drivers/clk/{shmobile => renesas}/clk-sh73a0.c (99%)
 rename drivers/clk/{shmobile => renesas}/r8a7795-cpg-mssr.c (61%)
 rename drivers/clk/{shmobile => renesas}/renesas-cpg-mssr.c (99%)
 rename drivers/clk/{shmobile => renesas}/renesas-cpg-mssr.h (97%)
 create mode 100644 drivers/clk/ti/Kconfig
 create mode 100644 drivers/clk/ti/adpll.c
 create mode 100644 include/dt-bindings/clock/qcom,gcc-ipq4019.h
 rename include/linux/clk/{shmobile.h => renesas.h} (93%)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

Return-Path: <swboyd@chromium.org>
MIME-Version: 1.0
From: Stephen Boyd <swboyd@chromium.org>
Date: Sat, 9 Jun 2018 11:15:44 -0700
Message-ID: <CAE-0n52gh06pJHyKUMfAXf--FjcNoxDCu7HbWekwGp9cBOw+2A@mail.gmail.com>
Subject: [GIT PULL] clk changes for v4.18
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Content-Type: multipart/alternative; boundary="000000000000521f4c056e398139"
List-ID: <linux-clk.vger.kernel.org>

--000000000000521f4c056e398139
Content-Type: text/plain; charset="UTF-8"

Please note I'm sending this from my chromium.org account because I'm
traveling
since the start of the merge window and I don't want to setup my korg smtp
on this
computer.

The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git
tags/clk-for-linus

for you to fetch changes up to 55913c2d33307ac11797531ebbe7c122a73cc0fd:

  Merge branch 'clk-imx6ul' into clk-next (2018-06-04 12:41:57 -0700)

----------------------------------------------------------------
This time we have a good set of changes to the core framework that do some
general cleanups, but nothing too major. The majority of the diff goes to
two SoCs, Actions Semi and Qualcomm. A brand new driver is introduced for
Actions Semi so it takes up some lines to add all the different types, and
the Qualcomm diff is there because we add support for two SoCs and it's
quite
a bit of data.

Otherwise the big driver updates are on TI Davinci and Amlogic platforms.
And
then the long tail of driver updates for various fixes and stuff follows
after that.

Core:
 - debugfs cleanups removing error checking and an unused provider API
 - Removal of a clk init typedef that isn't used
 - Usage of match_string() to simplify parent string name matching
 - OF clk helpers moved to their own file (linux/of_clk.h)
 - Make clk warnings more readable across kernel versions

New Drivers:
 - Qualcomm SDM845 GCC and Video clk controllers
 - Qualcomm MSM8998 GCC
 - Actions Semi S900 SoC support
 - Nuvoton npcm750 microcontroller clks
 - Amlogic axg AO clock controller

Removed Drivers:
 - Deprecated Rockchip clk-gate driver

Updates:
 - debugfs functions stopped checking return values
 - Support for the MSIOF module clocks on Rensas R-Car M3-N
 - Support for the new Rensas RZ/G1C and R-Car E3 SoCs
 - Qualcomm GDSC, RCG, and PLL updates for clk changes in new SoCs
 - Berlin and Amlogic SPDX tagging
 - Usage of of_clk_get_parent_count() in more places
 - Proper implementation of the CDEV1/2 clocks on Tegra20
 - Allwinner H6 PRCM clock support and R40 EMAC support
 - Add critical flag to meson8b's fdiv2 as temporary fixup for ethernet
 - Round closest support for meson's mpll driver
 - Support for meson8b nand clocks and gxbb video decoder clocks
 - Mediatek mali clks
 - STM32MP1 fixes
 - Uniphier LD11/LD20 stream demux system clock

----------------------------------------------------------------
Amit Nischal (10):
      clk: qcom: Clear hardware clock control bit of RCG
      clk: qcom: Add support for controlling Fabia PLL
      clk: qcom: gdsc: Add support to reset AON and block reset logic
      clk: qcom: gdsc: Add support to poll for higher timeout value
      clk: qcom: gdsc: Add support to poll CFG register to check GDSC state
      clk: qcom: Configure the RCGs to a safe source as needed
      clk: qcom: Add DT bindings for SDM845 gcc clock controller
      clk: qcom: Add support for BRANCH_HALT_SKIP flag for branch clocks
      dt-bindings: clock: Introduce QCOM Video clock bindings
      clk: qcom: Add video clock controller driver for SDM845

Anson Huang (6):
      clk: imx6sx: add missing lvds2 clock to the clock tree
      clk: imx6sx: disable unnecessary clocks during clock initialization
      clk: imx6sl: correct ocram_podf clock type
      clk: imx7d: correct enet phy ref clock gates
      clk: imx7d: correct enet clock CCGR registers
      ARM: dts: imx7: correct enet ipg clock

Biju Das (2):
      clk: renesas: Add r8a77470 CPG Core Clock Definitions
      clk: renesas: cpg-mssr: Add r8a77470 support

Bjorn Andersson (1):
      clk: qcom: gcc-msm8996: Disable halt check on UFS clocks

Chris Packham (1):
      clk: mvebu: use correct bit for 98DX3236 NAND

Christophe JAILLET (1):
      clk: stm32mp1: Fix a memory leak in 'clk_stm32_register_gate_ops()'

Colin Didier (1):
      clk: imx6: add EPIT clock support

Daniel Lezcano (1):
      clk/driver/hisi: Consolidate the Kconfig for the CLOCK_STUB

David Lechner (7):
      clk: davinci: pll-dm355: drop pll2_sysclk2
      clk: davinci: pll-dm355: fix SYSCLKn parent names
      clk: davinci: psc-dm355: fix ASP0/1 clkdev lookups
      clk: davinci: pll: allow dev == NULL
      clk: davinci: da850-pll: change PLL0 to CLK_OF_DECLARE
      clk: davinci: psc: allow for dev == NULL
      clk: davinci: Fix link errors when not all SoCs are enabled

Dinh Nguyen (2):
      clk: socfpga: stratix10: use platform driver APIs
      clk: socfpga: stratix10: suppress unbinding platform's clock driver

Dmitry Osipenko (3):
      clk: tegra20: Add DEV1/DEV2 OSC dividers
      clk: tegra20: Correct parents of CDEV1/2 clocks
      clk: tegra: Add quirk for getting CDEV1/2 clocks on Tegra20

Evan Green (1):
      clk: qcom: Base rcg parent rate off plan frequency

Fabio Estevam (1):
      clk: Print the clock name and warning cause

Gabriel Fernandez (7):
      clk: stm32mp1: add missing static
      clk: stm32mp1: remove unused dfsdm_src[] const
      clk: stm32mp1: fix SAI3 & SAI4 clocks
      clk: stm32mp1: add missing tzc2 clock
      clk: stm32mp1: set stgen_k clock as critical
      clk: stm32mp1: remove ck_apb_dbg clock
      clk: stm32mp1: Add CLK_IGNORE_UNUSED to ck_sys_dbg clock

Geert Uytterhoeven (13):
      clk: renesas: r8a7743: Fix LB clock divider
      clk: renesas: r8a7745: Fix LB clock divider
      clk: renesas: r8a7791/r8a7793: Fix LB clock divider
      clk: renesas: r8a7792: Fix LB clock divider
      clk: renesas: r8a7794: Fix LB clock divider
      clk: renesas: r8a77980: Correct parent clock of PCIEC0
      clk: renesas: rcar-gen2: Centralize quirks handling
      clk: Remove clk_init_cb typedef
      clk: Extract OF clock helpers in <linux/of_clk.h>
      ARM: timer-sp: Use of_clk_get_parent_count() instead of open coding
      soc: rockchip: power-domain: Use of_clk_get_parent_count() instead of
open coding
      soc/tegra: pmc: Use of_clk_get_parent_count() instead of open coding
      pinctrl: sunxi: Use of_clk_get_parent_count() instead of open coding

Greg Kroah-Hartman (5):
      clk: no need to check return value of debugfs_create functions
      clk: bcm2835: no need to check return value of debugfs_create
functions
      clk: davinci: no need to check return value of debugfs_create
functions
      clk: tegra: no need to check return value of debugfs_create functions
      clk: remove clk_debugfs_add_file()

Heiko Stuebner (1):
      clk: rockchip: remove deprecated gate-clk code and dt-binding

Icenowy Zheng (3):
      clk: sunxi-ng: add support for H6 PRCM CCU
      clk: sunxi-ng: r40: rewrite init code to a platform driver
      clk: sunxi-ng: r40: export a regmap to access the GMAC register

Jae Hyun Yoo (1):
      clk:aspeed: Fix reset bits for PCI/VGA and PECI

Jerome Brunet (5):
      Merge branch 'next/bindings' into next/drivers
      clk: bulk: silently error out on EPROBE_DEFER
      clk: meson: use SPDX license identifiers consistently
      clk: meson: mpll: add round closest support
      clk: meson: axg: let mpll clocks round closest

Jianguo Sun (1):
      clk: hisilicon: add missing usb3 clocks for Hi3798CV200 SoC

Jisheng Zhang (1):
      clk: berlin: switch to SPDX license identifier

Joel Stanley (1):
      clk: aspeed: Support second reset register

Joonwoo Park (1):
      clk: qcom: Add MSM8998 Global Clock Control (GCC) driver

Katsuhiro Suzuki (1):
      clk: uniphier: add LD11/LD20 stream demux system clock

Lei YU (1):
      clk: aspeed: Add 24MHz fixed clock

Manivannan Sadhasivam (10):
      dt-bindings: clock: Add Actions S900 clock bindings
      clk: actions: Add common clock driver support
      clk: actions: Add gate clock support
      clk: actions: Add mux clock support
      clk: actions: Add divider clock support
      clk: actions: Add factor clock support
      clk: actions: Add fixed factor clock support
      clk: actions: Add composite clock support
      clk: actions: Add pll clock support
      clk: actions: Add S900 SoC clock support

Manu Gautam (1):
      clk: msm8996-gcc: Mark halt check as no-op for USB/PCIE pipe_clk

Marcin Ziemianowicz (1):
      clk: at91: PLL recalc_rate() now using cached MUL and DIV values

Martin Blumenstingl (3):
      dt-bindings: clock: meson8b: export the NAND clock
      clk: meson: meson8b: add support for the NAND clocks
      clk: meson: meson8b: mark fclk_div2 gate clocks as CLK_IS_CRITICAL

Maxime Jourdan (2):
      clk: meson: gxbb: expose VDEC_1 and VDEC_HEVC clocks
      clk: meson: gxbb: add the video decoder clocks

Michael Trimarchi (1):
      clk: imx: Add new clo01 and clo2 controlled by CCOSR

Mike Looijmans (1):
      clk-si544: Properly round requested frequency to nearest match

Paul Cercueil (6):
      clk: ingenic: Add support for clocks whose gate bit is inverted
      clk: ingenic: Support specifying "wait for clock stable" delay
      clk: ingenic: jz4770: Change OTG from custom to standard gated clock
      clk: ingenic: jz4770: Modify C1CLK clock to disable CPU clock stop on
idle
      clk: ingenic: jz4770: Enable power of AHB1 bus after ungating VPU
clock
      clk: ingenic: jz4770: Add 150us delay after enabling VPU clock

Pramod Kumar (2):
      dt-bindings: clk: Update Stingray binding doc
      clk: bcm: Update and add Stingray clock entries

Qiufang Dai (1):
      clk: meson-axg: Add AO Clock and Reset controller driver

Quentin Schulz (1):
      clk: spear: fix WDT clock definition on SPEAr600

Rajendra Nayak (3):
      clk: qcom: gdsc: Add support for ALWAYS_ON gdscs
      clk: qcom: Register the gdscs before the clocks
      clk: qcom: mmcc-msm8996: leave all mmagic gdscs and clocks always
enabled

Rui Miguel Silva (2):
      clk: imx7d: fix mipi dphy div parent
      clk: imx7d: reset parent for mipi csi root

Ryder Lee (1):
      clk: mediatek: correct the clocks for MT2701 HDMI PHY module

Sean Wang (4):
      dt-bindings: clock: mediatek: add g3dsys bindings
      dt-bindings: clock: mediatek: add entry for Mali-450 node to refer
      dt-bindings: reset: mediatek: add entry for Mali-450 node to refer
      clk: mediatek: add g3dsys support for MT2701 and MT7623

Sekhar Nori (3):
      clk: davinci: psc-da830: fix USB0 48MHz PHY clock registration
      clk: davinci: pll-dm646x: keep PLL2 SYSCLK1 always enabled
      clk: davinci: psc-dm365: fix few clocks

Stefan Agner (1):
      clk: imx6ul: fix periph clk2 clock mux selection

Stephen Boyd (22):
      clk: qcom: Simplify gdsc status checking logic
      Merge tag 'clk-renesas-for-v4.18-tag1' of git://
git.kernel.org/.../geert/renesas-drivers into clk-renesas
      Merge tag 'meson-clk-4.18-1' of https://github.com/BayLibre/clk-meson
into clk-meson
      Merge tag 'meson-clk-4.18-2' of https://github.com/BayLibre/clk-meson
into clk-meson
      Merge tag 'sunxi-clk-for-4.18' of
https://git.kernel.org/.../sunxi/linux into clk-allwinner
      Merge tag 'v4.18-rockchip-clk-1' of git://
git.kernel.org/.../mmind/linux-rockchip into clk-rockchip
      Merge tag 'tegra-for-4.18-clk' of git://git.kernel.org/.../tegra/linux
into clk-tegra
      clk: Return void from debug_init op
      clk: qcom: Export clk_fabia_pll_configure()
      Merge branches 'clk-warn', 'clk-core', 'clk-spear' and
'clk-qcom-msm8998' into clk-next
      Merge branch 'clk-actions' into clk-next
      Merge branches 'clk-qcom-rpmh', 'clk-npcm7xx', 'clk-of-parent-count'
and 'clk-qcom-rcg-fix' into clk-next
      Merge branches 'clk-stm32mp1', 'clk-samsung', 'clk-uniphier-mpeg',
'clk-stratix10' and 'clk-aspeed' into clk-next
      Merge branches 'clk-hisi-usb', 'clk-silent-bulk', 'clk-mtk-hdmi',
'clk-mtk-mali' and 'clk-imx6ul-ccosr' into clk-next
      Merge branches 'clk-allwinner', 'clk-rockchip', 'clk-tegra',
'clk-berlin' and 'clk-qcom-mmagic' into clk-next
      Merge branches 'clk-imx6sx', 'clk-imx7d-enet' and 'clk-aspeed-24'
into clk-next
      Merge branches 'clk-imx7d', 'clk-hisi-stub', 'clk-mvebu',
'clk-imx6-epit' and 'clk-debugfs-simple' into clk-next
      Merge branches 'clk-match-string', 'clk-ingenic',
'clk-si544-round-fix' and 'clk-bcm-stingray' into clk-next
      Merge branch 'clk-qcom-sdm845' into clk-next
      Merge branch 'clk-qcom-8996-halt' into clk-next
      Merge branches 'clk-davinci-psc-da830', 'clk-renesas',
'clk-at91-recalc', 'clk-davinci' and 'clk-meson' into clk-next
      Merge branch 'clk-imx6ul' into clk-next

Takeshi Kihara (2):
      clk: renesas: r8a77965: Add MSIOF controller clocks
      clk: renesas: Add r8a77990 CPG Core Clock Definitions

Tali Perry (2):
      dt-binding: clk: npcm750: Add binding for Nuvoton NPCM7XX Clock
      clk: npcm7xx: add clock controller

Taniya Das (2):
      dt-bindings: clock: Introduce QCOM RPMh clock bindings
      clk: qcom: Add Global Clock controller (GCC) driver for SDM845

Wei Yongjun (1):
      clk: npcm7xx: fix return value check in npcm7xx_clk_init()

Wolfram Sang (1):
      clk: samsung: simplify getting .drvdata

Yisheng Xie (3):
      clk: rockchip: use match_string() helper
      clk: bcm2835: use match_string() helper
      clk: use match_string() helper

Yixun Lan (5):
      dt-bindings: clock: axg-aoclkc: New binding for Meson-AXG SoC
      dt-bindings: clock: reset: Add AXG AO Clock and Reset Bindings
      clk: meson: migrate to devm_of_clk_add_hw_provider API
      clk: meson: aoclk: refactor common code into dedicated file
      clk: meson: drop CLK_SET_RATE_PARENT flag

Yoshihiro Shimoda (1):
      clk: renesas: cpg-mssr: Add support for R-Car E3

 Documentation/clk.txt                              |    2 +-
 .../bindings/arm/mediatek/mediatek,g3dsys.txt      |   30 +
 .../devicetree/bindings/clock/actions,s900-cmu.txt |   47 +
 .../bindings/clock/amlogic,gxbb-aoclkc.txt         |    1 +
 .../bindings/clock/brcm,iproc-clocks.txt           |   26 +-
 .../bindings/clock/nuvoton,npcm750-clk.txt         |  100 +
 .../devicetree/bindings/clock/qcom,gcc.txt         |    2 +
 .../devicetree/bindings/clock/qcom,rpmh-clk.txt    |   22 +
 .../devicetree/bindings/clock/qcom,videocc.txt     |   19 +
 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   10 +-
 .../devicetree/bindings/clock/rockchip.txt         |   77 -
 .../devicetree/bindings/clock/sunxi-ccu.txt        |    3 +-
 MAINTAINERS                                        |    1 +
 arch/arm/boot/dts/imx7d.dtsi                       |    2 +-
 arch/arm/boot/dts/imx7s.dtsi                       |    2 +-
 drivers/clk/Kconfig                                |    1 +
 drivers/clk/Makefile                               |    2 +
 drivers/clk/actions/Kconfig                        |   14 +
 drivers/clk/actions/Makefile                       |   12 +
 drivers/clk/actions/owl-common.c                   |   89 +
 drivers/clk/actions/owl-common.h                   |   41 +
 drivers/clk/actions/owl-composite.c                |  199 ++
 drivers/clk/actions/owl-composite.h                |  124 +
 drivers/clk/actions/owl-divider.c                  |   94 +
 drivers/clk/actions/owl-divider.h                  |   75 +
 drivers/clk/actions/owl-factor.c                   |  222 ++
 drivers/clk/actions/owl-factor.h                   |   83 +
 drivers/clk/actions/owl-fixed-factor.h             |   28 +
 drivers/clk/actions/owl-gate.c                     |   77 +
 drivers/clk/actions/owl-gate.h                     |   73 +
 drivers/clk/actions/owl-mux.c                      |   60 +
 drivers/clk/actions/owl-mux.h                      |   61 +
 drivers/clk/actions/owl-pll.c                      |  194 ++
 drivers/clk/actions/owl-pll.h                      |   92 +
 drivers/clk/actions/owl-s900.c                     |  721 ++++
 drivers/clk/at91/clk-pll.c                         |   13 +-
 drivers/clk/bcm/clk-bcm2835.c                      |   42 +-
 drivers/clk/bcm/clk-sr.c                           |  135 +-
 drivers/clk/berlin/berlin2-avpll.c                 |   13 +-
 drivers/clk/berlin/berlin2-avpll.h                 |   13 +-
 drivers/clk/berlin/berlin2-div.c                   |   13 +-
 drivers/clk/berlin/berlin2-div.h                   |   13 +-
 drivers/clk/berlin/berlin2-pll.c                   |   13 +-
 drivers/clk/berlin/berlin2-pll.h                   |   13 +-
 drivers/clk/berlin/bg2.c                           |   13 +-
 drivers/clk/berlin/bg2q.c                          |   13 +-
 drivers/clk/berlin/common.h                        |   13 +-
 drivers/clk/clk-aspeed.c                           |   57 +-
 drivers/clk/clk-bulk.c                             |    5 +-
 drivers/clk/clk-npcm7xx.c                          |  656 ++++
 drivers/clk/clk-si544.c                            |    1 +
 drivers/clk/clk-stm32mp1.c                         |   66 +-
 drivers/clk/clk.c                                  |  171 +-
 drivers/clk/davinci/pll-da830.c                    |    5 +-
 drivers/clk/davinci/pll-da850.c                    |   37 +-
 drivers/clk/davinci/pll-dm355.c                    |   22 +-
 drivers/clk/davinci/pll-dm365.c                    |    9 +-
 drivers/clk/davinci/pll-dm644x.c                   |    9 +-
 drivers/clk/davinci/pll-dm646x.c                   |   11 +-
 drivers/clk/davinci/pll.c                          |  314 +-
 drivers/clk/davinci/pll.h                          |   41 +-
 drivers/clk/davinci/psc-da830.c                    |    3 +-
 drivers/clk/davinci/psc-dm355.c                    |    7 +-
 drivers/clk/davinci/psc-dm365.c                    |   22 +-
 drivers/clk/davinci/psc-dm644x.c                   |    3 +-
 drivers/clk/davinci/psc-dm646x.c                   |    3 +-
 drivers/clk/davinci/psc.c                          |   72 +-
 drivers/clk/davinci/psc.h                          |   12 +
 drivers/clk/hisilicon/Kconfig                      |   13 +-
 drivers/clk/hisilicon/crg-hi3798cv200.c            |   17 +
 drivers/clk/imx/clk-imx6q.c                        |    2 +
 drivers/clk/imx/clk-imx6sl.c                       |    2 +-
 drivers/clk/imx/clk-imx6sx.c                       |   17 +-
 drivers/clk/imx/clk-imx6ul.c                       |   20 +-
 drivers/clk/imx/clk-imx7d.c                        |   17 +-
 drivers/clk/ingenic/cgu.c                          |    8 +-
 drivers/clk/ingenic/cgu.h                          |    4 +
 drivers/clk/ingenic/jz4770-cgu.c                   |   49 +-
 drivers/clk/mediatek/Kconfig                       |    6 +
 drivers/clk/mediatek/Makefile                      |    1 +
 drivers/clk/mediatek/clk-mt2701-g3d.c              |   95 +
 drivers/clk/mediatek/clk-mt2701.c                  |    8 +-
 drivers/clk/meson/Kconfig                          |    8 +
 drivers/clk/meson/Makefile                         |    3 +-
 drivers/clk/meson/axg-aoclk.c                      |  164 +
 drivers/clk/meson/axg-aoclk.h                      |   29 +
 drivers/clk/meson/axg.c                            |    4 +
 drivers/clk/meson/clk-audio-divider.c              |   13 +-
 drivers/clk/meson/clk-mpll.c                       |   76 +-
 drivers/clk/meson/clk-pll.c                        |   13 +-
 drivers/clk/meson/clk-regmap.c                     |    6 +-
 drivers/clk/meson/clk-regmap.h                     |    8 +-
 drivers/clk/meson/clkc.h                           |   16 +-
 drivers/clk/meson/gxbb-aoclk-32k.c                 |    3 +-
 drivers/clk/meson/gxbb-aoclk.c                     |  147 +-
 drivers/clk/meson/gxbb-aoclk.h                     |    8 +-
 drivers/clk/meson/gxbb.c                           |  129 +-
 drivers/clk/meson/gxbb.h                           |   58 +-
 drivers/clk/meson/meson-aoclk.c                    |   81 +
 drivers/clk/meson/meson-aoclk.h                    |   34 +
 drivers/clk/meson/meson8b.c                        |   77 +-
 drivers/clk/meson/meson8b.h                        |   18 +-
 drivers/clk/mvebu/clk-corediv.c                    |    2 +-
 drivers/clk/qcom/Kconfig                           |   27 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  302 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |   18 +-
 drivers/clk/qcom/clk-branch.c                      |    7 +-
 drivers/clk/qcom/clk-branch.h                      |    1 +
 drivers/clk/qcom/clk-rcg.h                         |   17 +-
 drivers/clk/qcom/clk-rcg2.c                        |  168 +-
 drivers/clk/qcom/common.c                          |   32 +-
 drivers/clk/qcom/gcc-msm8996.c                     |    8 +-
 drivers/clk/qcom/gcc-msm8998.c                     | 2834 ++++++++++++++++
 drivers/clk/qcom/gcc-sdm845.c                      | 3465
++++++++++++++++++++
 drivers/clk/qcom/gdsc.c                            |  102 +-
 drivers/clk/qcom/gdsc.h                            |    6 +-
 drivers/clk/qcom/mmcc-msm8996.c                    |   22 +-
 drivers/clk/qcom/videocc-sdm845.c                  |  358 ++
 drivers/clk/renesas/Kconfig                        |   10 +
 drivers/clk/renesas/Makefile                       |    2 +
 drivers/clk/renesas/r8a7743-cpg-mssr.c             |    2 +-
 drivers/clk/renesas/r8a7745-cpg-mssr.c             |    2 +-
 drivers/clk/renesas/r8a77470-cpg-mssr.c            |  229 ++
 drivers/clk/renesas/r8a7791-cpg-mssr.c             |    2 +-
 drivers/clk/renesas/r8a7792-cpg-mssr.c             |    2 +-
 drivers/clk/renesas/r8a7794-cpg-mssr.c             |    2 +-
 drivers/clk/renesas/r8a77965-cpg-mssr.c            |    4 +
 drivers/clk/renesas/r8a77980-cpg-mssr.c            |    2 +-
 drivers/clk/renesas/r8a77990-cpg-mssr.c            |  289 ++
 drivers/clk/renesas/rcar-gen2-cpg.c                |   24 +
 drivers/clk/renesas/renesas-cpg-mssr.c             |   12 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |    2 +
 drivers/clk/rockchip/Makefile                      |    1 -
 drivers/clk/rockchip/clk-rockchip.c                |   98 -
 drivers/clk/rockchip/clk.c                         |   16 +-
 drivers/clk/samsung/clk-s3c2410-dclk.c             |    6 +-
 drivers/clk/socfpga/clk-s10.c                      |   40 +-
 drivers/clk/spear/spear6xx_clock.c                 |    2 +-
 drivers/clk/sunxi-ng/Kconfig                       |    5 +
 drivers/clk/sunxi-ng/Makefile                      |    1 +
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c             |  207 ++
 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h             |   19 +
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c               |   72 +-
 drivers/clk/tegra/clk-dfll.c                       |   42 +-
 drivers/clk/tegra/clk-tegra114.c                   |    2 +-
 drivers/clk/tegra/clk-tegra124.c                   |    2 +-
 drivers/clk/tegra/clk-tegra20.c                    |   52 +-
 drivers/clk/tegra/clk-tegra210.c                   |    2 +-
 drivers/clk/tegra/clk-tegra30.c                    |    2 +-
 drivers/clk/tegra/clk.c                            |    5 +-
 drivers/clk/tegra/clk.h                            |    2 +-
 drivers/clk/uniphier/clk-uniphier-sys.c            |    5 +
 drivers/clocksource/timer-sp804.c                  |    3 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c              |    4 +-
 drivers/soc/rockchip/pm_domains.c                  |    4 +-
 drivers/soc/tegra/pmc.c                            |    3 +-
 include/dt-bindings/clock/actions,s900-cmu.h       |  129 +
 include/dt-bindings/clock/aspeed-clock.h           |    4 +-
 include/dt-bindings/clock/axg-aoclkc.h             |   26 +
 include/dt-bindings/clock/bcm-sr.h                 |   24 +-
 include/dt-bindings/clock/gxbb-clkc.h              |    2 +
 include/dt-bindings/clock/histb-clock.h            |    8 +
 include/dt-bindings/clock/imx6qdl-clock.h          |    4 +-
 include/dt-bindings/clock/imx6sx-clock.h           |    6 +-
 include/dt-bindings/clock/imx6ul-clock.h           |   33 +-
 include/dt-bindings/clock/imx7d-clock.h            |    4 +-
 include/dt-bindings/clock/meson8b-clkc.h           |    1 +
 include/dt-bindings/clock/mt2701-clk.h             |   20 +-
 include/dt-bindings/clock/nuvoton,npcm7xx-clock.h  |   44 +
 include/dt-bindings/clock/qcom,gcc-msm8998.h       |  208 ++
 include/dt-bindings/clock/qcom,gcc-sdm845.h        |  239 ++
 include/dt-bindings/clock/qcom,rpmh.h              |   22 +
 include/dt-bindings/clock/qcom,videocc-sdm845.h    |   35 +
 include/dt-bindings/clock/r8a77470-cpg-mssr.h      |   36 +
 include/dt-bindings/clock/r8a77990-cpg-mssr.h      |   62 +
 include/dt-bindings/clock/stm32mp1-clks.h          |    4 +-
 include/dt-bindings/clock/sun50i-h6-r-ccu.h        |   24 +
 include/dt-bindings/reset/axg-aoclkc.h             |   20 +
 include/dt-bindings/reset/mt2701-resets.h          |    3 +
 include/dt-bindings/reset/sun50i-h6-r-ccu.h        |   17 +
 include/linux/clk-provider.h                       |   23 +-
 include/linux/clk/davinci.h                        |   40 +
 include/linux/of_clk.h                             |   30 +
 184 files changed, 13867 insertions(+), 1345 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.txt
 create mode 100644
Documentation/devicetree/bindings/clock/actions,s900-cmu.txt
 create mode 100644
Documentation/devicetree/bindings/clock/nuvoton,npcm750-clk.txt
 create mode 100644
Documentation/devicetree/bindings/clock/qcom,rpmh-clk.txt
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,videocc.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/rockchip.txt
 create mode 100644 drivers/clk/actions/Kconfig
 create mode 100644 drivers/clk/actions/Makefile
 create mode 100644 drivers/clk/actions/owl-common.c
 create mode 100644 drivers/clk/actions/owl-common.h
 create mode 100644 drivers/clk/actions/owl-composite.c
 create mode 100644 drivers/clk/actions/owl-composite.h
 create mode 100644 drivers/clk/actions/owl-divider.c
 create mode 100644 drivers/clk/actions/owl-divider.h
 create mode 100644 drivers/clk/actions/owl-factor.c
 create mode 100644 drivers/clk/actions/owl-factor.h
 create mode 100644 drivers/clk/actions/owl-fixed-factor.h
 create mode 100644 drivers/clk/actions/owl-gate.c
 create mode 100644 drivers/clk/actions/owl-gate.h
 create mode 100644 drivers/clk/actions/owl-mux.c
 create mode 100644 drivers/clk/actions/owl-mux.h
 create mode 100644 drivers/clk/actions/owl-pll.c
 create mode 100644 drivers/clk/actions/owl-pll.h
 create mode 100644 drivers/clk/actions/owl-s900.c
 create mode 100644 drivers/clk/clk-npcm7xx.c
 create mode 100644 drivers/clk/mediatek/clk-mt2701-g3d.c
 create mode 100644 drivers/clk/meson/axg-aoclk.c
 create mode 100644 drivers/clk/meson/axg-aoclk.h
 create mode 100644 drivers/clk/meson/meson-aoclk.c
 create mode 100644 drivers/clk/meson/meson-aoclk.h
 create mode 100644 drivers/clk/qcom/gcc-msm8998.c
 create mode 100644 drivers/clk/qcom/gcc-sdm845.c
 create mode 100644 drivers/clk/qcom/videocc-sdm845.c
 create mode 100644 drivers/clk/renesas/r8a77470-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/r8a77990-cpg-mssr.c
 delete mode 100644 drivers/clk/rockchip/clk-rockchip.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h
 create mode 100644 include/dt-bindings/clock/actions,s900-cmu.h
 create mode 100644 include/dt-bindings/clock/axg-aoclkc.h
 create mode 100644 include/dt-bindings/clock/nuvoton,npcm7xx-clock.h
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8998.h
 create mode 100644 include/dt-bindings/clock/qcom,gcc-sdm845.h
 create mode 100644 include/dt-bindings/clock/qcom,rpmh.h
 create mode 100644 include/dt-bindings/clock/qcom,videocc-sdm845.h
 create mode 100644 include/dt-bindings/clock/r8a77470-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/r8a77990-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/sun50i-h6-r-ccu.h
 create mode 100644 include/dt-bindings/reset/axg-aoclkc.h
 create mode 100644 include/dt-bindings/reset/sun50i-h6-r-ccu.h
 create mode 100644 include/linux/clk/davinci.h
 create mode 100644 include/linux/of_clk.h

--000000000000521f4c056e398139
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Please note I&#39;m sending this from my <a href=3D"h=
ttp://chromium.org">chromium.org</a> account because I&#39;m traveling</div=
><div>since the start of the merge window and I don&#39;t want to setup my =
korg smtp on this</div><div>computer.</div><div><br></div><div>The followin=
g changes since commit 60cc43fc888428bb2f18f08997432d426a243338:</div><div>=
<br></div><div>=C2=A0 Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)</div><div>=
<br></div><div>are available in the Git repository at:</div><div><br></div>=
<div>=C2=A0 git://<a href=3D"http://git.kernel.org/pub/scm/linux/kernel/git=
/clk/linux.git">git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git</a> t=
ags/clk-for-linus</div><div><br></div><div>for you to fetch changes up to 5=
5913c2d33307ac11797531ebbe7c122a73cc0fd:</div><div><br></div><div>=C2=A0 Me=
rge branch &#39;clk-imx6ul&#39; into clk-next (2018-06-04 12:41:57 -0700)</=
div><div><br></div><div>---------------------------------------------------=
-------------</div><div>This time we have a good set of changes to the core=
 framework that do some</div><div>general cleanups, but nothing too major. =
The majority of the diff goes to</div><div>two SoCs, Actions Semi and Qualc=
omm. A brand new driver is introduced for</div><div>Actions Semi so it take=
s up some lines to add all the different types, and</div><div>the Qualcomm =
diff is there because we add support for two SoCs and it&#39;s quite</div><=
div>a bit of data.</div><div><br></div><div>Otherwise the big driver update=
s are on TI Davinci and Amlogic platforms. And</div><div>then the long tail=
 of driver updates for various fixes and stuff follows</div><div>after that=
.</div><div><br></div><div>Core:</div><div>=C2=A0- debugfs cleanups removin=
g error checking and an unused provider API</div><div>=C2=A0- Removal of a =
clk init typedef that isn&#39;t used</div><div>=C2=A0- Usage of match_strin=
g() to simplify parent string name matching</div><div>=C2=A0- OF clk helper=
s moved to their own file (linux/of_clk.h)</div><div>=C2=A0- Make clk warni=
ngs more readable across kernel versions</div><div><br></div><div>New Drive=
rs:</div><div>=C2=A0- Qualcomm SDM845 GCC and Video clk controllers</div><d=
iv>=C2=A0- Qualcomm MSM8998 GCC</div><div>=C2=A0- Actions Semi S900 SoC sup=
port</div><div>=C2=A0- Nuvoton npcm750 microcontroller clks</div><div>=C2=
=A0- Amlogic axg AO clock controller</div><div><br></div><div>Removed Drive=
rs:</div><div>=C2=A0- Deprecated Rockchip clk-gate driver</div><div><br></d=
iv><div>Updates:</div><div>=C2=A0- debugfs functions stopped checking retur=
n values</div><div>=C2=A0- Support for the MSIOF module clocks on Rensas R-=
Car M3-N</div><div>=C2=A0- Support for the new Rensas RZ/G1C and R-Car E3 S=
oCs</div><div>=C2=A0- Qualcomm GDSC, RCG, and PLL updates for clk changes i=
n new SoCs</div><div>=C2=A0- Berlin and Amlogic SPDX tagging</div><div>=C2=
=A0- Usage of of_clk_get_parent_count() in more places</div><div>=C2=A0- Pr=
oper implementation of the CDEV1/2 clocks on Tegra20</div><div>=C2=A0- Allw=
inner H6 PRCM clock support and R40 EMAC support</div><div>=C2=A0- Add crit=
ical flag to meson8b&#39;s fdiv2 as temporary fixup for ethernet</div><div>=
=C2=A0- Round closest support for meson&#39;s mpll driver</div><div>=C2=A0-=
 Support for meson8b nand clocks and gxbb video decoder clocks</div><div>=
=C2=A0- Mediatek mali clks</div><div>=C2=A0- STM32MP1 fixes</div><div>=C2=
=A0- Uniphier LD11/LD20 stream demux system clock</div><div><br></div><div>=
----------------------------------------------------------------</div><div>=
Amit Nischal (10):</div><div>=C2=A0 =C2=A0 =C2=A0 clk: qcom: Clear hardware=
 clock control bit of RCG</div><div>=C2=A0 =C2=A0 =C2=A0 clk: qcom: Add sup=
port for controlling Fabia PLL</div><div>=C2=A0 =C2=A0 =C2=A0 clk: qcom: gd=
sc: Add support to reset AON and block reset logic</div><div>=C2=A0 =C2=A0 =
=C2=A0 clk: qcom: gdsc: Add support to poll for higher timeout value</div><=
div>=C2=A0 =C2=A0 =C2=A0 clk: qcom: gdsc: Add support to poll CFG register =
to check GDSC state</div><div>=C2=A0 =C2=A0 =C2=A0 clk: qcom: Configure the=
 RCGs to a safe source as needed</div><div>=C2=A0 =C2=A0 =C2=A0 clk: qcom: =
Add DT bindings for SDM845 gcc clock controller</div><div>=C2=A0 =C2=A0 =C2=
=A0 clk: qcom: Add support for BRANCH_HALT_SKIP flag for branch clocks</div=
><div>=C2=A0 =C2=A0 =C2=A0 dt-bindings: clock: Introduce QCOM Video clock b=
indings</div><div>=C2=A0 =C2=A0 =C2=A0 clk: qcom: Add video clock controlle=
r driver for SDM845</div><div><br></div><div>Anson Huang (6):</div><div>=C2=
=A0 =C2=A0 =C2=A0 clk: imx6sx: add missing lvds2 clock to the clock tree</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 clk: imx6sx: disable unnecessary clocks during=
 clock initialization</div><div>=C2=A0 =C2=A0 =C2=A0 clk: imx6sl: correct o=
cram_podf clock type</div><div>=C2=A0 =C2=A0 =C2=A0 clk: imx7d: correct ene=
t phy ref clock gates</div><div>=C2=A0 =C2=A0 =C2=A0 clk: imx7d: correct en=
et clock CCGR registers</div><div>=C2=A0 =C2=A0 =C2=A0 ARM: dts: imx7: corr=
ect enet ipg clock</div><div><br></div><div>Biju Das (2):</div><div>=C2=A0 =
=C2=A0 =C2=A0 clk: renesas: Add r8a77470 CPG Core Clock Definitions</div><d=
iv>=C2=A0 =C2=A0 =C2=A0 clk: renesas: cpg-mssr: Add r8a77470 support</div><=
div><br></div><div>Bjorn Andersson (1):</div><div>=C2=A0 =C2=A0 =C2=A0 clk:=
 qcom: gcc-msm8996: Disable halt check on UFS clocks</div><div><br></div><d=
iv>Chris Packham (1):</div><div>=C2=A0 =C2=A0 =C2=A0 clk: mvebu: use correc=
t bit for 98DX3236 NAND</div><div><br></div><div>Christophe JAILLET (1):</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 clk: stm32mp1: Fix a memory leak in &#39;clk_s=
tm32_register_gate_ops()&#39;</div><div><br></div><div>Colin Didier (1):</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 clk: imx6: add EPIT clock support</div><div><b=
r></div><div>Daniel Lezcano (1):</div><div>=C2=A0 =C2=A0 =C2=A0 clk/driver/=
hisi: Consolidate the Kconfig for the CLOCK_STUB</div><div><br></div><div>D=
avid Lechner (7):</div><div>=C2=A0 =C2=A0 =C2=A0 clk: davinci: pll-dm355: d=
rop pll2_sysclk2</div><div>=C2=A0 =C2=A0 =C2=A0 clk: davinci: pll-dm355: fi=
x SYSCLKn parent names</div><div>=C2=A0 =C2=A0 =C2=A0 clk: davinci: psc-dm3=
55: fix ASP0/1 clkdev lookups</div><div>=C2=A0 =C2=A0 =C2=A0 clk: davinci: =
pll: allow dev =3D=3D NULL</div><div>=C2=A0 =C2=A0 =C2=A0 clk: davinci: da8=
50-pll: change PLL0 to CLK_OF_DECLARE</div><div>=C2=A0 =C2=A0 =C2=A0 clk: d=
avinci: psc: allow for dev =3D=3D NULL</div><div>=C2=A0 =C2=A0 =C2=A0 clk: =
davinci: Fix link errors when not all SoCs are enabled</div><div><br></div>=
<div>Dinh Nguyen (2):</div><div>=C2=A0 =C2=A0 =C2=A0 clk: socfpga: stratix1=
0: use platform driver APIs</div><div>=C2=A0 =C2=A0 =C2=A0 clk: socfpga: st=
ratix10: suppress unbinding platform&#39;s clock driver</div><div><br></div=
><div>Dmitry Osipenko (3):</div><div>=C2=A0 =C2=A0 =C2=A0 clk: tegra20: Add=
 DEV1/DEV2 OSC dividers</div><div>=C2=A0 =C2=A0 =C2=A0 clk: tegra20: Correc=
t parents of CDEV1/2 clocks</div><div>=C2=A0 =C2=A0 =C2=A0 clk: tegra: Add =
quirk for getting CDEV1/2 clocks on Tegra20</div><div><br></div><div>Evan G=
reen (1):</div><div>=C2=A0 =C2=A0 =C2=A0 clk: qcom: Base rcg parent rate of=
f plan frequency</div><div><br></div><div>Fabio Estevam (1):</div><div>=C2=
=A0 =C2=A0 =C2=A0 clk: Print the clock name and warning cause</div><div><br=
></div><div>Gabriel Fernandez (7):</div><div>=C2=A0 =C2=A0 =C2=A0 clk: stm3=
2mp1: add missing static</div><div>=C2=A0 =C2=A0 =C2=A0 clk: stm32mp1: remo=
ve unused dfsdm_src[] const</div><div>=C2=A0 =C2=A0 =C2=A0 clk: stm32mp1: f=
ix SAI3 &amp; SAI4 clocks</div><div>=C2=A0 =C2=A0 =C2=A0 clk: stm32mp1: add=
 missing tzc2 clock</div><div>=C2=A0 =C2=A0 =C2=A0 clk: stm32mp1: set stgen=
_k clock as critical</div><div>=C2=A0 =C2=A0 =C2=A0 clk: stm32mp1: remove c=
k_apb_dbg clock</div><div>=C2=A0 =C2=A0 =C2=A0 clk: stm32mp1: Add CLK_IGNOR=
E_UNUSED to ck_sys_dbg clock</div><div><br></div><div>Geert Uytterhoeven (1=
3):</div><div>=C2=A0 =C2=A0 =C2=A0 clk: renesas: r8a7743: Fix LB clock divi=
der</div><div>=C2=A0 =C2=A0 =C2=A0 clk: renesas: r8a7745: Fix LB clock divi=
der</div><div>=C2=A0 =C2=A0 =C2=A0 clk: renesas: r8a7791/r8a7793: Fix LB cl=
ock divider</div><div>=C2=A0 =C2=A0 =C2=A0 clk: renesas: r8a7792: Fix LB cl=
ock divider</div><div>=C2=A0 =C2=A0 =C2=A0 clk: renesas: r8a7794: Fix LB cl=
ock divider</div><div>=C2=A0 =C2=A0 =C2=A0 clk: renesas: r8a77980: Correct =
parent clock of PCIEC0</div><div>=C2=A0 =C2=A0 =C2=A0 clk: renesas: rcar-ge=
n2: Centralize quirks handling</div><div>=C2=A0 =C2=A0 =C2=A0 clk: Remove c=
lk_init_cb typedef</div><div>=C2=A0 =C2=A0 =C2=A0 clk: Extract OF clock hel=
pers in &lt;linux/of_clk.h&gt;</div><div>=C2=A0 =C2=A0 =C2=A0 ARM: timer-sp=
: Use of_clk_get_parent_count() instead of open coding</div><div>=C2=A0 =C2=
=A0 =C2=A0 soc: rockchip: power-domain: Use of_clk_get_parent_count() inste=
ad of open coding</div><div>=C2=A0 =C2=A0 =C2=A0 soc/tegra: pmc: Use of_clk=
_get_parent_count() instead of open coding</div><div>=C2=A0 =C2=A0 =C2=A0 p=
inctrl: sunxi: Use of_clk_get_parent_count() instead of open coding</div><d=
iv><br></div><div>Greg Kroah-Hartman (5):</div><div>=C2=A0 =C2=A0 =C2=A0 cl=
k: no need to check return value of debugfs_create functions</div><div>=C2=
=A0 =C2=A0 =C2=A0 clk: bcm2835: no need to check return value of debugfs_cr=
eate functions</div><div>=C2=A0 =C2=A0 =C2=A0 clk: davinci: no need to chec=
k return value of debugfs_create functions</div><div>=C2=A0 =C2=A0 =C2=A0 c=
lk: tegra: no need to check return value of debugfs_create functions</div><=
div>=C2=A0 =C2=A0 =C2=A0 clk: remove clk_debugfs_add_file()</div><div><br><=
/div><div>Heiko Stuebner (1):</div><div>=C2=A0 =C2=A0 =C2=A0 clk: rockchip:=
 remove deprecated gate-clk code and dt-binding</div><div><br></div><div>Ic=
enowy Zheng (3):</div><div>=C2=A0 =C2=A0 =C2=A0 clk: sunxi-ng: add support =
for H6 PRCM CCU</div><div>=C2=A0 =C2=A0 =C2=A0 clk: sunxi-ng: r40: rewrite =
init code to a platform driver</div><div>=C2=A0 =C2=A0 =C2=A0 clk: sunxi-ng=
: r40: export a regmap to access the GMAC register</div><div><br></div><div=
>Jae Hyun Yoo (1):</div><div>=C2=A0 =C2=A0 =C2=A0 clk:aspeed: Fix reset bit=
s for PCI/VGA and PECI</div><div><br></div><div>Jerome Brunet (5):</div><di=
v>=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;next/bindings&#39; into next/drive=
rs</div><div>=C2=A0 =C2=A0 =C2=A0 clk: bulk: silently error out on EPROBE_D=
EFER</div><div>=C2=A0 =C2=A0 =C2=A0 clk: meson: use SPDX license identifier=
s consistently</div><div>=C2=A0 =C2=A0 =C2=A0 clk: meson: mpll: add round c=
losest support</div><div>=C2=A0 =C2=A0 =C2=A0 clk: meson: axg: let mpll clo=
cks round closest</div><div><br></div><div>Jianguo Sun (1):</div><div>=C2=
=A0 =C2=A0 =C2=A0 clk: hisilicon: add missing usb3 clocks for Hi3798CV200 S=
oC</div><div><br></div><div>Jisheng Zhang (1):</div><div>=C2=A0 =C2=A0 =C2=
=A0 clk: berlin: switch to SPDX license identifier</div><div><br></div><div=
>Joel Stanley (1):</div><div>=C2=A0 =C2=A0 =C2=A0 clk: aspeed: Support seco=
nd reset register</div><div><br></div><div>Joonwoo Park (1):</div><div>=C2=
=A0 =C2=A0 =C2=A0 clk: qcom: Add MSM8998 Global Clock Control (GCC) driver<=
/div><div><br></div><div>Katsuhiro Suzuki (1):</div><div>=C2=A0 =C2=A0 =C2=
=A0 clk: uniphier: add LD11/LD20 stream demux system clock</div><div><br></=
div><div>Lei YU (1):</div><div>=C2=A0 =C2=A0 =C2=A0 clk: aspeed: Add 24MHz =
fixed clock</div><div><br></div><div>Manivannan Sadhasivam (10):</div><div>=
=C2=A0 =C2=A0 =C2=A0 dt-bindings: clock: Add Actions S900 clock bindings</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 clk: actions: Add common clock driver support<=
/div><div>=C2=A0 =C2=A0 =C2=A0 clk: actions: Add gate clock support</div><d=
iv>=C2=A0 =C2=A0 =C2=A0 clk: actions: Add mux clock support</div><div>=C2=
=A0 =C2=A0 =C2=A0 clk: actions: Add divider clock support</div><div>=C2=A0 =
=C2=A0 =C2=A0 clk: actions: Add factor clock support</div><div>=C2=A0 =C2=
=A0 =C2=A0 clk: actions: Add fixed factor clock support</div><div>=C2=A0 =
=C2=A0 =C2=A0 clk: actions: Add composite clock support</div><div>=C2=A0 =
=C2=A0 =C2=A0 clk: actions: Add pll clock support</div><div>=C2=A0 =C2=A0 =
=C2=A0 clk: actions: Add S900 SoC clock support</div><div><br></div><div>Ma=
nu Gautam (1):</div><div>=C2=A0 =C2=A0 =C2=A0 clk: msm8996-gcc: Mark halt c=
heck as no-op for USB/PCIE pipe_clk</div><div><br></div><div>Marcin Ziemian=
owicz (1):</div><div>=C2=A0 =C2=A0 =C2=A0 clk: at91: PLL recalc_rate() now =
using cached MUL and DIV values</div><div><br></div><div>Martin Blumensting=
l (3):</div><div>=C2=A0 =C2=A0 =C2=A0 dt-bindings: clock: meson8b: export t=
he NAND clock</div><div>=C2=A0 =C2=A0 =C2=A0 clk: meson: meson8b: add suppo=
rt for the NAND clocks</div><div>=C2=A0 =C2=A0 =C2=A0 clk: meson: meson8b: =
mark fclk_div2 gate clocks as CLK_IS_CRITICAL</div><div><br></div><div>Maxi=
me Jourdan (2):</div><div>=C2=A0 =C2=A0 =C2=A0 clk: meson: gxbb: expose VDE=
C_1 and VDEC_HEVC clocks</div><div>=C2=A0 =C2=A0 =C2=A0 clk: meson: gxbb: a=
dd the video decoder clocks</div><div><br></div><div>Michael Trimarchi (1):=
</div><div>=C2=A0 =C2=A0 =C2=A0 clk: imx: Add new clo01 and clo2 controlled=
 by CCOSR</div><div><br></div><div>Mike Looijmans (1):</div><div>=C2=A0 =C2=
=A0 =C2=A0 clk-si544: Properly round requested frequency to nearest match</=
div><div><br></div><div>Paul Cercueil (6):</div><div>=C2=A0 =C2=A0 =C2=A0 c=
lk: ingenic: Add support for clocks whose gate bit is inverted</div><div>=
=C2=A0 =C2=A0 =C2=A0 clk: ingenic: Support specifying &quot;wait for clock =
stable&quot; delay</div><div>=C2=A0 =C2=A0 =C2=A0 clk: ingenic: jz4770: Cha=
nge OTG from custom to standard gated clock</div><div>=C2=A0 =C2=A0 =C2=A0 =
clk: ingenic: jz4770: Modify C1CLK clock to disable CPU clock stop on idle<=
/div><div>=C2=A0 =C2=A0 =C2=A0 clk: ingenic: jz4770: Enable power of AHB1 b=
us after ungating VPU clock</div><div>=C2=A0 =C2=A0 =C2=A0 clk: ingenic: jz=
4770: Add 150us delay after enabling VPU clock</div><div><br></div><div>Pra=
mod Kumar (2):</div><div>=C2=A0 =C2=A0 =C2=A0 dt-bindings: clk: Update Stin=
gray binding doc</div><div>=C2=A0 =C2=A0 =C2=A0 clk: bcm: Update and add St=
ingray clock entries</div><div><br></div><div>Qiufang Dai (1):</div><div>=
=C2=A0 =C2=A0 =C2=A0 clk: meson-axg: Add AO Clock and Reset controller driv=
er</div><div><br></div><div>Quentin Schulz (1):</div><div>=C2=A0 =C2=A0 =C2=
=A0 clk: spear: fix WDT clock definition on SPEAr600</div><div><br></div><d=
iv>Rajendra Nayak (3):</div><div>=C2=A0 =C2=A0 =C2=A0 clk: qcom: gdsc: Add =
support for ALWAYS_ON gdscs</div><div>=C2=A0 =C2=A0 =C2=A0 clk: qcom: Regis=
ter the gdscs before the clocks</div><div>=C2=A0 =C2=A0 =C2=A0 clk: qcom: m=
mcc-msm8996: leave all mmagic gdscs and clocks always enabled</div><div><br=
></div><div>Rui Miguel Silva (2):</div><div>=C2=A0 =C2=A0 =C2=A0 clk: imx7d=
: fix mipi dphy div parent</div><div>=C2=A0 =C2=A0 =C2=A0 clk: imx7d: reset=
 parent for mipi csi root</div><div><br></div><div>Ryder Lee (1):</div><div=
>=C2=A0 =C2=A0 =C2=A0 clk: mediatek: correct the clocks for MT2701 HDMI PHY=
 module</div><div><br></div><div>Sean Wang (4):</div><div>=C2=A0 =C2=A0 =C2=
=A0 dt-bindings: clock: mediatek: add g3dsys bindings</div><div>=C2=A0 =C2=
=A0 =C2=A0 dt-bindings: clock: mediatek: add entry for Mali-450 node to ref=
er</div><div>=C2=A0 =C2=A0 =C2=A0 dt-bindings: reset: mediatek: add entry f=
or Mali-450 node to refer</div><div>=C2=A0 =C2=A0 =C2=A0 clk: mediatek: add=
 g3dsys support for MT2701 and MT7623</div><div><br></div><div>Sekhar Nori =
(3):</div><div>=C2=A0 =C2=A0 =C2=A0 clk: davinci: psc-da830: fix USB0 48MHz=
 PHY clock registration</div><div>=C2=A0 =C2=A0 =C2=A0 clk: davinci: pll-dm=
646x: keep PLL2 SYSCLK1 always enabled</div><div>=C2=A0 =C2=A0 =C2=A0 clk: =
davinci: psc-dm365: fix few clocks</div><div><br></div><div>Stefan Agner (1=
):</div><div>=C2=A0 =C2=A0 =C2=A0 clk: imx6ul: fix periph clk2 clock mux se=
lection</div><div><br></div><div>Stephen Boyd (22):</div><div>=C2=A0 =C2=A0=
 =C2=A0 clk: qcom: Simplify gdsc status checking logic</div><div>=C2=A0 =C2=
=A0 =C2=A0 Merge tag &#39;clk-renesas-for-v4.18-tag1&#39; of git://<a href=
=3D"http://git.kernel.org/.../geert/renesas-drivers">git.kernel.org/.../gee=
rt/renesas-drivers</a> into clk-renesas</div><div>=C2=A0 =C2=A0 =C2=A0 Merg=
e tag &#39;meson-clk-4.18-1&#39; of <a href=3D"https://github.com/BayLibre/=
clk-meson">https://github.com/BayLibre/clk-meson</a> into clk-meson</div><d=
iv>=C2=A0 =C2=A0 =C2=A0 Merge tag &#39;meson-clk-4.18-2&#39; of <a href=3D"=
https://github.com/BayLibre/clk-meson">https://github.com/BayLibre/clk-meso=
n</a> into clk-meson</div><div>=C2=A0 =C2=A0 =C2=A0 Merge tag &#39;sunxi-cl=
k-for-4.18&#39; of <a href=3D"https://git.kernel.org/.../sunxi/linux">https=
://git.kernel.org/.../sunxi/linux</a> into clk-allwinner</div><div>=C2=A0 =
=C2=A0 =C2=A0 Merge tag &#39;v4.18-rockchip-clk-1&#39; of git://<a href=3D"=
http://git.kernel.org/.../mmind/linux-rockchip">git.kernel.org/.../mmind/li=
nux-rockchip</a> into clk-rockchip</div><div>=C2=A0 =C2=A0 =C2=A0 Merge tag=
 &#39;tegra-for-4.18-clk&#39; of git://<a href=3D"http://git.kernel.org/...=
/tegra/linux">git.kernel.org/.../tegra/linux</a> into clk-tegra</div><div>=
=C2=A0 =C2=A0 =C2=A0 clk: Return void from debug_init op</div><div>=C2=A0 =
=C2=A0 =C2=A0 clk: qcom: Export clk_fabia_pll_configure()</div><div>=C2=A0 =
=C2=A0 =C2=A0 Merge branches &#39;clk-warn&#39;, &#39;clk-core&#39;, &#39;c=
lk-spear&#39; and &#39;clk-qcom-msm8998&#39; into clk-next</div><div>=C2=A0=
 =C2=A0 =C2=A0 Merge branch &#39;clk-actions&#39; into clk-next</div><div>=
=C2=A0 =C2=A0 =C2=A0 Merge branches &#39;clk-qcom-rpmh&#39;, &#39;clk-npcm7=
xx&#39;, &#39;clk-of-parent-count&#39; and &#39;clk-qcom-rcg-fix&#39; into =
clk-next</div><div>=C2=A0 =C2=A0 =C2=A0 Merge branches &#39;clk-stm32mp1&#3=
9;, &#39;clk-samsung&#39;, &#39;clk-uniphier-mpeg&#39;, &#39;clk-stratix10&=
#39; and &#39;clk-aspeed&#39; into clk-next</div><div>=C2=A0 =C2=A0 =C2=A0 =
Merge branches &#39;clk-hisi-usb&#39;, &#39;clk-silent-bulk&#39;, &#39;clk-=
mtk-hdmi&#39;, &#39;clk-mtk-mali&#39; and &#39;clk-imx6ul-ccosr&#39; into c=
lk-next</div><div>=C2=A0 =C2=A0 =C2=A0 Merge branches &#39;clk-allwinner&#3=
9;, &#39;clk-rockchip&#39;, &#39;clk-tegra&#39;, &#39;clk-berlin&#39; and &=
#39;clk-qcom-mmagic&#39; into clk-next</div><div>=C2=A0 =C2=A0 =C2=A0 Merge=
 branches &#39;clk-imx6sx&#39;, &#39;clk-imx7d-enet&#39; and &#39;clk-aspee=
d-24&#39; into clk-next</div><div>=C2=A0 =C2=A0 =C2=A0 Merge branches &#39;=
clk-imx7d&#39;, &#39;clk-hisi-stub&#39;, &#39;clk-mvebu&#39;, &#39;clk-imx6=
-epit&#39; and &#39;clk-debugfs-simple&#39; into clk-next</div><div>=C2=A0 =
=C2=A0 =C2=A0 Merge branches &#39;clk-match-string&#39;, &#39;clk-ingenic&#=
39;, &#39;clk-si544-round-fix&#39; and &#39;clk-bcm-stingray&#39; into clk-=
next</div><div>=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;clk-qcom-sdm845&#39; =
into clk-next</div><div>=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;clk-qcom-899=
6-halt&#39; into clk-next</div><div>=C2=A0 =C2=A0 =C2=A0 Merge branches &#3=
9;clk-davinci-psc-da830&#39;, &#39;clk-renesas&#39;, &#39;clk-at91-recalc&#=
39;, &#39;clk-davinci&#39; and &#39;clk-meson&#39; into clk-next</div><div>=
=C2=A0 =C2=A0 =C2=A0 Merge branch &#39;clk-imx6ul&#39; into clk-next</div><=
div><br></div><div>Takeshi Kihara (2):</div><div>=C2=A0 =C2=A0 =C2=A0 clk: =
renesas: r8a77965: Add MSIOF controller clocks</div><div>=C2=A0 =C2=A0 =C2=
=A0 clk: renesas: Add r8a77990 CPG Core Clock Definitions</div><div><br></d=
iv><div>Tali Perry (2):</div><div>=C2=A0 =C2=A0 =C2=A0 dt-binding: clk: npc=
m750: Add binding for Nuvoton NPCM7XX Clock</div><div>=C2=A0 =C2=A0 =C2=A0 =
clk: npcm7xx: add clock controller</div><div><br></div><div>Taniya Das (2):=
</div><div>=C2=A0 =C2=A0 =C2=A0 dt-bindings: clock: Introduce QCOM RPMh clo=
ck bindings</div><div>=C2=A0 =C2=A0 =C2=A0 clk: qcom: Add Global Clock cont=
roller (GCC) driver for SDM845</div><div><br></div><div>Wei Yongjun (1):</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 clk: npcm7xx: fix return value check in npcm7x=
x_clk_init()</div><div><br></div><div>Wolfram Sang (1):</div><div>=C2=A0 =
=C2=A0 =C2=A0 clk: samsung: simplify getting .drvdata</div><div><br></div><=
div>Yisheng Xie (3):</div><div>=C2=A0 =C2=A0 =C2=A0 clk: rockchip: use matc=
h_string() helper</div><div>=C2=A0 =C2=A0 =C2=A0 clk: bcm2835: use match_st=
ring() helper</div><div>=C2=A0 =C2=A0 =C2=A0 clk: use match_string() helper=
</div><div><br></div><div>Yixun Lan (5):</div><div>=C2=A0 =C2=A0 =C2=A0 dt-=
bindings: clock: axg-aoclkc: New binding for Meson-AXG SoC</div><div>=C2=A0=
 =C2=A0 =C2=A0 dt-bindings: clock: reset: Add AXG AO Clock and Reset Bindin=
gs</div><div>=C2=A0 =C2=A0 =C2=A0 clk: meson: migrate to devm_of_clk_add_hw=
_provider API</div><div>=C2=A0 =C2=A0 =C2=A0 clk: meson: aoclk: refactor co=
mmon code into dedicated file</div><div>=C2=A0 =C2=A0 =C2=A0 clk: meson: dr=
op CLK_SET_RATE_PARENT flag</div><div><br></div><div>Yoshihiro Shimoda (1):=
</div><div>=C2=A0 =C2=A0 =C2=A0 clk: renesas: cpg-mssr: Add support for R-C=
ar E3</div><div><br></div><div>=C2=A0Documentation/clk.txt=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-</div><div>=C2=A0.../bindings/arm/mediatek=
/mediatek,g3dsys.txt=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A030 +</div><div>=C2=
=A0.../devicetree/bindings/clock/actions,s900-cmu.txt |=C2=A0 =C2=A047 +</d=
iv><div>=C2=A0.../bindings/clock/amlogic,gxbb-aoclkc.txt=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +</div><div>=C2=A0.../bindings/clock/brcm=
,iproc-clocks.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A026 =
+-</div><div>=C2=A0.../bindings/clock/nuvoton,npcm750-clk.txt=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 100 +</div><div>=C2=A0.../devicetree/bindings/c=
lock/qcom,gcc.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +</div>=
<div>=C2=A0.../devicetree/bindings/clock/qcom,rpmh-clk.txt=C2=A0 =C2=A0 |=
=C2=A0 =C2=A022 +</div><div>=C2=A0.../devicetree/bindings/clock/qcom,videoc=
c.txt=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A019 +</div><div>=C2=A0.../devicetree/=
bindings/clock/renesas,cpg-mssr.txt |=C2=A0 =C2=A010 +-</div><div>=C2=A0...=
/devicetree/bindings/clock/rockchip.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A077 -</div><div>=C2=A0.../devicetree/bindings/clock/sunxi-ccu.t=
xt=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 3 +-</div><div>=C2=A0MAINTAINE=
RS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A0 1 +</div><div>=C2=A0arch/arm/boot/dts/imx7d.dtsi=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A0 2 +-</div><div>=C2=A0arch/arm/boot/dts/imx7s.dtsi=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A0 2 +-</div><div>=C2=A0drivers/clk/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 =C2=A0 1 +</div><div>=C2=A0drivers/clk/Makefile=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +</div><div>=C2=A0drivers/clk/acti=
ons/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A014 +</div><div>=C2=A0drivers/clk/actions=
/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A012 +</div><div>=C2=A0drivers/clk/actions/owl=
-common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A089 +</div><div>=C2=A0drivers/clk/actions/owl-common.h=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A041 +</div><div>=C2=A0drivers/clk/actions/owl-composite.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 199 ++</div><div>=C2=A0d=
rivers/clk/actions/owl-composite.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 124 +</div><div>=C2=A0drivers/clk/actions/owl-divide=
r.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A094 +</div><div>=C2=A0drivers/clk/actions/owl-divider.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A075 +</div><d=
iv>=C2=A0drivers/clk/actions/owl-factor.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 222 ++</div><div>=C2=A0drivers/c=
lk/actions/owl-factor.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A083 +</div><div>=C2=A0drivers/clk/actions/owl=
-fixed-factor.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A028 +</div><div>=C2=A0drivers/clk/actions/owl-gate.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A077 +</=
div><div>=C2=A0drivers/clk/actions/owl-gate.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A073 +</div><di=
v>=C2=A0drivers/clk/actions/owl-mux.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A060 +</div><div>=C2=A0d=
rivers/clk/actions/owl-mux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A061 +</div><div>=C2=A0drivers/=
clk/actions/owl-pll.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 194 ++</div><div>=C2=A0drivers/clk/actions=
/owl-pll.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A092 +</div><div>=C2=A0drivers/clk/actions/owl-s9=
00.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 721 ++++</div><div>=C2=A0drivers/clk/at91/clk-pll.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A013 +-</div><div>=C2=A0drivers/clk/bcm/clk-bcm2835.c=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A042 +-</div><div>=C2=A0drivers/clk/bcm/clk-sr.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 135 +-</div><div>=C2=A0drivers/clk/berlin/berlin2-avpll.c=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A013 +-</div><div>=C2=A0drivers/clk/berlin/berlin2-avpll.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A013 +-</div><d=
iv>=C2=A0drivers/clk/berlin/berlin2-div.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A013 +-</div><div>=C2=A0driv=
ers/clk/berlin/berlin2-div.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A013 +-</div><div>=C2=A0drivers/clk/ber=
lin/berlin2-pll.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A013 +-</div><div>=C2=A0drivers/clk/berlin/berlin2=
-pll.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 =C2=A013 +-</div><div>=C2=A0drivers/clk/berlin/bg2.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A013 +-</div><div>=C2=A0drivers/clk/berlin/bg2q.c=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A013 +-</div><div>=C2=A0drivers/clk/berlin/common=
.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A013 +-</div><div>=C2=A0drivers/clk/clk-aspeed.c=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A057 +-</div><div>=C2=A0drivers/clk/clk-bul=
k.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 5 +-</div><div>=C2=A0drive=
rs/clk/clk-npcm7xx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 656 ++++</div><div>=C2=A0driver=
s/clk/clk-si544.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +</div><div>=C2=
=A0drivers/clk/clk-stm32mp1.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A066 +-</div><div>=
=C2=A0drivers/clk/clk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
171 +-</div><div>=C2=A0drivers/clk/davinci/pll-da830.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 5 +-</div><=
div>=C2=A0drivers/clk/davinci/pll-da850.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A037 +-</div><div>=C2=A0dri=
vers/clk/davinci/pll-dm355.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A022 +-</div><div>=C2=A0drivers/clk/da=
vinci/pll-dm365.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 9 +-</div><div>=C2=A0drivers/clk/davinci/pll-d=
m644x.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A0 9 +-</div><div>=C2=A0drivers/clk/davinci/pll-dm646x.c=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A011 +-</div><div>=C2=A0drivers/clk/davinci/pll.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 314 +-</div><div>=C2=A0drivers/clk/davinci/pll.h=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A041 +-</div><div>=C2=A0drivers/clk/davinci/psc-da830.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =
3 +-</div><div>=C2=A0drivers/clk/davinci/psc-dm355.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 7 +-</div><=
div>=C2=A0drivers/clk/davinci/psc-dm365.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A022 +-</div><div>=C2=A0dri=
vers/clk/davinci/psc-dm644x.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 3 +-</div><div>=C2=A0drivers/clk/dav=
inci/psc-dm646x.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A0 3 +-</div><div>=C2=A0drivers/clk/davinci/psc.c=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A072 +-</div><div>=C2=A0drivers/clk/davinci/p=
sc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A012 +</div><div>=C2=A0drivers/clk/hisilic=
on/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A013 +-</div><div>=C2=A0drivers/clk/hisilicon/crg=
-hi3798cv200.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A017 +<=
/div><div>=C2=A0drivers/clk/imx/clk-imx6q.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +</di=
v><div>=C2=A0drivers/clk/imx/clk-imx6sl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-</div><=
div>=C2=A0drivers/clk/imx/clk-imx6sx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A017 +-</div><d=
iv>=C2=A0drivers/clk/imx/clk-imx6ul.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A020 +-</div><div>=
=C2=A0drivers/clk/imx/clk-imx7d.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A017 +-</div><div>=C2=
=A0drivers/clk/ingenic/cgu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 8 +-</div><div=
>=C2=A0drivers/clk/ingenic/cgu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 4 +</div><d=
iv>=C2=A0drivers/clk/ingenic/jz4770-cgu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A049 +-</div><div>=C2=A0driv=
ers/clk/mediatek/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 6 +</div><div>=C2=A0driver=
s/clk/mediatek/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +</div><div>=C2=A0drivers/clk/med=
iatek/clk-mt2701-g3d.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A095 +</div><div>=C2=A0drivers/clk/mediatek/clk-mt2701.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 8 +-</d=
iv><div>=C2=A0drivers/clk/meson/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 8 +<=
/div><div>=C2=A0drivers/clk/meson/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 3=
 +-</div><div>=C2=A0drivers/clk/meson/axg-aoclk.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 164 +</div><di=
v>=C2=A0drivers/clk/meson/axg-aoclk.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A029 +</div><div>=C2=A0d=
rivers/clk/meson/axg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 4 +</div><div>=
=C2=A0drivers/clk/meson/clk-audio-divider.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A013 +-</div><div>=C2=A0drivers/clk/meson/clk=
-mpll.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A076 +-</div><div>=C2=A0drivers/clk/meson/clk-=
pll.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A013 +-</div><div>=C2=A0drivers/clk/meson/clk-reg=
map.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A0 6 +-</div><div>=C2=A0drivers/clk/meson/clk-regmap.h=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A0 8 +-</div><div>=C2=A0drivers/clk/meson/clkc.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A016 +-</div><div>=C2=A0drivers/clk/meson/gxbb-aoclk-=
32k.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A0 3 +-</div><div>=C2=A0drivers/clk/meson/gxbb-aoclk.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 147 +-</=
div><div>=C2=A0drivers/clk/meson/gxbb-aoclk.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 8 +-</div><d=
iv>=C2=A0drivers/clk/meson/gxbb.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 129 +-</div>=
<div>=C2=A0drivers/clk/meson/gxbb.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A058=
 +-</div><div>=C2=A0drivers/clk/meson/meson-aoclk.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A081 +</div><div>=
=C2=A0drivers/clk/meson/meson-aoclk.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A034 +</div><div>=C2=A0drivers/=
clk/meson/meson8b.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A077 +-</div><div>=C2=A0drivers/clk=
/meson/meson8b.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A018 +-</div><div>=C2=A0drivers/clk/mv=
ebu/clk-corediv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-</div><div>=C2=A0drivers/clk/qcom/Kconfig=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A027 +</div><div>=C2=A0drivers/clk/qcom=
/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 3 +</div><div>=C2=A0drivers/clk/qco=
m/clk-alpha-pll.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 302 +-</div><div>=C2=A0drivers/clk/qcom/clk-alpha-pll.=
h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A018 +-</div><div>=C2=A0drivers/clk/qcom/clk-branch.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A0 7 +-</div><div>=C2=A0drivers/clk/qcom/clk-branch.h=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +<=
/div><div>=C2=A0drivers/clk/qcom/clk-rcg.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A017=
 +-</div><div>=C2=A0drivers/clk/qcom/clk-rcg2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 168 +-</div=
><div>=C2=A0drivers/clk/qcom/common.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A032 +-</d=
iv><div>=C2=A0drivers/clk/qcom/gcc-msm8996.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 8 +-</div><div>=
=C2=A0drivers/clk/qcom/gcc-msm8998.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2834 ++++++++++++++++</div><div>=C2=
=A0drivers/clk/qcom/gcc-sdm845.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3465 ++++++++++++++++++++</div><div>=
=C2=A0drivers/clk/qcom/gdsc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 102 +-</div><d=
iv>=C2=A0drivers/clk/qcom/gdsc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 6 +-=
</div><div>=C2=A0drivers/clk/qcom/mmcc-msm8996.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A022 +-</div><div>=
=C2=A0drivers/clk/qcom/videocc-sdm845.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 358 ++</div><div>=C2=A0drivers/clk/rene=
sas/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A010 +</div><div>=C2=A0drivers/clk/renesas=
/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +</div><div>=C2=A0drivers/clk/renesas/r8a=
7743-cpg-mssr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A0 2 +-</div><div>=C2=A0drivers/clk/renesas/r8a7745-cpg-mssr.c=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-</div><div>=C2=A0d=
rivers/clk/renesas/r8a77470-cpg-mssr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 229 ++</div><div>=C2=A0drivers/clk/renesas/r8a7791-cpg-mssr.=
c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-</div><=
div>=C2=A0drivers/clk/renesas/r8a7792-cpg-mssr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-</div><div>=C2=A0drivers/clk/renesa=
s/r8a7794-cpg-mssr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 =C2=A0 2 +-</div><div>=C2=A0drivers/clk/renesas/r8a77965-cpg-mssr.c=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 4 +</div><div>=C2=A0drive=
rs/clk/renesas/r8a77980-cpg-mssr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A0 2 +-</div><div>=C2=A0drivers/clk/renesas/r8a77990-cpg-mssr.=
c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 289 ++</div><div>=C2=A0d=
rivers/clk/renesas/rcar-gen2-cpg.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 |=C2=A0 =C2=A024 +</div><div>=C2=A0drivers/clk/renesas/renes=
as-cpg-mssr.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
12 +</div><div>=C2=A0drivers/clk/renesas/renesas-cpg-mssr.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +</div><div>=C2=A0driver=
s/clk/rockchip/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 -</div><div>=C2=A0drivers/clk/roc=
kchip/clk-rockchip.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 |=C2=A0 =C2=A098 -</div><div>=C2=A0drivers/clk/rockchip/clk.c=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A016 +-</div><div>=C2=A0drivers/clk/samsung/clk-s3c2410-dclk=
.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 6 +-</div>=
<div>=C2=A0drivers/clk/socfpga/clk-s10.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A040 +-</div><div>=C2=
=A0drivers/clk/spear/spear6xx_clock.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-</div><div>=C2=A0drivers/clk/sun=
xi-ng/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 5 +</div><div>=C2=A0drivers/clk/sunxi-n=
g/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 1 +</div><div>=C2=A0drivers/clk/sunxi-ng/ccu-s=
un50i-h6-r.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 207 ++<=
/div><div>=C2=A0drivers/clk/sunxi-ng/ccu-sun50i-h6-r.h=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A019 +</div><div>=C2=A0drivers/clk/s=
unxi-ng/ccu-sun8i-r40.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A072 +-</div><div>=C2=A0drivers/clk/tegra/clk-dfll.c=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A042 +-</div><div>=C2=A0drivers/clk/tegra/clk-tegra114.c=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A0 2 +-</div><div>=C2=A0drivers/clk/tegra/clk-tegra124.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-<=
/div><div>=C2=A0drivers/clk/tegra/clk-tegra20.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A052 +-</div><div>=C2=
=A0drivers/clk/tegra/clk-tegra210.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 2 +-</div><div>=C2=A0drivers/=
clk/tegra/clk-tegra30.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-</div><div>=C2=A0drivers/clk/tegra/clk=
.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 5 +-</div><div>=C2=A0drivers/clk/te=
gra/clk.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +-</div><div>=C2=A0drivers=
/clk/uniphier/clk-uniphier-sys.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 =C2=A0 5 +</div><div>=C2=A0drivers/clocksource/timer-sp804.c=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 3 +-=
</div><div>=C2=A0drivers/pinctrl/sunxi/pinctrl-sunxi.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 4 +-</div><div>=C2=A0drivers/soc=
/rockchip/pm_domains.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A0 4 +-</div><div>=C2=A0drivers/soc/tegra/pmc.c=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 3 +-</div><div>=C2=A0include/dt-binding=
s/clock/actions,s900-cmu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 129 +</div><di=
v>=C2=A0include/dt-bindings/clock/aspeed-clock.h=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0|=C2=A0 =C2=A0 4 +-</div><div>=C2=A0include/dt-bindings/clock=
/axg-aoclkc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0=
26 +</div><div>=C2=A0include/dt-bindings/clock/bcm-sr.h=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A024 +-</div><div>=C2=
=A0include/dt-bindings/clock/gxbb-clkc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 2 +</div><div>=C2=A0include/dt-bindings/clock/=
histb-clock.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 8 +</=
div><div>=C2=A0include/dt-bindings/clock/imx6qdl-clock.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 4 +-</div><div>=C2=A0include/dt-bindings/c=
lock/imx6sx-clock.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =
6 +-</div><div>=C2=A0include/dt-bindings/clock/imx6ul-clock.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A033 +-</div><div>=C2=A0include/dt-b=
indings/clock/imx7d-clock.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A0 4 +-</div><div>=C2=A0include/dt-bindings/clock/meson8b-clkc.h=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 1 +</div><div>=C2=A0in=
clude/dt-bindings/clock/mt2701-clk.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A020 +-</div><div>=C2=A0include/dt-bindings/clock/nuv=
oton,npcm7xx-clock.h=C2=A0 |=C2=A0 =C2=A044 +</div><div>=C2=A0include/dt-bi=
ndings/clock/qcom,gcc-msm8998.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 208 ++</d=
iv><div>=C2=A0include/dt-bindings/clock/qcom,gcc-sdm845.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 239 ++</div><div>=C2=A0include/dt-bindings/clock/qcom,rp=
mh.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A022 +</di=
v><div>=C2=A0include/dt-bindings/clock/qcom,videocc-sdm845.h=C2=A0 =C2=A0 |=
=C2=A0 =C2=A035 +</div><div>=C2=A0include/dt-bindings/clock/r8a77470-cpg-ms=
sr.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A036 +</div><div>=C2=A0include/dt-bind=
ings/clock/r8a77990-cpg-mssr.h=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A062 +</div>=
<div>=C2=A0include/dt-bindings/clock/stm32mp1-clks.h=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A0 4 +-</div><div>=C2=A0include/dt-bindings/clock=
/sun50i-h6-r-ccu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A024 +</div><div>=
=C2=A0include/dt-bindings/reset/axg-aoclkc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A020 +</div><div>=C2=A0include/dt-bindings/res=
et/mt2701-resets.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 3 +</di=
v><div>=C2=A0include/dt-bindings/reset/sun50i-h6-r-ccu.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A017 +</div><div>=C2=A0include/linux/clk-provider.h=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A023 +-</div><div>=C2=A0include/linux/clk/davinci.h=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A040 +</div><div>=C2=A0include/linux/of_clk.h=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A030 +</div><div>=C2=A0184 files change=
d, 13867 insertions(+), 1345 deletions(-)</div><div>=C2=A0create mode 10064=
4 Documentation/devicetree/bindings/arm/mediatek/mediatek,g3dsys.txt</div><=
div>=C2=A0create mode 100644 Documentation/devicetree/bindings/clock/action=
s,s900-cmu.txt</div><div>=C2=A0create mode 100644 Documentation/devicetree/=
bindings/clock/nuvoton,npcm750-clk.txt</div><div>=C2=A0create mode 100644 D=
ocumentation/devicetree/bindings/clock/qcom,rpmh-clk.txt</div><div>=C2=A0cr=
eate mode 100644 Documentation/devicetree/bindings/clock/qcom,videocc.txt</=
div><div>=C2=A0delete mode 100644 Documentation/devicetree/bindings/clock/r=
ockchip.txt</div><div>=C2=A0create mode 100644 drivers/clk/actions/Kconfig<=
/div><div>=C2=A0create mode 100644 drivers/clk/actions/Makefile</div><div>=
=C2=A0create mode 100644 drivers/clk/actions/owl-common.c</div><div>=C2=A0c=
reate mode 100644 drivers/clk/actions/owl-common.h</div><div>=C2=A0create m=
ode 100644 drivers/clk/actions/owl-composite.c</div><div>=C2=A0create mode =
100644 drivers/clk/actions/owl-composite.h</div><div>=C2=A0create mode 1006=
44 drivers/clk/actions/owl-divider.c</div><div>=C2=A0create mode 100644 dri=
vers/clk/actions/owl-divider.h</div><div>=C2=A0create mode 100644 drivers/c=
lk/actions/owl-factor.c</div><div>=C2=A0create mode 100644 drivers/clk/acti=
ons/owl-factor.h</div><div>=C2=A0create mode 100644 drivers/clk/actions/owl=
-fixed-factor.h</div><div>=C2=A0create mode 100644 drivers/clk/actions/owl-=
gate.c</div><div>=C2=A0create mode 100644 drivers/clk/actions/owl-gate.h</d=
iv><div>=C2=A0create mode 100644 drivers/clk/actions/owl-mux.c</div><div>=
=C2=A0create mode 100644 drivers/clk/actions/owl-mux.h</div><div>=C2=A0crea=
te mode 100644 drivers/clk/actions/owl-pll.c</div><div>=C2=A0create mode 10=
0644 drivers/clk/actions/owl-pll.h</div><div>=C2=A0create mode 100644 drive=
rs/clk/actions/owl-s900.c</div><div>=C2=A0create mode 100644 drivers/clk/cl=
k-npcm7xx.c</div><div>=C2=A0create mode 100644 drivers/clk/mediatek/clk-mt2=
701-g3d.c</div><div>=C2=A0create mode 100644 drivers/clk/meson/axg-aoclk.c<=
/div><div>=C2=A0create mode 100644 drivers/clk/meson/axg-aoclk.h</div><div>=
=C2=A0create mode 100644 drivers/clk/meson/meson-aoclk.c</div><div>=C2=A0cr=
eate mode 100644 drivers/clk/meson/meson-aoclk.h</div><div>=C2=A0create mod=
e 100644 drivers/clk/qcom/gcc-msm8998.c</div><div>=C2=A0create mode 100644 =
drivers/clk/qcom/gcc-sdm845.c</div><div>=C2=A0create mode 100644 drivers/cl=
k/qcom/videocc-sdm845.c</div><div>=C2=A0create mode 100644 drivers/clk/rene=
sas/r8a77470-cpg-mssr.c</div><div>=C2=A0create mode 100644 drivers/clk/rene=
sas/r8a77990-cpg-mssr.c</div><div>=C2=A0delete mode 100644 drivers/clk/rock=
chip/clk-rockchip.c</div><div>=C2=A0create mode 100644 drivers/clk/sunxi-ng=
/ccu-sun50i-h6-r.c</div><div>=C2=A0create mode 100644 drivers/clk/sunxi-ng/=
ccu-sun50i-h6-r.h</div><div>=C2=A0create mode 100644 include/dt-bindings/cl=
ock/actions,s900-cmu.h</div><div>=C2=A0create mode 100644 include/dt-bindin=
gs/clock/axg-aoclkc.h</div><div>=C2=A0create mode 100644 include/dt-binding=
s/clock/nuvoton,npcm7xx-clock.h</div><div>=C2=A0create mode 100644 include/=
dt-bindings/clock/qcom,gcc-msm8998.h</div><div>=C2=A0create mode 100644 inc=
lude/dt-bindings/clock/qcom,gcc-sdm845.h</div><div>=C2=A0create mode 100644=
 include/dt-bindings/clock/qcom,rpmh.h</div><div>=C2=A0create mode 100644 i=
nclude/dt-bindings/clock/qcom,videocc-sdm845.h</div><div>=C2=A0create mode =
100644 include/dt-bindings/clock/r8a77470-cpg-mssr.h</div><div>=C2=A0create=
 mode 100644 include/dt-bindings/clock/r8a77990-cpg-mssr.h</div><div>=C2=A0=
create mode 100644 include/dt-bindings/clock/sun50i-h6-r-ccu.h</div><div>=
=C2=A0create mode 100644 include/dt-bindings/reset/axg-aoclkc.h</div><div>=
=C2=A0create mode 100644 include/dt-bindings/reset/sun50i-h6-r-ccu.h</div><=
div>=C2=A0create mode 100644 include/linux/clk/davinci.h</div><div>=C2=A0cr=
eate mode 100644 include/linux/of_clk.h</div></div>

--000000000000521f4c056e398139--

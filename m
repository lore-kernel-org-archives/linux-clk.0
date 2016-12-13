Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: changes for v4.10
Date: Mon, 12 Dec 2016 18:05:09 -0800
Message-Id: <20161213020509.4188-1-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit b7d79eb4615e3eb5947355f7b4354818cba037f7:

  clk: bcm: Fix unmet Kconfig dependencies for CLK_BCM_63XX (2016-11-23 14:31:11 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

for you to fetch changes up to 2aab7a2055a1705c9e30920d95a596226999eb21:

  clk: bcm: Fix 'maybe-uninitialized' warning in bcm2835_clock_choose_div_and_prate() (2016-12-12 11:25:40 -0800)

----------------------------------------------------------------
This is a fairly quiet release. We don't have any patches to the core
framework. The only patch that can even be considered "core" adds another
clk_get() variant. The rest of the changes are in drivers for various SoCs, and
we have a few bits for ARM shmobile architecture code (dts and mach) due to the
dependency we're breaking between shmobile architecture code and its clk
driver. Those shmobile bits have also been pulled into arm-soc tree. Here's the
summary:

Core:

 - Support for devm_get_clk_from_child() used with DT bindings that have
   subnodes with the 'clocks' property

New Drivers:

 - Allwinner A64 (sun50i)
 - i.MX imx6ull
 - Socionext's UniPhier SoC CPUs
 - Mediatek MT2701 SoCs
 - Rockchip rk1108 SoCs
 - Qualcomm MSM8994/MSM8992 SoCS
 - Qualcomm RPM Clocks
 - Hisilicon Hi3516CV300 and Hi3798CV200 CRG
 - Oxford Semiconductor OX820 and OX810SE SoCs
 - Renesas RZ/G1M and RZ/GIE SoCs
 - Renesas R-Car RST driver for mode pin states

Updates:

 - Four Allwinner SoCs are migrated to the new style clk driver
 - Rockchip rk3399,rk3066 PLL optimizations
 - i.MX LVDS display glitch fixes and AV PLL precision improvements
 - Qualcomm MSM8996 GPU GDSCs, hw controlled GDSCs, and Alpha PLL support
 - Explicit demodularization of always builtin drivers
 - Freescale Qoriq ls1012a and ls1046a support
 - Exynos 5433 parent typo fix and critical clock tagging
 - Renesas r8a7743/r8a7745 CPG
 - Renesas R-Car M3-W CSI2/VIN/SYS-DMAC/(H)SCIF/I2C/DRIF/gfx support
 - stm32f4* LSI, LSE, RTC, and QSPI clocks
 - pxa27x and pxa25x cpufreq as clks
 - TI omap36xx sprz319 advisory 2.1 workaround
 - Broadcom bcm2835 rate change propogation to PLLH_AUX from VEC

----------------------------------------------------------------
Abhishek Sahu (1):
      clk: qcom: ipq4019: changed i2c freq table

Arnd Bergmann (2):
      clk: pxa mark dummy helper as 'inline'
      clk: pxa: fix pxa2xx_determine_rate return

Arvind Yadav (6):
      clk: nxp: clk-lpc18xx-ccu: Unmap region obtained by of_iomap
      clk: mmp: clk-of-pxa1928: Free memory obtained by kzalloc
      clk:mmp:clk-of-pxa910: Free memory and Unmap region obtained by kzmalloc and of_iomap
      clk:mmp:clk-of-mmp2: Free memory and Unmap region obtained by kzalloc and of_iomap
      clk: keystone: pll: Unmap region obtained by of_iomap
      clk: st: clk-flexgen: Unmap region obtained by of_iomap

Axel Lin (1):
      clk: qcom: lcc-ipq806x: Fixup overriding val in regmap_read call

Bai Ping (1):
      clk: imx: clk-imx6ul: add clk support for imx6ull

Bastian Köcher (1):
      clk: qcom: Add support for msm8994 global clock controller

Boris Brezillon (5):
      clk: bcm2835: Fix ->fixed_divider of pllh_aux
      clk: bcm2835: Avoid overwriting the div info when disabling a pll_div clk
      clk: bcm: Support rate change propagation on bcm2835 clocks
      clk: bcm: Allow rate change propagation to PLLH_AUX on VEC clock
      clk: bcm: Fix 'maybe-uninitialized' warning in bcm2835_clock_choose_div_and_prate()

Chen-Yu Tsai (2):
      clk: sunxi-ng: sun8i-a23: Set CLK_SET_RATE_PARENT for audio module clocks
      clk: sunxi-ng: sun8i-h3: Set CLK_SET_RATE_PARENT for audio module clocks

Christophe JAILLET (1):
      clk: cdce925: Fix limit check

Elaine Zhang (1):
      clk: rockchip: validity should be checked prior to cpu clock rate change

Emil Lundmark (1):
      clk: imx: improve precision of AV PLL to 1 Hz

Fabio Estevam (1):
      clk: imx6: Fix procedure to switch the parent of LDB_DI_CLK

Gabriel Fernandez (3):
      clk: stm32f4: Add LSI & LSE clocks
      clk: stm32f4: Add RTC clock
      clk: stm32f469: Add QSPI clock

Geert Uytterhoeven (30):
      clk: renesas: cpg-mssr: Always use readl()/writel()
      clk: renesas: rcar-gen3-cpg: Always use readl()/writel()
      clk: renesas: cpg-mssr: Fix inverted debug check
      clk: renesas: cpg-mssr: Fix inverted debug check
      clk: renesas: cpg-mssr: Remove bogus commas from error messages
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

Georgi Djakov (5):
      clk: qcom: Always add factor clock for xo clocks
      clk: qcom: Add support for SMD-RPM Clocks
      clk: qcom: Add support for RPM Clocks
      clk: qcom: clk-smd-rpm: Fix clk_hw references
      clk: qcom: clk-rpm: Fix clk_hw references

Grygorii Strashko (1):
      clk: ti: dra7: fix "failed to lookup clock node gmac_gmii_ref_clk_div" boot message

Heiko Stuebner (2):
      Merge branch 'v4.10-shared/clkids' into v4.10-clk/next
      Merge branch 'v4.10-shared/clkids' into v4.10-clk/next

Jeremy McNicoll (1):
      dt-bindings: qcom: clocks: Add msm8994 clock bindings

Jiancheng Xue (1):
      clk: hisilicon: add CRG driver for Hi3798CV200 SoC

Jianqun Xu (2):
      clk: rockchip: remove more CLK_IGNORE_UNUSED for rk3399 clocktree
      clk: rockchip: fix copy-paste error in rk3399 testclk

Julia Lawall (3):
      clk: sunxi: mod0: improve function-level documentation
      clk: keystone: improve function-level documentation
      clk: tegra: dfll: improve function-level documentation

Julius Werner (1):
      clk: rockchip: Ignore frac divisor for PLL equivalence when it's unused

Krzysztof Kozlowski (1):
      clk: Enable compile testing for s2mps11 and max77686

Kuninori Morimoto (1):
      clk: add devm_get_clk_from_child() API

Laurent Pinchart (3):
      clk: renesas: r8a7796: Add FCP clocks
      clk: renesas: r8a7796: Add VSP clocks
      clk: renesas: r8a7796: Add DU and LVDS clocks

Leo Yan (1):
      clk: Hi6220: enable stub clock driver for ARCH_HISI

Marcin Wojtas (1):
      clk: mvebu: migrate CP110 system controller to clk_hw API and registration

Marek Szyprowski (3):
      clk: exynos5433: Fix parent clocks for FSYS block
      clk: exynos5433: Add documentation for the audio block parent clocks
      clk: exynos5433: Mark some clocks as critical

Masahiro Yamada (2):
      clk: uniphier: add CPU-gear change (cpufreq) support
      clk: uniphier: add cpufreq data for LD11, LD20 SoCs

Maxime Ripard (6):
      clk: sunxi-ng: Rename the internal structures
      clk: sunxi-ng: Remove the use of rational computations
      clk: sunxi-ng: Finish to convert to structures for arguments
      clk: sunxi-ng: Add minimums for all the relevant structures and clocks
      clk: sunxi-ng: Implement minimum for multipliers
      clk: sunxi-ng: Add A64 clocks

Michael Turquette (1):
      Merge branch 'clk-next-oxnas' into clk-next

Mingkai Hu (1):
      clk: qoriq: add ls1046a support

Neil Armstrong (6):
      clk: oxnas: Add dt-bindings include file for OX810SE
      clk: oxnas: Add dt-bindings include file for OX820
      clk: oxnas: Rename to clk_oxnas_gate
      clk: oxnas: Refactor to make use of devm_clk_hw_register()
      clk: oxnas: Add OX820 Gate clocks
      dt-bindings: clk: oxnas,stdclk: Add OX820 bindings

Niklas Söderlund (2):
      clk: renesas: r8a7796: Add CSI2 clocks
      clk: renesas: r8a7796: Add VIN clocks

Pan Bian (1):
      clk: clk-wm831x: fix a logic error

Pan Wen (1):
      clk: hisilicon: add CRG driver for Hi3516CV300 SoC

Paul Gortmaker (4):
      clk: mvebu: make cp110-system-controller explicitly non-modular
      clk: mvebu: make ap806-system-controller explicitly non-modular
      clk: tegra: make clk-tegra124-dfll-fcpu explicitly non-modular
      clk: ti: make clk-dra7-atl explicitly non-modular

Paweł Jarosz (3):
      clk: rockchip: Add binding ids for cpu and peri clocks on rk3066
      clk: rockchip: Use clock ids for cpu and peri clocks on rk3066
      clk: rockchip: add 400MHz to rk3066 clock rates table

Philipp Zabel (2):
      clk: imx6: Mask mmdc_ch1 handshake for periph2_sel and mmdc_ch1_axi_podf
      clk: imx6: Make the LDB_DI0 and LDB_DI1 clocks read-only

Rajendra Nayak (11):
      clk: qcom: Handle the clamp_io assert/deassert sequence
      clk: qcom: mmcc-8996: Add gpu gdscs
      clk: qcom: Add support for alpha pll hwfsm ops
      clk: qcom: Add support to initialize alpha plls
      clk: qcom: handle alpha PLLs with 16bit alpha val registers
      clk: qcom: Enable FSM mode for votable alpha PLLs
      clk: qcom: Add .is_enabled ops for clk-alpha-pll
      clk: qcom: Add freq tables for a few rcgs
      clk: qcom: Add rcg ops to return floor value closest to the requested rate
      clk: qcom: Move all sdcc rcgs to use clk_rcg2_floor_ops
      clk: qcom: gdsc: Add support for gdscs with HW control

Ramesh Shanmugasundaram (1):
      clk: renesas: r8a7796: Add DRIF clock

Richard Watts (1):
      clk: ti: omap36xx: Work around sprz319 advisory 2.1

Robert Jarzmik (5):
      clk: pxa: remove unused variables
      clk: pxa: core pll is not affected by t bit
      clk: pxa: b bit of clkcfg means fast bus
      clk: pxa: export core clocks
      clk: pxa: transfer CPU clock setting from pxa2xx-cpufreq

Sergei Shtylyov (5):
      clk: renesas: Add r8a7743 CPG Core Clock Definitions
      clk: renesas: Add r8a7745 CPG Core Clock Definitions
      clk: renesas: cpg-mssr: Add common R-Car Gen2 support
      clk: renesas: cpg-mssr: Add R8A7743 support
      clk: renesas: cpg-mssr: Add R8A7745 support

Shawn Lin (3):
      clk: rockchip: add dt-binding header for rk1108
      dt-bindings: add documentation for rk1108 cru
      clk: rockchip: add clock controller for rk1108

Shunli Wang (2):
      clk: mediatek: Add MT2701 clock support
      reset: mediatek: Add MT2701 reset driver

Sricharan R (1):
      clk: qcom: Put venus core0/1 gdscs to hw control mode

Stephen Boyd (20):
      Merge branch 'clk-fixes' into clk-next
      Merge branch 'clk-fixes' into clk-next
      Merge branch 'clk-fixes' into clk-next
      clk: pxa: Use __iomem properly and staticize lock variable
      clk: qcom: ipq806x: Fix board clk rates
      Merge branch 'clk-qcom-8994' into clk-next
      Merge branch 'clk-qcom-rpm' into clk-next
      Merge branch 'clk-hisi' into clk-next
      Merge tag 'clk-renesas-for-v4.10-tag1' of git://git.kernel.org/.../geert/renesas-drivers into clk-next
      Merge tag 'v4.10-rockchip-clk1' of git://git.kernel.org/.../mmind/linux-rockchip into clk-next
      Merge branch 'clk-fixes' into clk-next
      Merge tag 'imx-clk-4.10' of git://git.kernel.org/.../shawnguo/linux into clk-next
      Merge tag 'sunxi-clk-for-4.10' of https://git.kernel.org/.../mripard/linux into clk-next
      clk: sunxi-ng: Mark structs static and cleanup spaces
      Merge tag 'clk-renesas-for-v4.10-tag2' of git://git.kernel.org/.../geert/renesas-drivers into clk-next
      Merge tag 'clk-renesas-for-v4.10-tag3' of git://git.kernel.org/.../geert/renesas-drivers into clk-next
      Merge tag 'clk-v4.10-exynos5433' of git://linuxtv.org/snawrocki/samsung into clk-next
      Merge branch 'clk-fixes' into clk-next
      Merge tag 'v4.10-rockchip-clk2' of git://git.kernel.org/.../mmind/linux-rockchip into clk-next
      clk: bcm: Make COMMON_CLK_IPROC into a library

Takeshi Kihara (1):
      clk: renesas: r8a7795: Fix HDMI parent clock

Tang Yuantian (1):
      clk: qoriq: added ls1012a clock configuration

Ulrich Hecht (4):
      clk: renesas: r8a7796: Add SYS-DMAC clocks
      clk: renesas: r8a7796: Add SCIF clocks
      clk: renesas: r8a7796: Add HSCIF clocks
      clk: renesas: r8a7796: Add I2C clocks

Uwe Kleine-König (1):
      clk: gate: fix coding style

Vladimir Zapolskiy (1):
      clk: lpc32xx: add a quirk for PWM and MS clock dividers

Wei Yongjun (1):
      clk: tegra: dfll: Use builtin_platform_driver to simplify the code

Xing Zheng (2):
      clk: rockchip: add 533.25MHz to rk3399 clock rates table
      clk: rockchip: optimize 800MHz and 1GHz pll rates on RK3399

 .../devicetree/bindings/clock/exynos5433-clock.txt |   13 +-
 .../clock/{hi3519-crg.txt => hisi-crg.txt}         |   12 +-
 .../devicetree/bindings/clock/oxnas,stdclk.txt     |   19 +-
 .../devicetree/bindings/clock/qcom,gcc.txt         |    1 +
 .../devicetree/bindings/clock/qcom,rpmcc.txt       |   37 +
 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |    5 +-
 .../bindings/clock/rockchip,rk1108-cru.txt         |   59 +
 .../devicetree/bindings/clock/st,stm32-rcc.txt     |    4 +-
 .../devicetree/bindings/clock/sunxi-ccu.txt        |    1 +
 .../devicetree/bindings/clock/uniphier-clock.txt   |   16 +-
 .../devicetree/bindings/reset/renesas,rst.txt      |   37 +
 arch/arm/boot/dts/r8a7778.dtsi                     |    5 +
 arch/arm/boot/dts/r8a7779.dtsi                     |    5 +
 arch/arm/boot/dts/r8a7790.dtsi                     |    5 +
 arch/arm/boot/dts/r8a7791.dtsi                     |    5 +
 arch/arm/boot/dts/r8a7792.dtsi                     |    5 +
 arch/arm/boot/dts/r8a7793.dtsi                     |    5 +
 arch/arm/boot/dts/r8a7794.dtsi                     |    5 +
 arch/arm/mach-shmobile/setup-r8a7778.c             |   15 -
 arch/arm/mach-shmobile/setup-r8a7779.c             |   27 -
 arch/arm/mach-shmobile/setup-rcar-gen2.c           |    5 +-
 arch/arm64/boot/dts/renesas/r8a7795.dtsi           |    5 +
 arch/arm64/boot/dts/renesas/r8a7796.dtsi           |    5 +
 drivers/clk/Kconfig                                |    4 +-
 drivers/clk/at91/clk-programmable.c                |    2 +-
 drivers/clk/bcm/Kconfig                            |   16 +-
 drivers/clk/bcm/clk-bcm2835.c                      |   91 +-
 drivers/clk/berlin/bg2.c                           |    2 +-
 drivers/clk/berlin/bg2q.c                          |    2 +-
 drivers/clk/clk-cdce925.c                          |    2 +-
 drivers/clk/clk-devres.c                           |   21 +
 drivers/clk/clk-efm32gg.c                          |    2 +-
 drivers/clk/clk-gate.c                             |    4 +-
 drivers/clk/clk-max77686.c                         |    1 +
 drivers/clk/clk-oxnas.c                            |  232 +-
 drivers/clk/clk-qoriq.c                            |   73 +-
 drivers/clk/clk-stm32f4.c                          |  435 +++-
 drivers/clk/clk-wm831x.c                           |    2 +-
 drivers/clk/clk-xgene.c                            |   10 +-
 drivers/clk/hisilicon/Kconfig                      |   17 +
 drivers/clk/hisilicon/Makefile                     |    2 +
 drivers/clk/hisilicon/clk-hi6220.c                 |    4 +-
 drivers/clk/hisilicon/crg-hi3516cv300.c            |  330 +++
 drivers/clk/hisilicon/crg-hi3798cv200.c            |  337 +++
 drivers/clk/hisilicon/crg.h                        |   34 +
 drivers/clk/imx/clk-imx6q.c                        |  283 ++-
 drivers/clk/imx/clk-imx6ul.c                       |   72 +-
 drivers/clk/imx/clk-pllv3.c                        |   16 +-
 drivers/clk/imx/clk.h                              |    8 +
 drivers/clk/keystone/pll.c                         |   13 +-
 drivers/clk/mediatek/Kconfig                       |   45 +
 drivers/clk/mediatek/Makefile                      |    7 +
 drivers/clk/mediatek/clk-gate.c                    |   52 +
 drivers/clk/mediatek/clk-gate.h                    |    2 +
 drivers/clk/mediatek/clk-mt2701-bdp.c              |  138 ++
 drivers/clk/mediatek/clk-mt2701-eth.c              |   80 +
 drivers/clk/mediatek/clk-mt2701-hif.c              |   81 +
 drivers/clk/mediatek/clk-mt2701-img.c              |   80 +
 drivers/clk/mediatek/clk-mt2701-mm.c               |  123 ++
 drivers/clk/mediatek/clk-mt2701-vdec.c             |   91 +
 drivers/clk/mediatek/clk-mt2701.c                  | 1035 +++++++++
 drivers/clk/mediatek/clk-mtk.c                     |   40 +
 drivers/clk/mediatek/clk-mtk.h                     |   41 +-
 drivers/clk/mediatek/clk-pll.c                     |    1 +
 drivers/clk/mmp/clk-of-mmp2.c                      |   17 +-
 drivers/clk/mmp/clk-of-pxa168.c                    |    2 +-
 drivers/clk/mmp/clk-of-pxa1928.c                   |    3 +
 drivers/clk/mmp/clk-of-pxa910.c                    |   23 +-
 drivers/clk/mvebu/ap806-system-controller.c        |   23 +-
 drivers/clk/mvebu/armada-37xx-periph.c             |   11 +-
 drivers/clk/mvebu/cp110-system-controller.c        |  167 +-
 drivers/clk/nxp/clk-lpc18xx-ccu.c                  |    5 +-
 drivers/clk/nxp/clk-lpc32xx.c                      |   32 +-
 drivers/clk/pxa/clk-pxa.c                          |  145 +-
 drivers/clk/pxa/clk-pxa.h                          |   59 +-
 drivers/clk/pxa/clk-pxa25x.c                       |  114 +-
 drivers/clk/pxa/clk-pxa27x.c                       |  168 +-
 drivers/clk/qcom/Kconfig                           |   37 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  187 +-
 drivers/clk/qcom/clk-alpha-pll.h                   |   25 +
 drivers/clk/qcom/clk-pll.c                         |   31 +-
 drivers/clk/qcom/clk-rcg.h                         |    1 +
 drivers/clk/qcom/clk-rcg2.c                        |   76 +-
 drivers/clk/qcom/clk-rpm.c                         |  497 +++++
 drivers/clk/qcom/clk-smd-rpm.c                     |  578 +++++
 drivers/clk/qcom/common.c                          |   52 +-
 drivers/clk/qcom/common.h                          |   11 +
 drivers/clk/qcom/gcc-apq8084.c                     |    8 +-
 drivers/clk/qcom/gcc-ipq4019.c                     |    3 +-
 drivers/clk/qcom/gcc-ipq806x.c                     |    4 +-
 drivers/clk/qcom/gcc-msm8916.c                     |    4 +-
 drivers/clk/qcom/gcc-msm8974.c                     |    8 +-
 drivers/clk/qcom/gcc-msm8994.c                     | 2300 ++++++++++++++++++++
 drivers/clk/qcom/gcc-msm8996.c                     |   33 +-
 drivers/clk/qcom/gdsc.c                            |   44 +-
 drivers/clk/qcom/gdsc.h                            |    3 +
 drivers/clk/qcom/lcc-ipq806x.c                     |    2 +-
 drivers/clk/qcom/mmcc-msm8996.c                    |   26 +
 drivers/clk/renesas/Kconfig                        |    2 +
 drivers/clk/renesas/Makefile                       |    2 +
 drivers/clk/renesas/clk-r8a7778.c                  |   26 +-
 drivers/clk/renesas/clk-r8a7779.c                  |   18 +-
 drivers/clk/renesas/clk-rcar-gen2.c                |   32 +-
 drivers/clk/renesas/r8a7743-cpg-mssr.c             |  270 +++
 drivers/clk/renesas/r8a7745-cpg-mssr.c             |  259 +++
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |   10 +-
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |   65 +-
 drivers/clk/renesas/rcar-gen2-cpg.c                |  371 ++++
 drivers/clk/renesas/rcar-gen2-cpg.h                |   43 +
 drivers/clk/renesas/rcar-gen3-cpg.c                |   31 +-
 drivers/clk/renesas/rcar-gen3-cpg.h                |    1 -
 drivers/clk/renesas/renesas-cpg-mssr.c             |   29 +-
 drivers/clk/renesas/renesas-cpg-mssr.h             |    2 +
 drivers/clk/rockchip/Makefile                      |    1 +
 drivers/clk/rockchip/clk-cpu.c                     |    9 +
 drivers/clk/rockchip/clk-ddr.c                     |    5 +-
 drivers/clk/rockchip/clk-pll.c                     |    6 +-
 drivers/clk/rockchip/clk-rk1108.c                  |  531 +++++
 drivers/clk/rockchip/clk-rk3188.c                  |   13 +-
 drivers/clk/rockchip/clk-rk3399.c                  |   31 +-
 drivers/clk/rockchip/clk.h                         |   15 +
 drivers/clk/samsung/clk-exynos-audss.c             |    1 +
 drivers/clk/samsung/clk-exynos-clkout.c            |   22 +-
 drivers/clk/samsung/clk-exynos5433.c               |   30 +-
 drivers/clk/st/clk-flexgen.c                       |    5 +-
 drivers/clk/sunxi-ng/Kconfig                       |   14 +-
 drivers/clk/sunxi-ng/Makefile                      |    1 +
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c              |  915 ++++++++
 drivers/clk/sunxi-ng/ccu-sun50i-a64.h              |   72 +
 drivers/clk/sunxi-ng/ccu-sun8i-a23.c               |    6 +-
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c                |   10 +-
 drivers/clk/sunxi-ng/ccu_div.h                     |    6 +-
 drivers/clk/sunxi-ng/ccu_frac.c                    |   12 +-
 drivers/clk/sunxi-ng/ccu_frac.h                    |   14 +-
 drivers/clk/sunxi-ng/ccu_mp.h                      |    4 +-
 drivers/clk/sunxi-ng/ccu_mult.c                    |   33 +-
 drivers/clk/sunxi-ng/ccu_mult.h                    |   17 +-
 drivers/clk/sunxi-ng/ccu_nk.c                      |   43 +-
 drivers/clk/sunxi-ng/ccu_nk.h                      |    4 +-
 drivers/clk/sunxi-ng/ccu_nkm.c                     |   45 +-
 drivers/clk/sunxi-ng/ccu_nkm.h                     |    6 +-
 drivers/clk/sunxi-ng/ccu_nkmp.c                    |   55 +-
 drivers/clk/sunxi-ng/ccu_nkmp.h                    |    8 +-
 drivers/clk/sunxi-ng/ccu_nm.c                      |   58 +-
 drivers/clk/sunxi-ng/ccu_nm.h                      |    6 +-
 drivers/clk/sunxi/clk-mod0.c                       |    2 +-
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c         |   21 +-
 drivers/clk/tegra/cvb.c                            |   10 +-
 drivers/clk/ti/clk-3xxx.c                          |   20 +-
 drivers/clk/ti/clk-7xx.c                           |    1 -
 drivers/clk/ti/clk-dra7-atl.c                      |   20 +-
 drivers/clk/ti/clock.h                             |    9 +
 drivers/clk/ti/dpll.c                              |   19 +-
 drivers/clk/ti/dpll3xxx.c                          |   67 +
 drivers/clk/uniphier/Makefile                      |    3 +
 drivers/clk/uniphier/clk-uniphier-core.c           |   23 +-
 drivers/clk/uniphier/clk-uniphier-cpugear.c        |  115 +
 drivers/clk/uniphier/clk-uniphier-mio.c            |    2 +-
 drivers/clk/uniphier/clk-uniphier-mux.c            |    2 +-
 drivers/clk/uniphier/clk-uniphier-sys.c            |   32 +
 drivers/clk/uniphier/clk-uniphier.h                |   47 +-
 drivers/soc/renesas/Makefile                       |    5 +
 drivers/soc/renesas/rcar-rst.c                     |   92 +
 include/dt-bindings/clock/hi3516cv300-clock.h      |   48 +
 include/dt-bindings/clock/histb-clock.h            |   66 +
 include/dt-bindings/clock/imx6ul-clock.h           |   15 +-
 include/dt-bindings/clock/oxsemi,ox810se.h         |   30 +
 include/dt-bindings/clock/oxsemi,ox820.h           |   40 +
 include/dt-bindings/clock/qcom,gcc-msm8994.h       |  137 ++
 include/dt-bindings/clock/qcom,rpmcc.h             |   69 +
 include/dt-bindings/clock/r8a7743-cpg-mssr.h       |   43 +
 include/dt-bindings/clock/r8a7745-cpg-mssr.h       |   44 +
 include/dt-bindings/clock/rk1108-cru.h             |  269 +++
 include/dt-bindings/clock/rk3188-cru-common.h      |    8 +-
 include/dt-bindings/clock/sun50i-a64-ccu.h         |  134 ++
 include/dt-bindings/reset/sun50i-a64-ccu.h         |   98 +
 include/linux/clk-provider.h                       |    2 +-
 include/linux/clk.h                                |   29 +-
 include/linux/clk/renesas.h                        |    4 -
 include/linux/soc/renesas/rcar-rst.h               |    6 +
 181 files changed, 12666 insertions(+), 854 deletions(-)
 rename Documentation/devicetree/bindings/clock/{hi3519-crg.txt => hisi-crg.txt} (80%)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk1108-cru.txt
 create mode 100644 Documentation/devicetree/bindings/reset/renesas,rst.txt
 create mode 100644 drivers/clk/hisilicon/crg-hi3516cv300.c
 create mode 100644 drivers/clk/hisilicon/crg-hi3798cv200.c
 create mode 100644 drivers/clk/hisilicon/crg.h
 create mode 100644 drivers/clk/mediatek/clk-mt2701-bdp.c
 create mode 100644 drivers/clk/mediatek/clk-mt2701-eth.c
 create mode 100644 drivers/clk/mediatek/clk-mt2701-hif.c
 create mode 100644 drivers/clk/mediatek/clk-mt2701-img.c
 create mode 100644 drivers/clk/mediatek/clk-mt2701-mm.c
 create mode 100644 drivers/clk/mediatek/clk-mt2701-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt2701.c
 create mode 100644 drivers/clk/qcom/clk-rpm.c
 create mode 100644 drivers/clk/qcom/clk-smd-rpm.c
 create mode 100644 drivers/clk/qcom/gcc-msm8994.c
 create mode 100644 drivers/clk/renesas/r8a7743-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/r8a7745-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/rcar-gen2-cpg.c
 create mode 100644 drivers/clk/renesas/rcar-gen2-cpg.h
 create mode 100644 drivers/clk/rockchip/clk-rk1108.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-a64.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun50i-a64.h
 create mode 100644 drivers/clk/uniphier/clk-uniphier-cpugear.c
 create mode 100644 drivers/soc/renesas/rcar-rst.c
 create mode 100644 include/dt-bindings/clock/hi3516cv300-clock.h
 create mode 100644 include/dt-bindings/clock/histb-clock.h
 create mode 100644 include/dt-bindings/clock/oxsemi,ox810se.h
 create mode 100644 include/dt-bindings/clock/oxsemi,ox820.h
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8994.h
 create mode 100644 include/dt-bindings/clock/qcom,rpmcc.h
 create mode 100644 include/dt-bindings/clock/r8a7743-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/r8a7745-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/rk1108-cru.h
 create mode 100644 include/dt-bindings/clock/sun50i-a64-ccu.h
 create mode 100644 include/dt-bindings/reset/sun50i-a64-ccu.h
 create mode 100644 include/linux/soc/renesas/rcar-rst.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

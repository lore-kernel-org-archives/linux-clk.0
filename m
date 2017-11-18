Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk changes for v4.15
Date: Fri, 17 Nov 2017 16:17:14 -0800
Message-Id: <20171118001714.22131-1-sboyd@codeaurora.org>
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 4d1dc40185735e285576d7ed865b065c5cabe40c:

  dt-bindings: clock: tegra: Add sor1_out clock (2017-10-17 13:31:10 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

for you to fetch changes up to 36331641eb4296f0c62f4bf1e320d8c30bc6a863:

  Merge branch 'clk-cleanup' into clk-next (2017-11-15 08:16:13 -0800)

----------------------------------------------------------------
We have two changes to the core framework this time around. The first being a
large change that introduces runtime PM support to the clk framework. Now we
properly call runtime PM operations on the device providing a clk when the clk
is in use. This helps on SoCs where the clks provided by a device need
something to be powered on before using the clks, like power domains or
regulators. It also helps power those things down when clks aren't in use. The
other core change is a devm API addition for clk providers so we can get rid of
a bunch of clk driver remove functions that are just doing
of_clk_del_provider().

Outside of the core, we have the usual addition of clk drivers and smattering
of non-critical fixes to existing drivers. The biggest diff is support for
Mediatek MT2712 and MT7622 SoCs, but those patches really just add a bunch
of data.

By the way, we're trying something new here where we build the tree up with
topic branches. We plan to work this into our workflow so that we don't step
on each other's toes, and so the fixes branch can be merged on an as-needed
basis.

Core:
 - Runtime PM support for clk providers
 - devm API for of_clk_add_hw_provider()

New Drivers:
 - Mediatek MT2712 and MT7622
 - Renesas R-Car V3M SoC

Updates:
 - Runtime PM support for Samsung exynos5433/exynos4412 providers
 - Removal of clkdev aliases on Samsung SoCs
 - Convert clk-gpio to use gpio descriptors
 - Various driver cleanups to match kernel coding style
 - Amlogic Video Processing Unit VPU and VAPB clks
 - Sigma-delta modulation for Allwinner audio PLLs
 - Allwinner A83t Display clks
 - Support for the second display unit clock on Renesas RZ/G1E
 - Suspend/resume support for Renesas R-Car Gen3 CPG/MSSR
 - New clock ids for Rockchip rk3188 and rk3368 SoCs
 - Various 'const' markings on clk_ops structures
 - RPM clk support on Qualcomm MSM8996/MSM8660 SoCs

----------------------------------------------------------------
Adriana Reus (2):
      clk: imx: imx7d: Fix parent clock for OCRAM_CLK
      clk: imx: imx7d: Remove ARM_M0 clock

Alexander Syring (1):
      clk: sunxi-ng: Fix missing CLK_SET_RATE_PARENT in ccu-sun4i-a10.c

Andrzej Pietrasiewicz (1):
      clk: samsung: Fix m2m scaler clock on Exynos542x

Arnd Bergmann (3):
      clk: samsung: exynos5433: mark PM functions as __maybe_unused
      clk: mediatek: mark mtk_infrasys_init_early __init
      clk: pxa: fix building on older compilers

Bhumika Goyal (10):
      clk: tegra: Make tegra_clk_pll_params __ro_after_init
      CLK: SPEAr: make structure field and function argument as const
      CLK: SPEAr: make aux_clk_masks structures const
      clk: spear: make clk_ops const
      clk: sirf: make clk_ops const
      clk: mxs: make clk_ops const
      clk: hisilicon: make clk_ops const
      clk: mmp: make clk_ops const
      clk: imx: make clk_ops const
      clk: make clk_init_data const

Chen Zhong (2):
      clk: mediatek: add the option for determining PLL source clock
      clk: mediatek: add clocks dt-bindings required header for MT7622 SoC

Chen-Yu Tsai (12):
      clk: sunxi-ng: Implement reset control status readback
      clk: sunxi-ng: sun6i: Export video PLLs
      clk: sunxi-ng: sun6i: Rename HDMI DDC clock to avoid name collision
      clk: sunxi-ng: sun5i: Fix bit offset of audio PLL post-divider
      clk: sunxi-ng: nm: Check if requested rate is supported by fractional clock
      clk: sunxi-ng: Add sigma-delta modulation support
      clk: sunxi-ng: nm: Add support for sigma-delta modulation
      clk: sunxi-ng: sun8i: h3: Use sigma-delta modulation for audio PLL
      clk: sunxi-ng: sun4i: Use sigma-delta modulation for audio PLL
      clk: sunxi-ng: sun5i: Use sigma-delta modulation for audio PLL
      clk: sunxi-ng: sun6i: Use sigma-delta modulation for audio PLL
      clk: sunxi-ng: sun8i: a23: Use sigma-delta modulation for audio PLL

Colin Ian King (2):
      clk: cdce925: remove redundant check for non-null parent_name
      ARC: clk: fix spelling mistake: "configurarion" -> "configuration"

Corentin LABBE (1):
      clk: sunxi: fix build warning

Dmitry Osipenko (4):
      clk: tegra: Add AHB DMA clock entry
      clk: tegra: Correct parent of the APBDMA clock
      clk: tegra: Use common definition of APBDMA clock gate
      clk: tegra: Bump SCLK clock rate to 216 MHz

Fabrizio Castro (1):
      clk: renesas: cpg-mssr: Add du1 clock to R8A7745

Gabriel Fernandez (1):
      clk: stm32h7: fix test of clock config

Geert Uytterhoeven (10):
      clk: renesas: r8a7795: Correct parent clock of INTC-AP
      clk: renesas: r8a7796: Correct parent clock of INTC-AP
      clk: renesas: r8a77995: Correct parent clock of INTC-AP
      clk: renesas: rz: clk-rz is meant for RZ/A1
      MAINTAINERS: Add git repository to Renesas clock driver section
      clk: renesas: cpg-mssr: Restore module clocks during resume
      clk: renesas: cpg-mssr: Add support to restore core clocks during resume
      clk: renesas: div6: Restore clock state during resume
      clk: renesas: rcar-gen3: Restore SDHI clocks during resume
      clk: renesas: rcar-gen3: Restore R clock during resume

Georgi Djakov (1):
      clk: qcom: Remove unused RCG ops

Heiko Stuebner (2):
      Merge branch 'v4.15-shared/clkids' into v4.15-clk/next
      clk: rockchip: use new cif/vdpu clock ids on rk3188

Icenowy Zheng (2):
      clk: sunxi-ng: add CLK_SET_RATE_UNGATE to all H3 PLLs
      clk: sunxi-ng: add CLK_SET_RATE_PARENT flag to H3 GPU clock

Johan Hovold (2):
      clk: qcom: common: fix legacy board-clock registration
      clk: ti: dra7-atl-clock: fix child-node lookups

Jon Hunter (1):
      clk: tegra: Mark APB clock as critical

Jonathan Liu (1):
      clk: sunxi-ng: sun4i: Export video PLLs

Leo Yan (1):
      clk: hi6220: mark clock cs_atb_syspll as critical

Linus Walleij (5):
      clk: qcom: Elaborate on "active" clocks in the RPM clock bindings
      clk: qcom: Update DT bindings for the MSM8660/APQ8060 RPMCC
      clk: qcom: Implement RPM clocks for MSM8660/APQ8060
      clk: clk-gpio: Make GPIO clock provider use descriptors only
      clk: clk-gpio: Request GPIO descriptor as LOW

Ludovic Desroches (1):
      clk: at91: utmi: set the mainck rate

Marek Szyprowski (19):
      clk: Add support for runtime PM
      clk: samsung: Add support for runtime PM
      clk: samsung: exynos5433: Add support for runtime PM
      clk: samsung: exynos-audss: Use local variable for controller's device
      clk: samsung: exynos-audss: Add support for runtime PM
      clk: samsung: Properly propagate flags in __PLL macro
      clk: samsung: Remove support for Exynos4212 SoCs in Exynos CLKOUT driver
      clk: samsung: Remove support for obsolete Exynos4212 CPU clock
      clk: samsung: Remove clkdev alias support in Exynos4 clk driver
      clk: samsung: Remove double assignment of CLK_ARM_CLK in Exynos4 driver
      clk: samsung: Remove clkdev alias support in Exynos5250 clk driver
      clk: samsung: Drop useless alias in Exynos5420 clk driver
      clk: samsung: Rework clkdev alias handling in Exynos5440 driver
      clk: samsung: Rework clkdev alias handling in S3C2443 driver
      clk: samsung: Add explicit MPLL, EPLL clkdev aliases in S3C2443 driver
      clk: samsung: Remove obsolete clkdev alias support
      clk: samsung: Instantiate Exynos4412 ISP clocks only when available
      clk: samsung: Add dt bindings for Exynos4412 ISP clock controller
      clk: samsung: Add a separate driver for Exynos4412 ISP clocks

Markus Elfring (23):
      clk: samsung: Delete a memory allocation error message in clk-cpu.c
      clk: rockchip: Remove superfluous error message in rockchip_clk_register_cpuclk()
      clk: renesas: mstp: Delete error messages for failed memory allocations
      clk: renesas: rcar-gen2: Delete error message for failed memory allocation
      clk: clk-mux: Delete an error message for a failed memory allocation
      clk: clk-mux: Improve a size determination in clk_hw_register_mux_table()
      clk: clk-u300: Delete error messages for failed memory allocations
      clk: clk-u300: Improve sizeof() usage
      clk: clk-u300: Add some spaces for better code readability
      clk: clk-u300: Fix a typo in two comment lines
      clk: clk-xgene: Delete error messages for failed memory allocations
      clk: clk-xgene: Adjust six checks for null pointers
      clk: mmp: Delete error messages for failed memory allocations
      clk: mmp: Use common error handling code in mmp_clk_register_mix()
      clk: mmp: Adjust checks for NULL pointers
      clk: ti: Delete error messages for failed memory allocations
      clk: spear: Delete error messages for failed memory allocations
      clk: ux500: Delete error messages for failed memory allocations
      clk: ux500: Improve sizeof() usage
      clk: versatile: Delete error messages for failed memory allocations
      clk: versatile: Improve sizeof() usage
      clk: kona-setup: Delete error messages for failed memory allocations
      clk: hisilicon: Delete an error message for a failed memory allocation in hisi_register_clkgate_sep()

Masahiro Yamada (2):
      clk: uniphier: fix parent of miodmac clock data
      clk: uniphier: fix DAPLL2 clock rate of Pro5

Maxime Ripard (1):
      clk: sunxi-ng: Add A83T display clocks

Michał Mirosław (1):
      clk: tegra: Fix cclk_lp divisor register

Mylene JOSSERAND (1):
      clk: sunxi-ng: a83t: Fix i2c buses bits

Neil Armstrong (2):
      clk: meson: gxbb: Add VPU and VAPB clockids
      clk: meson: gxbb: Add VPU and VAPB clocks data

Nicolin Chen (2):
      clk: tegra: dfll: Fix drvdata overwriting issue
      clk: tegra: Use readl_relaxed_poll_timeout_atomic() in tegra210_clock_init()

Ondrej Jirman (1):
      clk: sunxi-ng: a83t: Fix invalid csi-mclk mux offset

Philipp Zabel (2):
      clk: sunxi: explicitly request exclusive reset control
      clk: imx: clk-imx6ul: allow lcdif_pre_sel to change parent rate

Rajendra Nayak (1):
      clk: qcom: clk-smd-rpm: add msm8996 rpmclks

Romain Perier (1):
      clk: rockchip: export clock pclk_efuse_256 for RK3368 SoCs

Sean Wang (2):
      dt-bindings: clock: mediatek: document clk bindings for MediaTek MT7622 SoC
      clk: mediatek: add clock support for MT7622 SoC

Sergei Shtylyov (2):
      dt-bindings: clock: Add R8A77970 CPG core clock definitions
      clk: renesas: cpg-mssr: Add R8A77970 support

Shawn Guo (1):
      clk: hi3798cv200: correct parent mux clock for 'clk_sdio0_ciu'

Stephen Boyd (23):
      Merge branch 'clk-pm-runtime' into clk-next
      Merge branch 'clk-fixes' into clk-next
      Merge tag 'clk-renesas-for-v4.15-tag1' of git://git.kernel.org/.../geert/renesas-drivers into clk-next
      Merge tag 'clk-v4.15-samsung' of git://git.kernel.org/.../snawrocki/clk into clk-next
      Merge tag 'clk-v4.15-exynos-pm' of git://git.kernel.org/.../snawrocki/clk into clk-next
      Merge tag 'sunxi-clk-for-4.15' of https://git.kernel.org/.../sunxi/linux into clk-next
      Merge tag 'meson-clk-for-4.15' of git://github.com/baylibre/clk-meson into clk-next
      Merge tag 'clk-renesas-for-v4.15-tag2' of git://git.kernel.org/.../geert/renesas-drivers into clk-next
      Merge tag 'v4.15-rockchip-clk-1' of git://git.kernel.org/.../mmind/linux-rockchip into clk-next
      clk: Add devm_of_clk_add_hw_provider()/del_provider() APIs
      clk: qcom: common: Migrate to devm_* APIs for resets and clk providers
      Merge tag 'tegra-for-4.15-clk-2' of git://git.kernel.org/.../tegra/linux into clk-next
      Merge branch 'clk-hikey' into clk-next
      Merge branch 'clk-sunxi' into clk-next
      Merge branch 'clk-const' into clk-next
      Merge branch 'clk-devm-provider' into clk-next
      Merge branch 'clk-at91' into clk-next
      Merge branch 'clk-qcom' into clk-next
      Merge branch 'clk-imx' into clk-next
      Merge branch 'clk-mediatek' into clk-next
      Merge branch 'clk-gpio' into clk-next
      Merge branch 'clk-uniphier' into clk-next
      Merge branch 'clk-cleanup' into clk-next

Sébastien Szymanski (1):
      clk: imx6: refine hdmi_isfr's parent to make HDMI work on i.MX6 SoCs w/o VPU

Thierry Reding (5):
      Merge branch 'for-4.15/dt-bindings' into for-4.15/clk
      Merge branch 'for-4.15/firmware' into for-4.15/clk
      clk: tegra: Add peripheral clock registration helper
      clk: tegra: Use tegra_clk_register_periph_data()
      clk: tegra: Fix sor1_out clock implementation

Timo Alho (1):
      clk: tegra: Check BPMP response return code

Zhong Kaihua (1):
      clk: hi3660: fix incorrect uart3 clock freqency

weiyi.lu@mediatek.com (3):
      dt-bindings: ARM: Mediatek: Document bindings for MT2712
      clk: mediatek: Add dt-bindings for MT2712 clocks
      clk: mediatek: Add MT2712 clock support

 .../bindings/arm/mediatek/mediatek,apmixedsys.txt  |    2 +
 .../bindings/arm/mediatek/mediatek,audsys.txt      |   22 +
 .../bindings/arm/mediatek/mediatek,bdpsys.txt      |    1 +
 .../bindings/arm/mediatek/mediatek,ethsys.txt      |    1 +
 .../bindings/arm/mediatek/mediatek,hifsys.txt      |    1 +
 .../bindings/arm/mediatek/mediatek,imgsys.txt      |    1 +
 .../bindings/arm/mediatek/mediatek,infracfg.txt    |    2 +
 .../bindings/arm/mediatek/mediatek,jpgdecsys.txt   |   22 +
 .../bindings/arm/mediatek/mediatek,mcucfg.txt      |   22 +
 .../bindings/arm/mediatek/mediatek,mfgcfg.txt      |   22 +
 .../bindings/arm/mediatek/mediatek,mmsys.txt       |    1 +
 .../bindings/arm/mediatek/mediatek,pciesys.txt     |   22 +
 .../bindings/arm/mediatek/mediatek,pericfg.txt     |    2 +
 .../bindings/arm/mediatek/mediatek,sgmiisys.txt    |   22 +
 .../bindings/arm/mediatek/mediatek,ssusbsys.txt    |   22 +
 .../bindings/arm/mediatek/mediatek,topckgen.txt    |    2 +
 .../bindings/arm/mediatek/mediatek,vdecsys.txt     |    1 +
 .../bindings/arm/mediatek/mediatek,vencsys.txt     |    1 +
 .../devicetree/bindings/clock/clk-exynos-audss.txt |    6 +
 .../devicetree/bindings/clock/exynos4-clock.txt    |   43 +
 .../devicetree/bindings/clock/exynos5433-clock.txt |   16 +
 .../devicetree/bindings/clock/qcom,rpmcc.txt       |   11 +
 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |    5 +-
 .../bindings/clock/renesas,rz-cpg-clocks.txt       |    4 +-
 Documentation/driver-model/devres.txt              |    1 +
 MAINTAINERS                                        |    1 +
 drivers/clk/at91/clk-utmi.c                        |   95 +-
 drivers/clk/bcm/clk-kona-setup.c                   |    7 +-
 drivers/clk/clk-bulk.c                             |    1 +
 drivers/clk/clk-cdce925.c                          |    2 +-
 drivers/clk/clk-gpio.c                             |   84 +-
 drivers/clk/clk-hsdk-pll.c                         |    4 +-
 drivers/clk/clk-mux.c                              |    6 +-
 drivers/clk/clk-stm32h7.c                          |    4 +-
 drivers/clk/clk-twl6040.c                          |    2 +-
 drivers/clk/clk-u300.c                             |   84 +-
 drivers/clk/clk-wm831x.c                           |    6 +-
 drivers/clk/clk-xgene.c                            |   20 +-
 drivers/clk/clk.c                                  |  178 ++-
 drivers/clk/hisilicon/clk-hi3620.c                 |    2 +-
 drivers/clk/hisilicon/clk-hi3660.c                 |    2 +-
 drivers/clk/hisilicon/clk-hi6220.c                 |    2 +-
 drivers/clk/hisilicon/clk-hix5hd2.c                |    4 +-
 drivers/clk/hisilicon/clkgate-separated.c          |    6 +-
 drivers/clk/hisilicon/crg-hi3798cv200.c            |   12 +-
 drivers/clk/imx/clk-busy.c                         |    4 +-
 drivers/clk/imx/clk-gate2.c                        |    2 +-
 drivers/clk/imx/clk-imx6q.c                        |    2 +-
 drivers/clk/imx/clk-imx6ul.c                       |    2 +-
 drivers/clk/imx/clk-imx7d.c                        |   11 +-
 drivers/clk/imx/clk-pllv1.c                        |    2 +-
 drivers/clk/imx/clk-pllv2.c                        |    2 +-
 drivers/clk/mediatek/Kconfig                       |   80 ++
 drivers/clk/mediatek/Makefile                      |   12 +
 drivers/clk/mediatek/clk-mt2701.c                  |    2 +-
 drivers/clk/mediatek/clk-mt2712-bdp.c              |  102 ++
 drivers/clk/mediatek/clk-mt2712-img.c              |   80 ++
 drivers/clk/mediatek/clk-mt2712-jpgdec.c           |   76 ++
 drivers/clk/mediatek/clk-mt2712-mfg.c              |   75 +
 drivers/clk/mediatek/clk-mt2712-mm.c               |  170 +++
 drivers/clk/mediatek/clk-mt2712-vdec.c             |   94 ++
 drivers/clk/mediatek/clk-mt2712-venc.c             |   77 ++
 drivers/clk/mediatek/clk-mt2712.c                  | 1435 ++++++++++++++++++++
 drivers/clk/mediatek/clk-mt7622-aud.c              |  195 +++
 drivers/clk/mediatek/clk-mt7622-eth.c              |  156 +++
 drivers/clk/mediatek/clk-mt7622-hif.c              |  169 +++
 drivers/clk/mediatek/clk-mt7622.c                  |  780 +++++++++++
 drivers/clk/mediatek/clk-mtk.h                     |    3 +
 drivers/clk/mediatek/clk-pll.c                     |   18 +-
 drivers/clk/meson/gxbb.c                           |  292 ++++
 drivers/clk/meson/gxbb.h                           |    6 +-
 drivers/clk/mmp/clk-apbc.c                         |    2 +-
 drivers/clk/mmp/clk-apmu.c                         |    2 +-
 drivers/clk/mmp/clk-frac.c                         |    6 +-
 drivers/clk/mmp/clk-gate.c                         |    4 +-
 drivers/clk/mmp/clk-mix.c                          |   27 +-
 drivers/clk/mmp/clk-mmp2.c                         |    6 +-
 drivers/clk/mmp/clk-pxa168.c                       |    6 +-
 drivers/clk/mmp/clk-pxa910.c                       |    8 +-
 drivers/clk/mxs/clk-div.c                          |    2 +-
 drivers/clk/mxs/clk-frac.c                         |    2 +-
 drivers/clk/pxa/clk-pxa.c                          |    4 +-
 drivers/clk/qcom/clk-rcg.h                         |    3 -
 drivers/clk/qcom/clk-rcg2.c                        |   79 --
 drivers/clk/qcom/clk-rpm.c                         |   93 ++
 drivers/clk/qcom/clk-smd-rpm.c                     |   82 ++
 drivers/clk/qcom/common.c                          |   32 +-
 drivers/clk/renesas/Kconfig                        |    5 +
 drivers/clk/renesas/Makefile                       |    1 +
 drivers/clk/renesas/clk-div6.c                     |   38 +-
 drivers/clk/renesas/clk-div6.h                     |    3 +-
 drivers/clk/renesas/clk-mstp.c                     |    5 +-
 drivers/clk/renesas/clk-rcar-gen2.c                |    1 -
 drivers/clk/renesas/clk-rz.c                       |    2 +-
 drivers/clk/renesas/r8a7745-cpg-mssr.c             |    1 +
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |    3 +-
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |    2 +-
 drivers/clk/renesas/r8a77970-cpg-mssr.c            |  199 +++
 drivers/clk/renesas/r8a77995-cpg-mssr.c            |    2 +-
 drivers/clk/renesas/rcar-gen2-cpg.c                |    7 +-
 drivers/clk/renesas/rcar-gen2-cpg.h                |    6 +-
 drivers/clk/renesas/rcar-gen3-cpg.c                |   79 +-
 drivers/clk/renesas/rcar-gen3-cpg.h                |    3 +-
 drivers/clk/renesas/renesas-cpg-mssr.c             |  105 +-
 drivers/clk/renesas/renesas-cpg-mssr.h             |    4 +-
 drivers/clk/rockchip/clk-cpu.c                     |    2 -
 drivers/clk/rockchip/clk-rk3128.c                  |   12 +-
 drivers/clk/rockchip/clk-rk3188.c                  |   12 +-
 drivers/clk/rockchip/clk-rk3368.c                  |    2 +-
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-cpu.c                      |    2 -
 drivers/clk/samsung/clk-exynos-audss.c             |   76 +-
 drivers/clk/samsung/clk-exynos-clkout.c            |    2 -
 drivers/clk/samsung/clk-exynos4.c                  |  126 +-
 drivers/clk/samsung/clk-exynos4412-isp.c           |  179 +++
 drivers/clk/samsung/clk-exynos5250.c               |   18 +-
 drivers/clk/samsung/clk-exynos5420.c               |    5 +-
 drivers/clk/samsung/clk-exynos5433.c               |  409 ++++--
 drivers/clk/samsung/clk-exynos5440.c               |   12 +-
 drivers/clk/samsung/clk-pll.c                      |   11 +-
 drivers/clk/samsung/clk-s3c2443.c                  |   16 +-
 drivers/clk/samsung/clk.c                          |   45 +-
 drivers/clk/samsung/clk.h                          |   80 +-
 drivers/clk/sirf/clk-atlas6.c                      |    2 +-
 drivers/clk/sirf/clk-atlas7.c                      |   18 +-
 drivers/clk/sirf/clk-common.c                      |   92 +-
 drivers/clk/sirf/clk-prima2.c                      |    2 +-
 drivers/clk/spear/clk-aux-synth.c                  |   10 +-
 drivers/clk/spear/clk-frac-synth.c                 |    6 +-
 drivers/clk/spear/clk-gpt-synth.c                  |    6 +-
 drivers/clk/spear/clk-vco-pll.c                    |   12 +-
 drivers/clk/spear/clk.h                            |    4 +-
 drivers/clk/spear/spear1310_clock.c                |    2 +-
 drivers/clk/spear/spear1340_clock.c                |    2 +-
 drivers/clk/sunxi-ng/Makefile                      |    1 +
 drivers/clk/sunxi-ng/ccu-sun4i-a10.c               |   28 +-
 drivers/clk/sunxi-ng/ccu-sun4i-a10.h               |    4 +-
 drivers/clk/sunxi-ng/ccu-sun5i.c                   |   27 +-
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c               |   40 +-
 drivers/clk/sunxi-ng/ccu-sun6i-a31.h               |    8 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a23.c               |   38 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c              |    6 +-
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c               |   21 +-
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c                |   56 +-
 drivers/clk/sunxi-ng/ccu_common.h                  |    1 +
 drivers/clk/sunxi-ng/ccu_nm.c                      |   25 +-
 drivers/clk/sunxi-ng/ccu_nm.h                      |   25 +
 drivers/clk/sunxi-ng/ccu_reset.c                   |   14 +
 drivers/clk/sunxi-ng/ccu_sdm.c                     |  158 +++
 drivers/clk/sunxi-ng/ccu_sdm.h                     |   80 ++
 drivers/clk/sunxi/clk-factors.c                    |    2 -
 drivers/clk/sunxi/clk-sun9i-mmc.c                  |    2 +-
 drivers/clk/tegra/clk-bpmp.c                       |   15 +-
 drivers/clk/tegra/clk-dfll.c                       |   10 +-
 drivers/clk/tegra/clk-dfll.h                       |    2 +-
 drivers/clk/tegra/clk-id.h                         |    1 +
 drivers/clk/tegra/clk-periph.c                     |    8 +
 drivers/clk/tegra/clk-tegra-periph.c               |   24 +-
 drivers/clk/tegra/clk-tegra-super-gen4.c           |    2 +-
 drivers/clk/tegra/clk-tegra114.c                   |    4 +-
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c         |   12 +-
 drivers/clk/tegra/clk-tegra20.c                    |   13 +-
 drivers/clk/tegra/clk-tegra210.c                   |   51 +-
 drivers/clk/tegra/clk-tegra30.c                    |   23 +-
 drivers/clk/tegra/clk.h                            |    3 +
 drivers/clk/ti/clk-dra7-atl.c                      |    3 +-
 drivers/clk/ti/divider.c                           |    4 +-
 drivers/clk/ti/mux.c                               |    4 +-
 drivers/clk/uniphier/clk-uniphier-mio.c            |    7 +-
 drivers/clk/uniphier/clk-uniphier-sys.c            |    2 +-
 drivers/clk/ux500/clk-prcc.c                       |    6 +-
 drivers/clk/ux500/clk-prcmu.c                      |    6 +-
 drivers/clk/ux500/clk-sysctrl.c                    |    6 +-
 drivers/clk/versatile/clk-icst.c                   |    7 +-
 drivers/firmware/tegra/bpmp.c                      |   22 +-
 include/dt-bindings/clock/exynos4.h                |   35 +
 include/dt-bindings/clock/gxbb-clkc.h              |   11 +
 include/dt-bindings/clock/imx7d-clock.h            |    8 +-
 include/dt-bindings/clock/mt2712-clk.h             |  427 ++++++
 include/dt-bindings/clock/mt7622-clk.h             |  289 ++++
 include/dt-bindings/clock/qcom,rpmcc.h             |   17 +
 include/dt-bindings/clock/r8a77970-cpg-mssr.h      |   48 +
 include/dt-bindings/clock/rk3188-cru-common.h      |    9 +-
 include/dt-bindings/clock/rk3368-cru.h             |    1 +
 include/dt-bindings/clock/s3c2443.h                |    2 +
 include/dt-bindings/clock/sun4i-a10-ccu.h          |    2 +
 include/dt-bindings/clock/sun6i-a31-ccu.h          |    4 +
 include/linux/clk-provider.h                       |   25 +-
 include/linux/soc/qcom/smd-rpm.h                   |    4 +
 include/soc/at91/atmel-sfr.h                       |    2 +
 include/soc/tegra/bpmp.h                           |    1 +
 191 files changed, 7278 insertions(+), 992 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,jpgdecsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mcucfg.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mfgcfg.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,pciesys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,ssusbsys.txt
 create mode 100644 drivers/clk/mediatek/clk-mt2712-bdp.c
 create mode 100644 drivers/clk/mediatek/clk-mt2712-img.c
 create mode 100644 drivers/clk/mediatek/clk-mt2712-jpgdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt2712-mfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt2712-mm.c
 create mode 100644 drivers/clk/mediatek/clk-mt2712-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt2712-venc.c
 create mode 100644 drivers/clk/mediatek/clk-mt2712.c
 create mode 100644 drivers/clk/mediatek/clk-mt7622-aud.c
 create mode 100644 drivers/clk/mediatek/clk-mt7622-eth.c
 create mode 100644 drivers/clk/mediatek/clk-mt7622-hif.c
 create mode 100644 drivers/clk/mediatek/clk-mt7622.c
 create mode 100644 drivers/clk/renesas/r8a77970-cpg-mssr.c
 create mode 100644 drivers/clk/samsung/clk-exynos4412-isp.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_sdm.c
 create mode 100644 drivers/clk/sunxi-ng/ccu_sdm.h
 create mode 100644 include/dt-bindings/clock/mt2712-clk.h
 create mode 100644 include/dt-bindings/clock/mt7622-clk.h
 create mode 100644 include/dt-bindings/clock/r8a77970-cpg-mssr.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

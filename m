Return-Path: <linux-kernel-owner@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
From: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	sboyd@codeaurora.org
To: torvalds@linux-foundation.org
Message-ID: <20150701181050.9112.65937@quantum>
Subject: [GIT PULL] clk: changes for 4.2
Date: Wed, 01 Jul 2015 11:10:50 -0700
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit d4a4f75cd8f29cd9464a5a32e9224a91571d6649:

  Linux 4.1-rc7 (2015-06-07 20:23:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus-4.2

for you to fetch changes up to 358bdf892f6bfacf20884b54a35ab038321f06f9:

  clk: stm32: Add clock driver for STM32F4[23]xxx devices (2015-06-22 16:17:01 -0700)

----------------------------------------------------------------
The changes to the common clock framework for 4.2 are dominated by new
drivers and updates to existing ones, as usual. There are some fixes to
the framework itself and several cleanups for sparse warnings, etc.
Please consider pulling.

----------------------------------------------------------------
Alexander Sverdlin (1):
      clk: axm55xx: Use %zu in pr_info for size_t

Axel Lin (1):
      clk: cdce706: Add missing of_clk_del_provider call in cdce706_remove

Bartlomiej Zolnierkiewicz (1):
      clk: add CLK_RECALC_NEW_RATES clock flag for Exynos cpu clock support

Bintian Wang (3):
      clk: hisilicon: Remove __init for marking function prototypes
      dt-bindings: Add header file of hi6220 clock driver
      clk: hi6220: Clock driver support for Hisilicon hi6220 SoC

Boris Brezillon (2):
      clk: mvebu: add missing CESA gate clk
      clk: mvebu: flag the crypto clk as CLK_IGNORE_UNUSED

Carlo Caione (3):
      clk: meson: Add support for Meson clock controller
      clk: meson: Document bindings for Meson8b clock controller
      clk: meson8b: Add support for Meson8b clocks

Chanwoo Choi (2):
      clk: Show correct information when fail to set clock rate
      clk: exynos5433: Add CLK_SET_RATE_PARENT to support DVFS for big.LITTLE core

Chao Xie (3):
      clk: mmp: add fixed clock UBS_PLL for pxa910/pxa168
      clk: mmp: Fix the wrong factor table for uart PLL
      clk: mmp: add timer clock for pxa168/mmp2/pxa910

Dan Carpenter (2):
      clk: socfpga: remove a stray tab
      clk: meson: add some error handling in meson_clk_register_cpu()

Daniel Thompson (4):
      clk: Update docs after removal of clk-private.h
      clk: fixed: Add comment to clk_fixed_set_rate
      dt-bindings: Document the STM32F4 clock bindings
      clk: stm32: Add clock driver for STM32F4[23]xxx devices

Dinh Nguyen (4):
      clk: socfpga: update clk.h so for Arria10 platform to use
      clk: socfpga: add a clock driver for the Arria 10 platform
      clk: of: helper for filling parent clock array and return num of parents
      clk: socfpga: make use of of_clk_parent_fill helper function

Dong Aisheng (1):
      clk: Squash __clk_{enable,disable}() into callers

Ezequiel Garcia (2):
      clk: pistachio: Add a pll_lock() helper for clarity
      clk: pistachio: Lock the PLL when enabled upon rate change

Felipe Balbi (1):
      clk: add newline character after dumping all clocks

Geert Uytterhoeven (9):
      clk: emev2: Use generic names for device nodes
      clk: shmobile: r8a7794: Document DIV6 clock bindings
      clk: shmobile: div6: Document mandatory compatible fallback
      clk: shmobile: mstp: Document mandatory compatible fallback
      clk: shmobile: rcar-gen2: Document mandatory compatible fallback
      clk: shmobile: rz: Document mandatory compatible fallback
      clk: at91: Use of_clk_get_parent_count() instead of open coding
      clk: st: Use of_clk_get_parent_count() instead of open coding
      clk: ti: Use of_clk_get_parent_count() instead of open coding

Guo Zeng (1):
      ARM: dts: atlas7: add fixed frequency clocks in car node

Hans de Goede (1):
      clk: sunxi: Add support for the usb-clk on sun8i a23 and a33 SoCs

Hyungwon Hwang (1):
      clk: exynos5433: Add DIV_CPIF to the list of stored registers on suspend

James Liao (4):
      clk: mediatek: Add initial common clock support for Mediatek SoCs.
      clk: mediatek: Add basic clocks for Mediatek MT8135.
      clk: mediatek: Add basic clocks for Mediatek MT8173.
      clk: mediatek: Fix apmixedsys clock registration

Joachim Eastwood (4):
      clk: add lpc18xx cgu clk driver
      doc: dt: add documentation for lpc1850-cgu clk driver
      clk: add lpc18xx ccu clk driver
      doc: dt: add documentation for lpc1850-ccu clk driver

Jonghwa Lee (1):
      clk: exynos5433: Add CLK_IGNORE_UNUSED flag to clocks for SMC

Joonyoung Shim (1):
      clk: exynos5433: Add clock flag to support the DVFS of GPU

Kevin Cernekee (1):
      clk: pistachio: Add sanity checks on PLL configuration

Krzysztof Kozlowski (9):
      clk: at91: Constify irq_domain_ops
      clk: rockchip: Staticize file-scope declarations
      clk: exynos: Staticize file-scope declarations
      clk: cdce706: Constify parent names in clock init data
      clk: sirf: Constify parent names in clock init data
      clk: ls1x: Fix duplicate const for parent names
      clk: s3c2410: Staticize local symbols
      clk: s3c2410: Constify platform_device_id
      clk: ti: dra7-atl-clock: Fix possible ERR_PTR dereference

Linus Walleij (1):
      clk: ux500: ape[ate|trace]clk are scaleable

Marcel Ziswiler (1):
      clk: tegra: Fix hda2codec_2x clock name for Tegra30

Maxime Coquelin (1):
      clk: Move debug_node field under DEBUG_FS flag in struct clk_core

Maxime Ripard (2):
      clk: sunxi: Fix of_io_request_and_map error check
      clk: asm9260: Fix of_io_request_and_map error check

Michael Turquette (8):
      Merge branch 'clk-fixes' into clk-next
      Merge branch 'clk-next-hi6220' into clk-next
      Merge remote-tracking branch 'clk/clk-next' into clk-next
      Merge branch 'clk-shmobile-for-4.2' of git://git.kernel.org/.../geert/renesas-drivers into clk-next
      MAINTAINERS: update email for Michael Turquette
      Merge tag 'sunxi-clocks-for-4.2' of https://git.kernel.org/.../mripard/linux into clk-next
      Merge branch 'clk-exynos-cpu-clk' into clk-next
      Merge tag 'tegra-for-4.2-clk' of git://git.kernel.org/.../tegra/linux into clk-next

Mike Looijmans (1):
      Add TI CDCE925 I2C controlled clock synthesizer driver

Mikko Perttunen (3):
      soc/tegra: fuse: Add RAM code reader helper
      clk: tegra: Remove old Tegra124 EMC clock
      clk: tegra: Add EMC clock driver

Murali Karicheri (1):
      clk: keystone: add support for post divider register for main pll

Ray Jui (5):
      clk: iproc: define Broadcom iProc clock binding
      clk: iproc: add initial common clock support
      clk: Change bcm clocks build dependency
      clk: cygnus: add clock support for Broadcom Cygnus
      clk: cygnus: remove Cygnus dummy clock binding

Ricky Liang (1):
      clk: mediatek: Initialize clk_init_data

Rob Herring (2):
      dt-bindings: Add pxa1928 clock binding
      clk: mmp: add PXA1928 clock support

Sascha Hauer (4):
      clk: make strings in parent name arrays const
      clk: mediatek: Add reset controller support
      dt-bindings: ARM: Mediatek: Document devicetree bindings for clock/reset controllers
      dt-bindings: ARM: Mediatek: use more generic node name in examples

Sergej Sawazki (2):
      clk: si5351: fix .round_rate for multisynth 6-7
      clk: si5351: fix .recalc_rate for multisynth 6-7

Shailendra Verma (3):
      clk: Fix typo in clk_register() comment
      clk: samsung: Fix typo in panic log
      clk: clk-conf: Fix typo in comment

Stefan Wahren (1):
      clk: Fix JSON output in debugfs

Stephen Boyd (33):
      clk: s/clk/core/ for struct clk_core
      clk: Drop unnecessary OOM prints
      clk: Remove impossible if condition in clk_core_get_phase()
      clk: Remove forward declared function prototypes
      clk: Update some comments to reflect reality
      Merge branch 'clk-fixes' into clk-next
      Merge branch 'clk-fixes' into clk-next
      clk: Add some more lockdep assertions
      clk: bindings: Fix assigned-clock-rates description
      clk: basic-types: Remove useless allocation failure printks
      clk: gpio-gate: Don't export __init functions
      clk: Silence sparse warnings about __clk_{get,put}()
      clk: max-gen: Silence sparse warnings
      clk: bcm/kona: Silence sparse warnings
      clk: bcm/kona: Remove ccu_list
      clk: berlin: Silence sparse warning
      clk: hix5hd2: Silence sparse warnings
      clk: samsung: Silence sparse warnings
      clk: emev2: Silence sparse warnings
      clk: sirf: Silence sparse warnings
      clk: socfpga: Silence sparse warning
      clk: st: Silence sparse warnings
      clk: ti: Silence sparse warnings
      clk: versatile: Silence sparse warnings
      clk: socfpga: Silence sparse warning
      clk: mmp: Silence sparse warnings
      clk: xgene: Silence sparse warnings
      clk: moxart: Silence sparse warnings
      clk: u300: Silence sparse warnings
      clk: Kconfig: Move bcm Kconfig into clk menu
      Merge branch 'clk-meson8b' into clk-next
      clk: cdce925: Fix printk size_t warning
      clk: pxa: Fix const discarding warning

Thierry Reding (2):
      Merge branch 'for-4.2/ramcode' into for-4.2/clk
      clk: tegra: EMC clock driver depends on EMC driver

Thomas Abraham (4):
      clk: samsung: add infrastructure to register cpu clocks
      clk: samsung: exynos4: add cpu clock configuration data and instantiate cpu clock
      ARM: Exynos: switch to using generic cpufreq driver for Exynos4210
      cpufreq: exynos: remove Exynos4210 specific cpufreq driver support

Tomeu Vizoso (6):
      of: Document long-ram-code property in nvidia,tegra20-apbmisc
      clk: Expose clk_hw_reparent() to providers
      of: document new emc-timings subnode in nvidia,tegra124-car
      of: document external-memory-controller property in tegra124-car
      clk: tegra: Set the EMC clock as the parent of the MC clock
      clk: tegra: Have EMC clock implement determine_rate()

Ulrich Hecht (3):
      clk: shmobile: Add r8a7778 SoC to MSTP bindings
      clk: shmobile: Add r8a7793 SoC to MSTP bindings
      clk: shmobile: r8a7793: Document DIV6 clock bindings

Uwe Kleine-König (1):
      clk: make several parent names const

Zhiwu Song (1):
      clk: sirf: add CSR atlas7 clk and reset support

 Documentation/clk.txt                              |   27 +-
 .../bindings/arm/mediatek/mediatek,apmixedsys.txt  |   23 +
 .../bindings/arm/mediatek/mediatek,infracfg.txt    |   30 +
 .../bindings/arm/mediatek/mediatek,pericfg.txt     |   30 +
 .../bindings/arm/mediatek/mediatek,topckgen.txt    |   23 +
 .../bindings/clock/amlogic,meson8b-clkc.txt        |   40 +
 .../devicetree/bindings/clock/bcm-cygnus-clock.txt |   34 -
 .../bindings/clock/brcm,iproc-clocks.txt           |  132 ++
 .../devicetree/bindings/clock/clock-bindings.txt   |    7 +-
 .../devicetree/bindings/clock/csr,atlas7-car.txt   |   55 +
 .../devicetree/bindings/clock/emev2-clock.txt      |    2 +-
 .../devicetree/bindings/clock/keystone-pll.txt     |    8 +-
 .../devicetree/bindings/clock/lpc1850-ccu.txt      |   77 +
 .../devicetree/bindings/clock/lpc1850-cgu.txt      |  131 ++
 .../devicetree/bindings/clock/marvell,pxa1928.txt  |   21 +
 .../bindings/clock/mvebu-gated-clock.txt           |    1 +
 .../bindings/clock/nvidia,tegra124-car.txt         |   44 +-
 .../bindings/clock/renesas,cpg-div6-clocks.txt     |    6 +-
 .../bindings/clock/renesas,cpg-mstp-clocks.txt     |    6 +-
 .../clock/renesas,rcar-gen2-cpg-clocks.txt         |    2 +-
 .../bindings/clock/renesas,rz-cpg-clocks.txt       |    2 +-
 .../devicetree/bindings/clock/st,stm32-rcc.txt     |   65 +
 Documentation/devicetree/bindings/clock/sunxi.txt  |    1 +
 .../devicetree/bindings/clock/ti,cdce925.txt       |   42 +
 .../bindings/misc/nvidia,tegra20-apbmisc.txt       |    2 +
 MAINTAINERS                                        |    2 +-
 arch/arm/boot/dts/atlas7.dtsi                      |   15 +
 arch/arm/mach-exynos/exynos.c                      |   21 +-
 drivers/clk/Kconfig                                |   21 +-
 drivers/clk/Makefile                               |   11 +-
 drivers/clk/at91/clk-main.c                        |    2 +-
 drivers/clk/at91/clk-master.c                      |    2 +-
 drivers/clk/at91/clk-programmable.c                |    2 +-
 drivers/clk/at91/clk-slow.c                        |    4 +-
 drivers/clk/at91/clk-smd.c                         |    2 +-
 drivers/clk/at91/clk-usb.c                         |    2 +-
 drivers/clk/at91/pmc.c                             |    2 +-
 drivers/clk/bcm/Kconfig                            |    9 +
 drivers/clk/bcm/Makefile                           |    2 +
 drivers/clk/bcm/clk-cygnus.c                       |  265 +++
 drivers/clk/bcm/clk-iproc-armpll.c                 |  282 +++
 drivers/clk/bcm/clk-iproc-asiu.c                   |  276 +++
 drivers/clk/bcm/clk-iproc-pll.c                    |  716 +++++++
 drivers/clk/bcm/clk-iproc.h                        |  178 ++
 drivers/clk/bcm/clk-kona-setup.c                   |    4 -
 drivers/clk/bcm/clk-kona.c                         |    2 +-
 drivers/clk/bcm/clk-kona.h                         |    2 -
 drivers/clk/berlin/berlin2-pll.c                   |    9 +-
 drivers/clk/clk-asm9260.c                          |    2 +-
 drivers/clk/clk-axm5516.c                          |    2 +-
 drivers/clk/clk-cdce706.c                          |    5 +-
 drivers/clk/clk-cdce925.c                          |  749 ++++++++
 drivers/clk/clk-composite.c                        |    6 +-
 drivers/clk/clk-conf.c                             |    7 +-
 drivers/clk/clk-divider.c                          |    6 +-
 drivers/clk/clk-fixed-factor.c                     |   12 +-
 drivers/clk/clk-fixed-rate.c                       |    6 +-
 drivers/clk/clk-fractional-divider.c               |    4 +-
 drivers/clk/clk-gate.c                             |    6 +-
 drivers/clk/clk-gpio-gate.c                        |    3 +-
 drivers/clk/clk-ls1x.c                             |    6 +-
 drivers/clk/clk-max-gen.c                          |    2 +
 drivers/clk/clk-moxart.c                           |    4 +-
 drivers/clk/clk-mux.c                              |    6 +-
 drivers/clk/clk-si5351.c                           |   26 +-
 drivers/clk/clk-stm32f4.c                          |  380 ++++
 drivers/clk/clk-u300.c                             |    1 +
 drivers/clk/clk-xgene.c                            |   22 +-
 drivers/clk/clk.c                                  | 2000 ++++++++++----------
 drivers/clk/hisilicon/Kconfig                      |    6 +
 drivers/clk/hisilicon/Makefile                     |    3 +-
 drivers/clk/hisilicon/clk-hi3620.c                 |   70 +-
 drivers/clk/hisilicon/clk-hi6220.c                 |  284 +++
 drivers/clk/hisilicon/clk-hix5hd2.c                |   11 +-
 drivers/clk/hisilicon/clk.c                        |   29 +
 drivers/clk/hisilicon/clk.h                        |   41 +-
 drivers/clk/hisilicon/clkdivider-hi6220.c          |  156 ++
 drivers/clk/keystone/pll.c                         |   20 +-
 drivers/clk/mediatek/Makefile                      |    4 +
 drivers/clk/mediatek/clk-gate.c                    |  137 ++
 drivers/clk/mediatek/clk-gate.h                    |   49 +
 drivers/clk/mediatek/clk-mt8135.c                  |  644 +++++++
 drivers/clk/mediatek/clk-mt8173.c                  |  830 ++++++++
 drivers/clk/mediatek/clk-mtk.c                     |  220 +++
 drivers/clk/mediatek/clk-mtk.h                     |  169 ++
 drivers/clk/mediatek/clk-pll.c                     |  332 ++++
 drivers/clk/mediatek/reset.c                       |   97 +
 drivers/clk/meson/Makefile                         |    6 +
 drivers/clk/meson/clk-cpu.c                        |  242 +++
 drivers/clk/meson/clk-pll.c                        |  227 +++
 drivers/clk/meson/clkc.c                           |  250 +++
 drivers/clk/meson/clkc.h                           |  187 ++
 drivers/clk/meson/meson8b-clkc.c                   |  196 ++
 drivers/clk/mmp/Makefile                           |    2 +
 drivers/clk/mmp/clk-apbc.c                         |    2 +-
 drivers/clk/mmp/clk-apmu.c                         |    2 +-
 drivers/clk/mmp/clk-mmp2.c                         |    4 +-
 drivers/clk/mmp/clk-of-mmp2.c                      |   10 +-
 drivers/clk/mmp/clk-of-pxa168.c                    |    8 +
 drivers/clk/mmp/clk-of-pxa1928.c                   |  265 +++
 drivers/clk/mmp/clk-of-pxa910.c                    |   12 +
 drivers/clk/mvebu/armada-370.c                     |    1 +
 drivers/clk/mxs/clk-imx23.c                        |   12 +-
 drivers/clk/mxs/clk-imx28.c                        |   18 +-
 drivers/clk/mxs/clk.h                              |    2 +-
 drivers/clk/nxp/Makefile                           |    2 +
 drivers/clk/nxp/clk-lpc18xx-ccu.c                  |  293 +++
 drivers/clk/nxp/clk-lpc18xx-cgu.c                  |  635 +++++++
 drivers/clk/pistachio/clk-pll.c                    |  115 +-
 drivers/clk/pxa/clk-pxa.h                          |    4 +-
 drivers/clk/rockchip/clk-cpu.c                     |    2 +-
 drivers/clk/rockchip/clk-mmc-phase.c               |    2 +-
 drivers/clk/rockchip/clk-pll.c                     |    8 +-
 drivers/clk/rockchip/clk-rk3188.c                  |    2 +-
 drivers/clk/rockchip/clk-rk3288.c                  |    2 +-
 drivers/clk/rockchip/clk.c                         |    8 +-
 drivers/clk/rockchip/clk.h                         |   20 +-
 drivers/clk/samsung/Makefile                       |    2 +-
 drivers/clk/samsung/clk-cpu.c                      |  349 ++++
 drivers/clk/samsung/clk-cpu.h                      |   73 +
 drivers/clk/samsung/clk-exynos4.c                  |   24 +-
 drivers/clk/samsung/clk-exynos5260.c               |  100 +-
 drivers/clk/samsung/clk-exynos5420.c               |   10 +-
 drivers/clk/samsung/clk-exynos5433.c               |   81 +-
 drivers/clk/samsung/clk-pll.c                      |    4 +-
 drivers/clk/samsung/clk-s3c2410-dclk.c             |    6 +-
 drivers/clk/samsung/clk-s5pv210.c                  |   88 +-
 drivers/clk/samsung/clk.c                          |   15 +-
 drivers/clk/samsung/clk.h                          |   18 +-
 drivers/clk/shmobile/clk-emev2.c                   |    2 +-
 drivers/clk/sirf/Makefile                          |    2 +-
 drivers/clk/sirf/clk-atlas7.c                      | 1632 ++++++++++++++++
 drivers/clk/sirf/clk-common.c                      |   16 +-
 drivers/clk/socfpga/Makefile                       |    1 +
 drivers/clk/socfpga/clk-gate-a10.c                 |  190 ++
 drivers/clk/socfpga/clk-gate.c                     |   12 +-
 drivers/clk/socfpga/clk-periph-a10.c               |  138 ++
 drivers/clk/socfpga/clk-periph.c                   |    2 +-
 drivers/clk/socfpga/clk-pll-a10.c                  |  129 ++
 drivers/clk/socfpga/clk-pll.c                      |    7 +-
 drivers/clk/socfpga/clk.c                          |    7 +-
 drivers/clk/socfpga/clk.h                          |   11 +-
 drivers/clk/st/clk-flexgen.c                       |    8 +-
 drivers/clk/st/clkgen-fsyn.c                       |    4 +-
 drivers/clk/st/clkgen-mux.c                        |   16 +-
 drivers/clk/st/clkgen-pll.c                        |   10 +-
 drivers/clk/sunxi/clk-sun9i-core.c                 |   10 +-
 drivers/clk/sunxi/clk-sunxi.c                      |    2 +
 drivers/clk/sunxi/clk-usb.c                        |   11 +
 drivers/clk/tegra/Kconfig                          |    3 +
 drivers/clk/tegra/Makefile                         |    1 +
 drivers/clk/tegra/clk-emc.c                        |  538 ++++++
 drivers/clk/tegra/clk-tegra124.c                   |   19 +-
 drivers/clk/tegra/clk-tegra30.c                    |    2 +-
 drivers/clk/tegra/clk.h                            |   12 +
 drivers/clk/ti/clk-dra7-atl.c                      |    9 +-
 drivers/clk/ti/clk.c                               |    4 +-
 drivers/clk/ti/clockdomain.c                       |    2 +-
 drivers/clk/ti/dpll.c                              |    2 +-
 drivers/clk/ti/fapll.c                             |    6 +-
 drivers/clk/ux500/u8500_clk.c                      |    7 +-
 drivers/clk/ux500/u8500_of_clk.c                   |    4 +-
 drivers/clk/versatile/clk-sp810.c                  |    4 +-
 drivers/clk/zynq/clkc.c                            |   25 +-
 drivers/cpufreq/Kconfig.arm                        |   11 -
 drivers/cpufreq/Makefile                           |    1 -
 drivers/cpufreq/exynos-cpufreq.c                   |    5 +-
 drivers/cpufreq/exynos-cpufreq.h                   |    9 -
 drivers/cpufreq/exynos4210-cpufreq.c               |  184 --
 drivers/soc/tegra/fuse/tegra-apbmisc.c             |   21 +
 include/dt-bindings/clock/bcm-cygnus.h             |   68 +
 include/dt-bindings/clock/hi6220-clock.h           |  173 ++
 include/dt-bindings/clock/lpc18xx-ccu.h            |   74 +
 include/dt-bindings/clock/lpc18xx-cgu.h            |   41 +
 include/dt-bindings/clock/marvell,mmp2.h           |    1 +
 include/dt-bindings/clock/marvell,pxa168.h         |    3 +
 include/dt-bindings/clock/marvell,pxa1928.h        |   57 +
 include/dt-bindings/clock/marvell,pxa910.h         |    4 +
 include/dt-bindings/clock/meson8b-clkc.h           |   25 +
 include/dt-bindings/clock/mt8135-clk.h             |  194 ++
 include/dt-bindings/clock/mt8173-clk.h             |  235 +++
 .../dt-bindings/reset-controller/mt8135-resets.h   |   64 +
 .../dt-bindings/reset-controller/mt8173-resets.h   |   63 +
 include/linux/clk-provider.h                       |   16 +-
 include/soc/tegra/fuse.h                           |    1 +
 185 files changed, 14641 insertions(+), 1765 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,pericfg.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
 delete mode 100644 Documentation/devicetree/bindings/clock/bcm-cygnus-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,iproc-clocks.txt
 create mode 100644 Documentation/devicetree/bindings/clock/csr,atlas7-car.txt
 create mode 100644 Documentation/devicetree/bindings/clock/lpc1850-ccu.txt
 create mode 100644 Documentation/devicetree/bindings/clock/lpc1850-cgu.txt
 create mode 100644 Documentation/devicetree/bindings/clock/marvell,pxa1928.txt
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti,cdce925.txt
 create mode 100644 drivers/clk/bcm/clk-cygnus.c
 create mode 100644 drivers/clk/bcm/clk-iproc-armpll.c
 create mode 100644 drivers/clk/bcm/clk-iproc-asiu.c
 create mode 100644 drivers/clk/bcm/clk-iproc-pll.c
 create mode 100644 drivers/clk/bcm/clk-iproc.h
 create mode 100644 drivers/clk/clk-cdce925.c
 create mode 100644 drivers/clk/clk-stm32f4.c
 create mode 100644 drivers/clk/hisilicon/Kconfig
 create mode 100644 drivers/clk/hisilicon/clk-hi6220.c
 create mode 100644 drivers/clk/hisilicon/clkdivider-hi6220.c
 create mode 100644 drivers/clk/mediatek/Makefile
 create mode 100644 drivers/clk/mediatek/clk-gate.c
 create mode 100644 drivers/clk/mediatek/clk-gate.h
 create mode 100644 drivers/clk/mediatek/clk-mt8135.c
 create mode 100644 drivers/clk/mediatek/clk-mt8173.c
 create mode 100644 drivers/clk/mediatek/clk-mtk.c
 create mode 100644 drivers/clk/mediatek/clk-mtk.h
 create mode 100644 drivers/clk/mediatek/clk-pll.c
 create mode 100644 drivers/clk/mediatek/reset.c
 create mode 100644 drivers/clk/meson/Makefile
 create mode 100644 drivers/clk/meson/clk-cpu.c
 create mode 100644 drivers/clk/meson/clk-pll.c
 create mode 100644 drivers/clk/meson/clkc.c
 create mode 100644 drivers/clk/meson/clkc.h
 create mode 100644 drivers/clk/meson/meson8b-clkc.c
 create mode 100644 drivers/clk/mmp/clk-of-pxa1928.c
 create mode 100644 drivers/clk/nxp/Makefile
 create mode 100644 drivers/clk/nxp/clk-lpc18xx-ccu.c
 create mode 100644 drivers/clk/nxp/clk-lpc18xx-cgu.c
 create mode 100644 drivers/clk/samsung/clk-cpu.c
 create mode 100644 drivers/clk/samsung/clk-cpu.h
 create mode 100644 drivers/clk/sirf/clk-atlas7.c
 create mode 100644 drivers/clk/socfpga/clk-gate-a10.c
 create mode 100644 drivers/clk/socfpga/clk-periph-a10.c
 create mode 100644 drivers/clk/socfpga/clk-pll-a10.c
 create mode 100644 drivers/clk/tegra/Kconfig
 create mode 100644 drivers/clk/tegra/clk-emc.c
 delete mode 100644 drivers/cpufreq/exynos4210-cpufreq.c
 create mode 100644 include/dt-bindings/clock/bcm-cygnus.h
 create mode 100644 include/dt-bindings/clock/hi6220-clock.h
 create mode 100644 include/dt-bindings/clock/lpc18xx-ccu.h
 create mode 100644 include/dt-bindings/clock/lpc18xx-cgu.h
 create mode 100644 include/dt-bindings/clock/marvell,pxa1928.h
 create mode 100644 include/dt-bindings/clock/meson8b-clkc.h
 create mode 100644 include/dt-bindings/clock/mt8135-clk.h
 create mode 100644 include/dt-bindings/clock/mt8173-clk.h
 create mode 100644 include/dt-bindings/reset-controller/mt8135-resets.h
 create mode 100644 include/dt-bindings/reset-controller/mt8173-resets.h

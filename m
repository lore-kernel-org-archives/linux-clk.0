Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk changes for v4.13
Date: Thu,  6 Jul 2017 18:53:19 -0700
Message-Id: <20170707015319.9018-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 949bdfed4b0f74215da60992e9f5e14c9ecbb064:

  Merge tag 'sunxi-clk-fixes-for-4.12' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into clk-fixes (2017-06-14 16:48:03 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

for you to fetch changes up to 3cf50f6b13a2b2325532bc389107e6a2dcc99314:

  Merge branch 'binding-doc-cp110-ap806' of git://git.infradead.org/linux-mvebu into clk-next (2017-06-30 12:23:05 -0700)

----------------------------------------------------------------
This time we've got one core change to introduce a bulk clk_get API,
some new clk drivers and updates for old ones. The diff is pretty
spread out across a handful of different SoC clk drivers for Broadcom, TI,
Qualcomm, Renesas, Rockchip, Samsung, and Allwinner, mostly due to the
introduction of new drivers.

Core:
 - New clk bulk get APIs
 - Clk divider APIs gained the ability to consider a different parent than
   the current one

New Drivers:
 - Renesas r8a779{0,1,2,4} CPG/MSSR
 - TI Keystone SCI firmware controlled clks and OMAP4 clkctrl
 - Qualcomm IPQ8074 SoCs
 - Cortina Systems Gemini (SL3516/CS3516)
 - Rockchip rk3128 SoCs
 - Allwinner A83T clk control units
 - Broadcom Stingray SoCs
 - CPU clks for Mediatek MT8173/MT2701/MT7623 SoCs

Removed Drivers:
 - Old non-DT version of the Realview clk driver

Updates:
 - Renesas Kconfig/Makefile cleanups
 - Amlogic CEC EE clk support
 - Improved Armada 7K/8K cp110 clk support
 - Rockchip clk id exposing, critical clk markings
 - Samsung converted to clk_hw registration APIs
 - Fixes for Samsung exynos5420 audio clks
 - USB2 clks for Hisilicon hi3798cv200 SoC and video/camera clks for hi3660

----------------------------------------------------------------
Abhishek Sahu (2):
      clk: qcom: Add DT bindings for ipq8074 gcc clock controller
      clk: qcom: Add ipq8074 Global Clock Controller support

Alexandre Belloni (3):
      clk: at91: fix clk-generated parenting
      clk: at91: fix clk-generated compilation
      clk: at91: Add sama5d2 suspend/resume

Arnd Bergmann (2):
      clk: sunxi-ng: select SUNXI_CCU_MULT for sun8i-a83t
      clk: keystone: TI_SCI_PROTOCOL is needed for clk driver

Arvind Yadav (1):
      clk: palmas: undo preparation of a clock source.

Bryan O'Donoghue (1):
      clk: Fix __set_clk_rates error print-string

Chen Jun (2):
      clk: hi3660: fix wrong parent name of clk_mux_sysbus
      clk: hi3660: add clocks for video encoder, decoder and ISP

Chen-Yu Tsai (7):
      dt-bindings: clock: sunxi-ccu: Add compatible string for A83T CCU
      clk: sunxi-ng: Support multiple variable pre-dividers
      clk: sunxi-ng: Add driver for A83T CCU
      clk: sunxi-ng: a83t: Fix PLL lock status register offset
      clk: sunxi-ng: a83t: Fix audio PLL divider offset
      dt-bindings: clock: sunxi-ccu: Add compatible string for A83T PRCM
      clk: sunxi-ng: a83t: Add support for A83T's PRCM

Dinh Nguyen (1):
      clk: socfpga: Fix the smplsel on Arria10 and Stratix10

Dong Aisheng (2):
      clk: add clk_bulk_get accessories
      clk: add managed version of clk_bulk_get

Eddie Cai (1):
      clk: rockchip: add ids for rk3399 testclks used for camera handling

Elaine Zhang (9):
      clk: rockchip: fix up the RK3228 clk cpu setting table
      clk: rockchip: add dt-binding header for rk3128
      clk: rockchip: export more rk3228 clocks ids
      dt-bindings: add bindings for rk3128 clock controller
      clk: rockchip: add clock controller for rk3128
      clk: rockchip: mark pclk_ddrupctl as critical_clock on rk3036
      clk: rockchip: mark noc and some special clk as critical on rk3228
      clk: rockchip: mark noc and some special clk as critical on rk3288
      clk: rockchip: mark some special clk as critical on rk3368

Fabio Estevam (2):
      clk: imx7d: Fix the powerdown bit location of PLL DDR
      clk: imx7d: Fix the DDR PLL enable bit

Geert Uytterhoeven (20):
      clk: renesas: rcar-gen2: Fix PLL0 on R-Car V2H and E2
      clk: renesas: r8a7745: Remove nonexisting scu-src[0789] clocks
      clk: renesas: r8a7745: Remove PLL configs for MD19=0
      clk: renesas: Do not build clk-div6 for R8A7792
      clk: renesas: Use pm_clk_no_clocks() helper i.s.o. direct access
      clk: renesas: r8a7795: Correct pwm, gpio, and i2c parent clocks on ES2.0
      clk: renesas: cpg-mssr: Initialize error pointer using ERR_PTR()
      clk: renesas: Rework Kconfig and Makefile logic
      clk: renesas: cpg-mssr: Document R-Car Gen2 support
      clk: renesas: Add r8a7790 CPG Core Clock Definitions
      clk: renesas: Add r8a7791 CPG Core Clock Definitions
      clk: renesas: Add r8a7792 CPG Core Clock Definitions
      clk: renesas: Add r8a7793 CPG Core Clock Definitions
      clk: renesas: Add r8a7794 CPG Core Clock Definitions
      clk: renesas: r8a7790: Add new CPG/MSSR driver
      clk: renesas: r8a7791/r8a7793: Add new CPG/MSSR driver
      clk: renesas: r8a7792: Add new CPG/MSSR driver
      clk: renesas: r8a7794: Add new CPG/MSSR driver
      clk: Provide dummy of_clk_get_from_provider() for compile-testing
      clk: renesas: cpg-mssr: Use of_device_get_match_data() helper

Gregory CLEMENT (14):
      dt-bindings: ap806: do not depend anymore of the *-clock-output-names
      dt-bindings: ap806: introduce a new binding
      clk: mvebu: ap806: cosmetic improvement
      clk: mvebu: ap806: do not depend anymore of the *-clock-output-names
      clk: mvebu: ap806: introduce a new binding
      clk: mvebu: cp110: make failure labels more meaningful
      dt-bindings: cp110: do not depend anymore of the *-clock-output-names
      dt-bindings: cp110: introduce a new binding
      dt-bindings: cp110: add sdio clock to cp-110 system controller
      pinctrl: dt-bindings: add documentation for AP806 pin controllers
      pinctrl: dt-bindings: add documentation for CP110 pin controllers
      clk: mvebu: cp110: do not depend anymore of the *-clock-output-names
      clk: mvebu: cp110: introduce a new binding
      gpio: dt-bindings: Add documentation for gpio controllers on Armada 7K/8K

Harunobu Kurokawa (1):
      clk: renesas: r8a7796: Add PCIe clocks

Heiko Stuebner (1):
      Merge branch 'v4.13-shared/clkids' into v4.13-clk/next

Hiromitsu Yamasaki (2):
      clk: renesas: r8a7796: Add Audio-DMAC clocks
      clk: renesas: r8a7796: Add USB-DMAC clocks

Icenowy Zheng (2):
      dt-bindings: add binding for the Allwinner DE2 CCU
      clk: sunxi-ng: add support for DE2 CCU

Jerome Brunet (4):
      clk: gxbb: remove CLK_IGNORE_UNUSED from clk81
      Merge branch 'next/headers' into next/drivers
      clk: meson: gxbb: add all clk81 parents
      clk: scpi: error when clock fails to register

Jiancheng Xue (1):
      clk: hisilicon: add usb2 clocks for hi3798cv200 SoC

Joel Stanley (1):
      clk: gemini: Read status before using the value

Kazuya Mizuguchi (5):
      clk: renesas: r8a7796: Add EHCI/OHCI clocks
      clk: renesas: r8a7796: Add Sound SSI clock
      clk: renesas: r8a7796: Add Sound SRC clock
      clk: renesas: r8a7796: Add Sound DVC clocks
      clk: renesas: r8a7796: Add HS-USB clock

Koji Matsuoka (1):
      clk: renesas: r8a7796: Add HDMI clock

Konstantin Porotchkin (1):
      clk: mvebu: cp110: add sdio clock to cp-110 system controller

Krzysztof Kozlowski (1):
      clk: samsung: audss: Fix silent hang on Exynos4412 due to disabled EPLL

Leo Yan (1):
      clk: Hi3660: register fixed_rate_clks with CLK_OF_DECLARE_DRIVER

Linus Walleij (4):
      clk: versatile: delete old RealView clock implementation
      reset: add DT bindings header for Gemini reset controller
      clk: add DT bindings header for Gemini clock controller
      clk: Add Gemini SoC clock controller

Marek Szyprowski (6):
      clk: samsung: Remove dead code
      clk: samsung: Add local variable to match its purpose
      clk: samsung: Convert common drivers to the new clk_hw API
      clk: samsung: exynos-audss: Convert to the new clk_hw API
      clk: samsung: exynos-clkout: Convert to the new clk_hw API
      clk: samsung: s5pv210-audss: Convert to the new clk_hw API

Martin Blumenstingl (3):
      clk: meson: gxbb: remove the "cpu_clk" from the GXBB and GXL driver
      clk: meson: meson8b: mark clk81 as critical
      clk: meson: meson8b: add compatibles for Meson8 and Meson8m2

Masahiro Yamada (1):
      clk: uniphier: provide NAND controller clock rate

Maxime Ripard (8):
      clk: divider: Make divider_round_rate take the parent clock
      clk: sunxi-ng: Pass the parent and a pointer to the clocks round rate
      clk: sunxi-ng: div: Switch to divider_round_rate
      clk: sunxi-ng: mux: Don't just rely on the parent for CLK_SET_RATE_PARENT
      clk: sunxi-ng: mux: split out the pre-divider computation code
      clk: sunxi-ng: mux: Change pre-divider application function prototype
      clk: sunxi-ng: mux: Re-adjust parent rate
      clk: sunxi-ng: sun5i: Export video PLLs

Michael Turquette (2):
      Merge branch 'clk-ap806' into clk-next
      Merge tag 'clk-renesas-for-v4.13-tag1' of git://git.kernel.org/.../geert/renesas-drivers into clk-next

Neil Armstrong (1):
      clk: meson-gxbb: Add EE 32K Clock for CEC

Phil Elwell (3):
      clk: bcm2835: Correct the prediv logic
      clk: bcm2835: Limit PCM clock to OSC and PLLD_PER
      clk: bcm2835: Minimise clock jitter for PCM clock

Ralph Sennhauser (1):
      clk: mvebu: armada-38x: add support for 1866MHz variants

Ryo Kodama (1):
      clk: renesas: r8a7796: Add PWM clock

Sandeep Tripathy (2):
      dt-bindings: clk: Extend binding doc for Stingray SOC
      clk: bcm: Add clocks for Stingray SOC

Scott Wood (2):
      dt-bindings: qoriq-clock: Add coreclk
      clk: qoriq: Separate root input clock for core PLLs on ls1012a

Sean Wang (3):
      clk: mediatek: add missing cpu mux causing Mediatek cpufreq can't work
      clk: mediatek: export cpu multiplexer clock for MT2701/MT7623 SoCs
      clk: mediatek: export cpu multiplexer clock for MT8173 SoCs

Shawn Guo (1):
      clk: zx296718: export I2S mux clocks

Srinivas Kandagatla (1):
      clk: gcc-msm8916: add support to 9.6MHz codec clk

Stefan Agner (1):
      clk: imx7d: create clocks behind rawnand clock gate

Stephen Boyd (15):
      Merge tag 'meson-clk-for-4.13' of git://github.com/BayLibre/clk-meson into clk-next
      clk: meson-gxbb: Add const to some parent name arrays
      Merge branch 'clk-bulk-get' into clk-next
      clk: sunxi-ng: Move all clock types to a library
      Merge tag 'v4.13-rockchip-clk1' of git://git.kernel.org/.../mmind/linux-rockchip into clk-next
      Merge tag 'clk-v4.13-samsung' of git://git.kernel.org/.../snawrocki/clk into clk-next
      Merge branch 'clk-fixes' into clk-next
      Merge tag 'sunxi-clk-for-4.13' of https://git.kernel.org/.../sunxi/linux into clk-next
      clk: sunxi-ng: Staticize ccu_mux_helper_unapply_prediv()
      Merge branch 'for-4.13-ti-clkctrl' of https://github.com/t-kristo/linux-pm into clk-next
      Merge tag 'meson-clk-for-4.13-2' of git://github.com/BayLibre/clk-meson into clk-next
      Merge branch 'clk-cp110' of git://git.infradead.org/linux-mvebu into clk-next
      clk: mvebu: cp110: Minor cleanups
      clk: iproc: Remove __init marking on iproc_pll_clk_setup()
      Merge branch 'binding-doc-cp110-ap806' of git://git.infradead.org/linux-mvebu into clk-next

Sudeep Holla (1):
      clk: scpi: fix return type of __scpi_dvfs_round_rate

Sylwester Nawrocki (3):
      clk: samsung: Add enable/disable operation for PLL36XX clocks
      clk: samsung: Add missing exynos5420 audio related clocks
      clk: samsung: exynos542x: Add EPLL rate table

Takeshi Kihara (4):
      clk: renesas: r8a7795: Add EHCI/OHCI ch3 clock
      clk: renesas: r8a7795: Add USB-DMAC ch3 clock
      clk: renesas: r8a7795: Add HS-USB ch3 clock
      clk: renesas: r8a7796: Add INTC-EX clock

Tero Kristo (5):
      Documentation: dt: Add TI SCI clock driver
      clk: keystone: Add sci-clk driver support
      clk: ti: add support for clkctrl clocks
      dt-bindings: clk: add omap4 clkctrl definitions
      clk: ti: omap4: add clkctrl clock data

Tobias Klauser (1):
      clk: sunxi-ng: explicitly include linux/spinlock.h

Tony Lindgren (1):
      Documentation: dt-bindings: Add binding documentation for TI clkctrl clocks

Wei Yongjun (1):
      clk: sunxi-ng: de2: fix wrong pointer passed to PTR_ERR()

Zhangfei Gao (1):
      clk: hi6220: add acpu clock

Zhong Kaihua (1):
      clk: hi3660: Set PPLL2 to 2880M

 .../arm/marvell/ap806-system-controller.txt        |   85 +-
 .../arm/marvell/cp110-system-controller0.txt       |  144 ++-
 .../bindings/clock/amlogic,meson8b-clkc.txt        |   11 +-
 .../bindings/clock/brcm,iproc-clocks.txt           |   76 ++
 .../devicetree/bindings/clock/hi6220-clock.txt     |    1 +
 .../devicetree/bindings/clock/qcom,gcc.txt         |    1 +
 .../devicetree/bindings/clock/qoriq-clock.txt      |    6 +
 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |   10 +-
 .../bindings/clock/rockchip,rk3128-cru.txt         |   56 ++
 .../devicetree/bindings/clock/sun8i-de2.txt        |   31 +
 .../devicetree/bindings/clock/sunxi-ccu.txt        |    5 +-
 .../devicetree/bindings/clock/ti,sci-clk.txt       |   37 +
 .../devicetree/bindings/clock/ti-clkctrl.txt       |   56 ++
 .../devicetree/bindings/gpio/gpio-mvebu.txt        |   24 +-
 MAINTAINERS                                        |    2 +
 arch/mips/lantiq/clk.c                             |    5 -
 drivers/clk/Kconfig                                |   17 +-
 drivers/clk/Makefile                               |    7 +-
 drivers/clk/at91/clk-generated.c                   |    6 +-
 drivers/clk/at91/clk-peripheral.c                  |    4 +-
 drivers/clk/at91/pmc.c                             |  129 +++
 drivers/clk/at91/pmc.h                             |    6 +
 drivers/clk/bcm/Kconfig                            |    8 +
 drivers/clk/bcm/Makefile                           |    1 +
 drivers/clk/bcm/clk-bcm2835.c                      |   65 +-
 drivers/clk/bcm/clk-iproc-pll.c                    |   12 +-
 drivers/clk/bcm/clk-sr.c                           |  327 +++++++
 drivers/clk/clk-bulk.c                             |  157 +++
 drivers/clk/clk-conf.c                             |    2 +-
 drivers/clk/clk-devres.c                           |   36 +
 drivers/clk/clk-divider.c                          |   19 +-
 drivers/clk/clk-gemini.c                           |  455 +++++++++
 drivers/clk/clk-palmas.c                           |    1 +
 drivers/clk/clk-qoriq.c                            |   91 +-
 drivers/clk/clk-scpi.c                             |   14 +-
 drivers/clk/hisilicon/clk-hi3660.c                 |   98 +-
 drivers/clk/hisilicon/clk-hi6220.c                 |   22 +
 drivers/clk/hisilicon/crg-hi3798cv200.c            |   21 +
 drivers/clk/imx/clk-imx7d.c                        |    8 +-
 drivers/clk/imx/clk-pllv3.c                        |    5 +
 drivers/clk/imx/clk.h                              |    1 +
 drivers/clk/keystone/Kconfig                       |   16 +
 drivers/clk/keystone/Makefile                      |    3 +-
 drivers/clk/keystone/sci-clk.c                     |  724 ++++++++++++++
 drivers/clk/mediatek/Makefile                      |    2 +-
 drivers/clk/mediatek/clk-cpumux.c                  |  120 +++
 drivers/clk/mediatek/clk-cpumux.h                  |   30 +
 drivers/clk/mediatek/clk-mt2701.c                  |    8 +
 drivers/clk/mediatek/clk-mt8173.c                  |   23 +
 drivers/clk/meson/Kconfig                          |    6 +-
 drivers/clk/meson/gxbb.c                           |  137 ++-
 drivers/clk/meson/gxbb.h                           |   25 +-
 drivers/clk/meson/meson8b.c                        |    7 +-
 drivers/clk/meson/meson8b.h                        |   20 +-
 drivers/clk/mvebu/ap806-system-controller.c        |  107 ++-
 drivers/clk/mvebu/armada-38x.c                     |    7 +-
 drivers/clk/mvebu/cp110-system-controller.c        |  199 ++--
 drivers/clk/qcom/Kconfig                           |    9 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-ipq8074.c                     | 1007 ++++++++++++++++++++
 drivers/clk/qcom/gcc-msm8916.c                     |    1 +
 drivers/clk/renesas/Kconfig                        |  139 ++-
 drivers/clk/renesas/Makefile                       |   41 +-
 drivers/clk/renesas/clk-mstp.c                     |    2 +-
 drivers/clk/renesas/clk-rcar-gen2.c                |   23 +-
 drivers/clk/renesas/r8a7745-cpg-mssr.c             |   17 +-
 drivers/clk/renesas/r8a7790-cpg-mssr.c             |  278 ++++++
 drivers/clk/renesas/r8a7791-cpg-mssr.c             |  286 ++++++
 drivers/clk/renesas/r8a7792-cpg-mssr.c             |  221 +++++
 drivers/clk/renesas/r8a7794-cpg-mssr.c             |  255 +++++
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |   43 +-
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |   39 +
 drivers/clk/renesas/renesas-cpg-mssr.c             |   43 +-
 drivers/clk/renesas/renesas-cpg-mssr.h             |    4 +
 drivers/clk/rockchip/Makefile                      |    1 +
 drivers/clk/rockchip/clk-rk3036.c                  |    1 +
 drivers/clk/rockchip/clk-rk3128.c                  |  612 ++++++++++++
 drivers/clk/rockchip/clk-rk3228.c                  |  164 ++--
 drivers/clk/rockchip/clk-rk3288.c                  |   14 +-
 drivers/clk/rockchip/clk-rk3368.c                  |    5 +-
 drivers/clk/rockchip/clk-rk3399.c                  |    4 +-
 drivers/clk/samsung/clk-cpu.c                      |   17 +-
 drivers/clk/samsung/clk-exynos-audss.c             |   58 +-
 drivers/clk/samsung/clk-exynos-clkout.c            |   18 +-
 drivers/clk/samsung/clk-exynos5420.c               |   27 +-
 drivers/clk/samsung/clk-pll.c                      |  101 +-
 drivers/clk/samsung/clk-pll.h                      |    4 -
 drivers/clk/samsung/clk-s3c2410-dclk.c             |   75 +-
 drivers/clk/samsung/clk-s5pv210-audss.c            |   52 +-
 drivers/clk/samsung/clk.c                          |   91 +-
 drivers/clk/samsung/clk.h                          |    9 +-
 drivers/clk/socfpga/clk-gate-a10.c                 |    2 +-
 drivers/clk/socfpga/clk.h                          |    3 +
 drivers/clk/sunxi-ng/Kconfig                       |  116 +--
 drivers/clk/sunxi-ng/Makefile                      |   37 +-
 drivers/clk/sunxi-ng/ccu-sun50i-a64.c              |   10 +-
 drivers/clk/sunxi-ng/ccu-sun5i.h                   |    6 +-
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c               |   10 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a23.c               |   10 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c               |   10 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c              |  922 ++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-a83t.h              |   64 ++
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c               |  260 +++++
 drivers/clk/sunxi-ng/ccu-sun8i-de2.h               |   28 +
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c                |   10 +-
 drivers/clk/sunxi-ng/ccu-sun8i-r.c                 |  117 ++-
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c               |   10 +-
 drivers/clk/sunxi-ng/ccu_div.c                     |   38 +-
 drivers/clk/sunxi-ng/ccu_mp.c                      |   15 +-
 drivers/clk/sunxi-ng/ccu_mult.c                    |   19 +-
 drivers/clk/sunxi-ng/ccu_mux.c                     |  108 ++-
 drivers/clk/sunxi-ng/ccu_mux.h                     |   24 +-
 drivers/clk/sunxi-ng/ccu_nkm.c                     |    7 +-
 drivers/clk/sunxi-ng/ccu_reset.h                   |    1 +
 drivers/clk/ti/Makefile                            |    3 +-
 drivers/clk/ti/clk-44xx.c                          |  663 +++++++++++++
 drivers/clk/ti/clkctrl.c                           |  497 ++++++++++
 drivers/clk/ti/clock.h                             |   31 +
 drivers/clk/uniphier/clk-uniphier-sys.c            |   15 +-
 drivers/clk/versatile/Makefile                     |    1 -
 drivers/clk/versatile/clk-realview.c               |   97 --
 drivers/clk/zte/clk-zx296718.c                     |    8 +-
 include/dt-bindings/clock/bcm-sr.h                 |  101 ++
 include/dt-bindings/clock/cortina,gemini-clock.h   |   29 +
 include/dt-bindings/clock/exynos5420.h             |    3 +
 include/dt-bindings/clock/gxbb-clkc.h              |   10 +-
 include/dt-bindings/clock/hi3660-clock.h           |   17 +
 include/dt-bindings/clock/hi6220-clock.h           |    4 +
 include/dt-bindings/clock/histb-clock.h            |    9 +-
 include/dt-bindings/clock/imx7d-clock.h            |    4 +-
 include/dt-bindings/clock/meson8b-clkc.h           |   10 +
 include/dt-bindings/clock/mt2701-clk.h             |    3 +-
 include/dt-bindings/clock/mt8173-clk.h             |    4 +-
 include/dt-bindings/clock/omap4.h                  |  146 +++
 include/dt-bindings/clock/qcom,gcc-ipq8074.h       |  152 +++
 include/dt-bindings/clock/r8a7790-cpg-mssr.h       |   52 +
 include/dt-bindings/clock/r8a7791-cpg-mssr.h       |   48 +
 include/dt-bindings/clock/r8a7792-cpg-mssr.h       |   43 +
 include/dt-bindings/clock/r8a7793-cpg-mssr.h       |   48 +
 include/dt-bindings/clock/r8a7794-cpg-mssr.h       |   47 +
 include/dt-bindings/clock/rk3128-cru.h             |  282 ++++++
 include/dt-bindings/clock/rk3228-cru.h             |   47 +
 include/dt-bindings/clock/rk3399-cru.h             |    2 +
 include/dt-bindings/clock/sun5i-ccu.h              |    3 +
 include/dt-bindings/clock/sun8i-a83t-ccu.h         |  140 +++
 include/dt-bindings/clock/sun8i-de2.h              |   18 +
 include/dt-bindings/clock/zx296718-clock.h         |    6 +-
 include/dt-bindings/reset/cortina,gemini-reset.h   |   36 +
 include/dt-bindings/reset/sun8i-a83t-ccu.h         |   98 ++
 include/dt-bindings/reset/sun8i-de2.h              |   14 +
 include/linux/clk-provider.h                       |   16 +-
 include/linux/clk.h                                |  136 +++
 include/linux/platform_data/clk-realview.h         |    1 -
 153 files changed, 10778 insertions(+), 1051 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3128-cru.txt
 create mode 100644 Documentation/devicetree/bindings/clock/sun8i-de2.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti,sci-clk.txt
 create mode 100644 Documentation/devicetree/bindings/clock/ti-clkctrl.txt
 create mode 100644 drivers/clk/bcm/clk-sr.c
 create mode 100644 drivers/clk/clk-bulk.c
 create mode 100644 drivers/clk/clk-gemini.c
 create mode 100644 drivers/clk/keystone/Kconfig
 create mode 100644 drivers/clk/keystone/sci-clk.c
 create mode 100644 drivers/clk/mediatek/clk-cpumux.c
 create mode 100644 drivers/clk/mediatek/clk-cpumux.h
 create mode 100644 drivers/clk/qcom/gcc-ipq8074.c
 create mode 100644 drivers/clk/renesas/r8a7790-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/r8a7791-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/r8a7792-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/r8a7794-cpg-mssr.c
 create mode 100644 drivers/clk/rockchip/clk-rk3128.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-a83t.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-a83t.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-de2.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-de2.h
 create mode 100644 drivers/clk/ti/clkctrl.c
 delete mode 100644 drivers/clk/versatile/clk-realview.c
 create mode 100644 include/dt-bindings/clock/bcm-sr.h
 create mode 100644 include/dt-bindings/clock/cortina,gemini-clock.h
 create mode 100644 include/dt-bindings/clock/omap4.h
 create mode 100644 include/dt-bindings/clock/qcom,gcc-ipq8074.h
 create mode 100644 include/dt-bindings/clock/r8a7790-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/r8a7791-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/r8a7792-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/r8a7793-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/r8a7794-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/rk3128-cru.h
 create mode 100644 include/dt-bindings/clock/sun8i-a83t-ccu.h
 create mode 100644 include/dt-bindings/clock/sun8i-de2.h
 create mode 100644 include/dt-bindings/reset/cortina,gemini-reset.h
 create mode 100644 include/dt-bindings/reset/sun8i-a83t-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-de2.h
 delete mode 100644 include/linux/platform_data/clk-realview.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

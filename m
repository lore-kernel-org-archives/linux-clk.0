Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
From: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org
To: torvalds@linux-foundation.org
Message-ID: <20160115213618.19367.51299@quark.deferred.io>
Subject: [GIT PULL] clk: changes for 4.5
Date: Fri, 15 Jan 2016 13:36:18 -0800
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 4ef7675344d687a0ef5b0d7c0cee12da005870c0:

  Linux 4.4-rc6 (2015-12-20 16:06:09 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-=
linus-4.5

for you to fetch changes up to 3da834e3e5a4a5d26882955298b55a9ed37a00bc:

  clk: remove duplicated COMMON_CLK_NXP record from clk/Kconfig (2016-01-13=
 18:09:52 -0800)

----------------------------------------------------------------
The clk framework and driver changes for 4.5 look pretty typical. The
bulk of the changes are to clk controller drivers, though some
improvements to the core and some re-usable blocks/templates also
received some love. In this past cycle the clk maintainers developed a
good workflow for handling the common case of patch submissions
containing a new drivers, new shared Device Tree header and a new Device
Tree binding description. This requires coordination with the Device
Tree maintainers and with the architecture maintainers (typically the
arm-soc tree in our case). This explains the increase in changes to
include/dt-bindings/... and to
Documentation/devicetree/bindings/clock/... coming from the clk tree.
The same commits can be expected to come through those trees on
occasion, through the use of shared, immutable branches.

----------------------------------------------------------------
Alexandre Belloni (1):
      clk: at91: Revert "keep slow clk enabled to prevent system hang"

Andrew Bresticker (1):
      clk: tegra: pll: Fix issues with rates for VCO PLLs

Andrzej Hajda (1):
      clk: sunxi: fix handling return value of of_property_match_string

Arnd Bergmann (1):
      clk: st: avoid uninitialized variable use

Bai Ping (3):
      clk: imx: add 'is_prepared' clk_ops callback for pllv3 clk
      clk: imx: Add a virtual arm clk on i.mx7d
      clk: imx: Replace clk error check with imx_check_clocks()

Bartlomiej Zolnierkiewicz (1):
      clk: samsung: exynos542x/5800: fix cpu clock configuration data

Bill Huang (8):
      clk: tegra: pll: Change misc_reg count from 3 to 6
      clk: tegra: pll: Add code to handle if resets are supported by PLL
      clk: tegra: pll: Adjust vco_min if SDM present
      clk: tegra: pll: Add Set_default logic
      clk: tegra: pll: Add logic for SS
      clk: tegra: Add Super Gen5 Logic
      clk: tegra: Fix WARN_ON in PLL_RE registration
      clk: tegra: Read correct IDDQ register in PLL_SS registration

Brian Norris (1):
      clk: gpio: handle error codes for of_clk_get_parent_count()

Caesar Wang (1):
      clk: rockchip: Force rk3368 PWM clock (and its parents) on

Chen-Yu Tsai (5):
      clk: sunxi: Add sun9i A80 apbs gates support
      clk: sunxi: Add sun9i A80 cpus (cpu special) clock support
      clk: sunxi: Add DRAM gates support for sun4i-a10
      clk: sunxi: Add VE (Video Engine) module clock driver for sun[457]i
      clk: sunxi: Add CLK_OF_DECLARE support for sun8i-a23-apb0-clk driver

Chris Zhong (3):
      clk: rockchip: add id for mipidsi sclk on rk3288
      clk: rockchip: add mipidsi clock on rk3288
      clk: rockchip: switch PLLs to slow mode before reboot for rk3288

Dan Carpenter (1):
      clk: sunxi: signedness bug in sun8i_h3_bus_gates_init()

Danny Huang (1):
      clk: tegra: pll: Update PLLM handling

Eric Anholt (2):
      clk: bcm2835: Add bindings for the auxiliary peripheral clock gates.
      clk: bcm2835: Add a driver for the auxiliary peripheral clock gates.

Florian Fainelli (2):
      clk: iproc: Extend binding to cover BCM63138
      clk: bcm: Add BCM63138 clock support

Geert Uytterhoeven (7):
      clk: Use static inline functions instead of macros for dummies
      clk: Spelling s/derefing/dereferencing/
      clk: shmobile: rcar-gen2: Spelling/Grammar: dependant of, ouput
      clk: shmobile: div6: Make clock-output-names optional
      clk: shmobile: div6: Extract cpg_div6_register()
      clk: shmobile: Add new CPG/MSSR driver core
      clk: shmobile: r8a7795: Add new CPG/MSSR driver

Georgi Djakov (1):
      clk: qcom: msm8916: Move xo and sleep clocks into DT

Heiko Stuebner (8):
      Merge branch 'v4.5-clk/clkids' into v4.5-clk/next
      Merge branch 'v4.5-clk/clkids' into v4.5-clk/next
      clk: rockchip: fix rk3368 cpuclk divider offsets
      Merge branch 'v4.5-clk/clkids' into v4.5-clk/next
      clk: rockchip: only enter pll slow-mode directly before reboots on rk=
3288
      clk: rockchip: handle mux dependency of fractional dividers
      clk: rockchip: include downstream muxes into fractional dividers
      clk: add flag for clocks that need to be enabled on rate changes

Heiko St=C3=BCbner (1):
      clk: rockchip: fix section mismatches with new child-clocks

Jacob Siverskog (1):
      clk: si5351: Add PLL soft reset

Jeffy Chen (4):
      clk: rockchip: allow more than 2 parents for cpuclk
      clk: rockchip: add dt-binding header for rk3228
      dt-bindings: add documentation of rk3228 clock controller
      clk: rockchip: add clock controller for rk3228

Jens Kuske (1):
      clk: sunxi: Add H3 clocks support

Jianqun xu (1):
      clk: rockchip: protect rk3368 aclk_bus and aclk_peri clocks

Julia Lawall (1):
      clk: ti: dra7: constify clk_hw_omap_ops structure

Kuninori Morimoto (1):
      clk: add CS2000 Fractional-N driver

Loc Ho (1):
      clk: xgene: Fix divider with non-zero shift value

Magnus Damm (1):
      clk: shmobile: Rework CONFIG_ARCH_SHMOBILE_MULTI

Marc Gonzalez (1):
      clk: tango4: clkgen driver for Tango4 platforms

Marek Szyprowski (3):
      clk: samsung: exynos542x: add missing parent GSCL block clocks
      clk: samsung: exynos542x: fix MFC clock hierarchy parent
      clk: exynos: use irqsave version of spin_lock to avoid deadlock with =
irqs

Markus Pargmann (1):
      clk: imx25: Remove osc clock from driver

Masahiro Yamada (6):
      clk: remove redundant negative index check in of_clk_get_parent_name()
      clk: use IS_ERR_OR_NULL(hw) instead of !hw || IS_ERR(hw)
      clk: fix a typo in comment block of struct clk_rate_request
      clk: fix a typo in comment block of clk_notifier_register()
      clk: let of_clk_get_parent_name() fail for invalid clock-indices
      clk: fix codying style of if ... else blocks

Michael Trimarchi (1):
      clk: imx: clk-imx6q: Let OSC to be routed to anaclk2/2b

Michael Turquette (14):
      Merge branch 'clk-shmobile-for-v4.5' of git://git.kernel.org/.../geer=
t/renesas-drivers into clk-next
      Merge tag 'v4.5-rockchip-clk1_1' of git://git.kernel.org/.../mmind/li=
nux-rockchip into clk-next
      Merge tag 'imx-clk-v4.5' of git://git.kernel.org/.../shawnguo/linux i=
nto clk-next
      Merge commit 'fe5fa8fbd4d47f40a45fa29ee1abdb10cb061ec2' into clk-next
      Merge tag 'clk-samsung-4.5' of git://linuxtv.org/snawrocki/samsung in=
to clk-next
      Merge branch 'clk-dove' into clk-next
      Merge branch 'clk-bcm2835' into clk-next
      Merge branch 'clk-rockchip' into clk-next
      Merge tag 'sunxi-clocks-for-4.5' of https://git.kernel.org/.../mripar=
d/linux into clk-next
      Merge branch 'clk-lpc32xx' into clk-next
      Merge branch 'clk-bcm2835' into clk-next
      Merge branch 'clk-renesas' into clk-next
      Merge branch 'clk-rockchip' into clk-next
      Merge tag 'tegra-for-4.5-clk' of git://git.kernel.org/.../tegra/linux=
 into clk-next

Patrick Br=C3=BCnn (1):
      clk: imx5: ipu_di_sel clocks can set parent rates

Prasanna Karthik (1):
      clk: s3c2410: removed unneeded variable in s3c24xx_clkout_set_parent

Reinder de Haan (1):
      clk: sunxi: Add support for the H3 usb phy clocks

Remi Pommarel (3):
      clk: bcm2835: add a round up ability to the clock divisor
      clk: bcm2835: Support for clock parent selection
      clk: bcm2835: Add PWM clock support

Rhyland Klein (12):
      clk: tegra: periph: Add new periph clks and muxes for Tegra210
      clk: tegra: pll: Add tegra_pll_wait_for_lock to clk header
      clk: tegra: pll: Simplify clk_enable_path
      clk: tegra: pll: Update warning message
      clk: tegra: pll: Don't unconditionally set LOCK flags
      clk: tegra: pll: Add logic for handling SDM data
      clk: tegra: pll: Add logic for out-of-table rates for T210
      clk: tegra: pll: Fix _pll_ramp_calc_pll logic and _calc_dynamic_ramp_=
rate
      clk: tegra: pll: Add specialized logic for Tegra210
      clk: tegra: pll: Add support for PLLMB for Tegra210
      clk: tegra: pll: Add dyn_ramp callback
      clk: tegra: Add support for Tegra210 clocks

Russell King (2):
      clk: add Dove PLL divider support for GPU, VMeta and AXI clocks
      clk: fix clk-gpio.c with optional clock=3D DT property

Sjoerd Simons (1):
      clk: rockchip: Allow the RK3288 SPDIF clocks to change their parent

Stephen Boyd (11):
      clk: qcom: common: Add API to register board clocks backwards compati=
bly
      clk: qcom: Move cxo/pxo/xo into dt files
      clk: qcom: Specify LE device endianness
      Merge branch 'clk-bcm63xx' into clk-next
      clk: divider: Cap table divider values to 'width' member
      clk: qcom: Add Alpha PLL support
      clk: qcom: Add MSM8996 Global Clock Control (GCC) driver
      clk: qcom: Add gfx3d ping-pong PLL frequency switching
      clk: qcom: Add MSM8996 Multimedia Clock Controller (MMCC) driver
      Merge branch 'clk-msm8996' into clk-next
      Merge branch 'clk-fixes' into clk-next

Sudip Mukherjee (3):
      clk: versatile: fix memory leak
      clk: versatile: remove unneeded error message
      clk: gpio: fix memory leak

Tero Kristo (1):
      clk: ti: omap5+: dpll: implement errata i810

Thierry Reding (5):
      clk: tegra: Add Tegra210 device tree binding
      clk: tegra: Fix 26 MHz oscillator frequency
      clk: tegra: Miscellaneous coding style cleanups
      clk: tegra: Format tables consistently
      clk: tegra: Constify pdiv-to-hw mappings

Thomas Abraham (1):
      clk: samsung: exynos5420: add cpu clock configuration data and instan=
tiate cpu clock

Ulrich Hecht (1):
      clk: shmobile: r8a7795: Add SATA0 clock

Vladimir Zapolskiy (6):
      dt-bindings: clock: add description of LPC32xx clock controller
      dt-bindings: clock: add description of LPC32xx USB clock controller
      dt-bindings: clock: add NXP LPC32xx clock list for consumers
      clk: lpc18xx: add NXP specific COMMON_CLK_NXP configuration symbol
      clk: lpc32xx: add common clock framework driver
      clk: remove duplicated COMMON_CLK_NXP record from clk/Kconfig

Xing Zheng (5):
      clk: rockchip: add dt-binding header for rk3036
      dt-bindings: add documentation of rk3036 clock controller
      clk: rockchip: add new pll-type for rk3036 and similar socs
      clk: rockchip: add clock controller for rk3036
      clk: rockchip: rk3036: include downstream muxes into fractional divid=
ers

Yakir Yang (1):
      clk: rockchip: rk3036: enable the CLK_IGNORE_UNUSED flag for aclk_vio

Zain Wang (2):
      clk: rockchip: add an id for rk3288 crypto clk
      clk: rockchip: set the id for crypto clk

ZhengShunQian (2):
      clk: rockchip: Add the clock ids of rk3288 eFuses
      clk: rockchip: use rk3288-efuse clock ids

 .../bindings/clock/brcm,bcm2835-aux-clock.txt      |   31 +
 .../bindings/clock/brcm,iproc-clocks.txt           |    5 +
 .../devicetree/bindings/clock/cs2000-cp.txt        |   22 +
 .../bindings/clock/nvidia,tegra210-car.txt         |   56 +
 .../devicetree/bindings/clock/nxp,lpc3220-clk.txt  |   30 +
 .../bindings/clock/nxp,lpc3220-usb-clk.txt         |   22 +
 .../devicetree/bindings/clock/qcom,gcc.txt         |    1 +
 .../devicetree/bindings/clock/qcom,mmcc.txt        |    1 +
 .../bindings/clock/renesas,cpg-div6-clocks.txt     |    4 +
 .../bindings/clock/rockchip,rk3036-cru.txt         |   56 +
 .../bindings/clock/rockchip,rk3228-cru.txt         |   58 +
 Documentation/devicetree/bindings/clock/sunxi.txt  |   10 +
 .../devicetree/bindings/clock/tango4-clock.txt     |   23 +
 arch/arm/mach-omap2/clock.c                        |    4 +
 drivers/clk/Kconfig                                |   12 +
 drivers/clk/Makefile                               |    5 +-
 drivers/clk/at91/clk-slow.c                        |   29 -
 drivers/clk/bcm/Kconfig                            |   10 +
 drivers/clk/bcm/Makefile                           |    2 +
 drivers/clk/bcm/clk-bcm2835-aux.c                  |   85 +
 drivers/clk/bcm/clk-bcm2835.c                      |  155 +-
 drivers/clk/bcm/clk-bcm63xx.c                      |   22 +
 drivers/clk/clk-cs2000-cp.c                        |  510 +++
 drivers/clk/clk-divider.c                          |    9 +-
 drivers/clk/clk-gpio.c                             |   28 +-
 drivers/clk/clk-mux.c                              |    5 +-
 drivers/clk/clk-si5351.c                           |    7 +
 drivers/clk/clk-tango4.c                           |   61 +
 drivers/clk/clk-xgene.c                            |    3 +-
 drivers/clk/clk.c                                  |   35 +-
 drivers/clk/imx/clk-imx25.c                        |   18 +-
 drivers/clk/imx/clk-imx51-imx53.c                  |    8 +-
 drivers/clk/imx/clk-imx6q.c                        |    3 +-
 drivers/clk/imx/clk-imx6ul.c                       |    4 +-
 drivers/clk/imx/clk-imx7d.c                        |   11 +-
 drivers/clk/imx/clk-pllv3.c                        |   14 +
 drivers/clk/mvebu/Makefile                         |    2 +-
 drivers/clk/mvebu/dove-divider.c                   |  262 ++
 drivers/clk/mvebu/dove-divider.h                   |    6 +
 drivers/clk/mvebu/dove.c                           |    6 +
 drivers/clk/nxp/Makefile                           |    1 +
 drivers/clk/nxp/clk-lpc32xx.c                      | 1569 +++++++++
 drivers/clk/qcom/Kconfig                           |   17 +
 drivers/clk/qcom/Makefile                          |    3 +
 drivers/clk/qcom/clk-alpha-pll.c                   |  355 ++
 drivers/clk/qcom/clk-alpha-pll.h                   |   57 +
 drivers/clk/qcom/clk-rcg.h                         |    1 +
 drivers/clk/qcom/clk-rcg2.c                        |   87 +
 drivers/clk/qcom/common.c                          |   87 +
 drivers/clk/qcom/common.h                          |    4 +
 drivers/clk/qcom/gcc-apq8084.c                     |   17 +-
 drivers/clk/qcom/gcc-ipq806x.c                     |   15 +-
 drivers/clk/qcom/gcc-msm8660.c                     |   16 +-
 drivers/clk/qcom/gcc-msm8916.c                     |   17 +-
 drivers/clk/qcom/gcc-msm8960.c                     |   16 +-
 drivers/clk/qcom/gcc-msm8974.c                     |   18 +-
 drivers/clk/qcom/gcc-msm8996.c                     | 3422 ++++++++++++++++=
++++
 drivers/clk/qcom/lcc-ipq806x.c                     |    1 +
 drivers/clk/qcom/lcc-msm8960.c                     |    1 +
 drivers/clk/qcom/mmcc-apq8084.c                    |    1 +
 drivers/clk/qcom/mmcc-msm8960.c                    |    2 +
 drivers/clk/qcom/mmcc-msm8974.c                    |    1 +
 drivers/clk/qcom/mmcc-msm8996.c                    | 3217 ++++++++++++++++=
++
 drivers/clk/rockchip/Makefile                      |    2 +
 drivers/clk/rockchip/clk-cpu.c                     |    4 +-
 drivers/clk/rockchip/clk-pll.c                     |  258 +-
 drivers/clk/rockchip/clk-rk3036.c                  |  493 +++
 drivers/clk/rockchip/clk-rk3188.c                  |  112 +-
 drivers/clk/rockchip/clk-rk3228.c                  |  678 ++++
 drivers/clk/rockchip/clk-rk3288.c                  |  136 +-
 drivers/clk/rockchip/clk-rk3368.c                  |   13 +-
 drivers/clk/rockchip/clk.c                         |  144 +-
 drivers/clk/rockchip/clk.h                         |   62 +-
 drivers/clk/samsung/clk-cpu.c                      |   10 +-
 drivers/clk/samsung/clk-exynos5420.c               |   98 +-
 drivers/clk/samsung/clk-s3c2410-dclk.c             |    3 +-
 drivers/clk/shmobile/Makefile                      |   24 +-
 drivers/clk/shmobile/clk-div6.c                    |  137 +-
 drivers/clk/shmobile/clk-div6.h                    |    7 +
 drivers/clk/shmobile/clk-rcar-gen2.c               |    4 +-
 drivers/clk/shmobile/r8a7795-cpg-mssr.c            |  383 +++
 drivers/clk/shmobile/renesas-cpg-mssr.c            |  596 ++++
 drivers/clk/shmobile/renesas-cpg-mssr.h            |  132 +
 drivers/clk/st/clkgen-fsyn.c                       |   17 +-
 drivers/clk/sunxi/Makefile                         |    5 +
 drivers/clk/sunxi/clk-a10-ve.c                     |  171 +
 drivers/clk/sunxi/clk-simple-gates.c               |   14 +
 drivers/clk/sunxi/clk-sun8i-apb0.c                 |   80 +-
 drivers/clk/sunxi/clk-sun8i-bus-gates.c            |  112 +
 drivers/clk/sunxi/clk-sun9i-cpus.c                 |  240 ++
 drivers/clk/sunxi/clk-sunxi.c                      |    6 +
 drivers/clk/sunxi/clk-usb.c                        |   12 +
 drivers/clk/tegra/Makefile                         |    1 +
 drivers/clk/tegra/clk-id.h                         |   75 +-
 drivers/clk/tegra/clk-pll.c                        |  838 ++++-
 drivers/clk/tegra/clk-tegra-periph.c               |  371 ++-
 drivers/clk/tegra/clk-tegra-super-gen4.c           |  142 +-
 drivers/clk/tegra/clk-tegra114.c                   |  339 +-
 drivers/clk/tegra/clk-tegra124.c                   |  453 +--
 drivers/clk/tegra/clk-tegra20.c                    |  314 +-
 drivers/clk/tegra/clk-tegra210.c                   | 2852 ++++++++++++++++
 drivers/clk/tegra/clk-tegra30.c                    |  426 +--
 drivers/clk/tegra/clk.h                            |  101 +-
 drivers/clk/ti/apll.c                              |    2 +-
 drivers/clk/ti/dpll3xxx.c                          |   25 +-
 drivers/clk/versatile/clk-sp810.c                  |    5 +-
 include/dt-bindings/clock/bcm2835-aux.h            |   17 +
 include/dt-bindings/clock/bcm2835.h                |    3 +-
 include/dt-bindings/clock/exynos5420.h             |    4 +
 include/dt-bindings/clock/imx7d-clock.h            |    3 +-
 include/dt-bindings/clock/lpc32xx-clock.h          |   56 +
 include/dt-bindings/clock/qcom,gcc-msm8996.h       |  339 ++
 include/dt-bindings/clock/qcom,mmcc-msm8996.h      |  285 ++
 include/dt-bindings/clock/rk3036-cru.h             |  193 ++
 include/dt-bindings/clock/rk3228-cru.h             |  220 ++
 include/dt-bindings/clock/rk3288-cru.h             |    4 +
 include/dt-bindings/clock/tegra210-car.h           |  401 +++
 include/linux/clk-provider.h                       |    9 +-
 include/linux/clk/ti.h                             |    1 +
 119 files changed, 20639 insertions(+), 1353 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm2835-au=
x-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/cs2000-cp.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra210=
-car.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nxp,lpc3220-clk=
.txt
 create mode 100644 Documentation/devicetree/bindings/clock/nxp,lpc3220-usb=
-clk.txt
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3036=
-cru.txt
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3228=
-cru.txt
 create mode 100644 Documentation/devicetree/bindings/clock/tango4-clock.txt
 create mode 100644 drivers/clk/bcm/clk-bcm2835-aux.c
 create mode 100644 drivers/clk/bcm/clk-bcm63xx.c
 create mode 100644 drivers/clk/clk-cs2000-cp.c
 create mode 100644 drivers/clk/clk-tango4.c
 create mode 100644 drivers/clk/mvebu/dove-divider.c
 create mode 100644 drivers/clk/mvebu/dove-divider.h
 create mode 100644 drivers/clk/nxp/clk-lpc32xx.c
 create mode 100644 drivers/clk/qcom/clk-alpha-pll.c
 create mode 100644 drivers/clk/qcom/clk-alpha-pll.h
 create mode 100644 drivers/clk/qcom/gcc-msm8996.c
 create mode 100644 drivers/clk/qcom/mmcc-msm8996.c
 create mode 100644 drivers/clk/rockchip/clk-rk3036.c
 create mode 100644 drivers/clk/rockchip/clk-rk3228.c
 create mode 100644 drivers/clk/shmobile/clk-div6.h
 create mode 100644 drivers/clk/shmobile/r8a7795-cpg-mssr.c
 create mode 100644 drivers/clk/shmobile/renesas-cpg-mssr.c
 create mode 100644 drivers/clk/shmobile/renesas-cpg-mssr.h
 create mode 100644 drivers/clk/sunxi/clk-a10-ve.c
 create mode 100644 drivers/clk/sunxi/clk-sun8i-bus-gates.c
 create mode 100644 drivers/clk/sunxi/clk-sun9i-cpus.c
 create mode 100644 drivers/clk/tegra/clk-tegra210.c
 create mode 100644 include/dt-bindings/clock/bcm2835-aux.h
 create mode 100644 include/dt-bindings/clock/lpc32xx-clock.h
 create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8996.h
 create mode 100644 include/dt-bindings/clock/qcom,mmcc-msm8996.h
 create mode 100644 include/dt-bindings/clock/rk3036-cru.h
 create mode 100644 include/dt-bindings/clock/rk3228-cru.h
 create mode 100644 include/dt-bindings/clock/tegra210-car.h

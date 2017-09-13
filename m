Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk changes for v4.14
Date: Tue, 12 Sep 2017 17:54:03 -0700
Message-Id: <20170913005403.28639-1-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit a376a4b0453ffac35ba6215dd1d1e53e37c5e810:

  clk: rockchip: fix up indentation of some RV1108 clock-ids (2017-08-06 19:45:19 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-for-linus

for you to fetch changes up to 73c950da6ec523136090d6d4d6907a6ea8e8b67b:

  clk: si5351: fix PLL reset (2017-09-01 16:00:54 -0700)

----------------------------------------------------------------
The diff is dominated by the Allwinner A10/A20 SoCs getting converted to
the sunxi-ng framework. Otherwise, the heavy hitters are various drivers
for SoCs like AT91, Amlogic, Renesas, and Rockchip. There are some other
new clk drivers in here too but overall this is just a bunch of clk
drivers for various different pieces of hardware and a collection of
non-critical fixes for clk drivers.

New Drivers:
 - Allwinner R40 SoCs
 - Renesas R-Car Gen3 USB 2.0 clock selector PHY
 - Atmel AT91 audio PLL
 - Uniphier PXs3 SoCs
 - ARC HSDK Board PLLs
 - AXS10X Board PLLs
 - STMicroelectronics STM32H743 SoCs

Removed Drivers:
 - Non-compiling mb86s7x support

Updates:
 - Allwinner A10/A20 SoCs converted to sunxi-ng framework
 - Allwinner H3 CPU clk fixes
 - Renesas R-Car D3 SoC
 - Renesas V2H and M3-W modules
 - Samsung Exynos5420/5422/5800 audio fixes
 - Rockchip fractional clk approximation fixes
 - Rockchip rk3126 SoC support within the rk3128 driver
 - Amlogic gxbb CEC32 and sd_emmc clks
 - Amlogic meson8b reset controller support
 - IDT VersaClock 5P49V5925/5P49V6901 support
 - Qualcomm MSM8996 SMMU clks
 - Various 'const' applications for struct clk_ops
 - si5351 PLL reset bugfix
 - Uniphier audio on LD11/LD20 and ethernet support on LD11/LD20/Pro4/PXs2
 - Assorted Tegra clk driver fixes

----------------------------------------------------------------
Alex Frid (8):
      clk: tegra: Fix T210 effective NDIV calculation
      clk: tegra: Add TEGRA_PERIPH_ON_APB flag to I2C
      clk: tegra: Re-factor T210 PLLX registration
      clk: tegra: Update T210 PLLSS (D2/DP) registration
      clk: tegra: Fix T210 PLLRE registration
      clk: tegra: Correct Tegra210 UTMIPLL poweron delay
      clk: tegra: Fix Tegra210 PLLU initialization
      clk: Don't write error code into divider register

Andreas Färber (1):
      clk: mb86s7x: Drop non-building driver

Arnd Bergmann (1):
      clk: sunxi: fix uninitialized access

Arvind Yadav (5):
      clk: ux500: prcmu: constify clk_ops.
      clk: ux500: sysctrl: constify clk_ops.
      clk: ux500: prcc: constify clk_ops.
      clk: imx: constify clk_div_table
      clk: zte: constify clk_div_table

Bhumika Goyal (2):
      clk: ti: make clk_ops const
      clk: versatile: make clk_ops const

Chen-Yu Tsai (1):
      clk: sunxi-ng: h3: gate then ungate PLL CPU clk after rate change

Colin Ian King (1):
      clk: ti: check for null return in strrchr to avoid null dereferencing

Elaine Zhang (17):
      clk: rockchip: support more rates for rv1108 cpuclk
      clk: rockchip: fix up the pll clks error for rv1108 SoC
      clk: rockchip: support more clks for rv1108
      clk: rockchip: fix up some clks describe error for rv1108 SoC
      clk: rockchip: rename some of clks for rv1108 SoC
      clk: rockchip: add some critical clocks for rv1108 SoC
      dt-bindings: add documentation for rk3126 clock
      clk: rockchip: modify rk3128 clk driver to also support rk3126
      clk: fractional-divider: allow overriding of approximation
      clk: rockchip: add special approximation to fix up fractional clk's jitter
      clk: rockchip: add rk3228 sclk_sdio_src ID
      clk: rockchip: add rv1108 ACLK_GAMC and PCLK_GMAC ID
      clk: rockchip: add rk3228 SCLK_SDIO_SRC clk id
      clk: rockchip: add rv1108 ACLK_GMAC and PCLK_GMAC clocks
      clk: rockchip: rename rv1108 macphy clock to mac
      clk: rockchip: fix the rv1108 clk_mac sel register description
      clk: Kconfig: Name RK805 in Kconfig for COMMON_CLK_RK808

Eugeniy Paltsev (2):
      clk: axs10x: introduce AXS10X pll driver
      ARC: clk: introduce HSDK pll driver

Gabriel Fernandez (3):
      clk: nxp: clk-lpc32xx: rename clk_gate_is_enabled()
      clk: gate: expose clk_gate_ops::is_enabled
      clk: stm32h7: Add stm32h743 clock driver

Gaku Inami (1):
      clk: cs2000: Add cs2000_set_saved_rate

Geert Uytterhoeven (7):
      clk: renesas: div6: Document fields used for parent selection
      clk: renesas: r8a7792: Add IMR-LX3/LSX3 clocks
      clk: renesas: Allow compile-testing of all (sub)drivers
      clk: renesas: Add r8a77995 CPG Core Clock Definitions
      clk: renesas: rcar-gen3: Add divider support for PLL1 and PLL3
      clk: renesas: rcar-gen3: Add support for SCCG/Clean peripheral clocks
      clk: renesas: cpg-mssr: Add R8A77995 support

Georgi Djakov (2):
      clk: qcom: clk-smd-rpm: Fix the reported rate of branches
      clk: qcom: msm8916: Fix bimc gpu clock ops

Gustavo A. R. Silva (1):
      clk: moxart: remove unnecessary statics

Heiko Stuebner (2):
      Merge branch 'v4.14-shared/clkids' into v4.14-clk/next
      Merge branch 'v4.14-shared/clkids' into v4.14-clk/next

Hiromitsu Yamasaki (1):
      clk: renesas: r8a7796: Add USB3.0 clock

Icenowy Zheng (4):
      clk: sunxi-ng: allow set parent clock (PLL_CPUX) for CPUX clock on H3
      clk: sunxi-ng: nkm: add support for fixed post-divider
      dt-bindings: add compatible string for Allwinner R40 CCU
      clk: sunxi-ng: support R40 SoC

Jernej Škrabec (4):
      clk: sunxi-ng: Fix fractional mode for N-M clocks
      clk: sunxi-ng: multiplier: Fix fractional mode
      clk: sunxi-ng: Make fractional helper less chatty
      clk: sunxi-ng: Wait for lock when using fractional mode

Jerome Brunet (3):
      clk: meson: gxbb: fix meson cts_amclk divider flags
      clk: meson: gxbb: fix clk_mclk_i958 divider flags
      clk: meson: gxbb: Add sd_emmc clk0 clocks

Jonathan Liu (1):
      dt-bindings: clock: sunxi-ccu: Add compatibles for sun5i CCU driver

Julia Lawall (1):
      clk: mmp: Drop unnecessary static

Katsuhiro Suzuki (2):
      clk: uniphier: add audio system clock
      clk: uniphier: add video input subsystem clock

Kunihiko Hayashi (1):
      clk: uniphier: add ethernet clock control support

Leo Yan (1):
      clk: hi6220: change watchdog clock source

Linus Walleij (1):
      clk: gemini: hands off PCI OE bit

Lucas Stach (1):
      clk: imx51: propagate rate across ipu_di*_sel

Marek Vasut (8):
      clk: vc5: Prevent division by zero on unconfigured outputs
      clk: vc5: Fix trivial typo
      clk: vc5: Do not warn about disabled output buffer input muxes
      clk: vc5: Configure the output buffer input mux on prepare
      clk: vc5: Split clock input mux and predivider
      clk: vc5: Add support for the input frequency doubler
      clk: vc5: Add bindings for IDT VersaClock 5P49V6901
      clk: vc5: Add support for IDT VersaClock 5P49V6901

Martin Blumenstingl (1):
      clk: meson: meson8b: register the built-in reset controller

Masahiro Yamada (2):
      clk: uniphier: remove sLD3 SoC support
      clk: uniphier: add PXs3 clock data

Matthias Kaehlcke (1):
      clk: sunxi-ng: Fix header guard of ccu-sun8i-r.h

Neil Armstrong (3):
      dt-bindings: clock: amlogic, gxbb-aoclkc: Update bindings
      clk: meson: gxbb-aoclk: Switch to regmap for register access
      clk: meson: gxbb-aoclk: Add CEC 32k clock

Peter De Schrijver (7):
      clk: tegra: fix SS control on PLL enable/disable
      clk: tegra: Enable PLL_SS for Tegra210
      clk: tegra: disable SSC for PLL_D2
      clk: tegra210: remove non-existing VFIR clock
      clk: tegra: Init cfg structure in _get_pll_mnp
      clk: tegra: change post IDDQ release delay to 5us
      clk: tegra: don't warn for pll_d2 defaults unnecessarily

Priit Laes (4):
      clk: sunxi-ng: div: Add support for fixed post-divider
      dt-bindings: List devicetree binding for the CCU of Allwinner A20
      dt-bindings: List devicetree binding for the CCU of Allwinner A10
      clk: sunxi-ng: Add sun4i/sun7i CCU driver

Quentin Schulz (7):
      clk: at91: clk-generated: remove useless divisor loop
      dt-bindings: clk: at91: add audio plls to the compatible list
      clk: at91: add audio pll clock drivers
      clk: at91: clk-generated: create function to find best_diff
      clk: at91: clk-generated: make gclk determine audio_pll rate
      ASoC: atmel-classd: remove aclk clock from DT binding
      ASoC: atmel-classd: remove aclk clock

Rob Herring (1):
      clk: Convert to using %pOF instead of full_name

Russell King (1):
      clk: si5351: fix PLL reset

Sean Wang (1):
      clk: mediatek: fixed static checker warning in clk_cpumux_get_parent call

Srinivas Kandagatla (1):
      clk: msm8996-gcc: add missing smmu clks

Stephen Boyd (9):
      Merge branch 'clk-fixes' into clk-next
      Merge branch 'clk-fixes' into clk-next
      Merge tag 'meson-clk-for-4.14' of git://github.com/baylibre/clk-meson into clk-next
      Merge tag 'clk-v4.14-samsung' of git://git.kernel.org/.../snawrocki/clk into clk-next
      Merge tag 'sunxi-clk-for-4.14-2' of https://git.kernel.org/.../sunxi/linux into clk-next
      Merge tag 'v4.14-rockchip-clk1' of git://git.kernel.org/.../mmind/linux-rockchip into clk-next
      clk: rockchip: Mark rockchip_fractional_approximation static
      Merge tag 'clk-renesas-for-v4.14-tag1' of git://git.kernel.org/.../geert/renesas-drivers into clk-next
      Merge tag 'sunxi-clk-for-4.14-3' of https://git.kernel.org/.../sunxi/linux into clk-next

Sylwester Nawrocki (3):
      clk: samsung: Fix mau_epll clock definition for exynos5422
      clk: samsung: Add CLK_SET_RATE_PARENT to some AUDSS CLK CON clocks
      clk: samsung: exynos542x: Enable clock rate propagation up to the EPLL

Vladimir Barinov (2):
      clk: vc5: Add support for IDT VersaClock 5P49V5925
      dt: Add bindings for IDT VersaClock 5P49V5925

Wolfram Sang (2):
      clk: renesas: rcar-gen3-cpg: Drop superfluous variable
      clk: renesas: rcar-gen3-cpg: Refactor checks for accessing the div table

Yoshihiro Shimoda (1):
      clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0 clock selector PHY

Yuantian Tang (2):
      clk: qoriq: add clock configuration for ls1088a soc
      clk: qoriq: add pll clock to clock lookup table

 .../bindings/clock/amlogic,gxbb-aoclkc.txt         |   22 +-
 .../bindings/clock/amlogic,meson8b-clkc.txt        |    9 +-
 .../devicetree/bindings/clock/at91-clock.txt       |   10 +
 .../devicetree/bindings/clock/idt,versaclock5.txt  |   30 +-
 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |    3 +-
 .../bindings/clock/renesas,rcar-usb2-clock-sel.txt |   55 +
 .../bindings/clock/rockchip,rk3128-cru.txt         |    8 +-
 .../bindings/clock/snps,hsdk-pll-clock.txt         |   28 +
 .../devicetree/bindings/clock/snps,pll-clock.txt   |   28 +
 .../devicetree/bindings/clock/st,stm32h7-rcc.txt   |   71 +
 .../devicetree/bindings/clock/sunxi-ccu.txt        |    6 +
 .../devicetree/bindings/clock/uniphier-clock.txt   |    8 +-
 .../devicetree/bindings/sound/atmel-classd.txt     |    9 +-
 MAINTAINERS                                        |   12 +
 arch/arm/mach-at91/Kconfig                         |    4 +
 drivers/clk/Kconfig                                |   17 +-
 drivers/clk/Makefile                               |    3 +-
 drivers/clk/at91/Makefile                          |    1 +
 drivers/clk/at91/clk-audio-pll.c                   |  536 +++++++
 drivers/clk/at91/clk-generated.c                   |  101 +-
 drivers/clk/axs10x/Makefile                        |    1 +
 drivers/clk/axs10x/pll_clock.c                     |  346 +++++
 drivers/clk/berlin/bg2.c                           |    3 +-
 drivers/clk/berlin/bg2q.c                          |    7 +-
 drivers/clk/clk-asm9260.c                          |    4 +-
 drivers/clk/clk-conf.c                             |   16 +-
 drivers/clk/clk-cs2000-cp.c                        |   14 +-
 drivers/clk/clk-divider.c                          |    6 +-
 drivers/clk/clk-fractional-divider.c               |   28 +-
 drivers/clk/clk-gate.c                             |    3 +-
 drivers/clk/clk-gemini.c                           |   21 +-
 drivers/clk/clk-hsdk-pll.c                         |  431 ++++++
 drivers/clk/clk-mb86s7x.c                          |  390 ------
 drivers/clk/clk-moxart.c                           |   16 +-
 drivers/clk/clk-qoriq.c                            |   26 +-
 drivers/clk/clk-si5351.c                           |   12 +-
 drivers/clk/clk-stm32f4.c                          |    4 +-
 drivers/clk/clk-stm32h7.c                          | 1410 +++++++++++++++++++
 drivers/clk/clk-versaclock5.c                      |  172 ++-
 drivers/clk/clk-xgene.c                            |   15 +-
 drivers/clk/clk.c                                  |    4 +-
 drivers/clk/clkdev.c                               |    4 +-
 drivers/clk/hisilicon/clk-hi6220.c                 |    6 +-
 drivers/clk/imx/clk-imx51-imx53.c                  |    8 +-
 drivers/clk/imx/clk-imx6sl.c                       |    6 +-
 drivers/clk/imx/clk-imx6sx.c                       |    6 +-
 drivers/clk/imx/clk-imx6ul.c                       |    6 +-
 drivers/clk/imx/clk-imx7d.c                        |    4 +-
 drivers/clk/imx/clk-vf610.c                        |    2 +-
 drivers/clk/keystone/sci-clk.c                     |   66 +-
 drivers/clk/mediatek/clk-cpumux.c                  |    6 +-
 drivers/clk/mediatek/clk-mtk.c                     |    2 +-
 drivers/clk/mediatek/reset.c                       |    2 +-
 drivers/clk/meson/Kconfig                          |    1 +
 drivers/clk/meson/Makefile                         |    2 +-
 drivers/clk/meson/clk-mpll.c                       |    7 +
 drivers/clk/meson/clkc.h                           |    1 +
 drivers/clk/meson/gxbb-aoclk-32k.c                 |  194 +++
 drivers/clk/meson/gxbb-aoclk-regmap.c              |   46 +
 drivers/clk/meson/gxbb-aoclk.c                     |   65 +-
 drivers/clk/meson/gxbb-aoclk.h                     |   42 +
 drivers/clk/meson/gxbb.c                           |  194 ++-
 drivers/clk/meson/gxbb.h                           |  125 +-
 drivers/clk/meson/meson8b.c                        |  165 ++-
 drivers/clk/meson/meson8b.h                        |  112 +-
 drivers/clk/mmp/clk.c                              |    2 +-
 drivers/clk/nxp/clk-lpc32xx.c                      |   12 +-
 drivers/clk/qcom/clk-smd-rpm.c                     |    2 -
 drivers/clk/qcom/gcc-msm8916.c                     |    2 +-
 drivers/clk/qcom/gcc-msm8996.c                     |   28 +
 drivers/clk/renesas/Kconfig                        |   48 +-
 drivers/clk/renesas/Makefile                       |    2 +
 drivers/clk/renesas/clk-div6.c                     |    3 +
 drivers/clk/renesas/clk-mstp.c                     |    2 +-
 drivers/clk/renesas/clk-rcar-gen2.c                |    3 +-
 drivers/clk/renesas/r8a7792-cpg-mssr.c             |    7 +
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |   34 +-
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |   35 +-
 drivers/clk/renesas/r8a77995-cpg-mssr.c            |  236 ++++
 drivers/clk/renesas/rcar-gen3-cpg.c                |   69 +-
 drivers/clk/renesas/rcar-gen3-cpg.h                |   15 +-
 drivers/clk/renesas/rcar-usb2-clock-sel.c          |  188 +++
 drivers/clk/renesas/renesas-cpg-mssr.c             |    6 +
 drivers/clk/renesas/renesas-cpg-mssr.h             |    1 +
 drivers/clk/rockchip/clk-rk3128.c                  |   69 +-
 drivers/clk/rockchip/clk-rk3228.c                  |    2 +-
 drivers/clk/rockchip/clk-rv1108.c                  |  462 +++++--
 drivers/clk/rockchip/clk.c                         |   36 +
 drivers/clk/samsung/clk-exynos-audss.c             |    8 +-
 drivers/clk/samsung/clk-exynos5420.c               |   39 +-
 drivers/clk/sunxi-ng/Kconfig                       |   18 +
 drivers/clk/sunxi-ng/Makefile                      |    2 +
 drivers/clk/sunxi-ng/ccu-sun4i-a10.c               | 1456 ++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun4i-a10.h               |   61 +
 drivers/clk/sunxi-ng/ccu-sun5i.c                   |    5 +-
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c               |    3 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a23.c               |    3 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c               |    3 +-
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c                |   16 +-
 drivers/clk/sunxi-ng/ccu-sun8i-r.c                 |    3 +-
 drivers/clk/sunxi-ng/ccu-sun8i-r.h                 |    2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c               | 1290 +++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-r40.h               |   69 +
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c               |    3 +-
 drivers/clk/sunxi-ng/ccu_div.c                     |   22 +-
 drivers/clk/sunxi-ng/ccu_div.h                     |    3 +-
 drivers/clk/sunxi-ng/ccu_frac.c                    |   14 +-
 drivers/clk/sunxi-ng/ccu_frac.h                    |    2 +-
 drivers/clk/sunxi-ng/ccu_mult.c                    |   10 +-
 drivers/clk/sunxi-ng/ccu_nkm.c                     |   22 +-
 drivers/clk/sunxi-ng/ccu_nkm.h                     |    2 +
 drivers/clk/sunxi-ng/ccu_nm.c                      |   19 +-
 drivers/clk/sunxi/clk-sun8i-bus-gates.c            |    4 +
 drivers/clk/sunxi/clk-sunxi.c                      |   17 +-
 drivers/clk/tegra/clk-emc.c                        |   12 +-
 drivers/clk/tegra/clk-pll.c                        |  159 +--
 drivers/clk/tegra/clk-tegra-periph.c               |    3 +-
 drivers/clk/tegra/clk-tegra-super-gen4.c           |   11 +-
 drivers/clk/tegra/clk-tegra210.c                   |   32 +-
 drivers/clk/tegra/clk.h                            |    6 -
 drivers/clk/ti/adpll.c                             |    4 +-
 drivers/clk/ti/apll.c                              |    2 +-
 drivers/clk/ti/clockdomain.c                       |    4 +-
 drivers/clk/ti/fapll.c                             |    4 +-
 drivers/clk/uniphier/clk-uniphier-core.c           |   26 +-
 drivers/clk/uniphier/clk-uniphier-mio.c            |    4 +-
 drivers/clk/uniphier/clk-uniphier-sys.c            |   98 +-
 drivers/clk/uniphier/clk-uniphier.h                |    4 +-
 drivers/clk/ux500/clk-prcc.c                       |    6 +-
 drivers/clk/ux500/clk-prcmu.c                      |   14 +-
 drivers/clk/ux500/clk-sysctrl.c                    |    8 +-
 drivers/clk/versatile/clk-vexpress-osc.c           |    2 +-
 drivers/clk/x86/clk-pmc-atom.c                     |    7 +
 drivers/clk/zte/clk-zx296718.c                     |    6 +-
 include/dt-bindings/clock/gxbb-aoclkc.h            |    1 +
 include/dt-bindings/clock/gxbb-clkc.h              |   63 +
 include/dt-bindings/clock/meson8b-clkc.h           |   70 +
 include/dt-bindings/clock/qcom,gcc-msm8996.h       |    2 +
 include/dt-bindings/clock/r8a77995-cpg-mssr.h      |   57 +
 include/dt-bindings/clock/rk3228-cru.h             |    1 +
 include/dt-bindings/clock/rv1108-cru.h             |    8 +-
 include/dt-bindings/clock/stm32h7-clks.h           |  165 +++
 include/dt-bindings/clock/sun4i-a10-ccu.h          |  200 +++
 include/dt-bindings/clock/sun7i-a20-ccu.h          |   53 +
 include/dt-bindings/clock/sun8i-r40-ccu.h          |  187 +++
 include/dt-bindings/mfd/stm32h7-rcc.h              |  136 ++
 .../dt-bindings/reset/amlogic,meson8b-clkc-reset.h |   27 +
 include/dt-bindings/reset/sun4i-a10-ccu.h          |   69 +
 include/dt-bindings/reset/sun8i-r40-ccu.h          |  130 ++
 include/linux/clk-provider.h                       |    4 +
 include/linux/clk/at91_pmc.h                       |   25 +
 sound/soc/atmel/atmel-classd.c                     |   47 +-
 152 files changed, 9634 insertions(+), 1345 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
 create mode 100644 Documentation/devicetree/bindings/clock/snps,hsdk-pll-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/snps,pll-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32h7-rcc.txt
 create mode 100644 drivers/clk/at91/clk-audio-pll.c
 create mode 100644 drivers/clk/axs10x/pll_clock.c
 create mode 100644 drivers/clk/clk-hsdk-pll.c
 delete mode 100644 drivers/clk/clk-mb86s7x.c
 create mode 100644 drivers/clk/clk-stm32h7.c
 create mode 100644 drivers/clk/meson/gxbb-aoclk-32k.c
 create mode 100644 drivers/clk/meson/gxbb-aoclk-regmap.c
 create mode 100644 drivers/clk/meson/gxbb-aoclk.h
 create mode 100644 drivers/clk/renesas/r8a77995-cpg-mssr.c
 create mode 100644 drivers/clk/renesas/rcar-usb2-clock-sel.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun4i-a10.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun4i-a10.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-r40.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-r40.h
 create mode 100644 include/dt-bindings/clock/r8a77995-cpg-mssr.h
 create mode 100644 include/dt-bindings/clock/stm32h7-clks.h
 create mode 100644 include/dt-bindings/clock/sun4i-a10-ccu.h
 create mode 100644 include/dt-bindings/clock/sun7i-a20-ccu.h
 create mode 100644 include/dt-bindings/clock/sun8i-r40-ccu.h
 create mode 100644 include/dt-bindings/mfd/stm32h7-rcc.h
 create mode 100644 include/dt-bindings/reset/amlogic,meson8b-clkc-reset.h
 create mode 100644 include/dt-bindings/reset/sun4i-a10-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-r40-ccu.h

Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk changes for v4.12
Date: Wed, 10 May 2017 12:38:57 -0700
Message-Id: <20170510193857.29493-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit e7590308d17e578e47f298cc3fec359108341cb6:

  Merge tag 'sunxi-clk-fixes-for-4.11-2-bis' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into clk-fixes (2017-04-17 11:04:12 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

for you to fetch changes up to 0119dc6132d2110df8f3545bd0ffe29aa0752d6b:

  clk: x86: pmc-atom: Checking for IS_ERR() instead of NULL (2017-05-01 11:13:25 -0700)

----------------------------------------------------------------
Sort of on the quieter side this time, which is probably due more
to me not catching up as quickly on patch review than anything else.
Overall it seems normal though, a few small changes to the core, mostly
small non-critical fixes here and there as well as driver updates for new
and existing hardware support. The biggest things are the TI clk driver
rework to lay the groundwork for clkctrl support in the next merge window
and the AmLogic audio/graphics clk support.

Core:
 * clk_possible_parents debugfs file so we know which parents a clk
   could possibly have
 * Fix to make clk rate change notifiers stop on the first failure instead
   of continuing

New Drivers:
 * Mediatek MT6797 SoCs
 * hi655x PMIC clks
 * AmLogic Meson SoC i2s and spdif audio clks and Mali graphics clks
 * Allwinner H5 SoCs and PRCM hardware

Updates:
 * Nvidia Tegra T210 cleanups and non-critical fixes
 * TI OMAP cleanups in preparation for clkctrl support
 * Trivial fixes like kcalloc(), devm_* conversions, and seq_puts()
 * ZTE zx296718 SoC VGA clks
 * Rockchip clk-ids, fixups, and rename of rk1108 to rv1108
 * Support for IDT VersaClock 5P49V5935
 * Renesas R-Car H3 and M3-W IMR clks and ES2.0 rev of R-Car H3 support

----------------------------------------------------------------
Alex Frid (1):
      clk: tegra: Propagate clk_out_x rate to parent

Alexey Firago (3):
      clk: vc5: Add structure to describe particular chip features
      clk: vc5: Add bindings for IDT VersaClock 5P49V5935
      clk: vc5: Add support for IDT VersaClock 5P49V5935

Andy Yan (2):
      dt-bindings: rk1108-cru: rename RK1108 to RV1108
      clk: rockchip: rename RK1108 to RV1108

Arnd Bergmann (3):
      clk: ti: fix linker error with !SOC_OMAP4
      clk: ti: fix building without legacy omap3
      clk: ti: divider: try to fix ti_clk_register_divider

Bharat Kumar Reddy Gooty (1):
      clk: ns2: Correct SDIO bits

Chen-Yu Tsai (7):
      clk: sunxi-ng: gate: Support common pre-dividers
      clk: sunxi-ng: mult: Support PLL lock detection
      clk: sunxi-ng: a80: Remodel CPU cluster PLLs as N-type multiplier clocks
      clk: sunxi-ng: a33: Add offset and minimum value for DDR1 PLL N factor
      clk: sunxi-ng: use 1 as fallback for minimum multiplier
      clk: sunxi-ng: Fix round_rate/set_rate multiplier minimum mismatch
      clk: sunxi-ng: a80: Fix audio PLL comment not matching actual code

Dan Carpenter (1):
      clk: x86: pmc-atom: Checking for IS_ERR() instead of NULL

Daniel Lezcano (1):
      clk: hi6220: Add the hi655x's pmic clock

Dong Aisheng (2):
      clk: clk-imx7d: fix ahb clk definition
      clk: imx7d: add the missing ipg_root_clk

Douglas Anderson (1):
      clk: rockchip: Set "ignore unused" for PMU M0 clocks on rk3399

Elaine Zhang (7):
      clk: rockchip: add rk3328 clk_mac2io_ext ID
      clk: rockchip: fix up rk3368 timer-ids
      clk: rockchip: add clock ids for timer10-15 of RK3368 SoCs
      clk: rockchip: describe clk_gmac using the new muxgrf type on rk3328
      clk: rockchip: export SCLK_TIMERXX id for timers on rk3368
      clk: rockchip: mark some rk3368 core-clks as critical
      clk: rockchip: add pll_wait_lock for pll_enable

Gabriel Fernandez (2):
      clk: stm32f4: fix: exclude values 0 and 1 for PLLQ
      clk: stm32f4: fix timeout management for pll and ready gate

Geert Uytterhoeven (11):
      clk: renesas: r8a7795: Correct parent clock and sort order for Audio DMACs
      clk: renesas: r8a7795: Correct name of watchdog clock
      clk: renesas: r8a7796: Correct name of watchdog clock
      clk: renesas: r8a7795: Reformat core clock table
      clk: renesas: r8a7796: Reformat core clock table
      clk: renesas: rcar-gen3-cpg: Pass mode pins to rcar_gen3_cpg_init()
      clk: renesas: rcar-gen3: Add workaround for PLL0/2/4 errata on H3 ES1.0
      clk: renesas: cpg-mssr: Add support for fixing up clock tables
      clk: renesas: Add r8a7795 ES2.0 CPG Core Clock Definitions
      clk: renesas: r8a7795: Add support for R-Car H3 ES2.0
      clk: renesas: rcar-gen3-cpg: Add support for RCLK on R-Car H3 ES2.0

Heiko Stuebner (1):
      Merge branch 'v4.12-shared/clkids' into v4.12-clk/next

Icenowy Zheng (5):
      clk: sunxi-ng: add Allwinner H5 CCU support for H3 CCU driver
      dt-bindings: update device tree binding for Allwinner PRCM CCUs
      clk: sunxi-ng: add support for PRCM CCUs
      clk: sunxi-ng: fix PRCM CCU ir clk parent
      clk: sunxi-ng: fix PRCM CCU CLK_NUMBER value

Jerome Brunet (14):
      clk: meson: fix SET_PARM macro
      clk: meson: add missing const qualifiers on gate arrays
      clk: meson8b: put dividers and muxes in tables
      clk: gxbb: put dividers and muxes in tables
      clk: meson: mpll: add rw operation
      clk: meson: gxbb: mpll: use rw operation
      clk: meson8b: add the mplls clocks 0, 1 and 2
      clk: meson: mpll: correct N2 maximum value
      MAINTAINERS: Add maintainers for the meson clock driver
      clk: meson: gxbb: protect against holes in the onecell_data array
      clk: meson: add audio clock divider support
      clk: meson: gxbb: add cts_amclk
      clk: meson: gxbb: add cts_mclk_i958
      clk: meson: gxbb: add cts_i958 clock

John Crispin (2):
      clk: mediatek: add mt2701 ethernet reset
      reset: mediatek: Add MT2701 ethsys reset controller include file

Jon Hunter (1):
      clk: tegra: Don't reset PLL-CX if it is already enabled

Kevin Hilman (1):
      Merge branch 'v4.12/clk-drivers' into v4.12/clk

Kevin-CW Chen (2):
      dt-bindings: arm: mediatek: document clk bindings for MT6797
      clk: mediatek: add clk support for MT6797

Kuninori Morimoto (5):
      cs-2000-cp: keep Reserved bit on each register
      clk: cs2000: use existing priv_to_dev() to getting struct device
      clk: cs2000: enable clock skipping mode
      clk: cs2000: tidyup DEVICE_CFG2 settings
      clk: cs2000: select 12.20 High Accuracy on LFRatioCfg

Leo Yan (1):
      clk: hi6220: add debug APB clock

Markus Elfring (15):
      clk: hisilicon: Use kcalloc() in hisi_clk_init()
      clk: hisilicon: Use devm_kmalloc_array() in hisi_clk_alloc()
      clk: hisilicon: Delete error messages for failed memory allocations in hisi_clk_init()
      clk: hi3620: Use kcalloc() in hi3620_mmc_clk_init()
      clk: hi3620: Delete error messages for a failed memory allocation in two functions
      clk: hi3620: Fix a typo in one variable name
      clk: at91: Use kcalloc() in of_at91_clk_pll_get_characteristics()
      clk: si5351: Use devm_kcalloc() in si5351_i2c_probe()
      clk: si5351: Delete an error message for a failed memory allocation in si5351_i2c_probe()
      clk: Replace four seq_printf() calls by seq_putc()
      clk: Improve a size determination in two functions
      clk: nomadik: Use seq_puts() in nomadik_src_clk_show()
      clk: nomadik: Delete error messages for a failed memory allocation in two functions
      clk: mvebu: Use kcalloc() in of_cpu_clk_setup()
      clk: mvebu: Use kcalloc() in two functions

Mars Cheng (1):
      clk: mediatek: add mt6797 clock IDs

Martin Blumenstingl (2):
      clk: meson: mpll: fix division by zero in rate_from_params
      clk: meson: mpll: use 64bit math in rate_from_params

Michael Turquette (5):
      Merge tag 'clk-renesas-for-v4.12-tag2' of git://git.kernel.org/.../geert/renesas-drivers into clk-next
      Merge tag 'v4.12-rockchip-clk1' of git://git.kernel.org/.../mmind/linux-rockchip into clk-next
      Merge tag 'tegra-for-4.12-clk' of git://git.kernel.org/.../tegra/linux into clk-next
      Merge tag 'amlogic-clk' of git://git.kernel.org/.../khilman/linux-amlogic into clk-next
      Merge tag 'meson-clk-for-4.12' of git://github.com/BayLibre/clk-meson into clk-next

Mikko Perttunen (1):
      clk: tegra: Implement reset control reset

Neil Armstrong (4):
      clk: meson-gxbb: Add MALI clocks
      clk: meson: Add support for parameters for specific PLLs
      clk: meson-gxbb: Add GP0 PLL init parameters
      clk: meson-gxbb: Add GXL/GXM GP0 Variant

Peter De Schrijver (22):
      clk: tegra: Fix pll_a1 iddq register, add pll_a1
      clk: tegra: Fix ISP clock modelling
      clk: tegra: Correct afi clock parent
      clk: tegra: Remove non-existing pll_m_out1 clock
      clk: tegra: Don't warn for PLL defaults unnecessarily
      clk: tegra: Correct tegra210_pll_fixed_mdiv_cfg rate calculation
      clk: tegra: Fix type for m field
      clk: tegra: Add CEC clock
      clk: tegra: Define Tegra210 DMIC sync clocks
      clk: tegra: Fix constness for peripheral clocks
      clk: tegra: Define Tegra210 DMIC clocks
      clk: tegra: Add super clock mux/divider
      clk: tegra: Add aclk
      clk: tegra: Handle UTMIPLL IDDQ
      clk: tegra: Fix disable unused for clocks sharing enable bit
      clk: tegra: Rework pll_u
      clk: tegra: Add Tegra210 special resets
      clk: tegra: Add SATA seq input control
      clk: tegra: Mark TEGRA210_CLK_DBGAPB as always on
      clk: tegra: Add missing Tegra210 clocks
      clk: add clk_possible_parents debugfs file
      clk: aggregate return codes of notify chains

Peter Robinson (1):
      clk: sunxi-ng: tighten SoC deps on explicit AllWinner SoCs

Pierre-Louis Bossart (1):
      clk: x86: add "mclk" alias for Baytrail/Cherrytrail

Priit Laes (2):
      clk: sunxi-ng: sun5i: Fix mux width for csi clock
      clk: sunxi-ng: Display index when clock registration fails

Rajendra Nayak (1):
      clk: qcom: msm8996: Fix the vfe1 powerdomain name

Ray Jui (1):
      clk: iproc: Remove redundant check

Robin van der Gracht (2):
      clk: imx: clk-imx6ul: The i.mx6ul has no aips_tz3 clock
      clk: imx: correct uart4_serial clock name in driver for i.MX6UL

Sergei Shtylyov (2):
      clk: renesas: r8a7795: Add IMR clocks
      clk: renesas: r8a7796: Add IMR clocks

Shawn Guo (3):
      clk: zte: set CLK_SET_RATE_PARENT for a few zx296718 clocks
      clk: zte: pd_bit is not 0 on zx296718
      clk: zte: add pll_vga clock for zx296718

Srinivas Kandagatla (1):
      clk: qcom: clk-smd-rpm: fix rate for branch clks during handoff

Stanimir Varbanov (1):
      clk: qcom: add parent for venus core0 and core1 gdsc's

Stefan Agner (1):
      clk: imx7d: fix USDHC NAND clock

Stephen Boyd (7):
      Merge branch 'for-4.12-ti-clk-cleanups' of https://github.com/t-kristo/linux-pm into clk-next
      Merge branch 'clk-fixes' into clk-next
      clk: zte: Mark pll config tables as const
      Merge branch 'clk-fixes' into clk-next
      Merge tag 'sunxi-clk-for-4.12' of https://git.kernel.org/.../sunxi/linux into clk-next
      Merge branch 'clk-mt6797' into clk-next
      Merge tag 'sunxi-clk-for-4.12-2' of https://git.kernel.org/.../sunxi/linux into HEAD

Tero Kristo (15):
      clk: ti: remove un-used definitions from public clk_hw_omap struct
      clk: ti: add support for automatic clock alias generation
      clk: ti: add API for creating aliases automatically for simple clock types
      clk: ti: use automatic clock alias generation framework
      clk: ti: add clkdm_lookup to the exported functions
      clk: ti: move omap2_init_clk_clkdm under TI clock driver
      clk: ti: enforce const types on string arrays
      clk: ti: omap4: cleanup unnecessary clock aliases
      clk: ti: drop unnecessary MEMMAP_ADDRESSING flag
      clk: ti: mux: convert TI mux clock to use its internal data representation
      clk: ti: divider: convert TI divider clock to use its own data representation
      clk: ti: divider: add driver internal API for parsing divider data
      clk: ti: gate: export gate_clk_ops locally
      clk: ti: dpll44xx: fix clksel register initialization
      clk: ti: convert to use proper register definition for all accesses

Thierry Reding (1):
      clk: tegra: Fix build warnings on Tegra20/Tegra30

Thomas Petazzoni (1):
      clk: spear: fix ADC clock definition on SPEAr600

 .../bindings/arm/mediatek/mediatek,apmixedsys.txt  |   1 +
 .../bindings/arm/mediatek/mediatek,imgsys.txt      |   1 +
 .../bindings/arm/mediatek/mediatek,infracfg.txt    |   1 +
 .../bindings/arm/mediatek/mediatek,mmsys.txt       |   1 +
 .../bindings/arm/mediatek/mediatek,topckgen.txt    |   1 +
 .../bindings/arm/mediatek/mediatek,vdecsys.txt     |   1 +
 .../bindings/arm/mediatek/mediatek,vencsys.txt     |   3 +-
 .../bindings/clock/amlogic,gxbb-clkc.txt           |   3 +-
 .../devicetree/bindings/clock/idt,versaclock5.txt  |  16 +-
 ...chip,rk1108-cru.txt => rockchip,rv1108-cru.txt} |  12 +-
 .../devicetree/bindings/clock/sunxi-ccu.txt        |  18 +-
 MAINTAINERS                                        |  10 +
 arch/arm/boot/dts/rk1108.dtsi                      |   2 +-
 arch/arm/mach-omap2/clkt2xxx_dpllcore.c            |   3 +-
 arch/arm/mach-omap2/clock.c                        |  35 +-
 arch/arm/mach-omap2/clock.h                        |   2 +
 arch/arm/mach-omap2/cm.h                           |   5 +-
 arch/arm/mach-omap2/cm2xxx.c                       |   9 +-
 arch/arm/mach-omap2/cm3xxx.c                       |  10 +-
 arch/arm/mach-omap2/cm_common.c                    |   2 +-
 drivers/clk/Kconfig                                |   8 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/at91/clk-pll.c                         |   6 +-
 drivers/clk/bcm/clk-iproc-pll.c                    |   2 +-
 drivers/clk/bcm/clk-ns2.c                          |   2 +-
 drivers/clk/clk-cs2000-cp.c                        |  52 +-
 drivers/clk/clk-hi655x.c                           | 126 ++++
 drivers/clk/clk-nomadik.c                          |  12 +-
 drivers/clk/clk-si5351.c                           |   8 +-
 drivers/clk/clk-stm32f4.c                          |  43 +-
 drivers/clk/clk-versaclock5.c                      |  76 ++-
 drivers/clk/clk.c                                  |  47 +-
 drivers/clk/hisilicon/clk-hi3620.c                 |  16 +-
 drivers/clk/hisilicon/clk-hi6220.c                 |   1 +
 drivers/clk/hisilicon/clk.c                        |  18 +-
 drivers/clk/imx/clk-imx6ul.c                       |  11 +-
 drivers/clk/imx/clk-imx7d.c                        |  11 +-
 drivers/clk/mediatek/Kconfig                       |  32 +
 drivers/clk/mediatek/Makefile                      |   5 +
 drivers/clk/mediatek/clk-mt2701-eth.c              |   2 +
 drivers/clk/mediatek/clk-mt6797-img.c              |  76 +++
 drivers/clk/mediatek/clk-mt6797-mm.c               | 136 ++++
 drivers/clk/mediatek/clk-mt6797-vdec.c             |  93 +++
 drivers/clk/mediatek/clk-mt6797-venc.c             |  78 +++
 drivers/clk/mediatek/clk-mt6797.c                  | 714 +++++++++++++++++++++
 drivers/clk/meson/Makefile                         |   2 +-
 drivers/clk/meson/clk-audio-divider.c              | 144 +++++
 drivers/clk/meson/clk-mpll.c                       | 154 ++++-
 drivers/clk/meson/clk-pll.c                        |  53 +-
 drivers/clk/meson/clkc.h                           |  39 +-
 drivers/clk/meson/gxbb.c                           | 649 ++++++++++++++++++-
 drivers/clk/meson/gxbb.h                           |  30 +-
 drivers/clk/meson/meson8b.c                        | 127 +++-
 drivers/clk/meson/meson8b.h                        |  20 +-
 drivers/clk/mvebu/clk-cpu.c                        |   4 +-
 drivers/clk/mvebu/common.c                         |   4 +-
 drivers/clk/qcom/clk-smd-rpm.c                     |   2 +-
 drivers/clk/qcom/mmcc-msm8996.c                    |   4 +-
 drivers/clk/renesas/r8a7795-cpg-mssr.c             | 221 +++++--
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |  18 +-
 drivers/clk/renesas/rcar-gen3-cpg.c                |  64 +-
 drivers/clk/renesas/rcar-gen3-cpg.h                |   2 +-
 drivers/clk/renesas/renesas-cpg-mssr.c             |  50 ++
 drivers/clk/renesas/renesas-cpg-mssr.h             |  22 +
 drivers/clk/rockchip/Makefile                      |   2 +-
 drivers/clk/rockchip/clk-pll.c                     |   3 +
 drivers/clk/rockchip/clk-rk3328.c                  |   9 +
 drivers/clk/rockchip/clk-rk3368.c                  |  27 +-
 drivers/clk/rockchip/clk-rk3399.c                  |   8 +-
 .../clk/rockchip/{clk-rk1108.c => clk-rv1108.c}    | 414 ++++++------
 drivers/clk/rockchip/clk.h                         |  28 +-
 drivers/clk/spear/spear6xx_clock.c                 |   2 +-
 drivers/clk/sunxi-ng/Kconfig                       |  16 +-
 drivers/clk/sunxi-ng/Makefile                      |   1 +
 drivers/clk/sunxi-ng/ccu-sun5i.c                   |   2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c               |  18 +-
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c                | 327 +++++++++-
 drivers/clk/sunxi-ng/ccu-sun8i-h3.h                |   3 +-
 drivers/clk/sunxi-ng/ccu-sun8i-r.c                 | 213 ++++++
 drivers/clk/sunxi-ng/ccu-sun8i-r.h                 |  27 +
 drivers/clk/sunxi-ng/ccu-sun9i-a80.c               |  73 ++-
 drivers/clk/sunxi-ng/ccu_common.c                  |   4 +-
 drivers/clk/sunxi-ng/ccu_gate.c                    |  47 ++
 drivers/clk/sunxi-ng/ccu_mult.c                    |   2 +
 drivers/clk/sunxi-ng/ccu_mult.h                    |   2 +
 drivers/clk/sunxi-ng/ccu_nk.c                      |   8 +-
 drivers/clk/sunxi-ng/ccu_nkm.c                     |   8 +-
 drivers/clk/sunxi-ng/ccu_nkmp.c                    |   8 +-
 drivers/clk/sunxi-ng/ccu_nm.c                      |   4 +-
 drivers/clk/tegra/clk-id.h                         |  17 +
 drivers/clk/tegra/clk-periph-gate.c                |   3 +
 drivers/clk/tegra/clk-periph.c                     |   6 +-
 drivers/clk/tegra/clk-pll.c                        | 174 -----
 drivers/clk/tegra/clk-super.c                      |  87 ++-
 drivers/clk/tegra/clk-tegra-audio.c                |  85 ++-
 drivers/clk/tegra/clk-tegra-periph.c               |  41 +-
 drivers/clk/tegra/clk-tegra-pmc.c                  |   6 +-
 drivers/clk/tegra/clk-tegra114.c                   |   1 +
 drivers/clk/tegra/clk-tegra124.c                   |   1 +
 drivers/clk/tegra/clk-tegra210.c                   | 499 ++++++++++++--
 drivers/clk/tegra/clk-tegra30.c                    |   1 +
 drivers/clk/tegra/clk.c                            |  16 +
 drivers/clk/tegra/clk.h                            |  15 +-
 drivers/clk/ti/apll.c                              |  50 +-
 drivers/clk/ti/autoidle.c                          |  18 +-
 drivers/clk/ti/clk-3xxx.c                          |  55 +-
 drivers/clk/ti/clk-44xx.c                          | 188 +-----
 drivers/clk/ti/clk-dra7-atl.c                      |  11 +-
 drivers/clk/ti/clk.c                               | 157 ++++-
 drivers/clk/ti/clkt_dflt.c                         |  61 +-
 drivers/clk/ti/clkt_dpll.c                         |   6 +-
 drivers/clk/ti/clkt_iclk.c                         |  29 +-
 drivers/clk/ti/clock.h                             |  41 +-
 drivers/clk/ti/clockdomain.c                       |  38 +-
 drivers/clk/ti/composite.c                         |  18 +-
 drivers/clk/ti/divider.c                           | 128 ++--
 drivers/clk/ti/dpll.c                              |  63 +-
 drivers/clk/ti/dpll3xxx.c                          |  38 +-
 drivers/clk/ti/dpll44xx.c                          |  14 +-
 drivers/clk/ti/fixed-factor.c                      |   1 +
 drivers/clk/ti/gate.c                              |  44 +-
 drivers/clk/ti/interface.c                         |  25 +-
 drivers/clk/ti/mux.c                               |  59 +-
 drivers/clk/x86/clk-pmc-atom.c                     |   7 +
 drivers/clk/zte/clk-zx296718.c                     |  32 +-
 drivers/clk/zte/clk.c                              |  12 +-
 drivers/clk/zte/clk.h                              |   6 +-
 include/dt-bindings/clock/gxbb-clkc.h              |  11 +
 include/dt-bindings/clock/hi6220-clock.h           |   5 +-
 include/dt-bindings/clock/mt6797-clk.h             | 281 ++++++++
 include/dt-bindings/clock/r8a7795-cpg-mssr.h       |   7 +
 include/dt-bindings/clock/rk3328-cru.h             |   1 +
 include/dt-bindings/clock/rk3368-cru.h             |  19 +-
 .../clock/{rk1108-cru.h => rv1108-cru.h}           |   6 +-
 include/dt-bindings/clock/sun8i-h3-ccu.h           |   5 +-
 include/dt-bindings/clock/sun8i-r-ccu.h            |  59 ++
 include/dt-bindings/clock/tegra114-car.h           |   2 +-
 include/dt-bindings/clock/tegra124-car-common.h    |   2 +-
 include/dt-bindings/clock/tegra210-car.h           |  33 +-
 include/dt-bindings/clock/tegra30-car.h            |   2 +-
 include/dt-bindings/reset/mt2701-resets.h          |   7 +
 include/dt-bindings/reset/sun8i-h3-ccu.h           |   5 +-
 include/dt-bindings/reset/sun8i-r-ccu.h            |  53 ++
 include/dt-bindings/reset/tegra210-car.h           |  13 +
 include/linux/clk/tegra.h                          |   3 +
 include/linux/clk/ti.h                             |  55 +-
 146 files changed, 5760 insertions(+), 1439 deletions(-)
 rename Documentation/devicetree/bindings/clock/{rockchip,rk1108-cru.txt => rockchip,rv1108-cru.txt} (83%)
 create mode 100644 drivers/clk/clk-hi655x.c
 create mode 100644 drivers/clk/mediatek/clk-mt6797-img.c
 create mode 100644 drivers/clk/mediatek/clk-mt6797-mm.c
 create mode 100644 drivers/clk/mediatek/clk-mt6797-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt6797-venc.c
 create mode 100644 drivers/clk/mediatek/clk-mt6797.c
 create mode 100644 drivers/clk/meson/clk-audio-divider.c
 rename drivers/clk/rockchip/{clk-rk1108.c => clk-rv1108.c} (57%)
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-r.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-r.h
 create mode 100644 include/dt-bindings/clock/mt6797-clk.h
 rename include/dt-bindings/clock/{rk1108-cru.h => rv1108-cru.h} (97%)
 create mode 100644 include/dt-bindings/clock/sun8i-r-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-r-ccu.h
 create mode 100644 include/dt-bindings/reset/tegra210-car.h

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

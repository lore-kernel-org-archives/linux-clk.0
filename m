Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: changes for v4.11
Date: Fri, 24 Feb 2017 15:29:23 -0800
Message-Id: <20170224232923.11279-1-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 318fa46cc60d37fec1e87dbf03a82aca0f5ce695:

  clk/samsung: exynos542x: mark some clocks as critical (2017-01-09 16:11:05 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-for-linus

for you to fetch changes up to f59de563358eb9351b7f8f0ba2d3be2ebb70b93d:

  clk: renesas: mstp: ensure register writes complete (2017-02-16 10:36:05 -0800)

----------------------------------------------------------------
The usual collection of new drivers, non-critical fixes, and updates
to existing clk drivers. The bulk of the work is on Allwinner and
Rockchip SoCs, but there's also an Intel Atom driver in here too.

New Drivers:
 - Tegra BPMP firmware
 - Hisilicon hi3660 SoCs
 - Rockchip rk3328 SoCs
 - Intel Atom PMC
 - STM32F746
 - IDT VersaClock 5P49V5923 and 5P49V5933
 - Marvell mv98dx3236 SoCs
 - Allwinner V3s SoCs

Removed Drivers:
 - Samsung Exynos4415 SoCs

Updates:
 - Migrate ABx500 to OF
 - Qualcomm IPQ4019 CPU clks and general PLL support
 - Qualcomm MSM8974 RPM
 - Rockchip non-critical fixes and clk id additions
 - Samsung Exynos4412 CPUs
 - Socionext UniPhier NAND and eMMC support
 - ZTE zx296718 i2s and other audio clks
 - Renesas CAN and MSIOF clks for R-Car M3-W
 - Renesas resets for R-Car Gen2 and Gen3 and RZ/G1
 - TI CDCE913, CDCE937, and CDCE949 clk generators
 - Marvell Armada ap806 CPU frequencies
 - STM32F4* I2S/SAI support
 - Broadcom BCM2835 DSI support
 - Allwinner sun5i and A80 conversion to new style clk bindings

----------------------------------------------------------------
Abhishek Sahu (6):
      clk: qcom: ipq4019: remove fixed clocks and add pll clocks
      clk: qcom: ipq4019: Add the apss cpu pll divider clock node
      clk: qcom: ipq4019: Add the nodes for pcnoc
      clk: qcom: ipq4019: correct sdcc frequency and parent name
      clk: qcom: ipq4019: Add all the frequencies for apss cpu
      clk: qcom: ipq4019: Add the cpu clock frequency change notifier

Akinobu Mita (1):
      clk: cdce925: add support for CDCE913, CDCE937, and CDCE949

Arnd Bergmann (2):
      clk: stm32f4: avoid uninitialized variable access
      clk: sunxi-ng: select SUNXI_CCU_MULT for sun5i

Avaneesh Kumar Dwivedi (1):
      clk: qcom: Add GCC_MSS_RESET support

Baoyou Xie (1):
      clk: zte: add i2s clocks for zx296718

Bjorn Andersson (1):
      clk: qcom: smd-rpmcc: Add msm8974 clocks

Chanwoo Choi (1):
      clk: samsung: exynos5433: Set NoC (Network On Chip) clocks as critical

Chen-Yu Tsai (8):
      clk: sunxi-ng: mux: Fix determine_rate for mux clocks with pre-dividers
      clk: sunxi-ng: mux: honor CLK_SET_RATE_NO_REPARENT flag
      clk: sunxi-ng: mux: Get closest parent rate possible with CLK_SET_RATE_PARENT
      clk: sunxi-ng: Support separately grouped PLL lock status register
      clk: sunxi-ng: Add A80 CCU
      clk: sunxi-ng: Add A80 USB CCU
      clk: sunxi-ng: Add A80 Display Engine CCU
      ARM: dts: sun9i: Switch to new clock bindings

Chris Brandt (1):
      clk: renesas: mstp: ensure register writes complete

Chris Packham (2):
      clk: mvebu: support for 98DX3236 SoC
      clk: mvebu: Expand mv98dx3236-core-clock support

Chris Paterson (3):
      clk: renesas: r8a7796: Add CAN peripheral clock
      clk: renesas: r8a7796: Add CANFD clock
      clk: renesas: r8a7796: Add CAN FD peripheral clock

Douglas Anderson (1):
      clk: rockchip: Remove useless init of "grf" to -EPROBE_DEFER

Elaine Zhang (4):
      clk: rockchip: add new pll-type for rk3328
      clk: rockchip: add dt-binding header for rk3328
      dt-bindings: add bindings for rk3328 clock controller
      clk: rockchip: add clock controller for rk3328

Eric Anholt (3):
      clk: bcm2835: Don't rate change PLLs on behalf of DSI PLL dividers.
      clk: bcm2835: Register the DSI0/DSI1 pixel clocks.
      clk: bcm2835: Add leaf clock measurement support, disabled by default

Fabio Estevam (1):
      clk: imx7d: Add the OCOTP clock

Gabriel Fernandez (8):
      clk: stm32f4: Add PLL_I2S & PLL_SAI for STM32F429/469 boards
      clk: stm32f4: Add post divisor for I2S & SAI PLLs
      clk: stm32f4: Add lcd-tft clock
      clk: stm32f4: Add I2S clock
      clk: stm32f4: Add SAI clocks
      clk: stm32f4: SDIO & 48Mhz clock management for STM32F469 board
      clk: stm32f7: Add stm32f7 clock DT bindings for STM32F746 boards
      clk: stm32f7: Introduce stm32f7 clocks for STM32F746 boards

Geert Uytterhoeven (8):
      clk: clk-conf: Do not print error messages if EPROBE_DEFER
      clk: renesas: cpg-mssr: Migrate to CLK_IS_CRITICAL
      clk: renesas: mstp: Make INTC-SYS a critical clock
      clk: renesas: mstp: Reformat cpg_mstp_clock_register() for git diff
      dt-bindings: clock: renesas: cpg-mssr: Document reset control support
      clk: renesas: cpg-mssr: Document suitability for RZ/G1
      clk: renesas: cpg-mssr: Rename cpg_mssr_priv.mstp_lock
      clk: renesas: cpg-mssr: Add support for reset control

Guenter Roeck (1):
      clk: qcom: Do not drop device node twice

Heiko Stuebner (7):
      clk: rockchip: add a clock-type for muxes based in the grf
      clk: rockchip: describe aclk_vcodec using the new muxgrf type on rk3288
      Merge branch 'v4.11-shared/clkids' into v4.11-clk/next
      clk: rockchip: add clock ids for memory controller parts on rk3066/rk3188
      Merge branch 'v4.11-shared/clkids' into v4.11-clk/next
      clk: rockchip: use clock ids for memory controller parts on rk3066/rk3188
      Merge branch 'v4.11-shared/clkids' into v4.11-clk/next

Hiromitsu Yamasaki (1):
      clk: renesas: r8a7796: Add MSIOF controller clocks

Icenowy Zheng (4):
      clk: sunxi-ng: fix PLL_CPUX adjusting on A33
      clk: sunxi-ng: set the parent rate when adjustin CPUX clock on A33
      dt-bindings: add device binding for the CCU of Allwinner V3s
      clk: sunxi-ng: add support for V3s CCU

Irina Tirdea (3):
      clk: x86: Add Atom PMC platform clocks
      arch/x86/platform/atom: Move pmc_atom to drivers/platform/x86
      platform/x86: Enable Atom PMC platform clocks

Jacob Chen (5):
      clk: rockchip: add rk3288 isp_in clock ids
      clk: rockchip: use rk3288 isp_in clock ids
      clk: rockchip: add rk3288 vip_out clock id
      clk: rockchip: use rk3288 vip_out clock ids
      clk: rockchip: rk3288: make all niu clocks critical

Jean Delvare (2):
      clk: mediatek: Fix MT2701 dependencies
      clk: mediatek: Fix MT8135 dependencies

Jeremy McNicoll (2):
      dt-bindings: qcom: clk: Add missing binding for SDCHI enablement on Nexus 5X/6P
      clk: qcom: SDHCI enablement on Nexus 5X / 6P

Jerome Brunet (1):
      clk: meson8b: fix clk81 register address

Jose Abreu (1):
      clk/axs10x: Clear init field in driver probe

Jun Nie (1):
      clk: zte: add audio clocks for zx296718

Keerthy (1):
      clk: ti: divider: Add the table parsing to get the best divider value

Keita Kobayashi (1):
      clk: renesas: r8a7795: Add IIC-DVFS clock

Khiem Nguyen (2):
      clk: cs2000: add Suspend/Resume feature
      clk: renesas: r8a7796: Add IIC-DVFS clock

Krzysztof Kozlowski (1):
      clk: samsung: Remove Exynos4415 driver (SoC not supported anymore)

Leo Yan (1):
      clk: hisilicon: fix lock assignment

Linus Walleij (3):
      clk: ux500: move AB8500 sysclk over to PRCMU clk driver
      clk: ux500: Add device tree bindings for ABx500 clocks
      clk: ux500: Convert ABx500 clocks to use OF probing

Lucas Stach (1):
      clk: imx6: don't restrict LDB mux changes on QuadPlus

Marcus Cooper (1):
      clk: sunxi-ng: A31: Fix spdif clock register

Marek Szyprowski (5):
      clk: samsung: exynos-audss: Replace syscore PM with platform device PM
      clk: samsung: exynos5433: Add IDs for PHYCLK_MIPIDPHY0_* clocks
      clk: samsung: exynos5433: Add data for 250MHz and 278MHz PLL rates
      clk: samsung: exynos5433: Correct typos in SoC name
      clk: samsung: Add enable/disable support for PLL35XX clocks

Marek Vasut (2):
      clk: vc5: Add bindings for IDT VersaClock 5P49V5923 and 5P49V5933
      clk: vc5: Add support for IDT VersaClock 5P49V5923 and 5P49V5933

Martin Kaiser (1):
      clk: samsung: mark s3c...._clk_sleep_init() as __init

Masahiro Yamada (4):
      clk: uniphier: remove unneeded #include <linux/delay.h>
      clk: uniphier: continue probing even if some clocks fail to register
      clk: uniphier: add NAND clock for all UniPhier SoCs
      clk: uniphier: add eMMC clock for LD11 and LD20 SoCs

Maxime Ripard (10):
      clk: sunxi-ng: multiplier: Add fractional support
      clk: sunxi-ng: Implement factors offsets
      clk: sunxi-ng: mult: Fix minimum in round rate
      clk: sunxi-ng: Implement multiplier maximum
      clk: sunxi-ng: Implement global pre-divider
      clk: sunxi-ng: Add sun5i CCU driver
      ARM: sun5i: Convert to CCU
      ARM: gr8: Convert to CCU
      clk: sunxi-ng: Call divider_round_rate if we only have a single parent
      clk: sunxi-ng: a33: Set CLK_SET_RATE_PARENT for the GPU

Mylène Josserand (1):
      clk: sunxi-ng: a33: Add CLK_SET_RATE_PARENT to ac-dig

Nicholas Mc Guire (1):
      clk: wm831x: fix usleep_range with bad range

Nikita Yushchenko (1):
      clk: imx: pllv3: support fractional multiplier on vf610 PLL1/PLL2

Ondrej Jirman (1):
      clk: sunxi-ng: fix PLL_CPUX adjusting on H3

Pierre-Louis Bossart (2):
      clk: Make x86/ conditional on CONFIG_COMMON_CLK
      platform/x86: fix typo in comment

Rajendra Nayak (1):
      clk: qcom: gdsc: Fix handling of hw control enable/disable

Shawn Guo (2):
      clk: zx296718: do not panic on failure
      dt-bindings: zx296718-clk: add compatible for audio clock controller

Stephen Boyd (14):
      Merge branches 'clk-qcom-rpm8974', 'clk-stm32f4', 'clk-ipq4019' and 'clk-fixes' into clk-next
      Merge branch 'clk-hi3660' into clk-next
      Merge branch 'clk-fixes' into clk-next
      Merge tag 'clk-renesas-for-v4.11-tag1' of git://git.kernel.org/.../geert/renesas-drivers into clk-next
      Merge tag 'clk-v4.11-samsung' of git://linuxtv.org/snawrocki/samsung into clk-next
      Merge tag 'v4.11-rockchip-clk1' of git://git.kernel.org/.../mmind/linux-rockchip into clk-next
      Merge branch 'clk-imx7', 'clk-bcm2835' into clk-next
      Merge branch 'clk-stm32f4' into clk-next
      Merge branch 'clk-ux500' into clk-next
      Merge tag 'clk-renesas-for-v4.11-tag2' of git://git.kernel.org/.../geert/renesas-drivers into clk-next
      Merge tag 'clk-v4.11-samsung-2' of git://linuxtv.org/snawrocki/samsung into clk-next
      Merge tag 'sunxi-clk-for-4.11' of https://git.kernel.org/.../mripard/linux into clk-next
      Merge tag 'v4.11-rockchip-clk2' of git://git.kernel.org/.../mmind/linux-rockchip into clk-next
      clk: sunxi-ng: Check kzalloc() for errors and cleanup error path

Sudeep Holla (1):
      clk: scpi: don't add cpufreq device if the scpi dvfs node is disabled

Thierry Reding (1):
      clk: tegra: Add BPMP clock driver

Thomas Petazzoni (2):
      clk: mvebu: adjust AP806 CPU clock frequencies to production chip
      clk: mvebu: adjust clock handling for the CP110 system controller

Wei Yongjun (1):
      clk: sunxi-ng: sun9i-a80: Fix wrong pointer passed to PTR_ERR()

Xing Zheng (2):
      dt-bindings: clk: add rockchip,grf property for RK3399
      clk: rockchip: fix the incorrect pclk_edp div width for RK3399

Zhangfei Gao (2):
      dt-bindings: Document the hi3660 clock bindings
      clk: hisilicon: Add clock driver for hi3660 SoC

Zoran Markovic (1):
      clk: mdm9615: Add EBI2 clock

 .../bindings/clock/brcm,bcm2835-cprman.txt         |   15 +-
 .../devicetree/bindings/clock/exynos4415-clock.txt |   38 -
 .../devicetree/bindings/clock/hi3660-clock.txt     |   42 +
 .../devicetree/bindings/clock/idt,versaclock5.txt  |   65 ++
 .../bindings/clock/mvebu-corediv-clock.txt         |    1 +
 .../devicetree/bindings/clock/mvebu-cpu-clock.txt  |    1 +
 .../devicetree/bindings/clock/qcom,rpmcc.txt       |    1 +
 .../devicetree/bindings/clock/renesas,cpg-mssr.txt |    6 +
 .../bindings/clock/rockchip,rk3328-cru.txt         |   57 +
 .../bindings/clock/rockchip,rk3399-cru.txt         |    6 +
 .../devicetree/bindings/clock/st,stm32-rcc.txt     |   20 +
 .../bindings/clock/stericsson,abx500.txt           |   20 +
 .../devicetree/bindings/clock/sun9i-de.txt         |   28 +
 .../devicetree/bindings/clock/sun9i-usb.txt        |   24 +
 .../devicetree/bindings/clock/sunxi-ccu.txt        |    2 +
 .../devicetree/bindings/clock/ti,cdce925.txt       |   15 +-
 .../devicetree/bindings/clock/zx296718-clk.txt     |    3 +
 MAINTAINERS                                        |    5 +
 arch/arm/boot/dts/sun5i-a10s.dtsi                  |   85 +-
 arch/arm/boot/dts/sun5i-a13.dtsi                   |  140 +--
 arch/arm/boot/dts/sun5i-gr8.dtsi                   |  520 +--------
 arch/arm/boot/dts/sun5i-r8.dtsi                    |   10 +-
 arch/arm/boot/dts/sun5i.dtsi                       |  353 +-----
 arch/arm/boot/dts/sun9i-a80.dtsi                   |  404 ++-----
 arch/x86/Kconfig                                   |    4 -
 arch/x86/platform/atom/Makefile                    |    1 -
 drivers/acpi/acpi_lpss.c                           |    2 +-
 drivers/clk/Kconfig                                |   21 +-
 drivers/clk/Makefile                               |    3 +
 drivers/clk/axs10x/i2s_pll_clock.c                 |    1 +
 drivers/clk/bcm/clk-bcm2835.c                      |  303 ++++-
 drivers/clk/clk-cdce925.c                          |  108 +-
 drivers/clk/clk-conf.c                             |   15 +-
 drivers/clk/clk-cs2000-cp.c                        |   22 +
 drivers/clk/clk-scpi.c                             |   14 +-
 drivers/clk/clk-stm32f4.c                          |  872 +++++++++++++-
 drivers/clk/clk-versaclock5.c                      |  791 +++++++++++++
 drivers/clk/clk-wm831x.c                           |    3 +-
 drivers/clk/hisilicon/Kconfig                      |    7 +
 drivers/clk/hisilicon/Makefile                     |    1 +
 drivers/clk/hisilicon/clk-hi3660.c                 |  567 +++++++++
 drivers/clk/hisilicon/clkgate-separated.c          |    1 +
 drivers/clk/imx/clk-imx6q.c                        |   21 +-
 drivers/clk/imx/clk-imx7d.c                        |    1 +
 drivers/clk/imx/clk-pllv3.c                        |   99 ++
 drivers/clk/imx/clk-vf610.c                        |    4 +-
 drivers/clk/imx/clk.h                              |    1 +
 drivers/clk/mediatek/Kconfig                       |   19 +-
 drivers/clk/meson/meson8b.c                        |    1 -
 drivers/clk/mvebu/Makefile                         |    2 +-
 drivers/clk/mvebu/ap806-system-controller.c        |   28 +-
 drivers/clk/mvebu/armada-xp.c                      |   26 +
 drivers/clk/mvebu/clk-corediv.c                    |   23 +
 drivers/clk/mvebu/clk-cpu.c                        |    8 +
 drivers/clk/mvebu/cp110-system-controller.c        |   13 +-
 drivers/clk/mvebu/mv98dx3236.c                     |  180 +++
 drivers/clk/qcom/clk-smd-rpm.c                     |   71 ++
 drivers/clk/qcom/common.c                          |    1 -
 drivers/clk/qcom/gcc-ipq4019.c                     |  479 +++++++-
 drivers/clk/qcom/gcc-mdm9615.c                     |   30 +
 drivers/clk/qcom/gcc-msm8994.c                     |   18 +
 drivers/clk/qcom/gcc-msm8996.c                     |    1 +
 drivers/clk/qcom/gdsc.c                            |   58 +-
 drivers/clk/renesas/clk-mstp.c                     |   17 +-
 drivers/clk/renesas/r8a7795-cpg-mssr.c             |    1 +
 drivers/clk/renesas/r8a7796-cpg-mssr.c             |   10 +
 drivers/clk/renesas/renesas-cpg-mssr.c             |  149 ++-
 drivers/clk/rockchip/Makefile                      |    2 +
 drivers/clk/rockchip/clk-muxgrf.c                  |  102 ++
 drivers/clk/rockchip/clk-pll.c                     |   16 +-
 drivers/clk/rockchip/clk-rk3188.c                  |    4 +-
 drivers/clk/rockchip/clk-rk3288.c                  |   36 +-
 drivers/clk/rockchip/clk-rk3328.c                  |  895 ++++++++++++++
 drivers/clk/rockchip/clk-rk3399.c                  |    2 +-
 drivers/clk/rockchip/clk.c                         |    8 +-
 drivers/clk/rockchip/clk.h                         |   40 +
 drivers/clk/samsung/Makefile                       |    1 -
 drivers/clk/samsung/clk-exynos-audss.c             |   24 +-
 drivers/clk/samsung/clk-exynos4415.c               | 1022 ----------------
 drivers/clk/samsung/clk-exynos5433.c               |   44 +-
 drivers/clk/samsung/clk-pll.c                      |   45 +-
 drivers/clk/samsung/clk-s3c2410.c                  |    4 +-
 drivers/clk/samsung/clk-s3c2412.c                  |    4 +-
 drivers/clk/samsung/clk-s3c2443.c                  |    4 +-
 drivers/clk/samsung/clk-s3c64xx.c                  |    4 +-
 drivers/clk/sunxi-ng/Kconfig                       |   32 +
 drivers/clk/sunxi-ng/Makefile                      |    5 +
 drivers/clk/sunxi-ng/ccu-sun5i.c                   | 1022 ++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun5i.h                   |   67 ++
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c               |    4 +-
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c               |   16 +-
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c                |   10 +
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c               |  591 ++++++++++
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.h               |   63 +
 drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c            |  283 +++++
 drivers/clk/sunxi-ng/ccu-sun9i-a80-de.h            |   33 +
 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c           |  144 +++
 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.h           |   25 +
 drivers/clk/sunxi-ng/ccu-sun9i-a80.c               | 1223 ++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu-sun9i-a80.h               |   57 +
 drivers/clk/sunxi-ng/ccu_common.c                  |   24 +-
 drivers/clk/sunxi-ng/ccu_common.h                  |    4 +
 drivers/clk/sunxi-ng/ccu_div.c                     |   12 +
 drivers/clk/sunxi-ng/ccu_div.h                     |   10 +-
 drivers/clk/sunxi-ng/ccu_mp.c                      |   10 +-
 drivers/clk/sunxi-ng/ccu_mult.c                    |   30 +-
 drivers/clk/sunxi-ng/ccu_mult.h                    |   24 +-
 drivers/clk/sunxi-ng/ccu_mux.c                     |   43 +-
 drivers/clk/sunxi-ng/ccu_nk.c                      |   22 +-
 drivers/clk/sunxi-ng/ccu_nkm.c                     |   26 +-
 drivers/clk/sunxi-ng/ccu_nkmp.c                    |   25 +-
 drivers/clk/sunxi-ng/ccu_nm.c                      |   17 +-
 drivers/clk/tegra/Kconfig                          |    4 +
 drivers/clk/tegra/Makefile                         |    1 +
 drivers/clk/tegra/clk-bpmp.c                       |  620 ++++++++++
 drivers/clk/ti/divider.c                           |   31 +-
 drivers/clk/uniphier/clk-uniphier-core.c           |    7 +-
 drivers/clk/uniphier/clk-uniphier-cpugear.c        |    1 -
 drivers/clk/uniphier/clk-uniphier-sys.c            |   21 +
 drivers/clk/ux500/abx500-clk.c                     |   44 +-
 drivers/clk/ux500/u8500_of_clk.c                   |    3 +
 drivers/clk/x86/Makefile                           |    1 +
 drivers/clk/x86/clk-pmc-atom.c                     |  371 ++++++
 drivers/clk/zte/clk-zx296718.c                     |  158 ++-
 drivers/clk/zte/clk.c                              |  127 ++
 drivers/clk/zte/clk.h                              |   21 +
 drivers/platform/x86/Kconfig                       |    5 +
 drivers/platform/x86/Makefile                      |    1 +
 .../atom => drivers/platform/x86}/pmc_atom.c       |   88 +-
 include/dt-bindings/clock/bcm2835.h                |    2 +
 include/dt-bindings/clock/exynos4415.h             |  360 ------
 include/dt-bindings/clock/exynos5433.h             |    5 +-
 include/dt-bindings/clock/hi3660-clock.h           |  194 ++++
 include/dt-bindings/clock/imx7d-clock.h            |    3 +-
 include/dt-bindings/clock/qcom,gcc-ipq4019.h       |   11 +
 include/dt-bindings/clock/qcom,gcc-mdm9615.h       |    2 +
 include/dt-bindings/clock/qcom,gcc-msm8994.h       |    1 +
 include/dt-bindings/clock/qcom,gcc-msm8996.h       |    1 +
 include/dt-bindings/clock/qcom,rpmcc.h             |   40 +-
 include/dt-bindings/clock/rk3188-cru-common.h      |    2 +
 include/dt-bindings/clock/rk3288-cru.h             |    2 +
 include/dt-bindings/clock/rk3328-cru.h             |  400 +++++++
 include/dt-bindings/clock/ste-ab8500.h             |   11 +
 include/dt-bindings/clock/stm32fx-clock.h          |   20 +
 include/dt-bindings/clock/sun5i-ccu.h              |  103 ++
 include/dt-bindings/clock/sun8i-v3s-ccu.h          |  107 ++
 include/dt-bindings/clock/sun9i-a80-ccu.h          |  162 +++
 include/dt-bindings/clock/sun9i-a80-de.h           |   80 ++
 include/dt-bindings/clock/sun9i-a80-usb.h          |   59 +
 include/dt-bindings/reset/sun5i-ccu.h              |   32 +
 include/dt-bindings/reset/sun8i-v3s-ccu.h          |   78 ++
 include/dt-bindings/reset/sun9i-a80-ccu.h          |  102 ++
 include/dt-bindings/reset/sun9i-a80-de.h           |   58 +
 include/dt-bindings/reset/sun9i-a80-usb.h          |   56 +
 include/linux/platform_data/x86/clk-pmc-atom.h     |   44 +
 .../linux/platform_data/x86}/pmc_atom.h            |    2 +-
 156 files changed, 12306 insertions(+), 3072 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos4415-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/hi3660-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/idt,versaclock5.txt
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3328-cru.txt
 create mode 100644 Documentation/devicetree/bindings/clock/stericsson,abx500.txt
 create mode 100644 Documentation/devicetree/bindings/clock/sun9i-de.txt
 create mode 100644 Documentation/devicetree/bindings/clock/sun9i-usb.txt
 create mode 100644 drivers/clk/clk-versaclock5.c
 create mode 100644 drivers/clk/hisilicon/clk-hi3660.c
 create mode 100644 drivers/clk/mvebu/mv98dx3236.c
 create mode 100644 drivers/clk/rockchip/clk-muxgrf.c
 create mode 100644 drivers/clk/rockchip/clk-rk3328.c
 delete mode 100644 drivers/clk/samsung/clk-exynos4415.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun5i.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun5i.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v3s.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80-de.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.h
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80.c
 create mode 100644 drivers/clk/sunxi-ng/ccu-sun9i-a80.h
 create mode 100644 drivers/clk/tegra/clk-bpmp.c
 create mode 100644 drivers/clk/x86/clk-pmc-atom.c
 rename {arch/x86/platform/atom => drivers/platform/x86}/pmc_atom.c (87%)
 delete mode 100644 include/dt-bindings/clock/exynos4415.h
 create mode 100644 include/dt-bindings/clock/hi3660-clock.h
 create mode 100644 include/dt-bindings/clock/rk3328-cru.h
 create mode 100644 include/dt-bindings/clock/ste-ab8500.h
 create mode 100644 include/dt-bindings/clock/sun5i-ccu.h
 create mode 100644 include/dt-bindings/clock/sun8i-v3s-ccu.h
 create mode 100644 include/dt-bindings/clock/sun9i-a80-ccu.h
 create mode 100644 include/dt-bindings/clock/sun9i-a80-de.h
 create mode 100644 include/dt-bindings/clock/sun9i-a80-usb.h
 create mode 100644 include/dt-bindings/reset/sun5i-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-v3s-ccu.h
 create mode 100644 include/dt-bindings/reset/sun9i-a80-ccu.h
 create mode 100644 include/dt-bindings/reset/sun9i-a80-de.h
 create mode 100644 include/dt-bindings/reset/sun9i-a80-usb.h
 create mode 100644 include/linux/platform_data/x86/clk-pmc-atom.h
 rename {arch/x86/include/asm => include/linux/platform_data/x86}/pmc_atom.h (98%)
s

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

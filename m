Return-Path: <narmstrong@baylibre.com>
Return-Path: <narmstrong@baylibre.com>
To: sboyd@codeaurora.org, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
 khilman@baylibre.com
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] Amlogic clock driver updates for 4.17
Message-ID: <f7bad58b-d7a3-779b-8551-76c030023ec5@baylibre.com>
Date: Mon, 12 Mar 2018 12:04:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Dear clock maintainers,

Below is a request to pull a 1st batch of Amlogic clock driver updates for this
cycle.
The PR is composed of 3 series :
- pll fixes for GXBB, GXL and AXG
- use regmap in clock controllers for GXBB, GXL and AXG
- general clock updates for Meson8, GXBB, GXL and AXG

These 2 last series were depending on patches merged on clk-next, thus clk-next
was merged in between.

Cheers
Neil

The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the git repository at:

  git://github.com/BayLibre/clk-meson.git next/drivers

for you to fetch changes up to 0d6368ef015e734a36f043289b92ca493a121147:

  clk: meson: clean-up clk81 clocks (2018-03-12 11:48:28 +0100)

----------------------------------------------------------------
Gabriel Fernandez (12):
      dt-bindings: Document STM32MP1 Reset Clock Controller (RCC) bindings
      clk: stm32mp1: Introduce STM32MP1 clock driver
      clk: stm32mp1: add MP1 gate for hse/hsi/csi oscillators
      clk: stm32mp1: add Source Clocks for PLLs
      clk: stm32mp1: add PLL clocks
      clk: stm32mp1: add Post-dividers for PLL
      clk: stm32mp1: add Sub System clocks
      clk: stm32mp1: add Kernel timers
      clk: stm32mp1: add Peripheral & Kernel Clocks
      clk: stm32mp1: add RTC clock
      clk: stm32mp1: add MCO clocks
      clk: stm32mp1: add Debug clocks

Jerome Brunet (48):
      clk: meson: check pll rate param table before using it
      clk: meson: remove useless pll rate params tables
      clk: meson: remove unnecessary rounding in the pll clock
      clk: meson: use the frac parameter width instead of a constant
      clk: meson: add od3 to the pll driver
      clk: meson: add the gxl hdmi pll
      clk: meson: fix rate calculation of plls with a fractional part
      clk: meson: gxbb: add the fractional part of the fixed_pll
      clk: meson: axg: add the fractional part of the fixed_pll
      clk: meson: add axg misc bit to the mpll driver
      clk: migrate the count of orphaned clocks at init
      clk: divider: export clk_div_mask() helper
      clk: mux: add helper function for index/value translation
      clk: fix determine rate error with pass-through clock
      clk: call the clock init() callback before any other ops callback
      clk: fix mux clock documentation
      clk: divider: read-only divider can propagate rate change
      clk: qcom: use divider_ro_round_rate helper
      clk: meson: use dev pointer where possible
      clk: meson: use devm_of_clk_add_hw_provider
      clk: meson: only one loop index is necessary in probe
      clk: meson: remove obsolete comments
      clk: meson: add regmap clocks
      clk: meson: switch gxbb ao_clk to clk_regmap
      clk: meson: remove superseded aoclk_gate_regmap
      clk: meson: add regmap to the clock controllers
      clk: meson: migrate gates to clk_regmap
      clk: meson: migrate dividers to clk_regmap
      clk: meson: migrate muxes to clk_regmap
      clk: meson: add regmap helpers for parm
      clk: meson: migrate mplls clocks to clk_regmap
      clk: meson: migrate the audio divider clock to clk_regmap
      clk: meson: migrate plls clocks to clk_regmap
      clk: meson: split divider and gate part of mpll
      clk: meson: rework meson8b cpu clock
      clk: meson: remove obsolete cpu_clk
      clk: meson: use hhi syscon if available
      clk: meson: add fractional part of meson8b fixed_pll
      clk: meson: poke pll CNTL last
      clk: meson: remove special gp0 lock loop
      clk: meson: improve pll driver results with frac
      clk: meson: add gp0 frac parameter for axg and gxl
      clk: meson: add ROUND_CLOSEST to the pll driver
      clk: meson: axg: add hifi clock bindings
      clk: meson: axg: add hifi pll clock
      clk: meson: add mpll pre-divider
      clk: meson: add fdiv clock gates
      clk: meson: clean-up clk81 clocks

Michael Turquette (3):
      Merge branch 'clk-fixes' into clk-next
      Merge branch 'clk-helpers' into clk-next
      Merge branch 'clk-phase' into clk-next

Neil Armstrong (1):
      Merge branch 'clk-next' into next/drivers

Shawn Lin (1):
      clk: update cached phase to respect the fact when setting phase

Yixun Lan (1):
      clk: meson: axg: fix the od shift of the sys_pll

 .../devicetree/bindings/clock/st,stm32mp1-rcc.txt  |   60 +
 drivers/clk/Kconfig                                |    6 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-divider.c                          |   58 +-
 drivers/clk/clk-mux.c                              |   75 +-
 drivers/clk/clk-stm32mp1.c                         | 2117 ++++++++++++++++++++
 drivers/clk/clk.c                                  |   67 +-
 drivers/clk/meson/Kconfig                          |    9 +
 drivers/clk/meson/Makefile                         |    5 +-
 drivers/clk/meson/axg.c                            |  955 +++++----
 drivers/clk/meson/axg.h                            |   12 +-
 drivers/clk/meson/clk-audio-divider.c              |   63 +-
 drivers/clk/meson/clk-cpu.c                        |  178 --
 drivers/clk/meson/clk-mpll.c                       |  125 +-
 drivers/clk/meson/clk-pll.c                        |  306 +--
 drivers/clk/meson/clk-regmap.c                     |  166 ++
 drivers/clk/meson/clk-regmap.h                     |  111 +
 drivers/clk/meson/clkc.h                           |  107 +-
 drivers/clk/meson/gxbb-aoclk-regmap.c              |   46 -
 drivers/clk/meson/gxbb-aoclk.c                     |   20 +-
 drivers/clk/meson/gxbb-aoclk.h                     |   11 -
 drivers/clk/meson/gxbb.c                           | 1591 ++++++++-------
 drivers/clk/meson/gxbb.h                           |   14 +-
 drivers/clk/meson/meson8b.c                        |  706 ++++---
 drivers/clk/meson/meson8b.h                        |   17 +-
 drivers/clk/qcom/clk-regmap-divider.c              |   20 +-
 include/dt-bindings/clock/axg-clkc.h               |    1 +
 include/dt-bindings/clock/stm32mp1-clks.h          |  254 +++
 include/linux/clk-provider.h                       |   23 +-
 29 files changed, 5048 insertions(+), 2076 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.txt
 create mode 100644 drivers/clk/clk-stm32mp1.c
 delete mode 100644 drivers/clk/meson/clk-cpu.c
 create mode 100644 drivers/clk/meson/clk-regmap.c
 create mode 100644 drivers/clk/meson/clk-regmap.h
 delete mode 100644 drivers/clk/meson/gxbb-aoclk-regmap.c
 create mode 100644 include/dt-bindings/clock/stm32mp1-clks.h

Return-Path: <narmstrong@baylibre.com>
Return-Path: <narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL v2] Amlogic clock driver updates for 4.17
To: sboyd@codeaurora.org, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
 khilman@baylibre.com
Message-ID: <73587ed8-923d-e123-29a1-b6c3b710a0eb@baylibre.com>
Date: Tue, 13 Mar 2018 10:30:38 +0100
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

These 2 last series were depending on patches merged on the clk-helpers
topic branch, thus based on this branch.

Cheers
Neil

The following changes since commit f5edaefee2d621f4e7628f1421c58a2361572d3a:

  clk: qcom: use divider_ro_round_rate helper (2018-03-12 15:10:27 -0700)

are available in the git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-for-v4.17-1

for you to fetch changes up to 5b13ef64eebdc9e989fac2a3eb9aaa252a3edda6:

  clk: meson: clean-up clk81 clocks (2018-03-13 10:10:00 +0100)

----------------------------------------------------------------
 - pll fixes for GXBB, GXL and AXG
 - use regmap in clock controllers for GXBB, GXL and AXG
 - general clock updates for Meson8, GXBB, GXL and AXG
Based on the clk-helpers topic branch as a dependency.

----------------------------------------------------------------
Jerome Brunet (40):
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

Neil Armstrong (1):
      Merge branch 'topic/pll-fixes' into next/drivers

Yixun Lan (1):
      clk: meson: axg: fix the od shift of the sys_pll

 drivers/clk/meson/Kconfig             |    9 +
 drivers/clk/meson/Makefile            |    5 +-
 drivers/clk/meson/axg.c               |  955 +++++++++++---------
 drivers/clk/meson/axg.h               |   12 +-
 drivers/clk/meson/clk-audio-divider.c |   63 +-
 drivers/clk/meson/clk-cpu.c           |  178 ----
 drivers/clk/meson/clk-mpll.c          |  125 +--
 drivers/clk/meson/clk-pll.c           |  306 ++++---
 drivers/clk/meson/clk-regmap.c        |  166 ++++
 drivers/clk/meson/clk-regmap.h        |  111 +++
 drivers/clk/meson/clkc.h              |  107 +--
 drivers/clk/meson/gxbb-aoclk-regmap.c |   46 -
 drivers/clk/meson/gxbb-aoclk.c        |   20 +-
 drivers/clk/meson/gxbb-aoclk.h        |   11 -
 drivers/clk/meson/gxbb.c              | 1591 ++++++++++++++++++---------------
 drivers/clk/meson/gxbb.h              |   14 +-
 drivers/clk/meson/meson8b.c           |  706 +++++++++------
 drivers/clk/meson/meson8b.h           |   17 +-
 include/dt-bindings/clock/axg-clkc.h  |    1 +
 19 files changed, 2460 insertions(+), 1983 deletions(-)
 delete mode 100644 drivers/clk/meson/clk-cpu.c
 create mode 100644 drivers/clk/meson/clk-regmap.c
 create mode 100644 drivers/clk/meson/clk-regmap.h
 delete mode 100644 drivers/clk/meson/gxbb-aoclk-regmap.c

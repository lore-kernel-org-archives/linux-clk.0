Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1526388874.2897.44.camel@baylibre.com>
Subject: [GIT PULL]  clk: meson: updates for v4.18
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>,
 linux-clk <linux-clk@vger.kernel.org>, "open list:ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>, Neil Armstrong
 <narmstrong@baylibre.com>
Date: Tue, 15 May 2018 14:54:34 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Dear clock maintainers,

Below is a request to pull amlogic clock updates for v4.18. Apart from the usual
clock additions, there was a rework of the AO clock controller found on the gxbb
SoC family. This has been done to improve code re-usability before introducing a
very similar controller for the axg SoC family.

Cheers
Jerome

The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/meson-clk-4.18-1

for you to fetch changes up to 24a2e6796eb23d17d4e32a27f19336248666272c:

  clk: meson: drop CLK_SET_RATE_PARENT flag (2018-05-15 14:19:43 +0200)

----------------------------------------------------------------
First round of update for meson clocks targeted at v4.18:
* Add meson8b nand clocks
* Add gxbb video decoder clocks
* Rework of gxbb AO clock controller code to allow code reuse
* Add axg AO clock controller

----------------------------------------------------------------
Jerome Brunet (1):
      Merge branch 'next/bindings' into next/drivers

Martin Blumenstingl (2):
      dt-bindings: clock: meson8b: export the NAND clock
      clk: meson: meson8b: add support for the NAND clocks

Maxime Jourdan (2):
      clk: meson: gxbb: expose VDEC_1 and VDEC_HEVC clocks
      clk: meson: gxbb: add the video decoder clocks

Qiufang Dai (1):
      clk: meson-axg: Add AO Clock and Reset controller driver

Yixun Lan (5):
      dt-bindings: clock: axg-aoclkc: New binding for Meson-AXG SoC
      dt-bindings: clock: reset: Add AXG AO Clock and Reset Bindings
      clk: meson: migrate to devm_of_clk_add_hw_provider API
      clk: meson: aoclk: refactor common code into dedicated file
      clk: meson: drop CLK_SET_RATE_PARENT flag

 .../bindings/clock/amlogic,gxbb-aoclkc.txt         |   1 +
 drivers/clk/meson/Kconfig                          |   8 +
 drivers/clk/meson/Makefile                         |   3 +-
 drivers/clk/meson/axg-aoclk.c                      | 164 +++++++++++++++++++++
 drivers/clk/meson/axg-aoclk.h                      |  29 ++++
 drivers/clk/meson/gxbb-aoclk.c                     |  96 +++++-------
 drivers/clk/meson/gxbb-aoclk.h                     |   5 +
 drivers/clk/meson/gxbb.c                           | 114 ++++++++++++++
 drivers/clk/meson/gxbb.h                           |   6 +-
 drivers/clk/meson/meson-aoclk.c                    |  81 ++++++++++
 drivers/clk/meson/meson-aoclk.h                    |  34 +++++
 drivers/clk/meson/meson8b.c                        |  54 +++++++
 drivers/clk/meson/meson8b.h                        |   5 +-
 include/dt-bindings/clock/axg-aoclkc.h             |  26 ++++
 include/dt-bindings/clock/gxbb-clkc.h              |   2 +
 include/dt-bindings/clock/meson8b-clkc.h           |   1 +
 include/dt-bindings/reset/axg-aoclkc.h             |  20 +++
 17 files changed, 583 insertions(+), 66 deletions(-)
 create mode 100644 drivers/clk/meson/axg-aoclk.c
 create mode 100644 drivers/clk/meson/axg-aoclk.h
 create mode 100644 drivers/clk/meson/meson-aoclk.c
 create mode 100644 drivers/clk/meson/meson-aoclk.h
 create mode 100644 include/dt-bindings/clock/axg-aoclkc.h
 create mode 100644 include/dt-bindings/reset/axg-aoclkc.h

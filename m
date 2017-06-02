Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1496416942.3552.8.camel@baylibre.com>
Subject: [GIT PULL] Amlogic clock driver updates for 4.13
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette
	 <mturquette@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
	 <narmstrong@baylibre.com>, "linux-clk@vger.kernel.org"
	 <linux-clk@vger.kernel.org>, "open list:ARM/Amlogic Meson..."
	 <linux-amlogic@lists.infradead.org>
Date: Fri, 02 Jun 2017 17:22:22 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Dear clock maintainers,

Below is a request to pull the Amlogic clock driver updates for this cycle.

Cheers

The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  git://github.com/BayLibre/clk-meson.git tags/meson-clk-for-4.13

for you to fetch changes up to 14c735c8e3082714e3d5fa91843692a9c871cebe:

  clk: meson-gxbb: Add EE 32K Clock for CEC (2017-05-29 12:34:23 +0000)

----------------------------------------------------------------
Amlogic clock driver updates for 4.13

* Expose more i2s and spdif output clocks
* Expose EE uart and SPICC gate clocks
* Remove cpu_clk from to gxbb
* Mark clk81 as critical on gxbb
* Add CEC EE clocks

----------------------------------------------------------------
Helmut Klein (1):
      clk: meson-gxbb: expose UART clocks

Jerome Brunet (4):
      clk: meson-gxbb: expose spdif clock gates
      clk: meson-gxbb: expose i2s master clock
      clk: meson-gxbb: expose spdif master clock
      clk: gxbb: remove CLK_IGNORE_UNUSED from clk81

Martin Blumenstingl (3):
      clk: meson-gxbb: un-export the CPU clock
      clk: meson: gxbb: remove the "cpu_clk" from the GXBB and GXL driver
      clk: meson: meson8b: mark clk81 as critical

Neil Armstrong (2):
      clk: meson-gxbb: expose SPICC gate
      clk: meson-gxbb: Add EE 32K Clock for CEC

 drivers/clk/meson/gxbb.c              | 120 ++++++++++++++++------------------
 drivers/clk/meson/gxbb.h              |  25 +++----
 drivers/clk/meson/meson8b.c           |   2 +-
 include/dt-bindings/clock/gxbb-clkc.h |  10 ++-
 4 files changed, 82 insertions(+), 75 deletions(-)

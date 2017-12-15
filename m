Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1513352509.2261.66.camel@baylibre.com>
Subject: [GIT PULL] Amlogic clock driver updates for 4.16 - 2nd batch
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette
	 <mturquette@baylibre.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, "open list:ARM/Amlogic Meson..."
	 <linux-amlogic@lists.infradead.org>, Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>
Date: Fri, 15 Dec 2017 16:41:49 +0100
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Dear clock maintainers

Here is a 2nd round of update for amlogic clocks. It is based on top the
first PR sent last week.

Thanks for pulling
Jerome

The following changes since commit ed3fb5af69afc802d6e29700fff3401ba99edac1:

  clk: meson: gxbb: remove IGNORE_UNUSED from mmc clocks (2017-12-08 21:37:19
+0100)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/meson-clk-for-v4.16-2

for you to fetch changes up to 78b4af312f910e4f28ebf4cb0a8c1983daa16924:

  clk: meson-axg: add clock controller drivers (2017-12-14 10:19:37 +0100)

----------------------------------------------------------------
Second round of meson clock updates for v4.16

* Rename clock lock to help in case of lockdep issues
* Initial axg support

----------------------------------------------------------------
Jerome Brunet (1):
      Merge branch 'next/dt' into next/drivers

Qiufang Dai (2):
      clk: meson-axg: add clocks dt-bindings required header
      clk: meson-axg: add clock controller drivers

Yixun Lan (2):
      clk: meson: make the spinlock naming more specific
      dt-bindings: clock: add compatible variant for the Meson-AXG

 .../bindings/clock/amlogic,gxbb-clkc.txt           |   7 +-
 arch/arm64/Kconfig.platforms                       |   1 +
 drivers/clk/meson/Kconfig                          |   8 +
 drivers/clk/meson/Makefile                         |   1 +
 drivers/clk/meson/axg.c                            | 936 +++++++++++++++++++++
 drivers/clk/meson/axg.h                            | 126 +++
 drivers/clk/meson/clkc.h                           |   2 +-
 drivers/clk/meson/gxbb.c                           | 112 +--
 drivers/clk/meson/meson8b.c                        |  24 +-
 include/dt-bindings/clock/axg-clkc.h               |  71 ++
 10 files changed, 1217 insertions(+), 71 deletions(-)
 create mode 100644 drivers/clk/meson/axg.c
 create mode 100644 drivers/clk/meson/axg.h
 create mode 100644 include/dt-bindings/clock/axg-clkc.h

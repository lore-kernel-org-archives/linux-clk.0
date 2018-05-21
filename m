Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1526897051.2822.9.camel@baylibre.com>
Subject: [GIT PULL]  clk: meson: 2nd updates for v4.18
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>,
 linux-clk <linux-clk@vger.kernel.org>, "open list:ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>, Neil Armstrong
 <narmstrong@baylibre.com>
Date: Mon, 21 May 2018 12:04:11 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Dear clock maintainers,

Below is a request to pull a second round Amlogic clock updates for v4.18.
Nothing really out of the ordinary, the bulk of the changes comes from migrating
our files to SPDX license identifiers.

Cheers
Jerome

The following changes since commit 24a2e6796eb23d17d4e32a27f19336248666272c:

  clk: meson: drop CLK_SET_RATE_PARENT flag (2018-05-15 14:19:43 +0200)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/meson-clk-4.18-2

for you to fetch changes up to de1ca2d07bdc3fb4a21991ca78b026324636f541:

  clk: meson: axg: let mpll clocks round closest (2018-05-21 11:31:59 +0200)

----------------------------------------------------------------
Second round of update for meson clocks targeted at v4.18:
* Add critical flag to meson8b's fdiv2 as temporary fixup for the ethernet.
* Clean up license headers with SPDX
* Add round closest support to mpll driver.

----------------------------------------------------------------
Jerome Brunet (3):
      clk: meson: use SPDX license identifiers consistently
      clk: meson: mpll: add round closest support
      clk: meson: axg: let mpll clocks round closest

Martin Blumenstingl (1):
      clk: meson: meson8b: mark fclk_div2 gate clocks as CLK_IS_CRITICAL

 drivers/clk/meson/axg.c               |  4 ++
 drivers/clk/meson/clk-audio-divider.c | 13 +-----
 drivers/clk/meson/clk-mpll.c          | 76 +++++++++--------------------------
 drivers/clk/meson/clk-pll.c           | 13 +-----
 drivers/clk/meson/clk-regmap.c        |  6 ++-
 drivers/clk/meson/clk-regmap.h        |  8 ++--
 drivers/clk/meson/clkc.h              | 16 ++------
 drivers/clk/meson/gxbb-aoclk-32k.c    |  3 +-
 drivers/clk/meson/gxbb-aoclk.c        | 51 +----------------------
 drivers/clk/meson/gxbb-aoclk.h        |  3 +-
 drivers/clk/meson/gxbb.c              | 15 +------
 drivers/clk/meson/gxbb.h              | 52 +-----------------------
 drivers/clk/meson/meson8b.c           | 23 ++++-------
 drivers/clk/meson/meson8b.h           | 13 +-----
 14 files changed, 53 insertions(+), 243 deletions(-)

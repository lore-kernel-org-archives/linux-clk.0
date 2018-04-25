Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1524649974.4026.51.camel@baylibre.com>
Subject: [GIT PULL] Amlogic clock fixes for v4.17-rc
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, "open list:ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>, Neil Armstrong
 <narmstrong@baylibre.com>
Date: Wed, 25 Apr 2018 11:52:54 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Dear clock maintainers,

Below is a request to pull amlogic clock fixes for v4.17.
These changes fixes a few simple mistakes I did while reworking meson clock
providers in the last cycle.

Cheers

The following changes since commit 60cc43fc888428bb2f18f08997432d426a243338:

  Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/meson-clk-fixes-4.17-1

for you to fetch changes up to 5b33139b1a08eabcba7b39d8a4babd7fc2d3b534:

  clk: meson: meson8b: fix meson8b_cpu_clk parent clock name (2018-04-25
10:23:19 +0200)

----------------------------------------------------------------
First round of fixes for meson clocks targeted for v4.17
 - fix typos in two meson8 clock names
 - remove unused clock ops declaration

----------------------------------------------------------------
Martin Blumenstingl (2):
      clk: meson: meson8b: fix meson8b_fclk_div3_div clock name
      clk: meson: meson8b: fix meson8b_cpu_clk parent clock name

Yixun Lan (1):
      clk: meson: drop meson_aoclk_gate_regmap_ops

 drivers/clk/meson/gxbb-aoclk.h | 2 --
 drivers/clk/meson/meson8b.c    | 5 +++--
 2 files changed, 3 insertions(+), 4 deletions(-)

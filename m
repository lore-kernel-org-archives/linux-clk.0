Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 0/4] clk: meson: clk-pll driver update
Date: Wed,  1 Aug 2018 16:00:49 +0200
Message-Id: <20180801140053.25899-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This patchset is yet another round of update to the amlogic pll driver.

 1) Enable bit is added so we don't rely on the bootloader or the init
    value to enable to pll device.
 2) Remove unnecessary CLK_GET_RATE_NOCACHE flags.
 3) OD post dividers are removed from the pll driver. This simplify the
    driver and let us provide the clocks which exist between those
    dividers. Some device are actually using these clocks.
 4) The rates hard coded in parameter tables are remove. Instead, we
    only rely on the parent rate and the parameters to calculate the
    output rate, which is a lot better.

This series has been tested on the gxl libretech cc and axg s400.
I did not test it on meson8b yet.

Changes since v1: [0]
 - improve commit description of patch 1
 - remove unnecessary CLK_GET_RATE_NOCACHE flags.
 - add missing CLK_SET_RATE_PARENT.

[0]: https://lkml.kernel.org/r/20180717095617.12240-1-jbrunet@baylibre.com

Jerome Brunet (4):
  clk: meson: clk-pll: add enable bit
  clk: meson: clk-pll: drop CLK_GET_RATE_NOCACHE where unnecessary
  clk: meson: clk-pll: remove od parameters
  clk: meson: clk-pll: drop hard-coded rates from pll tables

 drivers/clk/meson/axg.c     | 326 +++++++++++++----------
 drivers/clk/meson/axg.h     |   8 +-
 drivers/clk/meson/clk-pll.c | 156 +++++++----
 drivers/clk/meson/clkc.h    |  16 +-
 drivers/clk/meson/gxbb.c    | 518 ++++++++++++++++++------------------
 drivers/clk/meson/gxbb.h    |  10 +-
 drivers/clk/meson/meson8b.c | 173 ++++++------
 drivers/clk/meson/meson8b.h |   5 +-
 8 files changed, 665 insertions(+), 547 deletions(-)

-- 
2.17.1

Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1491810121.3480.36.camel@baylibre.com>
Subject: [GIT PULL] Amlogic clock driver updates for v4.12 - 2nd batch
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	 <sboyd@codeaurora.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
	 <narmstrong@baylibre.com>, "linux-clk@vger.kernel.org"
	 <linux-clk@vger.kernel.org>, "open list:ARM/Amlogic Meson..."
	 <linux-amlogic@lists.infradead.org>
Date: Mon, 10 Apr 2017 09:42:01 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Dear clock maintainers,

Below is a request to pull a 2nd batch of update to the Amlogic clock driver. It
is based on the previous PR sent by Kevin.

Cheers

The following changes since commit 3a429818a2e48928ae0114df5fb3b0612dd57001:

  Merge branch 'v4.12/clk-drivers' into v4.12/clk (2017-04-04 15:58:11 -0700)

are available in the git repository at:

  git://github.com/BayLibre/clk-meson.git tags/meson-clk-for-4.12

for you to fetch changes up to b609338b26f5653aa211fc7af83477e2df6e3f0b:

  clk: meson: mpll: use 64bit math in rate_from_params (2017-04-07 17:45:30
+0200)

----------------------------------------------------------------
2nd Amlogic clock driver update for 4.12:
* Protect against holes in onecell_data
* Fix divison by zero and overflow in the mpll driver
* Add audio clock divider driver for i2s clocks
* Add i2s and spdif master clocks

----------------------------------------------------------------
Jerome Brunet (6):
      MAINTAINERS: Add maintainers for the meson clock driver
      clk: meson: gxbb: protect against holes in the onecell_data array
      clk: meson: add audio clock divider support
      clk: meson: gxbb: add cts_amclk
      clk: meson: gxbb: add cts_mclk_i958
      clk: meson: gxbb: add cts_i958 clock

Martin Blumenstingl (2):
      clk: meson: mpll: fix division by zero in rate_from_params
      clk: meson: mpll: use 64bit math in rate_from_params

 MAINTAINERS                           |  10 +++
 drivers/clk/meson/Makefile            |   2 +-
 drivers/clk/meson/clk-audio-divider.c | 144 ++++++++++++++++++++++++++++++++++
 drivers/clk/meson/clk-mpll.c          |  26 +++---
 drivers/clk/meson/clkc.h              |  10 +++
 drivers/clk/meson/gxbb.c              | 144 ++++++++++++++++++++++++++++++++++
 drivers/clk/meson/gxbb.h              |   9 ++-
 7 files changed, 332 insertions(+), 13 deletions(-)
 create mode 100644 drivers/clk/meson/clk-audio-divider.c

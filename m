Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1530604912.2900.152.camel@baylibre.com>
Subject: [GIT PULL] Amlogic clock fixes for v4.18-rc
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-clk
	 <linux-clk@vger.kernel.org>, "open list:ARM/Amlogic Meson..."
	 <linux-amlogic@lists.infradead.org>
Date: Tue, 03 Jul 2018 10:01:52 +0200
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Dear clock maintainers,

Below is a request to pull amlogic clock fixes for v4.18.

These are two simple fixes, yet the first one is quite important as it solves
boots hangs we've been having when FDIV2 gets disabled. This did not show up
before because this particular clock is heavily used and only gets disabled for
a very short period of time before modules (such as ethernet or emmc) probe.

Cheers
Jerome

The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:

  Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/meson-clk-fixes-4.18-1

for you to fetch changes up to 7813c14c9475dbebcd7f41bd498426d01255acf9:

  clk: meson: audio-divider is one based (2018-06-21 10:10:50 +0200)

----------------------------------------------------------------
- fix boot issue with gxbb and gxl platforms
- fix racalculation error in the clk_audio_divider

----------------------------------------------------------------
Jerome Brunet (1):
      clk: meson: audio-divider is one based

Neil Armstrong (1):
      clk: meson-gxbb: set fclk_div2 as CLK_IS_CRITICAL

 drivers/clk/meson/clk-audio-divider.c | 2 +-
 drivers/clk/meson/gxbb.c              | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

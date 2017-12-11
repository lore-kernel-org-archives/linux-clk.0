Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1512987406.334.22.camel@baylibre.com>
Subject: [GIT PULL] Amlogic clock driver updates for 4.16
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette
	 <mturquette@baylibre.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, "open list:ARM/Amlogic Meson..."
	 <linux-amlogic@lists.infradead.org>, Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <narmstrong@baylibre.com>
Date: Mon, 11 Dec 2017 11:16:46 +0100
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Dear clock maintainers,

Below is a request to pull a 1st batch of Amlogic clock driver updates for this
cycle. There is just 2 trivial changes for now. We expect/hope to have a 2nd
batch later in this cycle

Cheers
Jerome

The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-for-v4.16-1

for you to fetch changes up to ed3fb5af69afc802d6e29700fff3401ba99edac1:

  clk: meson: gxbb: remove IGNORE_UNUSED from mmc clocks (2017-12-08 21:37:19 +0100)

----------------------------------------------------------------
First round of meson clock for v4.16
* Fix 2 clock gates mixed up in the datasheet
* Remove unnecessary CLK_IGNORE_UNUSED on mmc clocks

----------------------------------------------------------------
Jerome Brunet (1):
      clk: meson: gxbb: remove IGNORE_UNUSED from mmc clocks

Yixun Lan (1):
      clk: meson: gxbb: fix wrong clock for SARADC/SANA

 drivers/clk/meson/gxbb.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

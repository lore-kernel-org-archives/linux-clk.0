Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.9-rc3
Date: Mon, 24 Oct 2016 16:11:57 -0700
Message-Id: <20161024231157.2701-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 91bbc174d45c347aa7aedb2215cc7d2013c06c1f:

  clk: at91: Fix a return value in case of error (2016-10-20 16:37:56 -0700)

----------------------------------------------------------------
This is the first batch of clk driver fixes for this release. We have a handful
of fixes for the uniphier clk driver that was introduced recently, as well as
Kconfig option hiding, module autoloading markings, and a few fixes for clk_hw
based registration patches that went in this merge window.

----------------------------------------------------------------
Christophe JAILLET (1):
      clk: at91: Fix a return value in case of error

Eric Anholt (1):
      clk: bcm2835: Clamp the PLL's requested rate to the hardware limits.

Gregory CLEMENT (2):
      clk: mvebu: armada-37xx-periph: Fix the clock provider registration
      clk: mvebu: armada-37xx-periph: Fix the clock gate flag

Javier Martinez Canillas (2):
      clk: samsung: clk-exynos-audss: Fix module autoload
      clk: max77686: fix number of clocks setup for clk_hw based registration

Jean Delvare (1):
      clk: mediatek: Add hardware dependency

Masahiro Yamada (4):
      clk: uniphier: add system clock support for sLD3 SoC
      clk: uniphier: fix type of variable passed to regmap_read()
      clk: uniphier: fix memory overrun bug
      clk: uniphier: rename MIO clock to SD clock for Pro5, PXs2, LD20 SoCs

Shawn Guo (2):
      clk: core: add __init decoration for CLK_OF_DECLARE_DRIVER function
      clk: hi6220: use CLK_OF_DECLARE_DRIVER for sysctrl and mediactrl clock init

 .../devicetree/bindings/clock/uniphier-clock.txt     | 16 ++++++++--------
 drivers/clk/at91/clk-programmable.c                  |  2 +-
 drivers/clk/bcm/clk-bcm2835.c                        | 11 ++++-------
 drivers/clk/clk-max77686.c                           |  1 +
 drivers/clk/hisilicon/clk-hi6220.c                   |  4 ++--
 drivers/clk/mediatek/Kconfig                         |  2 ++
 drivers/clk/mvebu/armada-37xx-periph.c               | 11 ++++++-----
 drivers/clk/samsung/clk-exynos-audss.c               |  1 +
 drivers/clk/uniphier/clk-uniphier-core.c             | 20 ++++++++++++--------
 drivers/clk/uniphier/clk-uniphier-mio.c              |  2 +-
 drivers/clk/uniphier/clk-uniphier-mux.c              |  2 +-
 drivers/clk/uniphier/clk-uniphier.h                  |  2 +-
 include/linux/clk-provider.h                         |  2 +-
 13 files changed, 41 insertions(+), 35 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

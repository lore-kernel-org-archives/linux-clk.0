Return-Path: <sboyd@codeaurora.org>
Message-ID: <55A0463F.5090503@codeaurora.org>
Date: Fri, 10 Jul 2015 15:25:03 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 mturquette@baylibre.com
Subject: [GIT PULL] clk: fixes for 4.2
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 358bdf892f6bfacf20884b54a35ab038321f06f9:

  clk: stm32: Add clock driver for STM32F4[23]xxx devices (2015-06-22 16:17:01 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 56551da9255f20ffd3a9711728a1a3ad4b7100af:

  drivers: clk: st: Incorrect register offset used for lock_status (2015-07-07 16:05:08 -0700)

----------------------------------------------------------------
A small set of fixes for problems found by smatch in new drivers
that we added this rc and a handful of driver fixes that came in
during the merge window.

----------------------------------------------------------------
Daniel Thompson (1):
      clk: stm32: Fix out-by-one error path in the index lookup

David Dueck (1):
      clk: at91: do not leak resources

Gabriel Fernandez (3):
      drivers: clk: st: Remove unused code
      drivers: clk: st: Fix FSYN channel values
      drivers: clk: st: Fix mux bit-setting for Cortex A9 clocks

Giuseppe Cavallaro (1):
      drivers: clk: st: Fix flexgen lock init

Hai Li (1):
      clk: qcom: Use parent rate when set rate to pixel RCG clock

Pankaj Dev (2):
      drivers: clk: st: Add CLK_GET_RATE_NOCACHE flag to clocks
      drivers: clk: st: Incorrect register offset used for lock_status

Ray Jui (2):
      clk: iproc: fix memory leak from clock name
      clk: iproc: fix bit manipulation arithmetic

Sascha Hauer (1):
      clk: mediatek: mt8173: Fix enabling of critical clocks

 drivers/clk/at91/clk-h32mx.c      |  4 +++-
 drivers/clk/at91/clk-main.c       |  4 +++-
 drivers/clk/at91/clk-master.c     |  8 ++++++--
 drivers/clk/at91/clk-pll.c        |  8 ++++++--
 drivers/clk/at91/clk-system.c     |  8 ++++++--
 drivers/clk/at91/clk-utmi.c       |  8 ++++++--
 drivers/clk/bcm/clk-iproc-asiu.c  |  6 +-----
 drivers/clk/bcm/clk-iproc-pll.c   | 13 ++++---------
 drivers/clk/clk-stm32f4.c         |  2 +-
 drivers/clk/mediatek/clk-mt8173.c | 26 +++++++++++++++++++++-----
 drivers/clk/qcom/clk-rcg2.c       |  9 +++------
 drivers/clk/st/clk-flexgen.c      |  4 +++-
 drivers/clk/st/clkgen-fsyn.c      | 12 ++++--------
 drivers/clk/st/clkgen-mux.c       | 10 ++++++----
 drivers/clk/st/clkgen-pll.c       |  2 +-
 15 files changed, 74 insertions(+), 50 deletions(-)

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project

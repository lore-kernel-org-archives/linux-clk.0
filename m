Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.15-rc4
Date: Thu, 21 Dec 2017 16:57:19 -0800
Message-Id: <20171222005719.30240-1-sboyd@codeaurora.org>
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:

  Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 61d2f2a05765a5f57149efbd93e3e81a83cbc2c1:

  clk: sunxi: sun9i-mmc: Implement reset callback for reset controls (2017-12-19 11:50:46 -0800)

----------------------------------------------------------------
Here's a trio of fixes:

 - The runtime PM clk patches that landed this merge window forgot to
   runtime resume devices that may be off while recalculating and setting
   rates of child clks of whatever clk is changing rates.

 - We had a NULL pointer deref in an old clk tracepoint when clk_set_parent()
   is called with a NULL parent pointer. This shouldn't really happen, but
   it's best to avoid this regardless.

 - The sun9i-mmc clk driver didn't provide 'reset' support, just 'assert'
   and 'deassert' so the MMC driver stopped probing when the probe was changed
   to do a reset instead of assert/deassert pair. This implements the reset so
   things work again.

----------------------------------------------------------------
Cai Li (1):
      clk: fix a panic error caused by accessing NULL pointer

Chen-Yu Tsai (1):
      clk: sunxi: sun9i-mmc: Implement reset callback for reset controls

Marek Szyprowski (1):
      clk: Manage proper runtime PM state in clk_change_rate()

 drivers/clk/clk.c                 |  5 +++++
 drivers/clk/sunxi/clk-sun9i-mmc.c | 12 ++++++++++++
 include/trace/events/clk.h        |  4 ++--
 3 files changed, 19 insertions(+), 2 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

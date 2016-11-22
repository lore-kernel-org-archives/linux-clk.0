Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.9-rc6
Date: Mon, 21 Nov 2016 18:57:35 -0800
Message-Id: <20161122025735.6626-1-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 10f2bfb092e3b49000526c02cfe8b2abbbdbb752:

  clk: mmp: pxa910: fix return value check in pxa910_clk_init() (2016-11-01 17:41:20 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to c8616671af913ed2c5fb5b45f09c28599458ba1a:

  Merge tag 'sunxi-clk-fixes-for-4.9' of https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux into clk-fixes (2016-11-16 11:10:58 -0800)

----------------------------------------------------------------
A handful of driver fixes. The sunxi fixes are for an incorrect clk tree
configuration and a bad frequency calculation. The other two are fixes for
passing the wrong pointer in drivers recently converted to clk_hw style
registration.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      clk: sunxi-ng: sun6i-a31: Force AHB1 clock to use PLL6 as parent

Stephen Boyd (3):
      clk: berlin: Pass correct type to hw provider registration
      clk: efm32gg: Pass correct type to hw provider registration
      Merge tag 'sunxi-clk-fixes-for-4.9' of https://git.kernel.org/.../mripard/linux into clk-fixes

Stéphan Rafin (1):
      clk: sunxi: Fix M factor computation for APB1

 drivers/clk/berlin/bg2.c             |  2 +-
 drivers/clk/berlin/bg2q.c            |  2 +-
 drivers/clk/clk-efm32gg.c            |  2 +-
 drivers/clk/sunxi-ng/ccu-sun6i-a31.c | 12 ++++++++++++
 drivers/clk/sunxi/clk-sunxi.c        |  2 +-
 5 files changed, 16 insertions(+), 4 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

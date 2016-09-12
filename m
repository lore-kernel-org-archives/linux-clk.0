Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.8-rc6
Date: Mon, 12 Sep 2016 14:25:27 -0700
Message-Id: <20160912212527.28064-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit dc7066c54107255f5f9a11bf3f82417c9b1aef51:

  Merge tag 'v4.8-rockchip-clk-fixes1' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into clk-fixes (2016-08-29 17:08:35 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to e4abe2b9ab3ac79537d99dfceff7302739a586bc:

  Merge tag 'sunxi-clk-fixes-for-4.8' of https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux into clk-fixes (2016-09-08 12:54:24 -0700)

----------------------------------------------------------------
Some small fixes for the new sunxi clk driver introduced this merge window.

----------------------------------------------------------------
Chen-Yu Tsai (2):
      clk: sunxi-ng: Fix inverted test condition in ccu_helper_wait_for_lock
      clk: sunxi-ng: nk: Make ccu_nk_find_best static

Jorik Jonker (1):
      clk: sunxi-ng: Fix wrong reset register offsets

Stephen Boyd (1):
      Merge tag 'sunxi-clk-fixes-for-4.8' of https://git.kernel.org/.../mripard/linux into clk-fixes

Wei Yongjun (2):
      clk: sunxi: pll2: Fix return value check in sun4i_pll2_setup()
      clk: sunxi: Fix return value check in sun8i_a23_mbus_setup()

 drivers/clk/sunxi-ng/ccu-sun8i-h3.c | 16 ++++++++--------
 drivers/clk/sunxi-ng/ccu_nk.c       |  6 +++---
 drivers/clk/sunxi/clk-a10-pll2.c    |  4 ++--
 drivers/clk/sunxi/clk-sun8i-mbus.c  |  2 +-
 4 files changed, 14 insertions(+), 14 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

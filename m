Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.11-rc7
Date: Wed, 19 Apr 2017 16:44:10 -0700
Message-Id: <20170419234410.13616-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 7f0b97d5bb4c1c99c38dd6770ad11f714ea42583:

  Merge tag 'sunxi-clk-fixes-for-4.11' of https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux into clk-fixes (2017-03-23 16:08:46 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to e7590308d17e578e47f298cc3fec359108341cb6:

  Merge tag 'sunxi-clk-fixes-for-4.11-2-bis' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into clk-fixes (2017-04-17 11:04:12 -0700)

----------------------------------------------------------------
One stm32f4 fix for a change that introduced the PLL_I2S and PLL_SAI boards
and then two Allwinner clk driver build fixes and two CPU clk driver fixes
where we see random CPUFreq crashes because the CPU's PLL locks up sometimes
when we change the rate.

----------------------------------------------------------------
Chen-Yu Tsai (2):
      clk: sunxi-ng: Add clk notifier to gate then ungate PLL clocks
      clk: sunxi-ng: a33: gate then ungate PLL CPU clk after rate change

Gabriel Fernandez (1):
      clk: stm32f4: fix: exclude values 0 and 1 for PLLQ

Stephen Boyd (1):
      Merge tag 'sunxi-clk-fixes-for-4.11-2-bis' of https://git.kernel.org/.../sunxi/linux into clk-fixes

Tobias Regnery (2):
      clk: sunxi-ng: fix build error without CONFIG_RESET_CONTROLLER
      clk: sunxi-ng: fix build failure in ccu-sun9i-a80 driver

 drivers/clk/clk-stm32f4.c            | 13 +++++++---
 drivers/clk/sunxi-ng/Kconfig         |  2 ++
 drivers/clk/sunxi-ng/ccu-sun8i-a33.c | 11 ++++++++
 drivers/clk/sunxi-ng/ccu_common.c    | 49 ++++++++++++++++++++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_common.h    | 12 +++++++++
 5 files changed, 84 insertions(+), 3 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

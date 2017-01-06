Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.10-rc3
Date: Fri,  6 Jan 2017 10:45:14 -0800
Message-Id: <20170106184514.17453-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 2aab7a2055a1705c9e30920d95a596226999eb21:

  clk: bcm: Fix 'maybe-uninitialized' warning in bcm2835_clock_choose_div_and_prate() (2016-12-12 11:25:40 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 3868f132cce6abab089fd6b12d6a7333712ade83:

  clk: stm32f4: Use CLK_OF_DECLARE_DRIVER initialization method (2016-12-21 16:33:14 -0800)

----------------------------------------------------------------
One fix for a broken driver on Renesas RZ/A1 SoCs with bootloaders that don't
turn all the clks on and another fix for stm32f4 SoCs where we have multiple
drivers attaching to the same DT node.

----------------------------------------------------------------
Chris Brandt (1):
      clk: renesas: mstp: Support 8-bit registers for r7s72100

Gabriel Fernandez (1):
      clk: stm32f4: Use CLK_OF_DECLARE_DRIVER initialization method

 drivers/clk/clk-stm32f4.c      |  4 ++--
 drivers/clk/renesas/clk-mstp.c | 27 ++++++++++++++++++++++-----
 2 files changed, 24 insertions(+), 7 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.11-rc8
Date: Fri, 28 Apr 2017 16:44:18 -0700
Message-Id: <20170428234418.21044-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit e7590308d17e578e47f298cc3fec359108341cb6:

  Merge tag 'sunxi-clk-fixes-for-4.11-2-bis' of https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into clk-fixes (2017-04-17 11:04:12 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 36c02d0be4c3c8804e51f9740f0d768e17f3b566:

  clk: sunxi-ng: always select CCU_GATE (2017-04-28 10:47:21 -0700)

----------------------------------------------------------------
One odd config build fix for a recent Allwinner clock driver change that
got merged. The common code called code in another file that wasn't always
built. This just forces it on so people don't run into this bad configuration.

----------------------------------------------------------------
Arnd Bergmann (1):
      clk: sunxi-ng: always select CCU_GATE

 drivers/clk/sunxi-ng/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

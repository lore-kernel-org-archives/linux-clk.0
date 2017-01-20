Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.10-rc4
Date: Fri, 20 Jan 2017 15:15:35 -0800
Message-Id: <20170120231535.21051-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 3868f132cce6abab089fd6b12d6a7333712ade83:

  clk: stm32f4: Use CLK_OF_DECLARE_DRIVER initialization method (2016-12-21 16:33:14 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 318fa46cc60d37fec1e87dbf03a82aca0f5ce695:

  clk/samsung: exynos542x: mark some clocks as critical (2017-01-09 16:11:05 -0800)

----------------------------------------------------------------
One fix for Samsung Exynos524x SoCs where recent IOMMU patches have
caused some of these clocks to turn off when they were always left
on before.

----------------------------------------------------------------
Marek Szyprowski (1):
      clk/samsung: exynos542x: mark some clocks as critical

 drivers/clk/samsung/clk-exynos5420.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

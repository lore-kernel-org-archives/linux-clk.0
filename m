Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.14-rc7
Date: Fri,  3 Nov 2017 13:26:22 -0700
Message-Id: <20171103202622.22995-1-sboyd@codeaurora.org>
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 5dcbeca615ef12047a5f4097b91030cbf995b1d2:

  clk: samsung: exynos4: Enable VPLL and EPLL clocks for suspend/resume cycle (2017-10-04 09:19:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to db9d79f6e7de3e059d897234f93cbe1e55a0ed50:

  clk: uniphier: fix clock data for PXs3 (2017-10-24 01:57:24 -0700)

----------------------------------------------------------------
One fix for USB clks on Uniphier PXs3 SoCs

----------------------------------------------------------------
Masahiro Yamada (1):
      clk: uniphier: fix clock data for PXs3

 drivers/clk/uniphier/clk-uniphier-sys.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

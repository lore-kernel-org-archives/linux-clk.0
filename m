Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.15-rc5
Date: Thu, 28 Dec 2017 15:19:46 -0800
Message-Id: <20171228231946.29784-1-sboyd@codeaurora.org>
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 61d2f2a05765a5f57149efbd93e3e81a83cbc2c1:

  clk: sunxi: sun9i-mmc: Implement reset callback for reset controls (2017-12-19 11:50:46 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 756efe131088b6e6e7f0124ff9c4e1f0165d3140:

  clk: use atomic runtime pm api in clk_core_is_enabled (2017-12-26 17:34:03 -0800)

----------------------------------------------------------------
One more fix for the runtime PM clk patches. We're calling a runtime
PM API that may schedule from somewhere that we can't do that. We
change to the async version of pm_runtime_put() to fix it.

----------------------------------------------------------------
Dong Aisheng (1):
      clk: use atomic runtime pm api in clk_core_is_enabled

 drivers/clk/clk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

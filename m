Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk bulk prepare enable
Date: Thu, 13 Jul 2017 15:23:24 -0700
Message-Id: <20170713222324.19223-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 618aee02e2f57042f4cdeab228caf631e524b281:

  clk: add managed version of clk_bulk_get (2017-06-02 15:37:49 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-bulk-get-prep-enable

for you to fetch changes up to 3c48d86cc959309ee168fb87737a8cb3f97c5224:

  clk: Provide bulk prepare_enable disable_unprepare variants (2017-07-12 23:50:53 -0700)

----------------------------------------------------------------
Small patch to add a clk_bulk_prepare_enable() and
clk_bulk_disable_unprepare() API to the newly introduced
clk bulk APIs.

----------------------------------------------------------------

It would be good to get this into the -rc1 so that other driver
trees can use it for code targeted for the next merge window.

Bjorn Andersson (1):
      clk: Provide bulk prepare_enable disable_unprepare variants

 include/linux/clk.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

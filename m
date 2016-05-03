Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.6-rc6
Date: Mon,  2 May 2016 18:52:00 -0700
Message-Id: <20160503015200.20120-1-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 2aac7ddf9a410e3418c9cc69618f304550466793:

  clk: qcom: ipq4019: add some fixed clocks for ddrppl and fepll (2016-03-29 16:31:16 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 2c49477f2a0fdccfe4765326efa5567c5b259aa1:

  Merge tag 'imx-clk-fixes-4.6' of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into clk-fixes (2016-04-15 15:40:49 -0700)

----------------------------------------------------------------

One small bug fix for the imx6qp CAN clk definition that was causing
failures and division by zeros in the kernel on those devices.

----------------------------------------------------------------

Lothar Waßmann (1):
      clk: imx6q: fix typo in CAN clock definition

Stephen Boyd (1):
      Merge tag 'imx-clk-fixes-4.6' of git://git.kernel.org/.../shawnguo/linux into clk-fixes

 drivers/clk/imx/clk-imx6q.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.6-rc1
Date: Fri,  1 Apr 2016 17:07:05 -0700
Message-Id: <1459555625-4924-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 2aac7ddf9a410e3418c9cc69618f304550466793:

  clk: qcom: ipq4019: add some fixed clocks for ddrppl and fepll (2016-03-29 16:31:16 -0700)

----------------------------------------------------------------
A handful of const updates for reset ops and a couple fixes to the
newly introduced IPQ4019 clock driver.

----------------------------------------------------------------
Matthew McClintock (2):
      clk: qcom: ipq4019: switch remaining defines to enums
      clk: qcom: ipq4019: add some fixed clocks for ddrppl and fepll

Philipp Zabel (7):
      clk: mediatek: Make reset_control_ops const
      clk: mmp: Make reset_control_ops const
      clk: rockchip: Make reset_control_ops const
      clk: atlas7: Make reset_control_ops const
      clk: sunxi: Make reset_control_ops const
      clk: tegra: Make reset_control_ops const
      clk: qcom: Make reset_control_ops const

 drivers/clk/mediatek/reset.c      |  2 +-
 drivers/clk/mmp/reset.c           |  2 +-
 drivers/clk/qcom/gcc-ipq4019.c    | 70 +++++++++++++++++++--------------------
 drivers/clk/qcom/reset.c          |  2 +-
 drivers/clk/qcom/reset.h          |  2 +-
 drivers/clk/rockchip/softrst.c    |  2 +-
 drivers/clk/sirf/clk-atlas7.c     |  2 +-
 drivers/clk/sunxi/clk-a10-ve.c    |  2 +-
 drivers/clk/sunxi/clk-sun9i-mmc.c |  2 +-
 drivers/clk/sunxi/clk-usb.c       |  2 +-
 drivers/clk/tegra/clk.c           |  2 +-
 11 files changed, 45 insertions(+), 45 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

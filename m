Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.9-rc5
Date: Fri, 11 Nov 2016 17:06:23 -0800
Message-Id: <20161112010623.28849-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 91bbc174d45c347aa7aedb2215cc7d2013c06c1f:

  clk: at91: Fix a return value in case of error (2016-10-20 16:37:56 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 10f2bfb092e3b49000526c02cfe8b2abbbdbb752:

  clk: mmp: pxa910: fix return value check in pxa910_clk_init() (2016-11-01 17:41:20 -0700)

----------------------------------------------------------------
The typical collection of minor bug fixes in clk drivers. We don't have
anything in the core framework here, just driver fixes. There's a boot fix for
Samsung devices and a safety measure for qoriq to prevent CPUs from running too
fast. There's also a fix for i.MX6Q to properly handle audio clock rates. We
also have some "that's obviously wrong" fixes like bad NULL pointer checks in
the MPP driver and a poor usage of __pa in the xgene clk driver that are fixed
here.

----------------------------------------------------------------
Emil Lundmark (1):
      clk: imx: fix integer overflow in AV PLL round rate

Laura Abbott (1):
      clk: xgene: Don't call __pa on ioremaped address

Marek Szyprowski (1):
      clk/samsung: Use CLK_OF_DECLARE_DRIVER initialization method for CLKOUT

Scott Wood (1):
      clk: qoriq: Don't allow CPU clocks higher than starting value

Shawn Lin (1):
      clk: rockchip: don't return NULL when failing to register ddrclk branch

Stephen Boyd (1):
      Merge tag 'v4.9-rockchip-clkfixes1' of git://git.kernel.org/.../mmind/linux-rockchip into clk-fixes

Wei Yongjun (3):
      clk: mmp: mmp2: fix return value check in mmp2_clk_init()
      clk: mmp: pxa168: fix return value check in pxa168_clk_init()
      clk: mmp: pxa910: fix return value check in pxa910_clk_init()

 drivers/clk/clk-qoriq.c                 | 13 ++++++++-----
 drivers/clk/clk-xgene.c                 | 10 ++++------
 drivers/clk/imx/clk-pllv3.c             |  8 ++++++--
 drivers/clk/mmp/clk-of-mmp2.c           |  2 +-
 drivers/clk/mmp/clk-of-pxa168.c         |  2 +-
 drivers/clk/mmp/clk-of-pxa910.c         |  4 ++--
 drivers/clk/rockchip/clk-ddr.c          |  5 +----
 drivers/clk/samsung/clk-exynos-clkout.c | 22 ++++++++++++++--------
 8 files changed, 37 insertions(+), 29 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

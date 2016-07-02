Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.7-rc5
Date: Fri,  1 Jul 2016 17:13:50 -0700
Message-Id: <20160702001350.16344-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 72ad679aa7182d23d269cbe4d655f7e129d3b057:

  clk: nxp: Select MFD_SYSCON for creg driver (2016-06-01 15:14:06 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 086347705be7530feabb6274a3ad81dd545e7914:

  Merge tag 'v4.7-rockchip-clk-fixes1' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into clk-fixes (2016-06-20 17:01:45 -0700)

----------------------------------------------------------------
A small fix for the newly added oxnas clk driver and a handful of
rockchip clk driver fixes for newly added rk3399 support.

----------------------------------------------------------------
Brian Norris (1):
      clk: rockchip: mark rk3399 GIC clocks as critical

Douglas Anderson (1):
      clk: rockchip: Revert "clk: rockchip: reset init state before mmc card initialization"

Heiko Stuebner (1):
      clk: rockchip: initialize flags of clk_init_data in mmc-phase clock

Shawn Lin (1):
      clk: rockchip: release io resource when failing to init clk on rk3399

Stephen Boyd (1):
      Merge tag 'v4.7-rockchip-clk-fixes1' of git://git.kernel.org/.../mmind/linux-rockchip into clk-fixes

Wei Yongjun (1):
      clk: Fix return value check in oxnas_stdclk_probe()

Xing Zheng (2):
      clk: rockchip: fix incorrect parent for rk3399's {c,g}pll_aclk_perihp_src
      clk: rockchip: fix cpuclk registration error handling

 drivers/clk/clk-oxnas.c              |  4 ++--
 drivers/clk/rockchip/clk-cpu.c       |  4 ++--
 drivers/clk/rockchip/clk-mmc-phase.c | 12 +-----------
 drivers/clk/rockchip/clk-rk3399.c    |  8 ++++++--
 4 files changed, 11 insertions(+), 17 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

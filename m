Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.8-rc4
Date: Thu,  1 Sep 2016 18:56:00 -0700
Message-Id: <20160902015600.21873-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to dc7066c54107255f5f9a11bf3f82417c9b1aef51:

  Merge tag 'v4.8-rockchip-clk-fixes1' of git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into clk-fixes (2016-08-29 17:08:35 -0700)

----------------------------------------------------------------
A collection of small fixes for various SoC vendor clk drivers.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      clk: sunxi-ng: Fix inverted test condition in ccu_helper_wait_for_lock

Chris Zhong (1):
      clk: rockchip: fix rk3399 aclk_vio gate bit

Stephen Boyd (1):
      Merge tag 'v4.8-rockchip-clk-fixes1' of git://git.kernel.org/.../mmind/linux-rockchip into clk-fixes

Vince Hsu (1):
      clk: tegra: remove TEGRA_PLL_USE_LOCK for PLLD/PLLD2

Xing Zheng (3):
      clk: rockchip: fix incorrect aclk_emmc source gate bits on rk3399
      clk: rockchip: fix incorrect GATE bits for {c, g}pll_aclk_perihp_src on rk3399
      clk: rockchip: mark aclk_emmc_noc as a critical clock on rk3399

Yoshihiro Shimoda (1):
      clk: renesas: r8a7795: Fix SD clocks

 drivers/clk/renesas/r8a7795-cpg-mssr.c |  9 +++++----
 drivers/clk/rockchip/clk-rk3399.c      | 11 ++++++-----
 drivers/clk/sunxi-ng/ccu_common.c      |  2 +-
 drivers/clk/tegra/clk-tegra114.c       |  4 ++--
 4 files changed, 14 insertions(+), 12 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

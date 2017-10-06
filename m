Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v4.14-rc3
Date: Fri,  6 Oct 2017 16:18:01 -0700
Message-Id: <20171006231801.32714-1-sboyd@codeaurora.org>
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to 5dcbeca615ef12047a5f4097b91030cbf995b1d2:

  clk: samsung: exynos4: Enable VPLL and EPLL clocks for suspend/resume cycle (2017-10-04 09:19:13 -0700)

----------------------------------------------------------------
 - Build fix to export the clk_bulk_prepare() symbol

 - Suspend fix for Samsung Exynos SoCs where we need to keep clks on
   across suspend

 - Two critical clk markings for clks that shouldn't ever turn off on
   Rockchip SoCs

 - A fix for a copy-paste mistake on Rockchip rk3128 causing some clks to
   touch the same bit and trample over one another

----------------------------------------------------------------
Bjorn Andersson (1):
      clk: Export clk_bulk_prepare()

Elaine Zhang (3):
      clk: rockchip: add pclk_pmu as critical clock on rk3128
      clk: rockchip: fix up rk3128 pvtm and mipi_24m gate regs error
      clk: rockchip: add sclk_timer5 as critical clock on rk3128

Marek Szyprowski (1):
      clk: samsung: exynos4: Enable VPLL and EPLL clocks for suspend/resume cycle

Stephen Boyd (1):
      Merge tag 'v4.14-rockchip-clkfixes-1' of git://git.kernel.org/.../mmind/linux-rockchip into clk-fixes

 drivers/clk/clk-bulk.c            |  1 +
 drivers/clk/rockchip/clk-rk3128.c | 12 +++++++-----
 drivers/clk/samsung/clk-exynos4.c | 15 +++++++++++++++
 3 files changed, 23 insertions(+), 5 deletions(-)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

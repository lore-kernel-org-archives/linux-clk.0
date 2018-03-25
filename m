Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock updates for 4.17 round 2
Date: Mon, 26 Mar 2018 00:11:36 +0200
Message-ID: <2462810.3FAOKQrxCs@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

it looks like the recent phase change triggered some more fixups and
corrections and would be great on top of the first pull request.
So please pull :-)


Thanks
Heiko


The following changes since commit 4ee3fd4abeca30d530fe67972f1964f7454259d6:

  clk: rockchip: Add 1.6GHz PLL rate for rk3399 (2018-03-14 00:37:22 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.17-rockchip-clk-2

for you to fetch changes up to 9dc486fdf6cc0d7f635954810ab119c5db2cbb60:

  clk: rockchip: assign correct id for pclk_ddr and hclk_sd in rk3399 (2018-03-23 09:09:19 +0100)

----------------------------------------------------------------
Some more fixes for Rockchip clocks mainly resulting from the changes in
phase-handling. Which revealed some parent issues on rk3228 and rk3328 as
well as additional issue in how handle phase restoration.
And to top it off two assignments of already existing clock ids for rk3399.

----------------------------------------------------------------
Lin Huang (1):
      clk: rockchip: assign correct id for pclk_ddr and hclk_sd in rk3399

Shawn Lin (4):
      clk: rockchip: Fix wrong parent for SDMMC phase clock for rk3228
      clk: rockchip: Fix wrong parents for MMC phase clock for rk3328
      clk: rockchip: Correct the behaviour of restoring cached phase
      clk: rockchip: Fix error return in phase clock registration

 drivers/clk/rockchip/clk-mmc-phase.c | 22 ++++++++++++++++++----
 drivers/clk/rockchip/clk-rk3228.c    |  2 +-
 drivers/clk/rockchip/clk-rk3328.c    | 16 ++++++++--------
 drivers/clk/rockchip/clk-rk3399.c    |  4 ++--
 4 files changed, 29 insertions(+), 15 deletions(-)

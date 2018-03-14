Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock updates for 4.17 round 1
Date: Wed, 14 Mar 2018 18:22:47 +0100
Message-ID: <1808510.rdFFBGyEiV@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

please find below Rockchip clock changes targetted at 4.17.

As you can see in the tag, making the rk3328 ready for display output
is the biggest part, otherwise there are some smaller things for the
other parts. So please pull.

Thanks
Heiko


The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.17-rockchip-clk-1

for you to fetch changes up to 4ee3fd4abeca30d530fe67972f1964f7454259d6:

  clk: rockchip: Add 1.6GHz PLL rate for rk3399 (2018-03-14 00:37:22 +0100)

----------------------------------------------------------------
The rk3328 got the most love this time, preparing it for supplying actual
display output in the future and actually protecting all necessary clocks.
The rk3399 simply got a special 1.6GHz rate that is going to be needed
for a board and the core code got a fix to actually free allocated memory
in error case as well as making sure the clock-phases don't return bad
values and stay the same on rate changes.

----------------------------------------------------------------
Derek Basehore (1):
      clk: rockchip: Add 1.6GHz PLL rate for rk3399

Heiko Stuebner (6):
      clk: rockchip: fix hclk_vio_niu on rk3328
      clk: rockchip: remove HCLK_VIO from rk3328 dt header
      clk: rockchip: export sclk_hdmi_sfc on rk3328
      clk: rockchip: protect all remaining rk3328 interconnect clocks
      clk: rockchip: remove ignore_unused flag from rk3328 vio_h2p clocks
      clk: rockchip: document hdmi_phy external input for rk3328

Shawn Lin (3):
      clk: rockchip: Free the memory on the error path
      clk: rockchip: Prevent calculating mmc phase if clock rate is zero
      clk: rockchip: Restore the clock phase after the rate was changed

Zheng Yang (1):
      clk: rockchip: add flags for rk3328 dclk_lcdc

 .../bindings/clock/rockchip,rk3328-cru.txt         |  1 +
 drivers/clk/rockchip/clk-mmc-phase.c               | 62 +++++++++++++++++++-
 drivers/clk/rockchip/clk-rk3328.c                  | 67 ++++++++++++++--------
 drivers/clk/rockchip/clk-rk3399.c                  |  1 +
 drivers/clk/rockchip/clk.c                         | 22 +++++--
 include/dt-bindings/clock/rk3328-cru.h             |  1 -
 6 files changed, 124 insertions(+), 30 deletions(-)

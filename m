Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] rockchip clock changes for 4.11 part2
Date: Tue, 31 Jan 2017 23:59:50 +0100
Message-ID: <2089162.48xHT324p0@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

some more smallish clock changes popped up since the first pull request,
which you can find below. Looking at my inbox devoid of clock-related
patches, this should most likely also be all for 4.7.

So please pull.

Thanks
Heiko


The following changes since commit 1a0abcd634dc3caf0d15cb8625e3f43d77b37031:

  dt-bindings: clk: add rockchip,grf property for RK3399 (2017-01-13 20:02:27 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.11-rockchip-clk2

for you to fetch changes up to a811498902cf4c3f6e659f9bc877a1cd1c180606:

  clk: rockchip: rk3288: make all niu clocks critical (2017-01-23 00:58:45 +0100)

----------------------------------------------------------------
Non-critical fix for the pclk_edp divider on rk3399, one new clock-id
and making niu (interconnect) clocks critical on rk3288, as
CLK_IGNORE_UNUSED is not enough to keep them running all the time
when more users access particular clock subtrees.

----------------------------------------------------------------
Heiko Stuebner (1):
      Merge branch 'v4.11-shared/clkids' into v4.11-clk/next

Jacob Chen (3):
      clk: rockchip: add rk3288 vip_out clock id
      clk: rockchip: use rk3288 vip_out clock ids
      clk: rockchip: rk3288: make all niu clocks critical

Xing Zheng (1):
      clk: rockchip: fix the incorrect pclk_edp div width for RK3399

 drivers/clk/rockchip/clk-rk3288.c      | 23 +++++++++++++++--------
 drivers/clk/rockchip/clk-rk3399.c      |  2 +-
 include/dt-bindings/clock/rk3288-cru.h |  1 +
 3 files changed, 17 insertions(+), 9 deletions(-)

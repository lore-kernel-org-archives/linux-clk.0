Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: mturquette@baylibre.com, sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clk fixes for 4.7
Date: Wed, 08 Jun 2016 19:37:59 +0200
Message-ID: <6554609.UWKLgmyVYi@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

please find below some accumulated small-scale fixes that would be nice to have
in 4.7. So if nothing stands out, please pull


Thanks
Heiko

The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.7-rockchip-clk-fixes1

for you to fetch changes up to 62d0e71df063101e4551327bd9fa9aaa3535c86b:

  clk: rockchip: release io resource when failing to init clk on rk3399 (2016-06-03 15:36:49 +0200)

----------------------------------------------------------------
A bunch of fixes. Some for the newly added rk3399 clock tree, some
concerning error handling and initialization and a revert of the
mmc-phase clock initialization, as this could conflict with the
bootloader setting of this clock and a real solution to initing
the phase correctly from dw_mmc went in as fix for 4.7 through
the mmc tree.

----------------------------------------------------------------
Brian Norris (1):
      clk: rockchip: mark rk3399 GIC clocks as critical

Douglas Anderson (1):
      clk: rockchip: Revert "clk: rockchip: reset init state before mmc card initialization"

Heiko Stuebner (1):
      clk: rockchip: initialize flags of clk_init_data in mmc-phase clock

Shawn Lin (1):
      clk: rockchip: release io resource when failing to init clk on rk3399

Xing Zheng (2):
      clk: rockchip: fix incorrect parent for rk3399's {c,g}pll_aclk_perihp_src
      clk: rockchip: fix cpuclk registration error handling

 drivers/clk/rockchip/clk-cpu.c       |  4 ++--
 drivers/clk/rockchip/clk-mmc-phase.c | 12 +-----------
 drivers/clk/rockchip/clk-rk3399.c    |  8 ++++++--
 3 files changed, 9 insertions(+), 15 deletions(-)

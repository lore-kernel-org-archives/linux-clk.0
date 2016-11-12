Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] rockchip clock changes for 4.10
Date: Sat, 12 Nov 2016 16:30:05 +0100
Message-ID: <2643672.7kkyv0VVfm@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

please find below a pull request for rockchip-related clock changes for 4.1=
0.
Nothing really big stands out this time, so if it looks ok please pull.


Thanks
Heiko


The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git ta=
gs/v4.10-rockchip-clk1

for you to fetch changes up to bf92384b6d729b22916ba832b4a225ca196e98ba:

  clk: rockchip: Ignore frac divisor for PLL equivalence when it's unused (=
2016-11-05 23:16:29 +0100)

=2D---------------------------------------------------------------
PLL initialization for PLLs having both an integral and fractional mode
(rk3036, rk3399) does now take into account the mode that the PLL is
actually running at.
As always also some additional and optimized PLL rates for rk3066 and
rk3399, some additional clock ids for rk3066 and some additional clocks
on rk3399 are now sucessfully handled inside their respective driver.

=2D---------------------------------------------------------------
Heiko Stuebner (1):
      Merge branch 'v4.10-shared/clkids' into v4.10-clk/next

Jianqun Xu (1):
      clk: rockchip: remove more CLK_IGNORE_UNUSED for rk3399 clocktree

Julius Werner (1):
      clk: rockchip: Ignore frac divisor for PLL equivalence when it's unus=
ed

Pawe=C5=82 Jarosz (3):
      clk: rockchip: Add binding ids for cpu and peri clocks on rk3066
      clk: rockchip: Use clock ids for cpu and peri clocks on rk3066
      clk: rockchip: add 400MHz to rk3066 clock rates table

Xing Zheng (2):
      clk: rockchip: add 533.25MHz to rk3399 clock rates table
      clk: rockchip: optimize 800MHz and 1GHz pll rates on RK3399

 drivers/clk/rockchip/clk-pll.c                |  6 ++++--
 drivers/clk/rockchip/clk-rk3188.c             | 13 +++++++------
 drivers/clk/rockchip/clk-rk3399.c             | 27 ++++++++++++++---------=
=2D---
 include/dt-bindings/clock/rk3188-cru-common.h |  8 +++++++-
 4 files changed, 32 insertions(+), 22 deletions(-)

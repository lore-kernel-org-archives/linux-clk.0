Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: mturquette@baylibre.com, sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] rockchip clock changes for 4.7 part 3 - some more fixes
Date: Fri, 29 Apr 2016 00:06 +0200
Message-ID: <3990329.NB1U7jJjZj@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

some more fixes for the new rk3399 have come up addressing small errors
found in the manual during bringup of the soc, so please pull.


Thanks
Heiko

The following changes since commit 03ae1747869437a8e4d0d4e79d4c88c25c6df39c:

  clk: rockchip: fix checkpatch warning in core code (2016-04-20 09:53:39 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.7-rockchip-clk3

for you to fetch changes up to fd8bc829336a24b770247eb893111bcb8f1ddedb:

  clk: rockchip: fix the rk3399 cifout clock (2016-04-25 22:54:51 +0200)

----------------------------------------------------------------
A spelling fix and a bunch of rk3399 clock fixes.

----------------------------------------------------------------
Colin Ian King (1):
      clk: rockchip: fix of spelling mistake on unsuccessful in pll clock type

Heiko Stuebner (1):
      Merge branch 'v4.7-shared/clkids' into v4.7-clk/next

Xing Zheng (8):
      clk: rockchip: fix the gate bit for i2c4 and i2c8 on rk3399
      clk: rockchip: add general gpu soft-reset on rk3399
      clk: rockchip: rename rga clock-id on rk3399
      clk: rockchip: export some necessary rk3399 clock ids
      clk: rockchip: assign more necessary rk3399 clock ids
      clk: rockchip: add some frequencies on the rk3399 PLL table
      clk: rockchip: drop unnecessary CLK_IGNORE_UNUSED flags from rk3399
      clk: rockchip: fix the rk3399 cifout clock

 drivers/clk/rockchip/clk-pll.c         |   4 +-
 drivers/clk/rockchip/clk-rk3399.c      | 344 +++++++++++++++++----------------
 include/dt-bindings/clock/rk3399-cru.h |   5 +-
 3 files changed, 183 insertions(+), 170 deletions(-)

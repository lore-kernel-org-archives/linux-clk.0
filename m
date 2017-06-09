Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] rockchip clock changes for 4.13 part1
Date: Fri, 09 Jun 2017 12:00:04 +0200
Message-ID: <4709927.KhRz8573a2@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

please find below the core rockchip clock changes for 4.13.
As stated, one new clock controller and some misc changes as always.
There may be some more changes later on, but most likely nothing big.

So please pull.
Thanks
Heiko


The following changes since commit 2ea659a9ef488125eb46da6eb571de5eae5c43f6:

  Linux 4.12-rc1 (2017-05-13 13:19:49 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.13-rockchip-clk1

for you to fetch changes up to 223c24be740d293519ef8e03f5c075fab5512fd2:

  clk: rockchip: mark some special clk as critical on rk3368 (2017-06-02 15:57:32 +0200)

----------------------------------------------------------------
One new clock controller for the rk3128 soc, a fixup for the rk3228 cpuclk
table and the usual bunch of some new clock-ids and some clocks marked as
critical.

----------------------------------------------------------------
Eddie Cai (2):
      clk: rockchip: add ids for camera on rk3399
      clk: rockchip: add ids for rk3399 testclks used for camera handling

Elaine Zhang (10):
      clk: rockchip: add clock-ids for more rk3228 clocks
      clk: rockchip: fix up the RK3228 clk cpu setting table
      clk: rockchip: add dt-binding header for rk3128
      clk: rockchip: export more rk3228 clocks ids
      dt-bindings: add bindings for rk3128 clock controller
      clk: rockchip: add clock controller for rk3128
      clk: rockchip: mark pclk_ddrupctl as critical_clock on rk3036
      clk: rockchip: mark noc and some special clk as critical on rk3228
      clk: rockchip: mark noc and some special clk as critical on rk3288
      clk: rockchip: mark some special clk as critical on rk3368

Heiko Stuebner (1):
      Merge branch 'v4.13-shared/clkids' into v4.13-clk/next

 .../bindings/clock/rockchip,rk3128-cru.txt         |  56 ++
 drivers/clk/rockchip/Makefile                      |   1 +
 drivers/clk/rockchip/clk-rk3036.c                  |   1 +
 drivers/clk/rockchip/clk-rk3128.c                  | 612 +++++++++++++++++++++
 drivers/clk/rockchip/clk-rk3228.c                  | 164 ++++--
 drivers/clk/rockchip/clk-rk3288.c                  |  14 +-
 drivers/clk/rockchip/clk-rk3368.c                  |   5 +-
 drivers/clk/rockchip/clk-rk3399.c                  |   4 +-
 include/dt-bindings/clock/rk3128-cru.h             | 282 ++++++++++
 include/dt-bindings/clock/rk3228-cru.h             |  47 ++
 include/dt-bindings/clock/rk3399-cru.h             |   2 +
 11 files changed, 1122 insertions(+), 66 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3128-cru.txt
 create mode 100644 drivers/clk/rockchip/clk-rk3128.c
 create mode 100644 include/dt-bindings/clock/rk3128-cru.h

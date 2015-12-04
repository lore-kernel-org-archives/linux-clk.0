Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] rockchip clock changes for 4.5
Date: Fri, 04 Dec 2015 23:43:41 +0100
Message-ID: <3167734.Jiqp72JFJP@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

as discusses previously, here is round 1 of rockchip clock changes for 4.5.
This already includes the clock-id branch shared with the armsoc-
specific changes.

Thanks
Heiko


The following changes since commit 8005c49d9aea74d382f474ce11afbbc7d7130bec:

  Linux 4.4-rc1 (2015-11-15 17:00:27 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.5-rockchip-clk1

for you to fetch changes up to 8ad0df33c62d706f925a5910701255759a68c2e5:

  clk: rockchip: fix rk3368 cpuclk divider offsets (2015-12-03 16:20:02 +0100)

----------------------------------------------------------------
First round of Rockchip clock changes for 4.5 .
- one new clock-tree for the rk3036 including a new pll type
- switch rk3288 plls to slow mode on reboot
- a bunch of new clock ids
- some more critical clocks

----------------------------------------------------------------
Caesar Wang (1):
      clk: rockchip: Force rk3368 PWM clock (and its parents) on

Chris Zhong (3):
      clk: rockchip: add id for mipidsi sclk on rk3288
      clk: rockchip: add mipidsi clock on rk3288
      clk: rockchip: switch PLLs to slow mode before reboot for rk3288

Heiko Stuebner (3):
      Merge branch 'v4.5-clk/clkids' into v4.5-clk/next
      Merge branch 'v4.5-clk/clkids' into v4.5-clk/next
      clk: rockchip: fix rk3368 cpuclk divider offsets

Jianqun xu (1):
      clk: rockchip: protect rk3368 aclk_bus and aclk_peri clocks

Xing Zheng (4):
      clk: rockchip: add dt-binding header for rk3036
      dt-bindings: add documentation of rk3036 clock controller
      clk: rockchip: add new pll-type for rk3036 and similar socs
      clk: rockchip: add clock controller for rk3036

Zain Wang (2):
      clk: rockchip: add an id for rk3288 crypto clk
      clk: rockchip: set the id for crypto clk

 .../bindings/clock/rockchip,rk3036-cru.txt         |  56 +++
 drivers/clk/rockchip/Makefile                      |   1 +
 drivers/clk/rockchip/clk-pll.c                     | 258 ++++++++++-
 drivers/clk/rockchip/clk-rk3036.c                  | 478 +++++++++++++++++++++
 drivers/clk/rockchip/clk-rk3288.c                  |  36 +-
 drivers/clk/rockchip/clk-rk3368.c                  |  11 +-
 drivers/clk/rockchip/clk.h                         |  32 +-
 include/dt-bindings/clock/rk3036-cru.h             | 193 +++++++++
 include/dt-bindings/clock/rk3288-cru.h             |   2 +
 9 files changed, 1043 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3036-cru.txt
 create mode 100644 drivers/clk/rockchip/clk-rk3036.c
 create mode 100644 include/dt-bindings/clock/rk3036-cru.h

Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] rockchip clock changes for 4.7 part 1
Date: Tue, 12 Apr 2016 08:38:11 +0200
Message-ID: <1640921.TBVHP9NGjj@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

please find below clock changes for 4.7. As the tag explains it is mainly
the rk3399 support + necessary plumbing.

So if it looks ok, please pull.


Thanks
Heiko

The following changes since commit f55532a0c0b8bb6148f4e07853b876ef73bc69ca:

  Linux 4.6-rc1 (2016-03-26 16:03:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.7-rockchip-clk1

for you to fetch changes up to 115510053e5e5872f1f19a2220b04aab5542c5c4:

  clk: rockchip: add clock controller for the RK3399 (2016-03-28 14:57:07 +0200)

----------------------------------------------------------------
This is first big chunk of Rockchip clock-related changes for 4.7.

Main change is probably the added support for the new rk3399 soc
and necessary infrastructure changes surrounding it.

The biggest chunk is probably that clock code is now able to
handle multiple clock providers in one system, as the rk3399
has two of those. A general one and another smaller one in a
separate power domain. The rk3399 also uses another new pll type.
Thankfully it just fits nicely into our current structure.
It also needs some parts like the cpuclk mux parameters to be
a bit more flexible and an new fractional divider subtype without
gate.

Apart from this big change we have some more fixes and removal
of forgotten variables.

----------------------------------------------------------------
Heiko Stuebner (1):
      Merge branch 'v4.7-shared/clkids' into v4.7-clk/next

Shawn Lin (4):
      clk: rockchip: remove mux_core_reg from rockchip_cpuclk_reg_data
      clk: rockchip: fix warning reported by kernel-doc
      clk: rockchip: remove redundant checking of device_node
      clk: rockchip: release io resource when failing to init clk

Xing Zheng (7):
      clk: rockchip: add a COMPOSITE_FRACMUX_NOGATE type
      clk: rockchip: allow varying mux parameters for cpuclk pll-sources
      clk: rockchip: Add support for multiple clock providers
      clk: rockchip: add new pll-type for rk3399 and similar socs
      clk: rockchip: add dt-binding header for rk3399
      dt-bindings: add bindings for rk3399 clock controller
      clk: rockchip: add clock controller for the RK3399

 .../bindings/clock/rockchip,rk3399-cru.txt         |   62 +
 drivers/clk/rockchip/Makefile                      |    1 +
 drivers/clk/rockchip/clk-cpu.c                     |   29 +-
 drivers/clk/rockchip/clk-pll.c                     |  301 +++-
 drivers/clk/rockchip/clk-rk3036.c                  |   21 +-
 drivers/clk/rockchip/clk-rk3188.c                  |   51 +-
 drivers/clk/rockchip/clk-rk3228.c                  |   21 +-
 drivers/clk/rockchip/clk-rk3288.c                  |   23 +-
 drivers/clk/rockchip/clk-rk3368.c                  |   28 +-
 drivers/clk/rockchip/clk-rk3399.c                  | 1540 ++++++++++++++++++++
 drivers/clk/rockchip/clk.c                         |  146 +-
 drivers/clk/rockchip/clk.h                         |  106 +-
 include/dt-bindings/clock/rk3399-cru.h             |  752 ++++++++++
 13 files changed, 2945 insertions(+), 136 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt
 create mode 100644 drivers/clk/rockchip/clk-rk3399.c
 create mode 100644 include/dt-bindings/clock/rk3399-cru.h

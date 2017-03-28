Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] rockchip clock changes for 4.12 part1
Date: Tue, 28 Mar 2017 14:52:34 +0200
Message-ID: <5160508.89PunkDez8@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

Please find below rockchip clock changes for 4.12. As the tag states,
I've included the rk1108 -> rv1108 clock rename in here. Pinctrl changes
go through the pinctrl tree and once everything is in mainline I'll put
the actual devicetree on top. That way we keep cross-tree changes to a
minimum while keeping everything error-free and bisectable.

So please pull if nothing stands out.

Thanks
Heiko


The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.12-rockchip-clk1

for you to fetch changes up to 9be83448951a404a6fd5cf43ee0245a9bccc02c1:

  clk: rockchip: add pll_wait_lock for pll_enable (2017-03-22 18:33:22 +0100)

----------------------------------------------------------------
General rockchip clock changes for 4.12. Contains some new clock-ids
as well as fixups of the clock-ids on rk3368 timers, which were unused
and completely wrong (more and differently named timers).
Also there is one new clock on rk3328 using the muxgrf type, a fix for
pll enablement which should wait for the pll to lock before continuing,
some more critical clocks and the rename of the rk1108 to rv1108, as the
soc seems to have been using a preliminary name before its actual release.
The plan is to have the driver changes (pinctrl, clk) go through the
respective maintainer trees and once everything landed in mainline do
the rename of the devicetree files. With the dts-include change in the
clock rename, we also keep everything compiling and thus bisectability.

----------------------------------------------------------------
Andy Yan (2):
      dt-bindings: rk1108-cru: rename RK1108 to RV1108
      clk: rockchip: rename RK1108 to RV1108

Douglas Anderson (1):
      clk: rockchip: Set "ignore unused" for PMU M0 clocks on rk3399

Elaine Zhang (7):
      clk: rockchip: add rk3328 clk_mac2io_ext ID
      clk: rockchip: fix up rk3368 timer-ids
      clk: rockchip: add clock ids for timer10-15 of RK3368 SoCs
      clk: rockchip: describe clk_gmac using the new muxgrf type on rk3328
      clk: rockchip: export SCLK_TIMERXX id for timers on rk3368
      clk: rockchip: mark some rk3368 core-clks as critical
      clk: rockchip: add pll_wait_lock for pll_enable

Heiko Stuebner (1):
      Merge branch 'v4.12-shared/clkids' into v4.12-clk/next

 ...chip,rk1108-cru.txt => rockchip,rv1108-cru.txt} |  12 +-
 arch/arm/boot/dts/rk1108.dtsi                      |   2 +-
 drivers/clk/rockchip/Makefile                      |   2 +-
 drivers/clk/rockchip/clk-pll.c                     |   3 +
 drivers/clk/rockchip/clk-rk3328.c                  |   9 +
 drivers/clk/rockchip/clk-rk3368.c                  |  27 +-
 drivers/clk/rockchip/clk-rk3399.c                  |   8 +-
 .../clk/rockchip/{clk-rk1108.c => clk-rv1108.c}    | 414 ++++++++++-----------
 drivers/clk/rockchip/clk.h                         |  28 +-
 include/dt-bindings/clock/rk3328-cru.h             |   1 +
 include/dt-bindings/clock/rk3368-cru.h             |  19 +-
 .../clock/{rk1108-cru.h => rv1108-cru.h}           |   6 +-
 12 files changed, 276 insertions(+), 255 deletions(-)
 rename Documentation/devicetree/bindings/clock/{rockchip,rk1108-cru.txt => rockchip,rv1108-cru.txt} (83%)
 rename drivers/clk/rockchip/{clk-rk1108.c => clk-rv1108.c} (57%)
 rename include/dt-bindings/clock/{rk1108-cru.h => rv1108-cru.h} (97%)

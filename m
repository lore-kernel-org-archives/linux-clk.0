Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] some more rockchip clock changes for 4.6
Date: Fri, 04 Mar 2016 02:37:34 +0100
Message-ID: <1510327.LAx2hyWq2l@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

this pull request is based on the last tag 4.6 and I think the signed
tag below should explain that just right :-) .
So if nothing stands out, please pull.


Thanks
Heiko

The following changes since commit 36714529f8bbd4f8eaf93b50f4a64c52a24879aa:

  clk: rockchip: convert manually created factor clocks to the new type (2016-02-04 15:54:20 +0100)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.6-rockchip-clk2

for you to fetch changes up to 7af8a26ce7055dd74853ea7c2b9752961e3491da:

  clk: rockchip: include downstream muxes into fractional dividers on rk3368 (2016-02-26 02:08:45 +0100)

----------------------------------------------------------------
Inclusion of the rk3368 fractional dividers into our handling scheme,
fixes for missing error-handling in mmc-phase, inverters and cpu-clocks
and some more clock-ids.

----------------------------------------------------------------
Caesar Wang (2):
      clk: rockchip: add id of the tsadc clock found on rk3228 SoCs
      clk: rockchip: add the tsadc clocks found on rk3228 SoCs

Elaine Zhang (1):
      clk: rockchip: include downstream muxes into fractional dividers on rk3368

Heiko Stuebner (1):
      Merge branch 'v4.6-shared/clkids' into v4.6-clk/next

Shawn Lin (5):
      clk: rockchip: disable alt_parent clk in err cases when registering cpuclk
      clk: rockchip: check grf when waiting pll lock
      clk: rockchip: don't return NULL when registering inverter fails
      clk: rockchip: don't return NULL when registering mmc branch fails
      clk: rockchip: fix coding style for clk-cpu.c

Yakir Yang (4):
      clk: rockchip: add the new clock ids for RK3228 VOP
      clk: rockchip: add the new clock ids for RK3228 HDMI
      clk: rockchip: set the clock ids for RK3228 VOP
      clk: rockchip: set the clock ids for RK3228 HDMI

 drivers/clk/rockchip/clk-cpu.c         |  8 +--
 drivers/clk/rockchip/clk-inverter.c    |  8 +--
 drivers/clk/rockchip/clk-mmc-phase.c   |  8 +--
 drivers/clk/rockchip/clk-pll.c         |  5 ++
 drivers/clk/rockchip/clk-rk3228.c      | 18 +++----
 drivers/clk/rockchip/clk-rk3368.c      | 97 +++++++++++++++++++++-------------
 include/dt-bindings/clock/rk3228-cru.h | 12 +++++
 7 files changed, 95 insertions(+), 61 deletions(-)

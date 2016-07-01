Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com, sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clk changes for 4.8
Date: Fri, 01 Jul 2016 02:14:53 +0200
Message-ID: <112903792.EQ89smGoay@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

please find below clock changes for 4.8.

Apart from some new clock ids there is the addition of a placeholder clock
for the rk3399 watchdog pclk - as explained in the code, this gate is not
controlled through the clock controller but through the general register
files, yet the watchdog is unhappy if can't see the clock. And finally some
small fixes for clock mistakes that do not affect any currently support
board ip blocks like spdif-DPTX clock on the rk3399.

So if this looks ok, please pull

Thanks
Heiko


The following changes since commit 1a695a905c18548062509178b98bc91e67510864:

  Linux 4.7-rc1 (2016-05-29 09:29:24 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.8-rockchip-clk1

for you to fetch changes up to 3770821fa360525e6c726cd562a2438a0aa5d566:

  clk: rockchip: fix incorrect rk3399 spdif-DPTX divider bits (2016-07-01 01:50:17 +0200)

----------------------------------------------------------------
Placeholder for the rk3399 watchdog pclk, some newly exported
rk3228 clockids and a small fix for the not yet used spdif to
displayport clock on the rk3399.

----------------------------------------------------------------
Heiko Stuebner (1):
      Merge branch 'v4.8-shared/clkids' into v4.8-clk/next

Xing Zheng (9):
      clk: rockchip: add a dummy clock for the watchdog pclk on rk3399
      clk: rockchip: add clock-ids for rk3228 audio clocks
      clk: rockchip: add clock-ids for rk3228 MAC clocks
      clk: rockchip: fix incorrect rk3228 clock registers
      clk: rockchip: include rk3228 downstream muxes into fractional dividers
      clk: rockchip: export rk3228 audio clocks
      clk: rockchip: rename rk3228 sclk_macphy_50m to sclk_mac_extclk
      clk: rockchip: export rk3228 MAC clocks
      clk: rockchip: fix incorrect rk3399 spdif-DPTX divider bits

 drivers/clk/rockchip/clk-rk3228.c      | 125 +++++++++++++++++++--------------
 drivers/clk/rockchip/clk-rk3399.c      |  11 ++-
 include/dt-bindings/clock/rk3228-cru.h |  15 ++++
 3 files changed, 99 insertions(+), 52 deletions(-)

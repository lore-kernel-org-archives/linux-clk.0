Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] rockchip clock changes for 4.14 part1
Date: Mon, 14 Aug 2017 01:27:11 +0200
Message-ID: <2274885.hdbqj6Qr1b@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

please find below rockchip clock-changes targetted at 4.14.
As we talked about before, it includes the approximation-callback
for fractional dividers, Acked by Stephen.

Apart from that we have the usual changes as described by the tag.
So if stuff looks ok, please pull.


Thanks
Heiko


The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.14-rockchip-clk1

for you to fetch changes up to 5d890c2df900db0197d46ec75383d7633ef41c82:

  clk: rockchip: add special approximation to fix up fractional clk's jitter (2017-08-08 17:45:42 +0200)

----------------------------------------------------------------
The biggest change is fixing the jitter on the fractional clock-type
Rockchip socs experience with the default approximation. For that we
introduce the ability to override it with a clock-specific approximation
and use that to create the needed rate settings as described in the
Rockchip soc manuals (same for all Rockchip socs).

Apart from that we have support for the rk3126 clock controller
which is similar to the rk3128 with some minimal differences
and a lot of improvements and fixes for the rv1108 clock controller
(missing clocks, some clock-ids, naming fixes, register fixes).

----------------------------------------------------------------
Elaine Zhang (13):
      clk: rockchip: add more clk ids for rv1108
      clk: rockchip: rename the clk id for HCLK_I2S1_2CH
      clk: rockchip: fix up indentation of some RV1108 clock-ids
      clk: rockchip: support more rates for rv1108 cpuclk
      clk: rockchip: fix up the pll clks error for rv1108 SoC
      clk: rockchip: support more clks for rv1108
      clk: rockchip: fix up some clks describe error for rv1108 SoC
      clk: rockchip: rename some of clks for rv1108 SoC
      clk: rockchip: add some critical clocks for rv1108 SoC
      dt-bindings: add documentation for rk3126 clock
      clk: rockchip: modify rk3128 clk driver to also support rk3126
      clk: fractional-divider: allow overriding of approximation
      clk: rockchip: add special approximation to fix up fractional clk's jitter

Heiko Stuebner (1):
      Merge branch 'v4.14-shared/clkids' into v4.14-clk/next

 .../bindings/clock/rockchip,rk3128-cru.txt         |   8 +-
 drivers/clk/clk-fractional-divider.c               |  28 +-
 drivers/clk/rockchip/clk-rk3128.c                  |  69 +++-
 drivers/clk/rockchip/clk-rv1108.c                  | 460 +++++++++++++++++----
 drivers/clk/rockchip/clk.c                         |  36 ++
 include/dt-bindings/clock/rv1108-cru.h             | 123 +++++-
 include/linux/clk-provider.h                       |   3 +
 7 files changed, 605 insertions(+), 122 deletions(-)

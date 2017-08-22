Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL v2] rockchip clock changes for 4.14
Date: Tue, 22 Aug 2017 22:48:32 +0200
Message-ID: <2504131.RNZrFhkOWB@phil>
In-Reply-To: <2274885.hdbqj6Qr1b@phil>
References: <2274885.hdbqj6Qr1b@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

please find below rockchip clock-changes targetted at 4.14.
As we talked about before, it includes the approximation-callback
for fractional dividers, Acked by Stephen.

Apart from that we have the usual changes as described by the tag.
So if stuff looks ok, please pull.

changes in pull v2:
Compared to v1 of the pull I included some more clock-ids and
rv1108 fixes that came in meanwhile.


Thanks
Heiko


The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:

  Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.14-rockchip-clk1

for you to fetch changes up to 64a1644bc3baa62b769455d811b7999b9a1c6cd1:

  clk: rockchip: fix the rv1108 clk_mac sel register description (2017-08-22 02:55:03 +0200)

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
Elaine Zhang (19):
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
      clk: rockchip: add rk3228 sclk_sdio_src ID
      clk: rockchip: add rv1108 ACLK_GAMC and PCLK_GMAC ID
      clk: rockchip: add rk3228 SCLK_SDIO_SRC clk id
      clk: rockchip: add rv1108 ACLK_GMAC and PCLK_GMAC clocks
      clk: rockchip: rename rv1108 macphy clock to mac
      clk: rockchip: fix the rv1108 clk_mac sel register description

Heiko Stuebner (2):
      Merge branch 'v4.14-shared/clkids' into v4.14-clk/next
      Merge branch 'v4.14-shared/clkids' into v4.14-clk/next

 .../bindings/clock/rockchip,rk3128-cru.txt         |   8 +-
 drivers/clk/clk-fractional-divider.c               |  28 +-
 drivers/clk/rockchip/clk-rk3128.c                  |  69 ++-
 drivers/clk/rockchip/clk-rk3228.c                  |   2 +-
 drivers/clk/rockchip/clk-rv1108.c                  | 462 +++++++++++++++++----
 drivers/clk/rockchip/clk.c                         |  36 ++
 include/dt-bindings/clock/rk3228-cru.h             |   1 +
 include/dt-bindings/clock/rv1108-cru.h             | 125 +++++-
 include/linux/clk-provider.h                       |   3 +
 9 files changed, 611 insertions(+), 123 deletions(-)

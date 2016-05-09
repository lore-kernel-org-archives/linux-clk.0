Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: mturquette@baylibre.com, sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] rockchip clock changes for 4.7 part 4 - some more fixes
Date: Mon, 09 May 2016 16:22:24 +0200
Message-ID: <16076636.fp1YCeqDWQ@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

A fixup for a rk3399 clock name as well as the GRF-portions of
my cleanup series. As Stephen had some mild reservations about the
introduced indirection in the pll parts and we don't save to much lines
with my modifications for the currently supported pll-types, I think it's
easier to postpone those until the next new pll type comes around.

Maybe it even has some completely different properties to handle where
the current "simplification" might even be counter-productive :-) .

So please pull if possible.

Thanks
Heiko


The following changes since commit fd8bc829336a24b770247eb893111bcb8f1ddedb:

  clk: rockchip: fix the rk3399 cifout clock (2016-04-25 22:54:51 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.7-rockchip-clk4

for you to fetch changes up to 7e5385dc722258c862f969ab7e67907156ad0e3f:

  clk: rockchip: drop old_rate calculation on pll rate changes (2016-05-09 16:04:39 +0200)

----------------------------------------------------------------
Another small rk3399 fixup as well as simplifications around
our handling of the General-Register-Files syscon.

----------------------------------------------------------------
Douglas Anderson (1):
      clk: rockchip: fix the rk3399 sdmmc sample / drv name

Heiko Stuebner (3):
      clk: rockchip: lookup General Register Files in rockchip_clk_init
      clk: rockchip: simplify GRF handling in pll clocks
      clk: rockchip: drop old_rate calculation on pll rate changes

 drivers/clk/rockchip/clk-pll.c    | 45 ++++++++-------------------------------
 drivers/clk/rockchip/clk-rk3399.c |  4 ++--
 drivers/clk/rockchip/clk.c        | 11 +++-------
 drivers/clk/rockchip/clk.h        |  1 -
 4 files changed, 14 insertions(+), 47 deletions(-)

Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock Fixes for 4.14
Date: Mon, 25 Sep 2017 19:13:47 +0200
Message-ID: <2374267.IN5p8oW94K@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

please find below some fixes for the rk3128 clock controller that should
hopefully be suitable for 4.14. The normal stuff some wrong register bits
and some clocks that need to be critical for safe operation.

Otherwise from the main boards I test on, it looks like everything
survived the merge window, so with a bit of luck this might be the only
fixes for 4.14.

Please pull.


Thanks
Heiko

The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:

  Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.14-rockchip-clkfixes-1

for you to fetch changes up to 00e6751ffc9e6e0651e514961316fd15f0409683:

  clk: rockchip: add sclk_timer5 as critical clock on rk3128 (2017-09-17 01:55:36 +0200)

----------------------------------------------------------------
Some smallish fixes for the rk3128 clock support including
some register errors and some clocks that should be critical
for safe usage.

----------------------------------------------------------------
Elaine Zhang (3):
      clk: rockchip: add pclk_pmu as critical clock on rk3128
      clk: rockchip: fix up rk3128 pvtm and mipi_24m gate regs error
      clk: rockchip: add sclk_timer5 as critical clock on rk3128

 drivers/clk/rockchip/clk-rk3128.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

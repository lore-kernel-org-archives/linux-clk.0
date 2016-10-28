Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] rockchip clock fixes for 4.9-rc
Date: Fri, 28 Oct 2016 11:18:47 +0200
Message-ID: <2723813.N9JiJ3CpWT@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

please find below one small fix to the newly introduced ddrclk type.

Thanks
Heiko

The following changes since commit 1001354ca34179f3db924eb66672442a173147dc:

  Linux 4.9-rc1 (2016-10-15 12:17:50 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.9-rockchip-clkfixes1

for you to fetch changes up to 4a262b14c57d6ec88982d40273e742f7b9151560:

  clk: rockchip: don't return NULL when failing to register ddrclk branch (2016-10-16 02:39:58 +0200)

----------------------------------------------------------------
Fix return value in error case of new ddrclk type.

----------------------------------------------------------------
Shawn Lin (1):
      clk: rockchip: don't return NULL when failing to register ddrclk branch

 drivers/clk/rockchip/clk-ddr.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: mturquette@baylibre.com, sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clk fixes for 4.8
Date: Tue, 30 Aug 2016 00:23:56 +0200
Message-ID: <5043281.GVRln4Xh5N@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

please find below some fixes for rk3399 clocks.
Really only wrong register bits where the manual contained (now fixed)
mistakes and one needed critical clock.

So if nothing stands out please pull

Thanks
Heiko


The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.8-rockchip-clk-fixes1

for you to fetch changes up to a45f9d41c9dd2c28e38b9b88f69c39bc63807de9:

  clk: rockchip: mark aclk_emmc_noc as a critical clock on rk3399 (2016-08-24 23:44:49 +0200)

----------------------------------------------------------------
Some fixes for rk3399 register errors that revealed themself
during actual use.

----------------------------------------------------------------
Chris Zhong (1):
      clk: rockchip: fix rk3399 aclk_vio gate bit

Xing Zheng (3):
      clk: rockchip: fix incorrect aclk_emmc source gate bits on rk3399
      clk: rockchip: fix incorrect GATE bits for {c, g}pll_aclk_perihp_src on rk3399
      clk: rockchip: mark aclk_emmc_noc as a critical clock on rk3399

 drivers/clk/rockchip/clk-rk3399.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock updates for 4.19
Date: Mon, 06 Aug 2018 10:50:24 +0200
Message-ID: <29493561.nOART3tDXq@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

This one change on top of the previous changes that adds a critical clock
on rk3399 to prevent random hangs due to it supplying the vdd_log
cpu core supply.


Please pull
Heiko


The following changes since commit a64ad008980c65d38e6cf6858429c78e6b740c41:

  clk: rockchip: fix clk_i2sout parent selection bits on rk3399 (2018-07-08 00:19:19 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.19-rockchip-clk2

for you to fetch changes up to 508fc689cfe514228cb0b91f94d5542ec11881b1:

  clk: rockchip: Add pclk_rkpwm_pmu to PMU critical clocks in rk3399 (2018-08-06 10:03:13 +0200)

----------------------------------------------------------------
pclk_rkpwm_pmu as critical clock, due to it supplying the pwm
used to drive the logic supply of the rk3399 core.

----------------------------------------------------------------
Levin Du (1):
      clk: rockchip: Add pclk_rkpwm_pmu to PMU critical clocks in rk3399

 drivers/clk/rockchip/clk-rk3399.c | 1 +
 1 file changed, 1 insertion(+)

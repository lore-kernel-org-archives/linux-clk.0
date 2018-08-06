Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL v2] Rockchip clock updates for 4.19 - round 2
Date: Mon, 06 Aug 2018 23:59:16 +0200
Message-ID: <1693143.KCFObordkz@phil>
In-Reply-To: <29493561.nOART3tDXq@phil>
References: <29493561.nOART3tDXq@phil>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Mike, Stephen,

unfortunately, the one commit here missed a Signed-off-by, so here is
the pull again with the commit fixed.


Thanks
Heiko

The following changes since commit a64ad008980c65d38e6cf6858429c78e6b740c41:

  clk: rockchip: fix clk_i2sout parent selection bits on rk3399 (2018-07-08 00:19:19 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.19-rockchip-clk2

for you to fetch changes up to 640332d1a089909df08bc9f3e42888a2019c66e2:

  clk: rockchip: Add pclk_rkpwm_pmu to PMU critical clocks in rk3399 (2018-08-06 23:46:52 +0200)

----------------------------------------------------------------
pclk_rkpwm_pmu as critical clock, due to it supplying the pwm
used to drive the logic supply of the rk3399 core.

----------------------------------------------------------------
Levin Du (1):
      clk: rockchip: Add pclk_rkpwm_pmu to PMU critical clocks in rk3399

 drivers/clk/rockchip/clk-rk3399.c | 1 +
 1 file changed, 1 insertion(+)

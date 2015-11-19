Return-Path: <huanglin821201@gmail.com>
Return-Path: <huanglin821201@gmail.com>
From: Lin Huang <hl@rock-chips.com>
To: heiko@sntech.de,
	dianders@chromium.org,
	mturquette@baylibre.com,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com
Cc: linux-clk@vger.kernel.org,
	sboyd@codeaurora.org,
	dbasehore@chromium.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lin Huang <hl@rock-chips.com>
Subject: [PATCH 0/2] Bring up rk3399 ddr frequency scaling 
Date: Thu, 19 Nov 2015 18:21:09 +0800
Message-Id: <1447928471-14448-1-git-send-email-hl@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

these patchset bring up rk3399 ddr frequency scaling flow,
use devfreq framework and simple_ondemand policy. Ddr set
rate function will implement in dcf controller which run in
the ATF, and rk3399 ATF not ready now, so we need finish it
when rk3399 ATF ready.

Lin Huang (2):
  clk: rockchip: dmc: support rk3399 dmc clock driver
  devfreq: rockchip: support rk3399 dmc devfreq

 drivers/clk/rockchip/Makefile         |   1 +
 drivers/clk/rockchip/clk-rk3399-dmc.c | 196 ++++++++++++++++++++
 drivers/devfreq/Kconfig               |   1 +
 drivers/devfreq/Makefile              |   1 +
 drivers/devfreq/rockchip/Kconfig      |   8 +
 drivers/devfreq/rockchip/Makefile     |   1 +
 drivers/devfreq/rockchip/rk3399_dmc.c | 327 ++++++++++++++++++++++++++++++++++
 include/soc/rockchip/rk3399-dmc-clk.h |  36 ++++
 8 files changed, 571 insertions(+)
 create mode 100644 drivers/clk/rockchip/clk-rk3399-dmc.c
 create mode 100644 drivers/devfreq/rockchip/Kconfig
 create mode 100644 drivers/devfreq/rockchip/Makefile
 create mode 100644 drivers/devfreq/rockchip/rk3399_dmc.c
 create mode 100644 include/soc/rockchip/rk3399-dmc-clk.h

-- 
1.9.1

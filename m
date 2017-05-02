Return-Path: <zhangqing@rock-chips.com>
From: Elaine Zhang <zhangqing@rock-chips.com>
To: heiko@sntech.de,
	xf@rock-chips.com
Cc: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org,
	huangtao@rock-chips.com,
	xxx@rock-chips.com,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v3 0/4] make some special clk as critical_clocks
Date: Tue,  2 May 2017 15:34:02 +0800
Message-Id: <1493710446-7203-1-git-send-email-zhangqing@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

change in V3:
reword the commit message,explain why the specific clocks are need to be critical.

change in v2:
fix up some clks which have their own driver, not need to set as critical clocks

Elaine Zhang (4):
  clk: rockchip: rk3036: make pclk_ddrupctl as critical_clock
  clk: rockchip: rk3228: make noc and some special clk as
    critical_clocks
  clk: rockchip: rk3288: make noc and some special clk as
    critical_clocks
  clk: rockchip: rk3368: make some special clk as critical_clocks

 drivers/clk/rockchip/clk-rk3036.c |  1 +
 drivers/clk/rockchip/clk-rk3228.c | 30 +++++++++++++++++++++++++++++-
 drivers/clk/rockchip/clk-rk3288.c | 14 ++++++++++----
 drivers/clk/rockchip/clk-rk3368.c |  5 ++++-
 4 files changed, 44 insertions(+), 6 deletions(-)

-- 
1.9.1

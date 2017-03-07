Return-Path: <zhangqing@rock-chips.com>
From: Elaine Zhang <zhangqing@rock-chips.com>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	robh+dt@kernel.org,
	mark.rutland@arm.com,
	linux-clk@vger.kernel.org,
	huangtao@rock-chips.com,
	xxx@rock-chips.com,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v2 0/5] clk: rockchip: fix up the clk for RK3368 SoC 
Date: Tue,  7 Mar 2017 19:05:14 +0800
Message-Id: <1488884719-10350-1-git-send-email-zhangqing@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

change in V2:
split clock-id addition and the assignment in the clock-
driver.

Elaine Zhang (5):
  clk: rockchip: rk3368: fix up the timer-ids
  clk: rockchip: rk3368: remove the unused id
  clk: rockchip: add clock ids for timer10-15 of RK3368 SoCs
  clk: rockchip: rk3368: export SCLK_TIMERXX id for timers
  clk: rockchip: rk3368: add some clks as critical

 drivers/clk/rockchip/clk-rk3368.c      | 27 +++++++++++++++------------
 include/dt-bindings/clock/rk3368-cru.h | 19 ++++++++++++-------
 2 files changed, 27 insertions(+), 19 deletions(-)

-- 
1.9.1

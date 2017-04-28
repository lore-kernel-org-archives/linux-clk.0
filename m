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
Subject: [PATCH v1 0/2] clk: rockchip: Perfect clock description for RK3228
Date: Fri, 28 Apr 2017 10:33:19 +0800
Message-Id: <1493346801-23785-1-git-send-email-zhangqing@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

support more cpu freq, and support armcore div setting.
Add some necessary clks ID.

Elaine Zhang (2):
  clk: rockchip: fix up the RK3228 clk cpu setting table
  clk: rockchip: export rk3228 clocks ID

 drivers/clk/rockchip/clk-rk3228.c      | 142 +++++++++++++++++++--------------
 include/dt-bindings/clock/rk3228-cru.h |  47 +++++++++++
 2 files changed, 127 insertions(+), 62 deletions(-)

-- 
1.9.1

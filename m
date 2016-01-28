Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	zhengxing@rock-chips.com,
	zhangqing@rock-chips.com,
	wxt@rock-chips.com,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 0/3] clk: rockchip: introduce a clock type for factor clocks
Date: Thu, 28 Jan 2016 01:01:43 +0100
Message-Id: <1453939306-984-1-git-send-email-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

We're currently creating factor clocks manually during clock init.
That worked well in the beginning, but since the rk3288 we also see
combined gate-factor clocks and the overall number of factor clocks
we create manually seems to be rising. And also sometimes created
artificial separations that do not come from the clock hirarchy.

So I finished something I started some 6 months ago to finally be
able to model factor clocks inside the clock-tree where they belong.

Heiko Stuebner (3):
  clk: rockchip: rk3036: fix parent of hclk_vcodec
  clk: rockchip: add a factor clock type
  clk: rockchip: convert manually created factor clocks to the new type

 drivers/clk/rockchip/clk-rk3036.c | 32 ++++++-----------------
 drivers/clk/rockchip/clk-rk3188.c | 10 +++-----
 drivers/clk/rockchip/clk-rk3228.c | 33 +++++-------------------
 drivers/clk/rockchip/clk-rk3288.c | 23 +++++------------
 drivers/clk/rockchip/clk-rk3368.c | 29 ++++++---------------
 drivers/clk/rockchip/clk.c        | 53 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/rockchip/clk.h        | 28 +++++++++++++++++++++
 7 files changed, 110 insertions(+), 98 deletions(-)

-- 
2.6.4

Return-Path: <eddie.cai.linux@gmail.com>
Return-Path: <eddie.cai.linux@gmail.com>
From: Eddie Cai <eddie.cai.linux@gmail.com>
To: robh+dt@kernel.org,
	mark.rutland@arm.com,
	heiko@sntech.de,
	zhengxing@rock-chips.com,
	mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Eddie Cai <eddie.cai.linux@gmail.com>
Subject: [PATCH V2  0/2] correct ids for clk_testout
Date: Tue, 25 Apr 2017 14:41:08 +0800
Message-Id: <1493102470-22965-1-git-send-email-eddie.cai.linux@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

we use clk_testout1 and clk_testout2 for camera. e.g. mipi 24M mclk. the ids of
clk_testout1 and clk_testout2 is wrong. it's time to correct it. 

Eddie Cai (2):
  clk: rockchip: add ids for camera
  clk: rockchip: fix the incorrect ids

 drivers/clk/rockchip/clk-rk3399.c      | 4 ++--
 include/dt-bindings/clock/rk3399-cru.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
1.9.1

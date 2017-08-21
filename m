Return-Path: <zhangqing@rock-chips.com>
From: Elaine Zhang <zhangqing@rock-chips.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	heiko@sntech.de
Cc: robh+dt@kernel.org,
	mark.rutland@arm.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xxx@rock-chips.com,
	xf@rock-chips.com,
	huangtao@rock-chips.com,
	cl@rock-chips.com,
	andy.yan@rock-chips.com,
	wdc@rock-chips.com,
	Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v2 0/4] clk: rockchip: rv1108: support mac clk
Date: Mon, 21 Aug 2017 16:16:03 +0800
Message-Id: <1503303367-17915-1-git-send-email-zhangqing@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

change in V2:
[PATCH v2 1/4] : NONE
[PATCH v2 2/4] : NONE
[PATCH v2 3/4] : NONE
[PATCH v2 4/4] : fix up the clk_mac mux regs description error

Elaine Zhang (4):
  clk: rockchip: add rv1108 ACLK_GAMC and PCLK_GMAC ID
  clk: rockchip: rv1108: add ACLK_GMAC and PCLK_GMAC clk id
  clk: rockchip: rv1108: rename macphy to mac
  clk: rockchip: rv1108: fix up the clk_mac sel register description

 drivers/clk/rockchip/clk-rv1108.c      | 14 ++++++++------
 include/dt-bindings/clock/rv1108-cru.h |  8 +++++---
 2 files changed, 13 insertions(+), 9 deletions(-)

-- 
1.9.1

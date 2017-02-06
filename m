Return-Path: <zhangqing@rock-chips.com>
From: Elaine Zhang <zhangqing@rock-chips.com>
To: heiko@sntech.de,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	xf@rock-chips.com,
	wdc@rock-chips.com
Cc: linux-clk@vger.kernel.org,
	huangtao@rock-chips.com,
	xxx@rock-chips.com,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v1 0/2] clk: rockchip: describe clk_gmac2io and clk_gmac2phy on rk3328
Date: Mon,  6 Feb 2017 10:50:33 +0800
Message-Id: <1486349435-8681-1-git-send-email-zhangqing@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

add clk_mac2io_ext ID.
describe clk_gmac using the new muxgrf type on rk3328.

Elaine Zhang (2):
  rockchip: clk: rk3328: add clk_mac2io_ext ID
  clk: rockchip: describe clk_gmac using the new muxgrf type on rk3328

 drivers/clk/rockchip/clk-rk3328.c      | 9 +++++++++
 include/dt-bindings/clock/rk3328-cru.h | 1 +
 2 files changed, 10 insertions(+)

-- 
1.9.1

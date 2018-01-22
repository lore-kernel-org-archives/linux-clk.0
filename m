Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-rockchip@lists.infradead.org,
	robh+dt@kernel.org,
	mark.rutland@arm.com,
	devicetree@vger.kernel.org,
	yang.zheng@rock-chips.com,
	zhangqing@rock-chips.com,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 0/7] clk: rockchip: rk3328 fixes in preparation of graphics support
Date: Mon, 22 Jan 2018 15:15:23 +0100
Message-Id: <20180122141530.12398-1-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

Fix some clock issues on rk3328 to make way for the upcoming graphics
support on rk3328.

Heiko Stuebner (6):
  clk: rockchip: fix hclk_vio_niu on rk3328
  clk: rockchip: remove HCLK_VIO from rk3328 dt header
  clk: rockchip: export sclk_hdmi_sfc on rk3328
  clk: rockchip: protect all remaining rk3328 interconnect clocks
  clk: rockchip: remove ignore_unused flag from rk3328 vio_h2p clocks
  clk: rockchip: document hdmi_phy external input for rk3328

Zheng Yang (1):
  clk: rockchip: add flags for rk3328 dclk_lcdc

 .../bindings/clock/rockchip,rk3328-cru.txt         |  1 +
 drivers/clk/rockchip/clk-rk3328.c                  | 67 ++++++++++++++--------
 include/dt-bindings/clock/rk3328-cru.h             |  1 -
 3 files changed, 44 insertions(+), 25 deletions(-)

-- 
2.14.2

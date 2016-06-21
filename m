Return-Path: <zhengxing@rock-chips.com>
From: Xing Zheng <zhengxing@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Xing Zheng <zhengxing@rock-chips.com>,
	devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Yakir Yang <ykk@rock-chips.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel@vger.kernel.org,
	Kumar Gala <galak@codeaurora.org>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Rob Herring <robh+dt@kernel.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Caesar Wang <wxt@rock-chips.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/5] Fix and improve clock controller for the RK322x SoCs
Date: Tue, 21 Jun 2016 12:53:26 +0800
Message-Id: <1466484811-26923-1-git-send-email-zhengxing@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>


Hi,
  These patchset fix some clocks bugs, and improve clock configuration
for i2s/spdif/MAC on RK322x SoCs.

Thanks.


Xing Zheng (5):
  clk: rockchip: rk3228: fix incorrect clock node names
  clk: rockchip: rk3228: include downstream muxes into fractional
    dividers
  clk: rockchip: rk3228: export related i2s/spdif clocks
  clk: rockchip: rk3228: rename sclk_macphy_50m to sclk_mac_extclk
  clk: rockchip: rk3228: export related MAC clocks

 drivers/clk/rockchip/clk-rk3228.c      |  125 +++++++++++++++++++-------------
 include/dt-bindings/clock/rk3228-cru.h |   15 ++++
 2 files changed, 89 insertions(+), 51 deletions(-)

-- 
1.7.9.5

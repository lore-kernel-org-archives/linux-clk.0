Return-Path: <zhengxing@rock-chips.com>
From: Xing Zheng <zhengxing@rock-chips.com>
To: linux-rockchip@lists.infradead.org
Cc: dianders@google.com,
	heiko@sntech.de,
	Xing Zheng <zhengxing@rock-chips.com>,
	William wu <wulf@rock-chips.com>,
	Rob Herring <robh+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	linux-clk@vger.kernel.org,
	David Wu <david.wu@rock-chips.com>,
	Brian Norris <briannorris@chromium.org>,
	Lin Huang <hl@rock-chips.com>,
	Douglas Anderson <dianders@chromium.org>,
	Will Deacon <will.deacon@arm.com>,
	devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org,
	Jianqun Xu <jay.xu@rock-chips.com>,
	linux-kernel@vger.kernel.org,
	Caesar Wang <wxt@rock-chips.com>,
	Chris Zhong <zyw@rock-chips.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 0/3] Add and export clk-480m clocks for ehci and ohci on RK3399
Date: Wed, 14 Dec 2016 18:11:38 +0800
Message-Id: <1481710301-1454-1-git-send-email-zhengxing@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>


Hi,
  This patches would like to fix the USB suspend block without
the clk-480m clock. Let's add and export them to control them.

Thanks.


William wu (1):
  arm64: dts: rockchip: add clk-480m for ehci and ohci of rk3399

Xing Zheng (2):
  clk: rockchip: rk3399: add USBPHYx_480M_SRC clock IDs
  clk: rockchip: rk3399: export 480M_SRC clocks id for usbphy0/usbphy1

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 28 ++++++++++++++++++++--------
 drivers/clk/rockchip/clk-rk3399.c        |  4 ++--
 include/dt-bindings/clock/rk3399-cru.h   |  2 ++
 3 files changed, 24 insertions(+), 10 deletions(-)

-- 
2.7.4

Return-Path: <zhengxing@rock-chips.com>
From: Xing Zheng <zhengxing@rock-chips.com>
To: heiko@sntech.de
Cc: keescook@google.com,
	leozwang@google.com,
	linux-rockchip@lists.infradead.org,
	Xing Zheng <zhengxing@rock-chips.com>,
	devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-kernel@vger.kernel.org,
	Kumar Gala <galak@codeaurora.org>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/5] fix some clock configuration for the RK3036 platform
Date: Thu,  7 Jan 2016 20:17:32 +0800
Message-Id: <1452169057-24467-1-git-send-email-zhengxing@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>


Hi:
  In the development work, we found that some of the previous
incorrect clock configuration on the RK3036 platform, we should
fix them.



Xing Zheng (5):
  clk: rockchip: rk3036: fix the FLAGs for clock mux
  clk: rockchip: rk3036: fix uarts clock error
  clk: rockchip: rk3036: fix the div offset for emac clock
  clk: rockchip: rk3036: rename emac ext source clock
  clk: rockchip: rk3036: add HCLK_MAC id for emac

 drivers/clk/rockchip/clk-rk3036.c      |   28 ++++++++++++++--------------
 include/dt-bindings/clock/rk3036-cru.h |    1 +
 2 files changed, 15 insertions(+), 14 deletions(-)

-- 
1.7.9.5

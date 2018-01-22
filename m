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
Subject: [PATCH 7/7] clk: rockchip: document hdmi_phy external input for rk3328
Date: Mon, 22 Jan 2018 15:15:30 +0100
Message-Id: <20180122141530.12398-8-heiko@sntech.de>
In-Reply-To: <20180122141530.12398-1-heiko@sntech.de>
References: <20180122141530.12398-1-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

The hdmi-phy block inside the soc also loops its pll output back
into the clock controller, so document that already used input clock.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/clock/rockchip,rk3328-cru.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3328-cru.txt b/Documentation/devicetree/bindings/clock/rockchip,rk3328-cru.txt
index e71c675ba5da..904ae682ea90 100644
--- a/Documentation/devicetree/bindings/clock/rockchip,rk3328-cru.txt
+++ b/Documentation/devicetree/bindings/clock/rockchip,rk3328-cru.txt
@@ -32,6 +32,7 @@ clock-output-names:
  - "clkin_i2s" - external I2S clock - optional,
  - "gmac_clkin" - external GMAC clock - optional
  - "phy_50m_out" - output clock of the pll in the mac phy
+ - "hdmi_phy" - output clock of the hdmi phy pll - optional
 
 Example: Clock controller node:
 
-- 
2.14.2

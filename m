Return-Path: <icenowy@aosc.xyz>
From: Icenowy Zheng <icenowy@aosc.xyz>
To: robh+dt@kernel.org,
	mark.rutland@arm.com,
	maxime.ripard@free-electrons.com,
	wens@csie.org,
	emilio@elopez.com.ar
Cc: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <icenowy@aosc.xyz>
Subject: [PATCH 1/2] dt: bindings: sunxi: add binding for PLL2
Date: Wed, 29 Jun 2016 22:01:13 +0800
Message-Id: <20160629140114.58756-1-icenowy@aosc.xyz>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
---
 Documentation/devicetree/bindings/clock/sunxi.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentation/devicetree/bindings/clock/sunxi.txt
index 8f7619d..d58f36b 100644
--- a/Documentation/devicetree/bindings/clock/sunxi.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi.txt
@@ -10,6 +10,9 @@ Required properties:
 	"allwinner,sun4i-a10-pll1-clk" - for the main PLL clock and PLL4
 	"allwinner,sun6i-a31-pll1-clk" - for the main PLL clock on A31
 	"allwinner,sun8i-a23-pll1-clk" - for the main PLL clock on A23
+	"allwinner,sun4i-a10-pll2-clk" - for the audio PLL clock on A10
+	"allwinner,sun5i-a13-pll2-clk" - for the audio PLL clock on A13
+	"allwinner,sun6i-a31-pll2-clk" - for the audio PLL clock on A31
 	"allwinner,sun4i-a10-pll3-clk" - for the video PLL clock on A10
 	"allwinner,sun9i-a80-pll4-clk" - for the peripheral PLLs on A80
 	"allwinner,sun4i-a10-pll5-clk" - for the PLL5 clock
-- 
2.9.0

Return-Path: <wens@wens.csie.org>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] ARM: dts: sun9i: Fix apbs clock compatible
Date: Fri, 12 Feb 2016 17:31:15 +0800
Message-Id: <1455269475-8180-3-git-send-email-wens@csie.org>
In-Reply-To: <1455269475-8180-1-git-send-email-wens@csie.org>
References: <1455269475-8180-1-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

The APBS clock on A80 is not compatible with A23's APB0 clock. The only
reason it works is becase the lowest and default divider is the same.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun9i-a80.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun9i-a80.dtsi b/arch/arm/boot/dts/sun9i-a80.dtsi
index f68b3242b33a..2b4ce813b0ad 100644
--- a/arch/arm/boot/dts/sun9i-a80.dtsi
+++ b/arch/arm/boot/dts/sun9i-a80.dtsi
@@ -395,7 +395,7 @@
 		};
 
 		apbs: clk@0800141c {
-			compatible = "allwinner,sun8i-a23-apb0-clk";
+			compatible = "allwinner,sun9i-a80-apbs-clk";
 			reg = <0x0800141c 0x4>;
 			#clock-cells = <0>;
 			clocks = <&ahbs>;
-- 
2.7.0

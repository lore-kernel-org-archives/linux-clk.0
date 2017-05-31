Return-Path: <wens@wens.csie.org>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH v2 6/6] arm64: allwinner: a64: Add PLL_PERIPH0 clock to the R_CCU
Date: Wed, 31 May 2017 15:58:24 +0800
Message-Id: <20170531075824.657-7-wens@csie.org>
In-Reply-To: <20170531075824.657-1-wens@csie.org>
References: <20170531075824.657-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

The AR100 clock within the R_CCU (PRCM) has the PLL_PERIPH0 as one of
its parents.

This adds the reference in the device tree describing this relationship.
This patch uses a raw number for the clock index to ease merging by
avoiding cross tree dependencies.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 90dc4ec79485..4eb2f3ca602a 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -448,8 +448,9 @@
 		r_ccu: clock@1f01400 {
 			compatible = "allwinner,sun50i-a64-r-ccu";
 			reg = <0x01f01400 0x100>;
-			clocks = <&osc24M>, <&osc32k>, <&iosc>;
-			clock-names = "hosc", "losc", "iosc";
+			clocks = <&osc24M>, <&osc32k>, <&iosc>,
+				 <&ccu 11>;
+			clock-names = "hosc", "losc", "iosc", "pll-periph";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 		};
-- 
2.11.0

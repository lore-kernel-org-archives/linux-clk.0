Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mirror2.csie.ntu.edu.tw ([140.112.30.76]:51186 "EHLO
        wens.csie.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750995AbdEaH6d (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 31 May 2017 03:58:33 -0400
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@googlegroups.com
Subject: [PATCH v2 4/6] ARM: sunxi: h3-h5: Add PLL_PERIPH0 clock to the R_CCU
Date: Wed, 31 May 2017 15:58:22 +0800
Message-Id: <20170531075824.657-5-wens@csie.org>
In-Reply-To: <20170531075824.657-1-wens@csie.org>
References: <20170531075824.657-1-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The AR100 clock within the R_CCU (PRCM) has the PLL_PERIPH0 as one of
its parents.

This adds the reference in the device tree describing this relationship.
This patch uses a raw number for the clock index to ease merging by
avoiding cross tree dependencies.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sunxi-h3-h5.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sunxi-h3-h5.dtsi b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
index d0067fec99de..d4f600dbb7eb 100644
--- a/arch/arm/boot/dts/sunxi-h3-h5.dtsi
+++ b/arch/arm/boot/dts/sunxi-h3-h5.dtsi
@@ -560,8 +560,9 @@
 		r_ccu: clock@1f01400 {
 			compatible = "allwinner,sun8i-h3-r-ccu";
 			reg = <0x01f01400 0x100>;
-			clocks = <&osc24M>, <&osc32k>, <&iosc>;
-			clock-names = "hosc", "losc", "iosc";
+			clocks = <&osc24M>, <&osc32k>, <&iosc>,
+				 <&ccu 9>;
+			clock-names = "hosc", "losc", "iosc", "pll-periph";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 		};
-- 
2.11.0


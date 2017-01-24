Return-Path: <wens@wens.csie.org>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH 10/11] arm64: dts: allwinner: Remove no longer used pinctrl/sun4i-a10.h header
Date: Tue, 24 Jan 2017 10:32:29 +0800
Message-Id: <20170124023230.3990-11-wens@csie.org>
In-Reply-To: <20170124023230.3990-1-wens@csie.org>
References: <20170124023230.3990-1-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

All dts files for the sunxi platform have been switched to the generic
pinconf bindings. As a result, the sunxi specific pinctrl macros are
no longer used.

Remove the #include entry with the following command:

    sed -i -e '/pinctrl\/sun4i-a10.h/D' \
	arch/arm64/boot/dts/allwinner/*.dts?

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index 99b6bb1e141c..6ec831177b22 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -44,7 +44,6 @@
 
 #include <dt-bindings/clock/sun50i-a64-ccu.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
-#include <dt-bindings/pinctrl/sun4i-a10.h>
 #include <dt-bindings/reset/sun50i-a64-ccu.h>
 
 / {
-- 
2.11.0

Return-Path: <wens@mirror2.csie.ntu.edu.tw>
From: Chen-Yu Tsai <wens@csie.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Emilio Lopez <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: [PATCH resend 6/6] ARM: dts: sun7i: Add VE (Video Engine) module clock node
Date: Sat,  5 Dec 2015 21:16:47 +0800
Message-Id: <1449321407-4531-7-git-send-email-wens@csie.org>
In-Reply-To: <1449321407-4531-1-git-send-email-wens@csie.org>
References: <1449321407-4531-1-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

The video engine has its own module clock, which also includes a
reset control for it.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun7i-a20.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index 21169c0a6627..0940a788f824 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -527,6 +527,15 @@
 					     "dram_de_mp", "dram_ace";
 		};
 
+		ve_clk: clk@01c2013c {
+			#clock-cells = <0>;
+			#reset-cells = <0>;
+			compatible = "allwinner,sun4i-a10-ve-clk";
+			reg = <0x01c2013c 0x4>;
+			clocks = <&pll4>;
+			clock-output-names = "ve";
+		};
+
 		codec_clk: clk@01c20140 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-codec-clk";
-- 
2.6.2

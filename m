Return-Path: <vishnupatekar0510@gmail.com>
Return-Path: <vishnupatekar0510@gmail.com>
From: Vishnu Patekar <vishnupatekar0510@gmail.com>
To: robh+dt@kernel.org,
	corbet@lwn.net,
	pawel.moll@arm.com,
	mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk,
	galak@codeaurora.org,
	maxime.ripard@free-electrons.com,
	linux@arm.linux.org.uk,
	emilio@elopez.com.ar
Cc: jenskuske@gmail.com,
	hdegoede@redhat.com,
	wens@csie.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com,
	linux-gpio@vger.kernel.org,
	linus.walleij@linaro.org,
	mturquette@baylibre.com,
	sboyd@codeaurora.org,
	patchesrdh@mveas.com,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 05/13] ARM: dts: sun8i-a83t: add mmc clock nodes
Date: Sat,  5 Mar 2016 23:42:58 +0800
Message-Id: <1457192586-25596-6-git-send-email-vishnupatekar0510@gmail.com>
In-Reply-To: <1457192586-25596-1-git-send-email-vishnupatekar0510@gmail.com>
References: <1457192586-25596-1-git-send-email-vishnupatekar0510@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

mmc clocks are compatible with that of earlier sun8i socs.
This adds mmc0, mmc1, and mmc2 clock nodes for A83T.

Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
Acked-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 2689af4..943d8a8 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -237,6 +237,36 @@
 					     "bus_uart2", "bus_uart3",
 					     "bus_uart4";
 		};
+
+		mmc0_clk: clk@01c20088 {
+			#clock-cells = <1>;
+			compatible = "allwinner,sun4i-a10-mmc-clk";
+			reg = <0x01c20088 0x4>;
+			clocks = <&osc24M>, <&pll6>;
+			clock-output-names = "mmc0",
+					     "mmc0_output",
+					     "mmc0_sample";
+		};
+
+		mmc1_clk: clk@01c2008c {
+			#clock-cells = <1>;
+			compatible = "allwinner,sun4i-a10-mmc-clk";
+			reg = <0x01c2008c 0x4>;
+			clocks = <&osc24M>, <&pll6>;
+			clock-output-names = "mmc1",
+					     "mmc1_output",
+					     "mmc1_sample";
+		};
+
+		mmc2_clk: clk@01c20090 {
+			#clock-cells = <1>;
+			compatible = "allwinner,sun4i-a10-mmc-clk";
+			reg = <0x01c20090 0x4>;
+			clocks = <&osc24M>, <&pll6>;
+			clock-output-names = "mmc2",
+					     "mmc2_output",
+					     "mmc2_sample";
+		};
 	};
 
 	soc {
-- 
1.9.1

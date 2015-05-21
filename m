Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH v2 5/7] ARM: sunxi: Add PLL2 support
Date: Thu, 21 May 2015 22:54:04 +0200
Message-Id: <1432241646-9511-6-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1432241646-9511-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1432241646-9511-1-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

From: Emilio López <emilio@elopez.com.ar>

This commit adds the PLL2 definition to the sun4i, sun5i and sun7i device
trees. PLL2 is used to clock audio devices.

Signed-off-by: Emilio López <emilio@elopez.com.ar>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 arch/arm/boot/dts/sun4i-a10.dtsi | 9 +++++++++
 arch/arm/boot/dts/sun5i.dtsi     | 9 +++++++++
 arch/arm/boot/dts/sun7i-a20.dtsi | 9 +++++++++
 3 files changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/sun4i-a10.dtsi b/arch/arm/boot/dts/sun4i-a10.dtsi
index 73b6143e3e91..235e5204742f 100644
--- a/arch/arm/boot/dts/sun4i-a10.dtsi
+++ b/arch/arm/boot/dts/sun4i-a10.dtsi
@@ -195,6 +195,15 @@
 			clock-output-names = "pll1";
 		};
 
+		pll2: clk@01c20008 {
+			#clock-cells = <1>;
+			compatible = "allwinner,sun4i-a10-b-pll2-clk";
+			reg = <0x01c20008 0x8>;
+			clocks = <&osc24M>;
+			clock-output-names = "pll2-1x", "pll2-2x",
+					     "pll2-4x", "pll2-8x";
+		};
+
 		pll4: clk@01c20018 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-pll1-clk";
diff --git a/arch/arm/boot/dts/sun5i.dtsi b/arch/arm/boot/dts/sun5i.dtsi
index 5f662435a935..2f553a92a6dc 100644
--- a/arch/arm/boot/dts/sun5i.dtsi
+++ b/arch/arm/boot/dts/sun5i.dtsi
@@ -102,6 +102,15 @@
 			clock-output-names = "pll1";
 		};
 
+		pll2: clk@01c20008 {
+			#clock-cells = <1>;
+			compatible = "allwinner,sun4i-a10-b-pll2-clk";
+			reg = <0x01c20008 0x8>;
+			clocks = <&osc24M>;
+			clock-output-names = "pll2-1x", "pll2-2x",
+					     "pll2-4x", "pll2-8x";
+		};
+
 		pll4: clk@01c20018 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun4i-a10-pll1-clk";
diff --git a/arch/arm/boot/dts/sun7i-a20.dtsi b/arch/arm/boot/dts/sun7i-a20.dtsi
index e04cdf9d53f9..0141cc9876a7 100644
--- a/arch/arm/boot/dts/sun7i-a20.dtsi
+++ b/arch/arm/boot/dts/sun7i-a20.dtsi
@@ -199,6 +199,15 @@
 			clock-output-names = "pll1";
 		};
 
+		pll2: clk@01c20008 {
+			#clock-cells = <1>;
+			compatible = "allwinner,sun4i-a10-b-pll2-clk";
+			reg = <0x01c20008 0x8>;
+			clocks = <&osc24M>;
+			clock-output-names = "pll2-1x", "pll2-2x",
+					     "pll2-4x", "pll2-8x";
+		};
+
 		pll4: clk@01c20018 {
 			#clock-cells = <0>;
 			compatible = "allwinner,sun7i-a20-pll4-clk";
-- 
2.4.1

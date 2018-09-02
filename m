Return-Path: <jernej.skrabec@siol.net>
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: robh+dt@kernel.org,
	maxime.ripard@bootlin.com,
	wens@csie.org
Cc: mark.rutland@arm.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	airlied@linux.ie,
	architt@codeaurora.org,
	a.hajda@samsung.com,
	jernej.skrabec@siol.net,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-sunxi@googlegroups.com,
	Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 02/27] arm64: allwinner: h6: add system controller device tree node
Date: Sun,  2 Sep 2018 09:26:18 +0200
Message-Id: <20180902072643.4917-3-jernej.skrabec@siol.net>
In-Reply-To: <20180902072643.4917-1-jernej.skrabec@siol.net>
References: <20180902072643.4917-1-jernej.skrabec@siol.net>
List-ID: <linux-clk.vger.kernel.org>

From: Icenowy Zheng <icenowy@aosc.io>

As we have already binding for the H6 system controller, add its node
to the device tree.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
[fixed compatible string]
Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi | 23 ++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
index cfa5fffcf62b..040828d2e2c0 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi
@@ -92,6 +92,29 @@
 		#size-cells = <1>;
 		ranges;
 
+		syscon: syscon@3000000 {
+			compatible = "allwinner,sun50i-h6-system-control",
+				     "allwinner,sun50i-a64-system-control";
+			reg = <0x03000000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			sram_c: sram@28000 {
+				compatible = "mmio-sram";
+				reg = <0x00028000 0x1e000>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges = <0 0x00028000 0x1e000>;
+
+				de2_sram: sram-section@0 {
+					compatible = "allwinner,sun50i-h6-sram-c",
+						     "allwinner,sun50i-a64-sram-c";
+					reg = <0x0000 0x1e000>;
+				};
+			};
+		};
+
 		ccu: clock@3001000 {
 			compatible = "allwinner,sun50i-h6-ccu";
 			reg = <0x03001000 0x1000>;
-- 
2.18.0

Return-Path: <mturquette@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
To: linux-clk@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com,
	carlo@endlessm.com,
	victor.wan@amlogic.com,
	jerry.cao@amlogic.com,
	xing.xu@amlogic.com
Subject: [PATCH 7/7] arm64: dts: gxbb clock controller
Date: Thu,  9 Jun 2016 17:32:54 -0700
Message-Id: <1465518774-26924-8-git-send-email-mturquette@baylibre.com>
In-Reply-To: <1465518774-26924-1-git-send-email-mturquette@baylibre.com>
References: <1465518774-26924-1-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Add the clock controller node for the AmLogic GXBB machine.

Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 832815d..3badfab 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -174,5 +174,12 @@
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xd0000000 0x0 0x200000>;
 		};
+
+		clkc: clock-controller@c883c000 {
+			compatible = "amlogic,gxbb-clkc";
+			#clock-cells = <1>;
+			reg = <0x0 0xc883c000 0x0 0x3db>;
+		};
+
 	};
 };
-- 
2.1.4

Return-Path: <linus.walleij@linaro.org>
Return-Path: <linus.walleij@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 3/3] clk: add bindings for the Ux500 clocks
Date: Thu, 30 Jul 2015 15:20:00 +0200
Message-Id: <1438262400-29213-1-git-send-email-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

These Ux500 clocks have been around for years and were never
properly documented. Add the proper binding documentation.

Cc: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Ulf/Mike: please ACK this patch so I can take it through
ARM SoC.
---
 Documentation/devicetree/bindings/clock/ux500.txt | 64 +++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/ux500.txt

diff --git a/Documentation/devicetree/bindings/clock/ux500.txt b/Documentation/devicetree/bindings/clock/ux500.txt
new file mode 100644
index 000000000000..e52bd4b72348
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ux500.txt
@@ -0,0 +1,64 @@
+Clock bindings for ST-Ericsson Ux500 clocks
+
+Required properties :
+- compatible : shall contain only one of the following:
+  "stericsson,u8500-clks"
+  "stericsson,u8540-clks"
+  "stericsson,u9540-clks"
+- reg : shall contain base register location and length for
+  CLKRST1, 2, 3, 5, and 6 in an array. Note the absence of
+  CLKRST4, which does not exist.
+
+Required subnodes:
+- prcmu-clock: a subnode with one clock cell for PRCMU (power,
+  reset, control unit) clocks. The cell indicates which PRCMU
+  clock in the prcmu-clock node the consumer wants to use.
+- prcc-periph-clock: a subnode with two clock cells for
+  PRCC (programmable reset- and clock controller) peripheral clocks.
+  The first cell indicates which PRCC block the consumer
+  wants to use, possible values are 1, 2, 3, 5, 6. The second
+  cell indicates which clock inside the PRCC block it wants,
+  possible values are 0 thru 31.
+- prcc-kernel-clock: a subnode with two clock cells for
+  PRCC (programmable reset- and clock controller) kernel clocks
+  The first cell indicates which PRCC block the consumer
+  wants to use, possible values are 1, 2, 3, 5, 6. The second
+  cell indicates which clock inside the PRCC block it wants,
+  possible values are 0 thru 31.
+- rtc32k-clock: a subnode with zero clock cells for the 32kHz
+  RTC clock.
+- smp-twd-clock: a subnode for the ARM SMP Timer Watchdog cluster
+  with zero clock cells.
+
+Example:
+
+clocks {
+	compatible = "stericsson,u8500-clks";
+	/*
+	 * Registers for the CLKRST block on peripheral
+	 * groups 1, 2, 3, 5, 6,
+	 */
+	reg = <0x8012f000 0x1000>, <0x8011f000 0x1000>,
+	    <0x8000f000 0x1000>, <0xa03ff000 0x1000>,
+	    <0xa03cf000 0x1000>;
+
+	prcmu_clk: prcmu-clock {
+		#clock-cells = <1>;
+	};
+
+	prcc_pclk: prcc-periph-clock {
+		#clock-cells = <2>;
+	};
+
+	prcc_kclk: prcc-kernel-clock {
+		#clock-cells = <2>;
+	};
+
+	rtc_clk: rtc32k-clock {
+		#clock-cells = <0>;
+	};
+
+	smp_twd_clk: smp-twd-clock {
+		#clock-cells = <0>;
+	};
+};
-- 
2.4.3

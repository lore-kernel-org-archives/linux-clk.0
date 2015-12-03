Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org,
	agross@codeaurora.org
Cc: mturquette@baylibre.com,
	linux-clk@vger.kernel.org,
	bjorn.andersson@sonymobile.com,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH v5 5/6] arm: dts: qcom: apq8064: Add fixed rate on-board oscillators
Date: Thu,  3 Dec 2015 16:02:55 +0200
Message-Id: <1449151376-25930-6-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1449151376-25930-1-git-send-email-georgi.djakov@linaro.org>
References: <1449151376-25930-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Currently the rates of the xo and sleep clocks are hard-coded in the
GCC driver, but this is a board layout description that actually should
be in the DT. Moving them into DT also allows us to insert the RPM
controlled clocks between the DT and GCC clocks.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 276fef28fc1e..eb929f2693b2 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -81,6 +81,26 @@
 		interrupts = <1 10 0x304>;
 	};
 
+	clocks {
+		cxo_board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <19200000>;
+		};
+
+		pxo_board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <27000000>;
+		};
+
+		sleep_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+		};
+	};
+
 	soc: soc {
 		#address-cells = <1>;
 		#size-cells = <1>;

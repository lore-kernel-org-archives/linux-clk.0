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
Subject: [PATCH v5 2/6] arm64: dts: qcom: msm8916: Add fixed rate on-board oscillators
Date: Thu,  3 Dec 2015 16:02:52 +0200
Message-Id: <1449151376-25930-3-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1449151376-25930-1-git-send-email-georgi.djakov@linaro.org>
References: <1449151376-25930-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Currently the rates of the xo and sleep clocks are hard-coded in the
GCC driver, but this is a board layout description that actually should
be in the DT. Moving them into DT also allows us to insert the RPM
controlled clocks between the DT and GCC clocks.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 80cf15087d01..d577127cc81e 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -95,6 +95,20 @@
 			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	clocks {
+		xo_board: xo_board {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <19200000>;
+		};
+
+		sleep_clk: sleep_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+		};
+	};
+
 	soc: soc {
 		#address-cells = <1>;
 		#size-cells = <1>;

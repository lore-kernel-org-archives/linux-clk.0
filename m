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
Subject: [PATCH v3 4/8] arm64: dts: qcom: 8x16: Add fixed rate sleep clock oscillator
Date: Tue, 20 Oct 2015 19:57:56 +0300
Message-Id: <1445360280-2347-5-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1445360280-2347-1-git-send-email-georgi.djakov@linaro.org>
References: <1445360280-2347-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

The sleep clock oscillator should be in the DT instead of being
hard-coded into the clock drivers.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 355a2acea796..fda4d5cd574a 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -87,6 +87,13 @@
 			clock-frequency = <19200000>;
 			clock-output-names = "xo_board";
 		};
+
+		sleep_clk: sleep_clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+			clock-output-names = "sleep_clk_src";
+		};
 	};
 
 	soc: soc {

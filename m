Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
To: sboyd@codeaurora.org,
	agross@codeaurora.org
Cc: mturquette@linaro.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	georgi.djakov@linaro.org
Subject: [PATCH v2 5/5] arm64: dts: qcom: msm8916: Add A53 DT node
Date: Fri, 24 Jul 2015 19:58:39 +0300
Message-Id: <1437757119-6910-6-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1437757119-6910-1-git-send-email-georgi.djakov@linaro.org>
References: <1437757119-6910-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Add nodes for the A53 clocks and apcs, so that the driver
can probe and register the clocks.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index fd4813e9696b..14cb08cd59af 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -320,6 +320,18 @@
 			reg = <0x1800000 0x80000>;
 		};
 
+		apcs: syscon@b011000 {
+			compatible = "syscon";
+			reg = <0x0b011000 0x1000>;
+		};
+
+		a53cc: qcom,a53cc@0b016000 {
+			compatible = "qcom,clock-a53-msm8916";
+			reg = <0x0b016000 0x40>;
+			#clock-cells = <1>;
+			qcom,apcs = <&apcs>;
+		};
+
 		blsp1_uart2: serial@78b0000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
 			reg = <0x78b0000 0x200>;

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
Subject: [PATCH v5 3/6] arm64: dts: qcom: msm8916: Add RPMCC DT node
Date: Thu,  3 Dec 2015 16:02:53 +0200
Message-Id: <1449151376-25930-4-git-send-email-georgi.djakov@linaro.org>
In-Reply-To: <1449151376-25930-1-git-send-email-georgi.djakov@linaro.org>
References: <1449151376-25930-1-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Add the RPM Clock Controller DT node and include the necessary header
file for clocks.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index d577127cc81e..1cb88b3ce498 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -15,6 +15,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-msm8916.h>
 #include <dt-bindings/reset/qcom,gcc-msm8916.h>
+#include <dt-bindings/clock/qcom,rpmcc.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. MSM8916";
@@ -168,6 +169,11 @@
 				rpm_requests {
 					compatible = "qcom,rpm-msm8916";
 					qcom,smd-channels = "rpm_requests";
+
+					rpmcc: qcom,rpmcc {
+						compatible = "qcom,rpmcc-msm8916", "qcom,rpmcc";
+						#clock-cells = <1>;
+					};
 				};
 			};
 		};

Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:36084 "EHLO
        mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751902AbdCPMzK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Mar 2017 08:55:10 -0400
Received: by mail-wm0-f51.google.com with SMTP id n11so111207130wma.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2017 05:55:09 -0700 (PDT)
From: Georgi Djakov <georgi.djakov@linaro.org>
To: andy.gross@linaro.org
Cc: bjorn.andersson@linaro.org, sboyd@codeaurora.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, georgi.djakov@linaro.org
Subject: [PATCH v2 1/2] ARM: dts: qcom: msm8974: Add RPMCC DT node
Date: Thu, 16 Mar 2017 14:55:09 +0200
Message-Id: <20170316125509.13717-1-georgi.djakov@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add the RPM Clock Controller DT node for msm8974-based platforms, so that
drivers can use the clocks provided by the RPM processor.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1 (https://lkml.org/lkml/2017/2/3/492)
 * Added Bjorn's Reviewed-by

 arch/arm/boot/dts/qcom-msm8974.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index d3e1a61b8671..4b4c61e2ee35 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -2,6 +2,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,gcc-msm8974.h>
+#include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/reset/qcom,gcc-msm8974.h>
 #include "skeleton.dtsi"
@@ -760,6 +761,11 @@
 				compatible = "qcom,rpm-msm8974";
 				qcom,smd-channels = "rpm_requests";
 
+				rpmcc: clock-controller {
+					compatible = "qcom,rpmcc-msm8974", "qcom,rpmcc";
+					#clock-cells = <1>;
+				};
+
 				pm8841-regulators {
 					compatible = "qcom,rpm-pm8841-regulators";
 

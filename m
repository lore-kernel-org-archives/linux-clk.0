Return-Path: <rnayak@codeaurora.org>
From: Rajendra Nayak <rnayak@codeaurora.org>
To: sboyd@codeaurora.org,
	mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 6/6] arm64: dts: msm8996: Add CPU clock controller node
Date: Wed,  5 Apr 2017 10:25:29 +0530
Message-Id: <1491368129-24721-7-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1491368129-24721-1-git-send-email-rnayak@codeaurora.org>
References: <1491368129-24721-1-git-send-email-rnayak@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Add the DT node for Kryo CPU clock controller on msm8996
devices.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index ed7223d..baae195 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -311,6 +311,12 @@
 			reg = <0x300000 0x90000>;
 		};
 
+		kryocc: clock-controller@6400000 {
+			compatible = "qcom,apcc-msm8996";
+			reg = <0x6400000 0x90000>;
+			#clock-cells = <1>;
+		};
+
 		blsp1_spi0: spi@07575000 {
 			compatible = "qcom,spi-qup-v2.2.1";
 			reg = <0x07575000 0x600>;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

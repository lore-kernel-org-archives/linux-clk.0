Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:38986 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750912AbcKGLeh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Nov 2016 06:34:37 -0500
From: Ritesh Harjani <riteshh@codeaurora.org>
To: ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        adrian.hunter@intel.com, shawn.lin@rock-chips.com,
        sboyd@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        david.brown@linaro.org, andy.gross@linaro.org,
        linux-arm-msm@vger.kernel.org, georgi.djakov@linaro.org,
        alex.lemberg@sandisk.com, mateusz.nowak@intel.com,
        Yuliy.Izrailov@sandisk.com, asutoshd@codeaurora.org,
        kdorfman@codeaurora.org, david.griego@linaro.org,
        stummala@codeaurora.org, venkatg@codeaurora.org,
        rnayak@codeaurora.org, pramod.gurav@linaro.org,
        Ritesh Harjani <riteshh@codeaurora.org>
Subject: [PATCH v6 10/14] arm64: dts: qcom: msm8916: Add ddr support to sdhc1
Date: Mon,  7 Nov 2016 16:54:33 +0530
Message-Id: <1478517877-23733-11-git-send-email-riteshh@codeaurora.org>
In-Reply-To: <1478517877-23733-1-git-send-email-riteshh@codeaurora.org>
References: <1478517877-23733-1-git-send-email-riteshh@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

This adds mmc-ddr-1_8v support to DT for sdhc1 of msm8916.

Signed-off-by: Ritesh Harjani <riteshh@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 466ca57..ed15e87 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -514,6 +514,7 @@
 			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
 				 <&gcc GCC_SDCC1_AHB_CLK>;
 			clock-names = "core", "iface";
+			mmc-ddr-1_8v;
 			bus-width = <8>;
 			non-removable;
 			status = "disabled";
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, 
a Linux Foundation Collaborative Project.


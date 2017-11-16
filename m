Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:13408 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759924AbdKPPdV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Nov 2017 10:33:21 -0500
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
CC: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 8/8] arm64: dts: nvidia: Tegra210 CPU clock definition
Date: Thu, 16 Nov 2017 17:33:09 +0200
Message-ID: <1510846389-28712-9-git-send-email-pdeschrijver@nvidia.com>
In-Reply-To: <1510846389-28712-1-git-send-email-pdeschrijver@nvidia.com>
References: <1510846389-28712-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 813b9d8..c8d14d4 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1230,6 +1230,13 @@
 			device_type = "cpu";
 			compatible = "arm,cortex-a57";
 			reg = <0>;
+			clocks = <&tegra_car TEGRA210_CLK_CCLK_G>,
+				 <&tegra_car TEGRA210_CLK_PLL_X>,
+				 <&tegra_car TEGRA210_CLK_PLL_P_OUT_CPU>,
+				 <&dfll>;
+			clock-names = "cpu_g", "pll_x", "pll_p", "dfll";
+			/* FIXME: what's the actual transition time? */
+			clock-latency = <300000>;
 		};
 
 		cpu@1 {
-- 
1.9.1


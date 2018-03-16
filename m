Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:34228 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933025AbeCPDCk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Mar 2018 23:02:40 -0400
Received: by mail-pg0-f65.google.com with SMTP id m15so3579983pgc.1
        for <linux-clk@vger.kernel.org>; Thu, 15 Mar 2018 20:02:40 -0700 (PDT)
From: Lin Huang <hl@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
        dbasehore@chromium.org, diander@chromium.org,
        briannorris@chromium.org, shawn.lin@rock-chips.com,
        Lin Huang <hl@rock-chips.com>
Subject: [PATCH v2 2/2] arm64: dts: rockchip: assign clock rate for some cpll child clock
Date: Fri, 16 Mar 2018 11:02:28 +0800
Message-Id: <1521169348-8552-2-git-send-email-hl@rock-chips.com>
In-Reply-To: <1521169348-8552-1-git-send-email-hl@rock-chips.com>
References: <1521169348-8552-1-git-send-email-hl@rock-chips.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

These clocks do not assign default clock frequency, and use the
default cru register value to get frequency, so if cpll increase
frequency, these clocks also increase their frequency, that may
exceed their signed off frequency. So assign default clock for
them to avoid it.

Change-Id: If79368aeda5c51dbf2a3b6659f17052a2ae4a401
Signed-off-by: Lin Huang <hl@rock-chips.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi |  8 +++++++-
 arch/arm64/boot/dts/rockchip/rk3399.dtsi     | 14 ++++++++++++--
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
index 18f546f..84e367b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi
@@ -588,7 +588,10 @@
 		<&cru ACLK_PERILP0>, <&cru HCLK_PERILP0>,
 		<&cru PCLK_PERILP0>, <&cru ACLK_CCI>,
 		<&cru HCLK_PERILP1>, <&cru PCLK_PERILP1>,
-		<&cru ACLK_VIO>;
+		<&cru ACLK_VIO>,
+		<&cru ACLK_GIC_PRE>,
+		<&cru PCLK_DDR>,
+		<&cru ACLK_HDCP>;
 	assigned-clock-rates =
 		<600000000>, <800000000>,
 		<1000000000>,
@@ -597,6 +600,9 @@
 		<100000000>, <100000000>,
 		<50000000>, <800000000>,
 		<100000000>, <50000000>,
+		<400000000>,
+		<200000000>,
+		<200000000>,
 		<400000000>;
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3399.dtsi b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
index 4550c0f..b358533 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399.dtsi
@@ -315,6 +315,8 @@
 		clocks = <&cru HCLK_SDMMC>, <&cru SCLK_SDMMC>,
 			 <&cru SCLK_SDMMC_DRV>, <&cru SCLK_SDMMC_SAMPLE>;
 		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
+		assigned-clocks = <&cru HCLK_SD>;
+		assigned-clock-rates = <200000000>;
 		fifo-depth = <0x100>;
 		power-domains = <&power RK3399_PD_SD>;
 		resets = <&cru SRST_SDMMC>;
@@ -466,8 +468,10 @@
 		clocks = <&cru SCLK_DP_CORE>, <&cru PCLK_DP_CTRL>,
 			 <&cru SCLK_SPDIF_REC_DPTX>, <&cru PCLK_VIO_GRF>;
 		clock-names = "core-clk", "pclk", "spdif", "grf";
-		phys = <&tcphy0_dp>, <&tcphy1_dp>;
+		assigned-clocks = <&cru SCLK_DP_CORE>, <&cru SCLK_SPDIF_REC_DPTX>;
+		assigned-clock-rates = <100000000>, <200000000>;
 		power-domains = <&power RK3399_PD_HDCP>;
+		phys = <&tcphy0_dp>, <&tcphy1_dp>;
 		resets = <&cru SRST_DPTX_SPDIF_REC>, <&cru SRST_P_UPHY0_DPTX>,
 			 <&cru SRST_P_UPHY0_APB>, <&cru SRST_DP_CORE>;
 		reset-names = "spdif", "dptx", "apb", "core";
@@ -1323,7 +1327,10 @@
 			<&cru ACLK_PERILP0>, <&cru HCLK_PERILP0>,
 			<&cru PCLK_PERILP0>, <&cru ACLK_CCI>,
 			<&cru HCLK_PERILP1>, <&cru PCLK_PERILP1>,
-			<&cru ACLK_VIO>;
+			<&cru ACLK_VIO>,
+			<&cru ACLK_GIC_PRE>,
+			<&cru PCLK_DDR>,
+			<&cru ACLK_HDCP>;
 		assigned-clock-rates =
 			 <594000000>,  <800000000>,
 			<1000000000>,
@@ -1332,6 +1339,9 @@
 			 <100000000>,  <100000000>,
 			  <50000000>, <600000000>,
 			 <100000000>,   <50000000>,
+			 <400000000>,
+			 <200000000>,
+			 <200000000>,
 			 <400000000>;
 	};
 
-- 
2.7.4


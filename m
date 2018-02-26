Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:41081 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752538AbeBZMyI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Feb 2018 07:54:08 -0500
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 6/6] ARM: dts: exynos: Remove obsolete clock properties
 from power domains
Date: Mon, 26 Feb 2018 13:53:55 +0100
Message-id: <20180226125355.9052-7-m.szyprowski@samsung.com>
In-reply-to: <20180226125355.9052-1-m.szyprowski@samsung.com>
References: <20180226125355.9052-1-m.szyprowski@samsung.com>
        <CGME20180226125404eucas1p235469ad425d99e51cfa4163124f66b26@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Handling of special clock operations on power domain on/off sequences has
been moved to respective Exynos clock controller drivers and clock properties
have been marked as deprecated. Remove all clock properties from existing
Exynos power domain nodes, as they are no longer used.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |  4 ----
 arch/arm/boot/dts/exynos5420.dtsi | 14 --------------
 2 files changed, 18 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 56626d1a4235..38f216f9f5ad 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -134,10 +134,6 @@
 			reg = <0x100440A0 0x20>;
 			#power-domain-cells = <0>;
 			label = "DISP1";
-			clocks = <&clock CLK_FIN_PLL>,
-				 <&clock CLK_MOUT_ACLK200_DISP1_SUB>,
-				 <&clock CLK_MOUT_ACLK300_DISP1_SUB>;
-			clock-names = "oscclk", "clk0", "clk1";
 		};
 
 		pd_mau: power-domain@100440c0 {
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 2f3cb2a97f71..9672d0e51f69 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -276,10 +276,6 @@
 			reg = <0x10044000 0x20>;
 			#power-domain-cells = <0>;
 			label = "GSC";
-			clocks = <&clock CLK_FIN_PLL>,
-				 <&clock CLK_MOUT_USER_ACLK300_GSCL>,
-				 <&clock CLK_GSCL0>, <&clock CLK_GSCL1>;
-			clock-names = "oscclk", "clk0", "asb0", "asb1";
 		};
 
 		isp_pd: power-domain@10044020 {
@@ -292,10 +288,6 @@
 		mfc_pd: power-domain@10044060 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10044060 0x20>;
-			clocks = <&clock CLK_FIN_PLL>,
-				 <&clock CLK_MOUT_USER_ACLK333>,
-				 <&clock CLK_ACLK333>;
-			clock-names = "oscclk", "clk0","asb0";
 			#power-domain-cells = <0>;
 			label = "MFC";
 		};
@@ -312,12 +304,6 @@
 			reg = <0x100440C0 0x20>;
 			#power-domain-cells = <0>;
 			label = "DISP";
-			clocks = <&clock CLK_FIN_PLL>,
-				 <&clock CLK_MOUT_USER_ACLK200_DISP1>,
-				 <&clock CLK_MOUT_USER_ACLK300_DISP1>,
-				 <&clock CLK_MOUT_USER_ACLK400_DISP1>,
-				 <&clock CLK_FIMD1>, <&clock CLK_MIXER>;
-			clock-names = "oscclk", "clk0", "clk1", "clk2", "asb0", "asb1";
 		};
 
 		mau_pd: power-domain@100440e0 {
-- 
2.15.0


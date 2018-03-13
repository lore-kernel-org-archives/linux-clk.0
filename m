Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39213 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932514AbeCMKqZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Mar 2018 06:46:25 -0400
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2] clk: samsung: exynos5250: Add missing clocks for FIMC
 LITE SYSMMU devices
Date: Tue, 13 Mar 2018 11:46:12 +0100
Message-id: <20180313104612.24257-1-m.szyprowski@samsung.com>
References: <CGME20180313104621eucas1p1905014d182b444b86605d07702e91533@eucas1p1.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

FIMC LITE SYSMMU devices are defined in exynos5250.dtsi, but clocks for
them are not instantiated by Exynos5250 clock provider driver. Add needed
definitions for those clocks to fix IOMMU probe failure:

ERROR: could not get clock /soc/sysmmu@13c40000:sysmmu(0)
exynos-sysmmu 13c40000.sysmmu: Failed to get device clock(s)!
exynos-sysmmu: probe of 13c40000.sysmmu failed with error -38
ERROR: could not get clock /soc/sysmmu@13c50000:sysmmu(0)
exynos-sysmmu 13c50000.sysmmu: Failed to get device clock(s)!
exynos-sysmmu: probe of 13c50000.sysmmu failed with error -38

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Fixes: bfed1074f213 ("clk: exynos5250: Add missing sysmmu clocks for DISP and ISP blocks")
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/clk/samsung/clk-exynos5250.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 06e5ddcb30db..347fd80c351b 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -561,6 +561,8 @@ static const struct samsung_gate_clock exynos5250_gate_clks[] __initconst = {
 		0),
 	GATE(CLK_GSCL3, "gscl3", "mout_aclk266_gscl_sub", GATE_IP_GSCL, 3, 0,
 		0),
+	GATE(CLK_CAMIF_TOP, "camif_top", "mout_aclk266_gscl_sub",
+			GATE_IP_GSCL, 4, 0, 0),
 	GATE(CLK_GSCL_WA, "gscl_wa", "div_gscl_wa", GATE_IP_GSCL, 5, 0, 0),
 	GATE(CLK_GSCL_WB, "gscl_wb", "div_gscl_wb", GATE_IP_GSCL, 6, 0, 0),
 	GATE(CLK_SMMU_GSCL0, "smmu_gscl0", "mout_aclk266_gscl_sub",
@@ -571,6 +573,10 @@ static const struct samsung_gate_clock exynos5250_gate_clks[] __initconst = {
 			GATE_IP_GSCL, 9, 0, 0),
 	GATE(CLK_SMMU_GSCL3, "smmu_gscl3", "mout_aclk266_gscl_sub",
 			GATE_IP_GSCL, 10, 0, 0),
+	GATE(CLK_SMMU_FIMC_LITE0, "smmu_fimc_lite0", "mout_aclk266_gscl_sub",
+			GATE_IP_GSCL, 11, 0, 0),
+	GATE(CLK_SMMU_FIMC_LITE1, "smmu_fimc_lite1", "mout_aclk266_gscl_sub",
+			GATE_IP_GSCL, 12, 0, 0),
 
 
 	GATE(CLK_MFC, "mfc", "mout_aclk333_sub", GATE_IP_MFC, 0, 0, 0),
-- 
2.15.0


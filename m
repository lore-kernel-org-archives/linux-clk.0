Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:36800 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934236AbdA0LnK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Jan 2017 06:43:10 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OKF00LPTQZBZG80@mailout4.w1.samsung.com> for
 linux-clk@vger.kernel.org; Fri, 27 Jan 2017 11:09:11 +0000 (GMT)
Received: from eusmges1.samsung.com (unknown [203.254.199.239])
 by     eucas1p2.samsung.com (KnoxPortal)
 with ESMTP id  20170127110910eucas1p27e546496b621768c8c2b29dc16d69e90~dnFdRprk_0375503755eucas1p2D
        for <linux-clk@vger.kernel.org>; Fri, 27 Jan 2017 11:09:10 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179])
 by     eucas1p1.samsung.com (KnoxPortal)
 with ESMTP id  20170127110910eucas1p115bb34a2a9148fddfc74b768f4ef588a~dnFclCCyl3025130251eucas1p1S
        for <linux-clk@vger.kernel.org>; Fri, 27 Jan 2017 11:09:10 +0000 (GMT)
Received: from AMDC2765.digital.local ([106.116.147.25])
 by     eusync1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit  (built May  5 2014))
 with ESMTPA id <0OKF001FRQZ1L520@eusync1.samsung.com>  for
 linux-clk@vger.kernel.org; Fri, 27 Jan 2017 11:09:10 +0000 (GMT)
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org
Subject: [PATCH v2 RESEND 2/3] clk: samsung: exynos5433: Add data for 250MHz
 and 278MHz PLL rates
Date: Fri, 27 Jan 2017 12:09:01 +0100
Message-id: <1485515341-29911-3-git-send-email-m.szyprowski@samsung.com>
In-reply-to: <1485515341-29911-1-git-send-email-m.szyprowski@samsung.com>
References: <1485515341-29911-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170127110910eucas1p115bb34a2a9148fddfc74b768f4ef588a@eucas1p1.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Default clock configuration applied by the bootloader for TM2 and TM2e
boards includes 250MHz and 278MHz rate for DISP PLL clock. To ensure such
configuration for those boards with 'assigned-clocks*' properties,
parameters for those two additional rates are needed.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 6ee91ae875c3..11343a597093 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -739,7 +739,9 @@
 	PLL_35XX_RATE(350000000U,  350, 6,  2),
 	PLL_35XX_RATE(333000000U,  222, 4,  2),
 	PLL_35XX_RATE(300000000U,  500, 5,  3),
+	PLL_35XX_RATE(278000000U,  556, 6,  3),
 	PLL_35XX_RATE(266000000U,  532, 6,  3),
+	PLL_35XX_RATE(250000000U,  500, 6,  3),
 	PLL_35XX_RATE(200000000U,  400, 6,  3),
 	PLL_35XX_RATE(166000000U,  332, 6,  3),
 	PLL_35XX_RATE(160000000U,  320, 6,  3),
-- 
1.9.1


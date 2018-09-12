Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:34775 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726640AbeILSV2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Sep 2018 14:21:28 -0400
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] clk: samsung: exynos5433: Keep sclk_uart clocks enabled in
 suspend
Date: Wed, 12 Sep 2018 15:16:41 +0200
Message-id: <20180912131641.21688-1-m.szyprowski@samsung.com>
References: <CGME20180912131657eucas1p2eecc0e4a01ed9ddbf4417c17eba0fee0@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

All sclk_uart clocks in TOP CMU have to be kept enabled for suspend/resume
cycle, otherwise TM2(e) boards hangs before entering the suspend mode.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
This change was missing in the initial patch, because 'no_console_suspend'
kernel option did almost the same.
---
 drivers/clk/samsung/clk-exynos5433.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 13384f4911c7..84eac0ce5682 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -180,6 +180,8 @@ static const unsigned long top_clk_regs[] __initconst = {
 static const struct samsung_clk_reg_dump top_suspend_regs[] = {
 	/* force all aclk clocks enabled */
 	{ ENABLE_ACLK_TOP, 0x67ecffed },
+	/* force all sclk_uart clocks enabled */
+	{ ENABLE_SCLK_TOP_PERIC, 0x38 },
 	/* ISP PLL has to be enabled for suspend: reset value + ENABLE bit */
 	{ ISP_PLL_CON0, 0x85cc0502 },
 	/* ISP PLL has to be enabled for suspend: reset value + ENABLE bit */
-- 
2.17.1

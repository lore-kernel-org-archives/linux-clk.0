Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:39493 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727229AbeIXRDA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Sep 2018 13:03:00 -0400
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] clk: samsung: exynos5420: Enable PERIS clocks for suspend
Date: Mon, 24 Sep 2018 13:01:20 +0200
Message-id: <20180924110120.21319-1-m.szyprowski@samsung.com>
References: <CGME20180924110126eucas1p221aba92e694fcdf2f0f288f20a0b07a2@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Ensure that clocks for core SoC modules (including TZPC0..9 modules)
are enabled for suspend/resume cycle. This fixes suspend/resume
support on Exynos5422-based Odroid XU3/XU4 boards.

Suggested-by: Joonyoung Shim <jy0922.shim@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index a2d6e7f4bcd3..34cce3c5898f 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -276,6 +276,7 @@ static const struct samsung_clk_reg_dump exynos5420_set_clksrc[] = {
 	{ .offset = GATE_BUS_TOP,		.value = 0xffffffff, },
 	{ .offset = GATE_BUS_DISP1,		.value = 0xffffffff, },
 	{ .offset = GATE_IP_PERIC,		.value = 0xffffffff, },
+	{ .offset = GATE_IP_PERIS,		.value = 0xffffffff, },
 };
 
 /* list of all parent clocks */
-- 
2.17.1

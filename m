Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48364 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730272AbeIFUi6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Sep 2018 16:38:58 -0400
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 1/2] clk: samsung: Use NOIRQ stage for Exynos5433 clocks
 suspend/resume
Date: Thu, 06 Sep 2018 18:02:35 +0200
Message-id: <20180906160236.4326-2-m.szyprowski@samsung.com>
In-reply-to: <20180906160236.4326-1-m.szyprowski@samsung.com>
References: <20180906160236.4326-1-m.szyprowski@samsung.com>
        <CGME20180906160245eucas1p257fef879d3bb6127cb1afa6c357a953f@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

SoC clock drivers should suspend after every other drivers in the system,
which are using clocks and resume before them. The last stage for calling
suspend device callbacks is NOIRQ stage and there exists driver, which use
that state (dwmmc-exynos), so Exynos5433 clocks driver should also use it.
During the same stage, clocks driver will be always suspended after its
clients as a direct result of proper device probe order (deferred probe
reorders the suspend call sequence).

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/samsung/clk-exynos5433.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 162de44df099..426980514e67 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -5630,7 +5630,7 @@ static const struct of_device_id exynos5433_cmu_of_match[] = {
 static const struct dev_pm_ops exynos5433_cmu_pm_ops = {
 	SET_RUNTIME_PM_OPS(exynos5433_cmu_suspend, exynos5433_cmu_resume,
 			   NULL)
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				     pm_runtime_force_resume)
 };
 
-- 
2.17.1

Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55854 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729250AbeH2Tsi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Aug 2018 15:48:38 -0400
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 07/10] clk: samsung: exynos5250: Use generic helper for
 handling suspend/resume
Date: Wed, 29 Aug 2018 17:50:43 +0200
Message-id: <20180829155046.29359-8-m.szyprowski@samsung.com>
In-reply-to: <20180829155046.29359-1-m.szyprowski@samsung.com>
References: <20180829155046.29359-1-m.szyprowski@samsung.com>
        <CGME20180829155101eucas1p22b694bf6395d8efcb33ba3802e287c88@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Replace common suspend/resume handling code by generic helper.
No functional change.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5250.c | 42 ++--------------------------
 1 file changed, 2 insertions(+), 40 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 347fd80c351b..f14139bcb0c1 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -14,7 +14,6 @@
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/syscore_ops.h>
 
 #include "clk.h"
 #include "clk-cpu.h"
@@ -111,9 +110,6 @@ enum exynos5250_plls {
 
 static void __iomem *reg_base;
 
-#ifdef CONFIG_PM_SLEEP
-static struct samsung_clk_reg_dump *exynos5250_save;
-
 /*
  * list of controller registers to be saved and restored during a
  * suspend/resume cycle.
@@ -172,41 +168,6 @@ static const unsigned long exynos5250_clk_regs[] __initconst = {
 	GATE_IP_ISP1,
 };
 
-static int exynos5250_clk_suspend(void)
-{
-	samsung_clk_save(reg_base, exynos5250_save,
-				ARRAY_SIZE(exynos5250_clk_regs));
-
-	return 0;
-}
-
-static void exynos5250_clk_resume(void)
-{
-	samsung_clk_restore(reg_base, exynos5250_save,
-				ARRAY_SIZE(exynos5250_clk_regs));
-}
-
-static struct syscore_ops exynos5250_clk_syscore_ops = {
-	.suspend = exynos5250_clk_suspend,
-	.resume = exynos5250_clk_resume,
-};
-
-static void __init exynos5250_clk_sleep_init(void)
-{
-	exynos5250_save = samsung_clk_alloc_reg_dump(exynos5250_clk_regs,
-					ARRAY_SIZE(exynos5250_clk_regs));
-	if (!exynos5250_save) {
-		pr_warn("%s: failed to allocate sleep save data, no sleep support!\n",
-			__func__);
-		return;
-	}
-
-	register_syscore_ops(&exynos5250_clk_syscore_ops);
-}
-#else
-static void __init exynos5250_clk_sleep_init(void) {}
-#endif
-
 /* list of all parent clock list */
 PNAME(mout_apll_p)	= { "fin_pll", "fout_apll", };
 PNAME(mout_cpu_p)	= { "mout_apll", "mout_mpll", };
@@ -882,7 +843,8 @@ static void __init exynos5250_clk_init(struct device_node *np)
 		PWR_CTRL2_CORE2_UP_RATIO | PWR_CTRL2_CORE1_UP_RATIO);
 	__raw_writel(tmp, reg_base + PWR_CTRL2);
 
-	exynos5250_clk_sleep_init();
+	samsung_clk_sleep_init(reg_base, exynos5250_clk_regs,
+			       ARRAY_SIZE(exynos5250_clk_regs));
 	exynos5_subcmus_init(ctx, 1, &exynos5250_disp_subcmu);
 
 	samsung_clk_of_add_provider(np, ctx);
-- 
2.17.1

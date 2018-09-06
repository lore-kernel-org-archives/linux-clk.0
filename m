Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46889 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730432AbeIFUcJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Sep 2018 16:32:09 -0400
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 10/10] clk: samsung: exynos5420: Use generic helper for
 handling suspend/resume
Date: Thu, 06 Sep 2018 17:55:32 +0200
Message-id: <20180906155532.4085-11-m.szyprowski@samsung.com>
In-reply-to: <20180906155532.4085-1-m.szyprowski@samsung.com>
References: <20180906155532.4085-1-m.szyprowski@samsung.com>
        <CGME20180906155558eucas1p2df01efef605c1261cc8aaf53a7157614@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Replace common suspend/resume handling code by generic helper.
Almost no functional change, the only difference is in handling
of hypothetical memory allocation failure on boot.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 72 +++-------------------------
 1 file changed, 6 insertions(+), 66 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 95e1bf69449b..76e7686c6162 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -15,7 +15,6 @@
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/syscore_ops.h>
 
 #include "clk.h"
 #include "clk-cpu.h"
@@ -156,10 +155,6 @@ enum exynos5x_plls {
 static void __iomem *reg_base;
 static enum exynos5x_soc exynos5x_soc;
 
-#ifdef CONFIG_PM_SLEEP
-static struct samsung_clk_reg_dump *exynos5x_save;
-static struct samsung_clk_reg_dump *exynos5800_save;
-
 /*
  * list of controller registers to be saved and restored during a
  * suspend/resume cycle.
@@ -283,66 +278,6 @@ static const struct samsung_clk_reg_dump exynos5420_set_clksrc[] = {
 	{ .offset = GATE_IP_PERIC,		.value = 0xffffffff, },
 };
 
-static int exynos5420_clk_suspend(void)
-{
-	samsung_clk_save(reg_base, exynos5x_save,
-				ARRAY_SIZE(exynos5x_clk_regs));
-
-	if (exynos5x_soc == EXYNOS5800)
-		samsung_clk_save(reg_base, exynos5800_save,
-				ARRAY_SIZE(exynos5800_clk_regs));
-
-	samsung_clk_restore(reg_base, exynos5420_set_clksrc,
-				ARRAY_SIZE(exynos5420_set_clksrc));
-
-	return 0;
-}
-
-static void exynos5420_clk_resume(void)
-{
-	samsung_clk_restore(reg_base, exynos5x_save,
-				ARRAY_SIZE(exynos5x_clk_regs));
-
-	if (exynos5x_soc == EXYNOS5800)
-		samsung_clk_restore(reg_base, exynos5800_save,
-				ARRAY_SIZE(exynos5800_clk_regs));
-}
-
-static struct syscore_ops exynos5420_clk_syscore_ops = {
-	.suspend = exynos5420_clk_suspend,
-	.resume = exynos5420_clk_resume,
-};
-
-static void __init exynos5420_clk_sleep_init(void)
-{
-	exynos5x_save = samsung_clk_alloc_reg_dump(exynos5x_clk_regs,
-					ARRAY_SIZE(exynos5x_clk_regs));
-	if (!exynos5x_save) {
-		pr_warn("%s: failed to allocate sleep save data, no sleep support!\n",
-			__func__);
-		return;
-	}
-
-	if (exynos5x_soc == EXYNOS5800) {
-		exynos5800_save =
-			samsung_clk_alloc_reg_dump(exynos5800_clk_regs,
-					ARRAY_SIZE(exynos5800_clk_regs));
-		if (!exynos5800_save)
-			goto err_soc;
-	}
-
-	register_syscore_ops(&exynos5420_clk_syscore_ops);
-	return;
-err_soc:
-	kfree(exynos5x_save);
-	pr_warn("%s: failed to allocate sleep save data, no sleep support!\n",
-		__func__);
-	return;
-}
-#else
-static void __init exynos5420_clk_sleep_init(void) {}
-#endif
-
 /* list of all parent clocks */
 PNAME(mout_mspll_cpu_p) = {"mout_sclk_cpll", "mout_sclk_dpll",
 				"mout_sclk_mpll", "mout_sclk_spll"};
@@ -1540,7 +1475,12 @@ static void __init exynos5x_clk_init(struct device_node *np,
 		mout_kfc_p[0], mout_kfc_p[1], 0x28200,
 		exynos5420_kfcclk_d, ARRAY_SIZE(exynos5420_kfcclk_d), 0);
 
-	exynos5420_clk_sleep_init();
+	samsung_clk_extended_sleep_init(reg_base,
+		exynos5x_clk_regs, ARRAY_SIZE(exynos5x_clk_regs),
+		exynos5420_set_clksrc, ARRAY_SIZE(exynos5420_set_clksrc));
+	if (soc == EXYNOS5800)
+		samsung_clk_sleep_init(reg_base, exynos5800_clk_regs,
+				       ARRAY_SIZE(exynos5800_clk_regs));
 	exynos5_subcmus_init(ctx, ARRAY_SIZE(exynos5x_subcmus),
 			     exynos5x_subcmus);
 
-- 
2.17.1

Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:35932 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729200AbeH2Tsi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Aug 2018 15:48:38 -0400
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 09/10] clk: samsung: exynos4: Use generic helper for
 handling suspend/resume
Date: Wed, 29 Aug 2018 17:50:45 +0200
Message-id: <20180829155046.29359-10-m.szyprowski@samsung.com>
In-reply-to: <20180829155046.29359-1-m.szyprowski@samsung.com>
References: <20180829155046.29359-1-m.szyprowski@samsung.com>
        <CGME20180829155102eucas1p2a4b1c554623ff97a23f85f26a6b537e2@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Replace common suspend/resume handling code by generic helper.
Handling of PLLs is a bit different in generic code, as they are handled
in the same way as other clock registers. Such approach was already used
on later Exynos SoCs and worked fine. Tests have shown that it works also
on Exynos4 SoCs and significantly simplifies the code.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-exynos4.c | 147 ++++--------------------------
 1 file changed, 16 insertions(+), 131 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 0421960eb963..d3bd9ffd8a09 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -16,7 +16,6 @@
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/syscore_ops.h>
 
 #include "clk.h"
 #include "clk-cpu.h"
@@ -157,14 +156,6 @@ enum exynos4_plls {
 static void __iomem *reg_base;
 static enum exynos4_soc exynos4_soc;
 
-/*
- * Support for CMU save/restore across system suspends
- */
-#ifdef CONFIG_PM_SLEEP
-static struct samsung_clk_reg_dump *exynos4_save_common;
-static struct samsung_clk_reg_dump *exynos4_save_soc;
-static struct samsung_clk_reg_dump *exynos4_save_pll;
-
 /*
  * list of controller registers to be saved and restored during a
  * suspend/resume cycle.
@@ -192,7 +183,7 @@ static const unsigned long exynos4x12_clk_save[] __initconst = {
 	E4X12_PWR_CTRL2,
 };
 
-static const unsigned long exynos4_clk_pll_regs[] __initconst = {
+static const unsigned long exynos4_clk_regs[] __initconst = {
 	EPLL_LOCK,
 	VPLL_LOCK,
 	EPLL_CON0,
@@ -201,9 +192,6 @@ static const unsigned long exynos4_clk_pll_regs[] __initconst = {
 	VPLL_CON0,
 	VPLL_CON1,
 	VPLL_CON2,
-};
-
-static const unsigned long exynos4_clk_regs[] __initconst = {
 	SRC_LEFTBUS,
 	DIV_LEFTBUS,
 	GATE_IP_LEFTBUS,
@@ -276,6 +264,8 @@ static const unsigned long exynos4_clk_regs[] __initconst = {
 };
 
 static const struct samsung_clk_reg_dump src_mask_suspend[] = {
+	{ .offset = VPLL_CON0,			.value = 0x80600302, },
+	{ .offset = EPLL_CON0,			.value = 0x806F0302, },
 	{ .offset = SRC_MASK_TOP,		.value = 0x00000001, },
 	{ .offset = SRC_MASK_CAM,		.value = 0x11111111, },
 	{ .offset = SRC_MASK_TV,		.value = 0x00000111, },
@@ -291,123 +281,6 @@ static const struct samsung_clk_reg_dump src_mask_suspend_e4210[] = {
 	{ .offset = E4210_SRC_MASK_LCD1,	.value = 0x00001111, },
 };
 
-#define PLL_ENABLED	(1 << 31)
-#define PLL_LOCKED	(1 << 29)
-
-static void exynos4_clk_enable_pll(u32 reg)
-{
-	u32 pll_con = readl(reg_base + reg);
-	pll_con |= PLL_ENABLED;
-	writel(pll_con, reg_base + reg);
-
-	while (!(pll_con & PLL_LOCKED)) {
-		cpu_relax();
-		pll_con = readl(reg_base + reg);
-	}
-}
-
-static void exynos4_clk_wait_for_pll(u32 reg)
-{
-	u32 pll_con;
-
-	pll_con = readl(reg_base + reg);
-	if (!(pll_con & PLL_ENABLED))
-		return;
-
-	while (!(pll_con & PLL_LOCKED)) {
-		cpu_relax();
-		pll_con = readl(reg_base + reg);
-	}
-}
-
-static int exynos4_clk_suspend(void)
-{
-	samsung_clk_save(reg_base, exynos4_save_common,
-				ARRAY_SIZE(exynos4_clk_regs));
-	samsung_clk_save(reg_base, exynos4_save_pll,
-				ARRAY_SIZE(exynos4_clk_pll_regs));
-
-	exynos4_clk_enable_pll(EPLL_CON0);
-	exynos4_clk_enable_pll(VPLL_CON0);
-
-	if (exynos4_soc == EXYNOS4210) {
-		samsung_clk_save(reg_base, exynos4_save_soc,
-					ARRAY_SIZE(exynos4210_clk_save));
-		samsung_clk_restore(reg_base, src_mask_suspend_e4210,
-					ARRAY_SIZE(src_mask_suspend_e4210));
-	} else {
-		samsung_clk_save(reg_base, exynos4_save_soc,
-					ARRAY_SIZE(exynos4x12_clk_save));
-	}
-
-	samsung_clk_restore(reg_base, src_mask_suspend,
-					ARRAY_SIZE(src_mask_suspend));
-
-	return 0;
-}
-
-static void exynos4_clk_resume(void)
-{
-	samsung_clk_restore(reg_base, exynos4_save_pll,
-				ARRAY_SIZE(exynos4_clk_pll_regs));
-
-	exynos4_clk_wait_for_pll(EPLL_CON0);
-	exynos4_clk_wait_for_pll(VPLL_CON0);
-
-	samsung_clk_restore(reg_base, exynos4_save_common,
-				ARRAY_SIZE(exynos4_clk_regs));
-
-	if (exynos4_soc == EXYNOS4210)
-		samsung_clk_restore(reg_base, exynos4_save_soc,
-					ARRAY_SIZE(exynos4210_clk_save));
-	else
-		samsung_clk_restore(reg_base, exynos4_save_soc,
-					ARRAY_SIZE(exynos4x12_clk_save));
-}
-
-static struct syscore_ops exynos4_clk_syscore_ops = {
-	.suspend = exynos4_clk_suspend,
-	.resume = exynos4_clk_resume,
-};
-
-static void __init exynos4_clk_sleep_init(void)
-{
-	exynos4_save_common = samsung_clk_alloc_reg_dump(exynos4_clk_regs,
-					ARRAY_SIZE(exynos4_clk_regs));
-	if (!exynos4_save_common)
-		goto err_warn;
-
-	if (exynos4_soc == EXYNOS4210)
-		exynos4_save_soc = samsung_clk_alloc_reg_dump(
-					exynos4210_clk_save,
-					ARRAY_SIZE(exynos4210_clk_save));
-	else
-		exynos4_save_soc = samsung_clk_alloc_reg_dump(
-					exynos4x12_clk_save,
-					ARRAY_SIZE(exynos4x12_clk_save));
-	if (!exynos4_save_soc)
-		goto err_common;
-
-	exynos4_save_pll = samsung_clk_alloc_reg_dump(exynos4_clk_pll_regs,
-					ARRAY_SIZE(exynos4_clk_pll_regs));
-	if (!exynos4_save_pll)
-		goto err_soc;
-
-	register_syscore_ops(&exynos4_clk_syscore_ops);
-	return;
-
-err_soc:
-	kfree(exynos4_save_soc);
-err_common:
-	kfree(exynos4_save_common);
-err_warn:
-	pr_warn("%s: failed to allocate sleep save data, no sleep support!\n",
-		__func__);
-}
-#else
-static void __init exynos4_clk_sleep_init(void) {}
-#endif
-
 /* list of all parent clock list */
 PNAME(mout_apll_p)	= { "fin_pll", "fout_apll", };
 PNAME(mout_mpll_p)	= { "fin_pll", "fout_mpll", };
@@ -1532,7 +1405,19 @@ static void __init exynos4_clk_init(struct device_node *np,
 
 	if (soc == EXYNOS4X12)
 		exynos4x12_core_down_clock();
-	exynos4_clk_sleep_init();
+
+	samsung_clk_sleep_init2(reg_base, exynos4_clk_regs,
+			       ARRAY_SIZE(exynos4_clk_regs),
+			       src_mask_suspend,
+			       ARRAY_SIZE(src_mask_suspend));
+	if (exynos4_soc == EXYNOS4210)
+		samsung_clk_sleep_init2(reg_base, exynos4210_clk_save,
+				       ARRAY_SIZE(exynos4210_clk_save),
+				       src_mask_suspend_e4210,
+				       ARRAY_SIZE(src_mask_suspend_e4210));
+	else
+		samsung_clk_sleep_init(reg_base, exynos4x12_clk_save,
+				       ARRAY_SIZE(exynos4x12_clk_save));
 
 	samsung_clk_of_add_provider(np, ctx);
 
-- 
2.17.1

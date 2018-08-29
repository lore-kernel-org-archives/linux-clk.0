Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:35929 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729202AbeH2Tsh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Aug 2018 15:48:37 -0400
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 06/10] clk: samsung: s5pv210: Use generic helper for
 handling suspend/resume
Date: Wed, 29 Aug 2018 17:50:42 +0200
Message-id: <20180829155046.29359-7-m.szyprowski@samsung.com>
In-reply-to: <20180829155046.29359-1-m.szyprowski@samsung.com>
References: <20180829155046.29359-1-m.szyprowski@samsung.com>
        <CGME20180829155101eucas1p2f6ecb6ad0eb37fa725ac950cad73c423@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Replace common suspend/resume handling code by generic helper.
No functional change.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-s5pv210.c | 41 ++-----------------------------
 1 file changed, 2 insertions(+), 39 deletions(-)

diff --git a/drivers/clk/samsung/clk-s5pv210.c b/drivers/clk/samsung/clk-s5pv210.c
index fd2725710a6f..41d2337fe030 100644
--- a/drivers/clk/samsung/clk-s5pv210.c
+++ b/drivers/clk/samsung/clk-s5pv210.c
@@ -14,7 +14,6 @@
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/syscore_ops.h>
 
 #include "clk.h"
 #include "clk-pll.h"
@@ -83,9 +82,6 @@ enum {
 
 static void __iomem *reg_base;
 
-#ifdef CONFIG_PM_SLEEP
-static struct samsung_clk_reg_dump *s5pv210_clk_dump;
-
 /* List of registers that need to be preserved across suspend/resume. */
 static unsigned long s5pv210_clk_regs[] __initdata = {
 	CLK_SRC0,
@@ -132,40 +128,6 @@ static unsigned long s5pv210_clk_regs[] __initdata = {
 	CLK_OUT,
 };
 
-static int s5pv210_clk_suspend(void)
-{
-	samsung_clk_save(reg_base, s5pv210_clk_dump,
-				ARRAY_SIZE(s5pv210_clk_regs));
-	return 0;
-}
-
-static void s5pv210_clk_resume(void)
-{
-	samsung_clk_restore(reg_base, s5pv210_clk_dump,
-				ARRAY_SIZE(s5pv210_clk_regs));
-}
-
-static struct syscore_ops s5pv210_clk_syscore_ops = {
-	.suspend = s5pv210_clk_suspend,
-	.resume = s5pv210_clk_resume,
-};
-
-static void s5pv210_clk_sleep_init(void)
-{
-	s5pv210_clk_dump =
-		samsung_clk_alloc_reg_dump(s5pv210_clk_regs,
-					   ARRAY_SIZE(s5pv210_clk_regs));
-	if (!s5pv210_clk_dump) {
-		pr_warn("%s: Failed to allocate sleep save data\n", __func__);
-		return;
-	}
-
-	register_syscore_ops(&s5pv210_clk_syscore_ops);
-}
-#else
-static inline void s5pv210_clk_sleep_init(void) { }
-#endif
-
 /* Mux parent lists. */
 static const char *const fin_pll_p[] __initconst = {
 	"xxti",
@@ -822,7 +784,8 @@ static void __init __s5pv210_clk_init(struct device_node *np,
 	samsung_clk_register_alias(ctx, s5pv210_aliases,
 						ARRAY_SIZE(s5pv210_aliases));
 
-	s5pv210_clk_sleep_init();
+	samsung_clk_sleep_init(reg_base, s5pv210_clk_regs,
+			       ARRAY_SIZE(s5pv210_clk_regs));
 
 	samsung_clk_of_add_provider(np, ctx);
 
-- 
2.17.1

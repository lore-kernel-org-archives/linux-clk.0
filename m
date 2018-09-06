Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46877 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730394AbeIFUcH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Sep 2018 16:32:07 -0400
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 05/10] clk: samsung: s3c64xx: Use generic helper for
 handling suspend/resume
Date: Thu, 06 Sep 2018 17:55:27 +0200
Message-id: <20180906155532.4085-6-m.szyprowski@samsung.com>
In-reply-to: <20180906155532.4085-1-m.szyprowski@samsung.com>
References: <20180906155532.4085-1-m.szyprowski@samsung.com>
        <CGME20180906155556eucas1p2546c6d2fa7d42bad8ea021aea249752a@eucas1p2.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Replace common suspend/resume handling code by generic helper.
Almost no functional change, the only difference is in handling
of hypothetical memory allocation failure on boot.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/samsung/clk-s3c64xx.c | 66 +++----------------------------
 1 file changed, 6 insertions(+), 60 deletions(-)

diff --git a/drivers/clk/samsung/clk-s3c64xx.c b/drivers/clk/samsung/clk-s3c64xx.c
index 6db01cf5ab83..329a449f78c3 100644
--- a/drivers/clk/samsung/clk-s3c64xx.c
+++ b/drivers/clk/samsung/clk-s3c64xx.c
@@ -12,7 +12,6 @@
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/syscore_ops.h>
 
 #include <dt-bindings/clock/samsung,s3c64xx-clock.h>
 
@@ -59,10 +58,6 @@
 static void __iomem *reg_base;
 static bool is_s3c6400;
 
-#ifdef CONFIG_PM_SLEEP
-static struct samsung_clk_reg_dump *s3c64xx_save_common;
-static struct samsung_clk_reg_dump *s3c64xx_save_soc;
-
 /*
  * List of controller registers to be saved and restored during
  * a suspend/resume cycle.
@@ -89,60 +84,6 @@ static unsigned long s3c6410_clk_regs[] __initdata = {
 	MEM0_GATE,
 };
 
-static int s3c64xx_clk_suspend(void)
-{
-	samsung_clk_save(reg_base, s3c64xx_save_common,
-				ARRAY_SIZE(s3c64xx_clk_regs));
-
-	if (!is_s3c6400)
-		samsung_clk_save(reg_base, s3c64xx_save_soc,
-					ARRAY_SIZE(s3c6410_clk_regs));
-
-	return 0;
-}
-
-static void s3c64xx_clk_resume(void)
-{
-	samsung_clk_restore(reg_base, s3c64xx_save_common,
-				ARRAY_SIZE(s3c64xx_clk_regs));
-
-	if (!is_s3c6400)
-		samsung_clk_restore(reg_base, s3c64xx_save_soc,
-					ARRAY_SIZE(s3c6410_clk_regs));
-}
-
-static struct syscore_ops s3c64xx_clk_syscore_ops = {
-	.suspend = s3c64xx_clk_suspend,
-	.resume = s3c64xx_clk_resume,
-};
-
-static void __init s3c64xx_clk_sleep_init(void)
-{
-	s3c64xx_save_common = samsung_clk_alloc_reg_dump(s3c64xx_clk_regs,
-						ARRAY_SIZE(s3c64xx_clk_regs));
-	if (!s3c64xx_save_common)
-		goto err_warn;
-
-	if (!is_s3c6400) {
-		s3c64xx_save_soc = samsung_clk_alloc_reg_dump(s3c6410_clk_regs,
-						ARRAY_SIZE(s3c6410_clk_regs));
-		if (!s3c64xx_save_soc)
-			goto err_soc;
-	}
-
-	register_syscore_ops(&s3c64xx_clk_syscore_ops);
-	return;
-
-err_soc:
-	kfree(s3c64xx_save_common);
-err_warn:
-	pr_warn("%s: failed to allocate sleep save data, no sleep support!\n",
-		__func__);
-}
-#else
-static void __init s3c64xx_clk_sleep_init(void) {}
-#endif
-
 /* List of parent clocks common for all S3C64xx SoCs. */
 PNAME(spi_mmc_p)	= { "mout_epll", "dout_mpll", "fin_pll", "clk27m" };
 PNAME(uart_p)		= { "mout_epll", "dout_mpll" };
@@ -508,7 +449,12 @@ void __init s3c64xx_clk_init(struct device_node *np, unsigned long xtal_f,
 
 	samsung_clk_register_alias(ctx, s3c64xx_clock_aliases,
 					ARRAY_SIZE(s3c64xx_clock_aliases));
-	s3c64xx_clk_sleep_init();
+
+	samsung_clk_sleep_init(reg_base, s3c64xx_clk_regs,
+			       ARRAY_SIZE(s3c64xx_clk_regs));
+        if (!is_s3c6400)
+		samsung_clk_sleep_init(reg_base, s3c6410_clk_regs,
+				       ARRAY_SIZE(s3c6410_clk_regs));
 
 	samsung_clk_of_add_provider(np, ctx);
 
-- 
2.17.1

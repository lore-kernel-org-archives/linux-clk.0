Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:35923 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729200AbeH2Tsg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Aug 2018 15:48:36 -0400
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 03/10] clk: samsung: s3c2412: Use generic helper for
 handling suspend/resume
Date: Wed, 29 Aug 2018 17:50:39 +0200
Message-id: <20180829155046.29359-4-m.szyprowski@samsung.com>
In-reply-to: <20180829155046.29359-1-m.szyprowski@samsung.com>
References: <20180829155046.29359-1-m.szyprowski@samsung.com>
        <CGME20180829155059eucas1p16fecde00348e0a2e6707aaf2a76320be@eucas1p1.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Replace common suspend/resume handling code by generic helper.
No functional change.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-s3c2412.c | 43 ++-----------------------------
 1 file changed, 2 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/samsung/clk-s3c2412.c b/drivers/clk/samsung/clk-s3c2412.c
index 6bc94d3aff78..dd1159050a5a 100644
--- a/drivers/clk/samsung/clk-s3c2412.c
+++ b/drivers/clk/samsung/clk-s3c2412.c
@@ -11,7 +11,6 @@
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/syscore_ops.h>
 #include <linux/reboot.h>
 
 #include <dt-bindings/clock/s3c2412.h>
@@ -29,9 +28,6 @@
 
 static void __iomem *reg_base;
 
-#ifdef CONFIG_PM_SLEEP
-static struct samsung_clk_reg_dump *s3c2412_save;
-
 /*
  * list of controller registers to be saved and restored during a
  * suspend/resume cycle.
@@ -45,42 +41,6 @@ static unsigned long s3c2412_clk_regs[] __initdata = {
 	CLKSRC,
 };
 
-static int s3c2412_clk_suspend(void)
-{
-	samsung_clk_save(reg_base, s3c2412_save,
-				ARRAY_SIZE(s3c2412_clk_regs));
-
-	return 0;
-}
-
-static void s3c2412_clk_resume(void)
-{
-	samsung_clk_restore(reg_base, s3c2412_save,
-				ARRAY_SIZE(s3c2412_clk_regs));
-}
-
-static struct syscore_ops s3c2412_clk_syscore_ops = {
-	.suspend = s3c2412_clk_suspend,
-	.resume = s3c2412_clk_resume,
-};
-
-static void __init s3c2412_clk_sleep_init(void)
-{
-	s3c2412_save = samsung_clk_alloc_reg_dump(s3c2412_clk_regs,
-						ARRAY_SIZE(s3c2412_clk_regs));
-	if (!s3c2412_save) {
-		pr_warn("%s: failed to allocate sleep save data, no sleep support!\n",
-			__func__);
-		return;
-	}
-
-	register_syscore_ops(&s3c2412_clk_syscore_ops);
-	return;
-}
-#else
-static void __init s3c2412_clk_sleep_init(void) {}
-#endif
-
 static struct clk_div_table divxti_d[] = {
 	{ .val = 0, .div = 1 },
 	{ .val = 1, .div = 2 },
@@ -278,7 +238,8 @@ void __init s3c2412_common_clk_init(struct device_node *np, unsigned long xti_f,
 	samsung_clk_register_alias(ctx, s3c2412_aliases,
 				   ARRAY_SIZE(s3c2412_aliases));
 
-	s3c2412_clk_sleep_init();
+	samsung_clk_sleep_init(reg_base, s3c2412_clk_regs,
+			       ARRAY_SIZE(s3c2412_clk_regs));
 
 	samsung_clk_of_add_provider(np, ctx);
 
-- 
2.17.1

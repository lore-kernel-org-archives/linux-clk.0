Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55846 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729213AbeH2Tsg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Aug 2018 15:48:36 -0400
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 04/10] clk: samsung: s3c2443: Use generic helper for
 handling suspend/resume
Date: Wed, 29 Aug 2018 17:50:40 +0200
Message-id: <20180829155046.29359-5-m.szyprowski@samsung.com>
In-reply-to: <20180829155046.29359-1-m.szyprowski@samsung.com>
References: <20180829155046.29359-1-m.szyprowski@samsung.com>
        <CGME20180829155100eucas1p1ba8149066e026fc15f82091968b78a08@eucas1p1.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Replace common suspend/resume handling code by generic helper.
No functional change.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk-s3c2443.c | 43 ++-----------------------------
 1 file changed, 2 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/samsung/clk-s3c2443.c b/drivers/clk/samsung/clk-s3c2443.c
index c46e6d5bc9bc..884067e4f1a1 100644
--- a/drivers/clk/samsung/clk-s3c2443.c
+++ b/drivers/clk/samsung/clk-s3c2443.c
@@ -11,7 +11,6 @@
 #include <linux/clk-provider.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/syscore_ops.h>
 #include <linux/reboot.h>
 
 #include <dt-bindings/clock/s3c2443.h>
@@ -43,9 +42,6 @@ enum supported_socs {
 
 static void __iomem *reg_base;
 
-#ifdef CONFIG_PM_SLEEP
-static struct samsung_clk_reg_dump *s3c2443_save;
-
 /*
  * list of controller registers to be saved and restored during a
  * suspend/resume cycle.
@@ -65,42 +61,6 @@ static unsigned long s3c2443_clk_regs[] __initdata = {
 	SCLKCON,
 };
 
-static int s3c2443_clk_suspend(void)
-{
-	samsung_clk_save(reg_base, s3c2443_save,
-				ARRAY_SIZE(s3c2443_clk_regs));
-
-	return 0;
-}
-
-static void s3c2443_clk_resume(void)
-{
-	samsung_clk_restore(reg_base, s3c2443_save,
-				ARRAY_SIZE(s3c2443_clk_regs));
-}
-
-static struct syscore_ops s3c2443_clk_syscore_ops = {
-	.suspend = s3c2443_clk_suspend,
-	.resume = s3c2443_clk_resume,
-};
-
-static void __init s3c2443_clk_sleep_init(void)
-{
-	s3c2443_save = samsung_clk_alloc_reg_dump(s3c2443_clk_regs,
-						ARRAY_SIZE(s3c2443_clk_regs));
-	if (!s3c2443_save) {
-		pr_warn("%s: failed to allocate sleep save data, no sleep support!\n",
-			__func__);
-		return;
-	}
-
-	register_syscore_ops(&s3c2443_clk_syscore_ops);
-	return;
-}
-#else
-static void __init s3c2443_clk_sleep_init(void) {}
-#endif
-
 PNAME(epllref_p) = { "mpllref", "mpllref", "xti", "ext" };
 PNAME(esysclk_p) = { "epllref", "epll" };
 PNAME(mpllref_p) = { "xti", "mdivclk" };
@@ -450,7 +410,8 @@ void __init s3c2443_common_clk_init(struct device_node *np, unsigned long xti_f,
 		break;
 	}
 
-	s3c2443_clk_sleep_init();
+	samsung_clk_sleep_init(reg_base, s3c2443_clk_regs,
+			       ARRAY_SIZE(s3c2443_clk_regs));
 
 	samsung_clk_of_add_provider(np, ctx);
 
-- 
2.17.1

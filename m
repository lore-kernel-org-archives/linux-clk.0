Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:35935 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729206AbeH2Tsi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Aug 2018 15:48:38 -0400
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 08/10] clk: samsung: Add support for setting registers state
 before suspend
Date: Wed, 29 Aug 2018 17:50:44 +0200
Message-id: <20180829155046.29359-9-m.szyprowski@samsung.com>
In-reply-to: <20180829155046.29359-1-m.szyprowski@samsung.com>
References: <20180829155046.29359-1-m.szyprowski@samsung.com>
        <CGME20180829155102eucas1p1ca7a26c10847dcb585f01b54657e29cb@eucas1p1.samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Some registers of clock controller have to be set to certain values before
entering system suspend state. Till now drivers did that on their own,
but it will be easier to handle it by generic code and let drivers simply
to provide the list of registers and their state.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/clk/samsung/clk.c | 23 +++++++++++++----------
 drivers/clk/samsung/clk.h | 18 ++++++++++++++++--
 2 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 8634884aa11c..ab467a7f973a 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -290,9 +290,12 @@ static int samsung_clk_suspend(void)
 {
 	struct samsung_clock_reg_cache *reg_cache;
 
-	list_for_each_entry(reg_cache, &clock_reg_cache_list, node)
+	list_for_each_entry(reg_cache, &clock_reg_cache_list, node) {
 		samsung_clk_save(reg_cache->reg_base, reg_cache->rdump,
 				reg_cache->rd_num);
+		samsung_clk_restore(reg_cache->reg_base, reg_cache->rsuspend,
+				reg_cache->rsuspend_num);
+	}
 	return 0;
 }
 
@@ -310,9 +313,11 @@ static struct syscore_ops samsung_clk_syscore_ops = {
 	.resume = samsung_clk_resume,
 };
 
-void samsung_clk_sleep_init(void __iomem *reg_base,
+void samsung_clk_sleep_init2(void __iomem *reg_base,
 			const unsigned long *rdump,
-			unsigned long nr_rdump)
+			unsigned long nr_rdump,
+			const struct samsung_clk_reg_dump *rsuspend,
+			unsigned long nr_rsuspend)
 {
 	struct samsung_clock_reg_cache *reg_cache;
 
@@ -330,13 +335,10 @@ void samsung_clk_sleep_init(void __iomem *reg_base,
 
 	reg_cache->reg_base = reg_base;
 	reg_cache->rd_num = nr_rdump;
+	reg_cache->rsuspend = rsuspend;
+	reg_cache->rsuspend_num = nr_rsuspend;
 	list_add_tail(&reg_cache->node, &clock_reg_cache_list);
 }
-
-#else
-void samsung_clk_sleep_init(void __iomem *reg_base,
-			const unsigned long *rdump,
-			unsigned long nr_rdump) {}
 #endif
 
 /*
@@ -380,8 +382,9 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
 		samsung_clk_register_fixed_factor(ctx, cmu->fixed_factor_clks,
 			cmu->nr_fixed_factor_clks);
 	if (cmu->clk_regs)
-		samsung_clk_sleep_init(reg_base, cmu->clk_regs,
-			cmu->nr_clk_regs);
+		samsung_clk_sleep_init2(reg_base,
+				       cmu->clk_regs, cmu->nr_clk_regs,
+				       cmu->suspend_regs, cmu->nr_suspend_regs);
 
 	samsung_clk_of_add_provider(np, ctx);
 
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index 3880d2f9d582..854d0b52ef5f 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -279,6 +279,8 @@ struct samsung_clock_reg_cache {
 	void __iomem *reg_base;
 	struct samsung_clk_reg_dump *rdump;
 	unsigned int rd_num;
+	const struct samsung_clk_reg_dump *rsuspend;
+	unsigned int rsuspend_num;
 };
 
 struct samsung_cmu_info {
@@ -358,9 +360,21 @@ extern struct samsung_clk_provider __init *samsung_cmu_register_one(
 
 extern unsigned long _get_rate(const char *clk_name);
 
-extern void samsung_clk_sleep_init(void __iomem *reg_base,
+#ifdef CONFIG_PM_SLEEP
+extern void samsung_clk_sleep_init2(void __iomem *reg_base,
 			const unsigned long *rdump,
-			unsigned long nr_rdump);
+			unsigned long nr_rdump,
+			const struct samsung_clk_reg_dump *rsuspend,
+			unsigned long nr_rsuspend);
+#else
+void samsung_clk_sleep_init2(void __iomem *reg_base,
+			const unsigned long *rdump,
+			unsigned long nr_rdump,
+			const struct samsung_clk_reg_dump *rsuspend,
+			unsigned long nr_rsuspend) {}
+#endif
+#define samsung_clk_sleep_init(reg_base, rdump, nr_rdump) \
+	samsung_clk_sleep_init2(reg_base, rdump, nr_rdump, NULL, 0)
 
 extern void samsung_clk_save(void __iomem *base,
 			struct samsung_clk_reg_dump *rd,
-- 
2.17.1

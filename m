Return-Path: <>
Return-Path: <>
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [v2] clk:mmp:clk-of-pxa910: Free memory and Unmap region obtained by kzmalloc and of_iomap
Date: Tue, 20 Sep 2016 16:29:38 +0530
Message-Id: <1474369178-16015-1-git-send-email-arvind.yadav.cs@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Arvind Yadav <arvind.yadav.cs@gmail.com>

Free memory and memory mapping , if pxa910_clk_init is not successful.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/clk/mmp/clk-of-pxa910.c |   19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mmp/clk-of-pxa910.c b/drivers/clk/mmp/clk-of-pxa910.c
index e22a67f..dce6245 100644
--- a/drivers/clk/mmp/clk-of-pxa910.c
+++ b/drivers/clk/mmp/clk-of-pxa910.c
@@ -278,25 +278,25 @@ static void __init pxa910_clk_init(struct device_node *np)
 	pxa_unit->mpmu_base = of_iomap(np, 0);
 	if (!pxa_unit->mpmu_base) {
 		pr_err("failed to map mpmu registers\n");
-		return;
+		goto free_memory;
 	}
 
 	pxa_unit->apmu_base = of_iomap(np, 1);
 	if (!pxa_unit->mpmu_base) {
 		pr_err("failed to map apmu registers\n");
-		return;
+		goto unmap_mpmu_region;
 	}
 
 	pxa_unit->apbc_base = of_iomap(np, 2);
 	if (!pxa_unit->apbc_base) {
 		pr_err("failed to map apbc registers\n");
-		return;
+		goto unmap_apmu_region;
 	}
 
 	pxa_unit->apbcp_base = of_iomap(np, 3);
 	if (!pxa_unit->mpmu_base) {
 		pr_err("failed to map apbcp registers\n");
-		return;
+		goto unmap_apbc_region;
 	}
 
 	mmp_clk_init(np, &pxa_unit->unit, PXA910_NR_CLKS);
@@ -308,6 +308,17 @@ static void __init pxa910_clk_init(struct device_node *np)
 	pxa910_axi_periph_clk_init(pxa_unit);
 
 	pxa910_clk_reset_init(np, pxa_unit);
+
+	return;
+
+unmap_apbc_region:
+	iounmap(pxa_unit->apbc_base);
+unmap_apmu_region:
+	iounmap(pxa_unit->apmu_base);
+unmap_mpmu_region:
+	iounmap(pxa_unit->mpmu_base);
+free_memory:
+	kfree(pxa_unit);
 }
 
 CLK_OF_DECLARE(pxa910_clk, "marvell,pxa910-clock", pxa910_clk_init);
-- 
1.7.9.5

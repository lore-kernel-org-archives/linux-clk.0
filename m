Return-Path: <>
Return-Path: <>
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arvind Yadav <arvind.yadav.cs@gmail.com>
Subject: [PATCH] clk: mmp: clk-of-pxa1928: Free memory obtained by kzalloc
Date: Tue, 20 Sep 2016 15:22:48 +0530
Message-Id: <1474365168-15489-1-git-send-email-arvind.yadav.cs@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Arvind Yadav <arvind.yadav.cs@gmail.com>

Free memory, if init is not successful.

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/clk/mmp/clk-of-pxa1928.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/mmp/clk-of-pxa1928.c b/drivers/clk/mmp/clk-of-pxa1928.c
index e478ff4..cede7b4 100644
--- a/drivers/clk/mmp/clk-of-pxa1928.c
+++ b/drivers/clk/mmp/clk-of-pxa1928.c
@@ -216,6 +216,7 @@ static void __init pxa1928_mpmu_clk_init(struct device_node *np)
 	pxa_unit->mpmu_base = of_iomap(np, 0);
 	if (!pxa_unit->mpmu_base) {
 		pr_err("failed to map mpmu registers\n");
+		kfree(pxa_unit);
 		return;
 	}
 
@@ -234,6 +235,7 @@ static void __init pxa1928_apmu_clk_init(struct device_node *np)
 	pxa_unit->apmu_base = of_iomap(np, 0);
 	if (!pxa_unit->apmu_base) {
 		pr_err("failed to map apmu registers\n");
+		kfree(pxa_unit);
 		return;
 	}
 
@@ -254,6 +256,7 @@ static void __init pxa1928_apbc_clk_init(struct device_node *np)
 	pxa_unit->apbc_base = of_iomap(np, 0);
 	if (!pxa_unit->apbc_base) {
 		pr_err("failed to map apbc registers\n");
+		kfree(pxa_unit);
 		return;
 	}
 
-- 
1.7.9.5

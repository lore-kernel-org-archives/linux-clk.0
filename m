Return-Path: <weiyj.lk@gmail.com>
Return-Path: <weiyj.lk@gmail.com>
From: Wei Yongjun <weiyj.lk@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Chao Xie <chao.xie@marvell.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: mmp: pxa910: fix return value check in pxa910_clk_init()
Date: Sat, 17 Sep 2016 15:55:56 +0000
Message-Id: <1474127756-14710-1-git-send-email-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

From: Wei Yongjun <weiyongjun1@huawei.com>

Fix the retrn value check which testing the wrong variable
in pxa910_clk_init().

Fixes: 2bc61da9f7ff ("clk: mmp: add pxa910 DT support for clock driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/mmp/clk-of-pxa910.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mmp/clk-of-pxa910.c b/drivers/clk/mmp/clk-of-pxa910.c
index e22a67f..64d1ef4 100644
--- a/drivers/clk/mmp/clk-of-pxa910.c
+++ b/drivers/clk/mmp/clk-of-pxa910.c
@@ -282,7 +282,7 @@ static void __init pxa910_clk_init(struct device_node *np)
 	}
 
 	pxa_unit->apmu_base = of_iomap(np, 1);
-	if (!pxa_unit->mpmu_base) {
+	if (!pxa_unit->apmu_base) {
 		pr_err("failed to map apmu registers\n");
 		return;
 	}
@@ -294,7 +294,7 @@ static void __init pxa910_clk_init(struct device_node *np)
 	}
 
 	pxa_unit->apbcp_base = of_iomap(np, 3);
-	if (!pxa_unit->mpmu_base) {
+	if (!pxa_unit->apbcp_base) {
 		pr_err("failed to map apbcp registers\n");
 		return;
 	}

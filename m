Return-Path: <weiyj.lk@gmail.com>
Return-Path: <weiyj.lk@gmail.com>
From: Wei Yongjun <weiyj.lk@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Chao Xie <chao.xie@marvell.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: mmp: pxa168: fix return value check in pxa168_clk_init()
Date: Sat, 17 Sep 2016 15:54:28 +0000
Message-Id: <1474127668-14614-1-git-send-email-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

From: Wei Yongjun <weiyongjun1@huawei.com>

Fix the retrn value check which testing the wrong variable
in pxa168_clk_init().

Fixes: ab08aefcd12d ("clk: mmp: add pxa168 DT support for clock driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/mmp/clk-of-pxa168.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mmp/clk-of-pxa168.c b/drivers/clk/mmp/clk-of-pxa168.c
index 87f2317..f110c02 100644
--- a/drivers/clk/mmp/clk-of-pxa168.c
+++ b/drivers/clk/mmp/clk-of-pxa168.c
@@ -262,7 +262,7 @@ static void __init pxa168_clk_init(struct device_node *np)
 	}
 
 	pxa_unit->apmu_base = of_iomap(np, 1);
-	if (!pxa_unit->mpmu_base) {
+	if (!pxa_unit->apmu_base) {
 		pr_err("failed to map apmu registers\n");
 		return;
 	}

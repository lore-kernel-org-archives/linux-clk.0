Return-Path: <weiyj.lk@gmail.com>
Return-Path: <weiyj.lk@gmail.com>
From: Wei Yongjun <weiyj.lk@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Chao Xie <chao.xie@marvell.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH] clk: mmp: mmp2: fix return value check in mmp2_clk_init()
Date: Sat, 17 Sep 2016 15:54:13 +0000
Message-Id: <1474127653-14529-1-git-send-email-weiyj.lk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

From: Wei Yongjun <weiyongjun1@huawei.com>

Fix the retrn value check which testing the wrong variable
in mmp2_clk_init().

Fixes: 1ec770d92a62 ("clk: mmp: add mmp2 DT support for clock driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/mmp/clk-of-mmp2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mmp/clk-of-mmp2.c b/drivers/clk/mmp/clk-of-mmp2.c
index 3a51fff..9adaf48 100644
--- a/drivers/clk/mmp/clk-of-mmp2.c
+++ b/drivers/clk/mmp/clk-of-mmp2.c
@@ -313,7 +313,7 @@ static void __init mmp2_clk_init(struct device_node *np)
 	}
 
 	pxa_unit->apmu_base = of_iomap(np, 1);
-	if (!pxa_unit->mpmu_base) {
+	if (!pxa_unit->apmu_base) {
 		pr_err("failed to map apmu registers\n");
 		return;
 	}

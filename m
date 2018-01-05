Return-Path: <weiyongjun1@huawei.com>
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Joel Stanley <joel@jms.id.au>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
CC: Wei Yongjun <weiyongjun1@huawei.com>, <linux-clk@vger.kernel.org>
Subject: [PATCH -next] clk: aspeed: Fix return value check in aspeed_cc_init()
Date: Fri, 5 Jan 2018 01:41:01 +0000
Message-ID: <1515116461-156320-1-git-send-email-weiyongjun1@huawei.com>
Content-Type: text/plain; charset="ISO-8859-1"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

In case of error, the function of_iomap() returns NULL pointer not
ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Fixes: a2e230c7b2ea ("clk: Add clock driver for ASPEED BMC SoCs")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/clk-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index 6fb3447..f9b9688 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -609,7 +609,7 @@ static void __init aspeed_cc_init(struct device_node *np)
 	int i;
 
 	scu_base = of_iomap(np, 0);
-	if (IS_ERR(scu_base))
+	if (!scu_base)
 		return;
 
 	aspeed_clk_data = kzalloc(sizeof(*aspeed_clk_data) +

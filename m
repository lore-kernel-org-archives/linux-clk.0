Return-Path: <leonard.crestez@nxp.com>
From: Leonard Crestez <leonard.crestez@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>, <linux-clk@vger.kernel.org>
CC: Leonard Crestez <leonard.crestez@nxp.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] clk: core: Copy connection id
Date: Mon, 20 Feb 2017 15:20:56 +0200
Message-ID: <60d115f6c11bc51cd8bc10c64cd222c3cdb43cc7.1487596492.git.leonard.crestez@nxp.com>
Return-Path: leonard.crestez@nxp.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Some drivers use sprintf to build clk connection id names but the clk
core will save those strings and occasionally print them back. Duplicate
the con_id strings instead of fixing all the users.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 drivers/clk/clk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Some examples of using sprintf for con_id include:
drivers/mfd/omap-usb-host.c
drivers/tty/serial/samsung.c
sound/soc/fsl/fsl_asrc.c

There are lots more. They are difficult to find and "fixing" them on the
consumer side requires nasty code to keep track of the allocated clkname.

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0fb39fe..67201f6 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2502,7 +2502,7 @@ struct clk *__clk_create_clk(struct clk_hw *hw, const char *dev_id,
 
 	clk->core = hw->core;
 	clk->dev_id = dev_id;
-	clk->con_id = con_id;
+	clk->con_id = kstrdup_const(con_id, GFP_KERNEL);
 	clk->max_rate = ULONG_MAX;
 
 	clk_prepare_lock();
@@ -2518,6 +2518,7 @@ void __clk_free_clk(struct clk *clk)
 	hlist_del(&clk->clks_node);
 	clk_prepare_unlock();
 
+	kfree_const(clk->con_id);
 	kfree(clk);
 }
 
-- 
2.7.4

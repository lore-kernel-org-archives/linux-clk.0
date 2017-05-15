Return-Path: <pure.logic@nexus-software.ie>
Return-Path: <pure.logic@nexus-software.ie>
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org,
	cw00.choi@samsung.com
Cc: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Subject: [PATCH] clk: Fix __set_clk_rates error print-string
Date: Mon, 15 May 2017 11:58:59 +0100
Message-Id: <1494845939-30724-1-git-send-email-pure.logic@nexus-software.ie>
List-ID: <linux-clk.vger.kernel.org>

When failing to set a clock the printout emitted is incorrect.
"u32 rate" is formatted as %d and should be %u whereas "unsigned long
clk_set_rate()" is formatted as %ld and should be %lu as per
Documentation/printk-formats.txt.

Fixes: 2885c3b2a3da ("clk: Show correct information when fail to set clock
                      rate")

Signed-off-by: Bryan O'Donoghue <pure.logic@nexus-software.ie>
---
 drivers/clk/clk-conf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
index e0e02a6..7ec3672 100644
--- a/drivers/clk/clk-conf.c
+++ b/drivers/clk/clk-conf.c
@@ -109,7 +109,7 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
 
 			rc = clk_set_rate(clk, rate);
 			if (rc < 0)
-				pr_err("clk: couldn't set %s clk rate to %d (%d), current rate: %ld\n",
+				pr_err("clk: couldn't set %s clk rate to %u (%d), current rate: %lu\n",
 				       __clk_get_name(clk), rate, rc,
 				       clk_get_rate(clk));
 			clk_put(clk);
-- 
2.7.4

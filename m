Return-Path: <shailendra.capricorn@gmail.com>
Return-Path: <shailendra.capricorn@gmail.com>
From: Shailendra Verma <shailendra.capricorn@gmail.com>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Shailendra Verma <shailendra.capricorn@gmail.com>
Subject: [PATCH] clk:clk-conf - Fix typo in comment.
Date: Thu, 21 May 2015 23:32:56 +0530
Message-Id: <1432231376-3542-1-git-send-email-shailendra.capricorn@gmail.com>
List-ID: <linux-clk.vger.kernel.org>


Signed-off-by: Shailendra Verma <shailendra.capricorn@gmail.com>
---
 drivers/clk/clk-conf.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
index 48a65b2..6396b76 100644
--- a/drivers/clk/clk-conf.c
+++ b/drivers/clk/clk-conf.c
@@ -124,7 +124,7 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
  * and sets any specified clock parents and rates. The @clk_supplier argument
  * should be set to true if @node may be also a clock supplier of any clock
  * listed in its 'assigned-clocks' or 'assigned-clock-parents' properties.
- * If @clk_supplier is false the function exits returnning 0 as soon as it
+ * If @clk_supplier is false the function exits returning 0 as soon as it
  * determines the @node is also a supplier of any of the clocks.
  */
 int of_clk_set_defaults(struct device_node *node, bool clk_supplier)
-- 
1.7.9.5

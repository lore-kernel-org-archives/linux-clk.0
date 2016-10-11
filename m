Return-Path: <Orson.Zhai@spreadtrum.com>
From: Orson Zhai <orson.zhai@spreadtrum.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>
CC: <baolin.wang@spreadtrum.com>, <xiaolong.zhang@spreadtrum.com>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <ben.li@spreadturm.com>, Orson Zhai <orson.zhai@spreadtrum.com>
Subject: [PATCH] clk: Register clkdev after setup of fixed-rate and fixed-factor clocks
Date: Tue, 11 Oct 2016 19:13:44 +0800
Message-ID: <1476184424-8528-1-git-send-email-orson.zhai@spreadtrum.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>

When common kernel setups fixed clock, of_clk_provider will be registerred.
But there is no clkdev being registerred at the same time. This will make
it difficult to get the clock by using clk_get(NULL, con_id).

Add clkdev register for fixed-rate and fixed-factor clock and ignore
the error if any.

Signed-off-by: Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>
Signed-off-by: Orson Zhai <orson.zhai@spreadtrum.com>
---
 drivers/clk/clk-fixed-factor.c | 5 +++++
 drivers/clk/clk-fixed-rate.c   | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
index a5d402d..b81656a 100644
--- a/drivers/clk/clk-fixed-factor.c
+++ b/drivers/clk/clk-fixed-factor.c
@@ -9,6 +9,7 @@
  */
 #include <linux/module.h>
 #include <linux/clk-provider.h>
+#include <linux/clkdev.h>
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/of.h>
@@ -186,6 +187,10 @@ static struct clk *_of_fixed_factor_clk_setup(struct device_node *node)
 		return ERR_PTR(ret);
 	}
 
+#ifdef CONFIG_CLKDEV_LOOKUP
+	clk_register_clkdev(clk, clk_name, 0);
+#endif
+
 	return clk;
 }
 
diff --git a/drivers/clk/clk-fixed-rate.c b/drivers/clk/clk-fixed-rate.c
index b5c46b3..d42c8e7 100644
--- a/drivers/clk/clk-fixed-rate.c
+++ b/drivers/clk/clk-fixed-rate.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/clkdev.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/io.h>
@@ -184,6 +185,10 @@ static struct clk *_of_fixed_clk_setup(struct device_node *node)
 		return ERR_PTR(ret);
 	}
 
+#ifdef CONFIG_CLKDEV_LOOKUP
+	clk_register_clkdev(clk, clk_name, 0);
+#endif
+
 	return clk;
 }
 
-- 
1.9.1

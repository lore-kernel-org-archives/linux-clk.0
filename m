Return-Path: <baoyou.xie@linaro.org>
Return-Path: <baoyou.xie@linaro.org>
From: Baoyou Xie <baoyou.xie@linaro.org>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	linus.walleij@linaro.org,
	arnd@arndb.de
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baoyou.xie@linaro.org,
	xie.baoyou@zte.com.cn
Subject: [PATCH] clk: versatile: add missing header dependencies
Date: Wed, 14 Sep 2016 14:29:47 +0800
Message-Id: <1473834587-22526-1-git-send-email-baoyou.xie@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

We get 1 warning when building kernel with W=1:
drivers/clk/versatile/clk-realview.c:54:13: warning: no previous prototype for 'realview_clk_init' [-Wmissing-prototypes]

In fact, this function is declared in clk-realview.h,
so this patch add missing header dependencies.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 drivers/clk/versatile/clk-realview.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/versatile/clk-realview.c b/drivers/clk/versatile/clk-realview.c
index c56efc7..f662fd1 100644
--- a/drivers/clk/versatile/clk-realview.c
+++ b/drivers/clk/versatile/clk-realview.c
@@ -10,6 +10,7 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/clk-provider.h>
+#include <linux/platform_data/clk-realview.h>
 
 #include "clk-icst.h"
 
-- 
2.7.4

Return-Path: <baoyou.xie@linaro.org>
Return-Path: <baoyou.xie@linaro.org>
From: Baoyou Xie <baoyou.xie@linaro.org>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	arnd@arndb.de
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baoyou.xie@linaro.org,
	xie.baoyou@zte.com.cn
Subject: [PATCH] clk: mmp: add missing header dependencies
Date: Wed, 14 Sep 2016 14:23:28 +0800
Message-Id: <1473834208-25896-1-git-send-email-baoyou.xie@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

We get 1 warning when building kernel with W=1:
drivers/clk/mmp/clk-mmp2.c:75:13: warning: no previous prototype for 'mmp2_clk_init' [-Wmissing-prototypes]

In fact, this function is declared in linux/clk/mmp.h,
so this patch add missing header dependencies.

Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
---
 drivers/clk/mmp/clk-mmp2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mmp/clk-mmp2.c b/drivers/clk/mmp/clk-mmp2.c
index 383f6a4..0380234 100644
--- a/drivers/clk/mmp/clk-mmp2.c
+++ b/drivers/clk/mmp/clk-mmp2.c
@@ -16,6 +16,7 @@
 #include <linux/io.h>
 #include <linux/delay.h>
 #include <linux/err.h>
+#include <linux/clk/mmp.h>
 
 #include "clk.h"
 
-- 
2.7.4

Return-Path: <wens@mirror2.csie.ntu.edu.tw>
From: Chen-Yu Tsai <wens@csie.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] clk: Add missing header for 'bool' definition to clk-conf.h
Date: Tue, 18 Aug 2015 15:16:45 +0800
Message-Id: <1439882205-10978-1-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

of_clk_set_defaults uses the type 'bool', but clk-conf.h does not
include its definition.

This results in a compile error when only clk-conf.h is used.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
Cc: stable@vger.kernel.org
---
 include/linux/clk/clk-conf.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/clk/clk-conf.h b/include/linux/clk/clk-conf.h
index f3050e15f833..e0c362363c38 100644
--- a/include/linux/clk/clk-conf.h
+++ b/include/linux/clk/clk-conf.h
@@ -7,6 +7,8 @@
  * published by the Free Software Foundation.
  */
 
+#include <linux/types.h>
+
 struct device_node;
 
 #if defined(CONFIG_OF) && defined(CONFIG_COMMON_CLK)
-- 
2.5.0

Return-Path: <ricardo.ribalda@gmail.com>
Return-Path: <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	s.hauer@pengutronix.de,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v5 1/8] clk: core: New macro CLK_OF_DECLARE_DRIVER
Date: Tue,  5 Jul 2016 18:23:25 +0200
Message-Id: <1467735814-23518-2-git-send-email-ricardo.ribalda@gmail.com>
In-Reply-To: <1467735814-23518-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1467735814-23518-1-git-send-email-ricardo.ribalda@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

This will be used by drivers that requires initialization at
of_clk_init() time and also during platform device probing.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 include/linux/clk-provider.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index a39c0c530778..f403b8a5f8ca 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -780,6 +780,18 @@ extern struct of_device_id __clk_of_table;
 
 #define CLK_OF_DECLARE(name, compat, fn) OF_DECLARE_1(clk, name, compat, fn)
 
+/*
+ * Use this macro when you have a driver that requires two initialization
+ * routines, one at of_clk_init(), and one at platform device probe
+ */
+#define CLK_OF_DECLARE_DRIVER(name, compat, fn) \
+	static void name##_of_clk_init_driver(struct device_node *np)	\
+	{								\
+		of_node_clear_flag(np, OF_POPULATED);			\
+		fn(np);							\
+	}								\
+	OF_DECLARE_1(clk, name, compat, name##_of_clk_init_driver)
+
 #ifdef CONFIG_OF
 int of_clk_add_provider(struct device_node *np,
 			struct clk *(*clk_src_get)(struct of_phandle_args *args,
-- 
2.8.1

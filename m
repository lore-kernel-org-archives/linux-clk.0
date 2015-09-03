Return-Path: <keescook@www.outflux.net>
Date: Thu, 3 Sep 2015 13:54:07 -0700
From: Kees Cook <keescook@chromium.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@arm.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nicolas Iooss <nicolas.iooss_linux@m4x.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk_register_clkdev: remove format string interface
Message-ID: <20150903205407.GA19702@www.outflux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

Many callers either use NULL or const strings for the third argument of
clk_register_clkdev. For those that do not and use a non-const string,
this is a risk for format strings being accidentally processed (for
example in device names). As this interface is already used as if it
weren't a format string (prints nothing when NULL), and there are zero
users of the format strings, remove the format string interface to make
sure format strings will not leak into the clkdev.

$ git grep '\bclk_register_clkdev\b' | grep % | wc -l
0

Unfortunately, all the internals expect a va_list even though they treat
a NULL format string as special. To deal with this, we must pass either
(..., "%s", string) or (..., NULL, NULL) so that a the va_list will be
created correctly (passing the name as an argument, not a format string).

Signed-off-by: Kees Cook <keescook@chromium.org>
---
This should be used instead of "clk_register_clkdev: handle callers needing
format string", which didn't handle the NULL special cases correctly.
---
 drivers/clk/clkdev.c   | 28 ++++++++++++++++++++++------
 include/linux/clkdev.h |  3 +--
 2 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
index c0eaf0973bd2..6d5ce07faba1 100644
--- a/drivers/clk/clkdev.c
+++ b/drivers/clk/clkdev.c
@@ -352,11 +352,25 @@ void clkdev_drop(struct clk_lookup *cl)
 }
 EXPORT_SYMBOL(clkdev_drop);
 
+static struct clk_lookup *__clk_register_clkdev(struct clk_hw *hw,
+						const char *con_id,
+						const char *dev_id, ...)
+{
+	struct clk_lookup *cl;
+	va_list ap;
+
+	va_start(ap, dev_id);
+	cl = vclkdev_create(hw, con_id, dev_id ? "%s" : NULL, ap);
+	va_end(ap);
+
+	return cl;
+}
+
 /**
  * clk_register_clkdev - register one clock lookup for a struct clk
  * @clk: struct clk to associate with all clk_lookups
  * @con_id: connection ID string on device
- * @dev_id: format string describing device name
+ * @dev_id: string describing device name
  *
  * con_id or dev_id may be NULL as a wildcard, just as in the rest of
  * clkdev.
@@ -367,17 +381,19 @@ EXPORT_SYMBOL(clkdev_drop);
  * after clk_register().
  */
 int clk_register_clkdev(struct clk *clk, const char *con_id,
-	const char *dev_fmt, ...)
+	const char *dev_id)
 {
 	struct clk_lookup *cl;
-	va_list ap;
 
 	if (IS_ERR(clk))
 		return PTR_ERR(clk);
 
-	va_start(ap, dev_fmt);
-	cl = vclkdev_create(__clk_get_hw(clk), con_id, dev_fmt, ap);
-	va_end(ap);
+	/*
+	 * To eliminate the variadic argument on clk_register_clkdev, we
+	 * pass dev_id twice. When dev_id is non-NULL, the called function
+	 * will pass "%s", dev_id. When NULL, it will pass NULL, NULL.
+	 */
+	cl = __clk_register_clkdev(__clk_get_hw(clk), con_id, dev_id, dev_id);
 
 	return cl ? 0 : -ENOMEM;
 }
diff --git a/include/linux/clkdev.h b/include/linux/clkdev.h
index 08bffcc466de..c2c04f7cbe8a 100644
--- a/include/linux/clkdev.h
+++ b/include/linux/clkdev.h
@@ -44,8 +44,7 @@ struct clk_lookup *clkdev_create(struct clk *clk, const char *con_id,
 void clkdev_add_table(struct clk_lookup *, size_t);
 int clk_add_alias(const char *, const char *, const char *, struct device *);
 
-int clk_register_clkdev(struct clk *, const char *, const char *, ...)
-	__printf(3, 4);
+int clk_register_clkdev(struct clk *, const char *, const char *);
 int clk_register_clkdevs(struct clk *, struct clk_lookup *, size_t);
 
 #ifdef CONFIG_COMMON_CLK
-- 
1.9.1


-- 
Kees Cook
Chrome OS Security

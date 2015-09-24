Return-Path: <newchief@king.net.pl>
From: Paul Osmialowski <newchief@king.net.pl>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Russell King <linux@arm.linux.org.uk>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Paul Osmialowski <pawelo@king.net.pl>
Subject: [PATCH 1/1] clk: add devm_of_clk_get() and devm_of_clk_get_by_name() functions
Date: Thu, 24 Sep 2015 10:03:28 +0200
Message-Id: <1443081808-19688-2-git-send-email-newchief@king.net.pl>
In-Reply-To: <1443081808-19688-1-git-send-email-newchief@king.net.pl>
References: <1443081808-19688-1-git-send-email-newchief@king.net.pl>
List-ID: <linux-clk.vger.kernel.org>

From: Paul Osmialowski <pawelo@king.net.pl>

These two functions were added to ease management of clocks obtained
from OF device nodes.

Signed-off-by: Paul Osmialowski <pawelo@king.net.pl>
---
 drivers/clk/clk-devres.c | 46 ++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk.h      | 20 ++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/drivers/clk/clk-devres.c b/drivers/clk/clk-devres.c
index 8f57154..197075a 100644
--- a/drivers/clk/clk-devres.c
+++ b/drivers/clk/clk-devres.c
@@ -34,6 +34,52 @@ struct clk *devm_clk_get(struct device *dev, const char *id)
 }
 EXPORT_SYMBOL(devm_clk_get);
 
+#ifdef CONFIG_OF
+
+struct clk *devm_of_clk_get(struct device *dev, struct device_node *np,
+			    int index)
+{
+	struct clk **ptr, *clk;
+
+	ptr = devres_alloc(devm_clk_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	clk = of_clk_get(np, index);
+	if (!IS_ERR(clk)) {
+		*ptr = clk;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return clk;
+}
+EXPORT_SYMBOL(devm_of_clk_get);
+
+struct clk *devm_of_clk_get_by_name(struct device *dev, struct device_node *np,
+				    const char *name)
+{
+	struct clk **ptr, *clk;
+
+	ptr = devres_alloc(devm_clk_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	clk = of_clk_get_by_name(np, name);
+	if (!IS_ERR(clk)) {
+		*ptr = clk;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return clk;
+}
+EXPORT_SYMBOL(devm_of_clk_get_by_name);
+
+#endif /* CONFIG_OF */
+
 static int devm_clk_match(struct device *dev, void *res, void *data)
 {
 	struct clk **c = res;
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 0df4a51..d7763f1 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -504,4 +504,24 @@ static inline struct clk *of_clk_get_by_name(struct device_node *np,
 }
 #endif
 
+#if defined(CONFIG_OF) && defined(CONFIG_COMMON_CLK) && defined(CONFIG_HAVE_CLK)
+struct clk *devm_of_clk_get(struct device *dev, struct device_node *np,
+			    int index);
+struct clk *devm_of_clk_get_by_name(struct device *dev, struct device_node *np,
+				    const char *name);
+#else
+static inline struct clk *devm_of_clk_get(struct device *dev,
+					  struct device_node *np,
+					  int index)
+{
+	return ERR_PTR(-ENOENT);
+}
+static inline struct clk *devm_of_clk_get_by_name(struct device *dev,
+						  struct device_node *np,
+						  const char *name)
+{
+	return ERR_PTR(-ENOENT);
+}
+#endif
+
 #endif
-- 
2.4.9

Return-Path: <yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-clk@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] clk: split of_clk_get_parent_name() into two functions
Date: Fri, 20 Nov 2015 16:36:21 +0900
Message-Id: <1448004981-11133-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1448004981-11133-1-git-send-email-yamada.masahiro@socionext.com>
References: <1448004981-11133-1-git-send-email-yamada.masahiro@socionext.com>
List-ID: <linux-clk.vger.kernel.org>

Currently, there is no function to get the clock name of the given
node.  Create a new helper function, of_clk_get_name().  This is
useful to get the clock name where "clock-indices" property is used.

  of_clk_get_name(): get the clock name in the given node
  of_clk_get_parent_name(): get the name of the parent clock

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

I want to use of_clk_get_name() for my clk drivers for my SoCs,
which I will submit later.

I found this helper function is useful.


 drivers/clk/clk.c            | 45 +++++++++++++++++++++++++++-----------------
 include/linux/clk-provider.h |  1 +
 2 files changed, 29 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8698074..1788ec7 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3051,25 +3051,17 @@ int of_clk_get_parent_count(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(of_clk_get_parent_count);
 
-const char *of_clk_get_parent_name(struct device_node *np, int index)
+const char *of_clk_get_name(struct device_node *np, int index)
 {
-	struct of_phandle_args clkspec;
 	const char *clk_name;
 	const __be32 *list;
-	int rc, len, i;
-	struct clk *clk;
-
-	rc = of_parse_phandle_with_args(np, "clocks", "#clock-cells", index,
-					&clkspec);
-	if (rc)
-		return NULL;
-
-	index = clkspec.args_count ? clkspec.args[0] : 0;
+	int len, i, rc;
 
-	/* if there is an indices property, use it to transfer the index
+	/*
+	 * if there is an indices property, use it to transfer the index
 	 * specified into an array offset for the clock-output-names property.
 	 */
-	list = of_get_property(clkspec.np, "clock-indices", &len);
+	list = of_get_property(np, "clock-indices", &len);
 	if (list) {
 		len /= sizeof(*list);
 		for (i = 0; i < len; i++)
@@ -3081,9 +3073,29 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
 			return NULL;
 	}
 
-	if (of_property_read_string_index(clkspec.np, "clock-output-names",
-					  index,
-					  &clk_name) < 0) {
+	rc = of_property_read_string_index(np, "clock-output-names", index,
+					   &clk_name);
+
+	return rc ? NULL : clk_name;
+}
+EXPORT_SYMBOL_GPL(of_clk_get_name);
+
+const char *of_clk_get_parent_name(struct device_node *np, int index)
+{
+	struct of_phandle_args clkspec;
+	const char *clk_name;
+	struct clk *clk;
+	int rc;
+
+	rc = of_parse_phandle_with_args(np, "clocks", "#clock-cells", index,
+					&clkspec);
+	if (rc)
+		return NULL;
+
+	index = clkspec.args_count ? clkspec.args[0] : 0;
+
+	clk_name = of_clk_get_name(clkspec.np, index);
+	if (!clk_name) {
 		/*
 		 * Best effort to get the name if the clock has been
 		 * registered with the framework. If the clock isn't
@@ -3102,7 +3114,6 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
 		}
 	}
 
-
 	of_node_put(clkspec.np);
 	return clk_name;
 }
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index e7bd710..c6ff498 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -702,6 +702,7 @@ struct clk *of_clk_src_onecell_get(struct of_phandle_args *clkspec, void *data);
 int of_clk_get_parent_count(struct device_node *np);
 int of_clk_parent_fill(struct device_node *np, const char **parents,
 		       unsigned int size);
+const char *of_clk_get_name(struct device_node *np, int index);
 const char *of_clk_get_parent_name(struct device_node *np, int index);
 
 void of_clk_init(const struct of_device_id *matches);
-- 
1.9.1

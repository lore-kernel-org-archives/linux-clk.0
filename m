Return-Path: <dinguyen@opensource.altera.com>
From: <dinguyen@opensource.altera.com>
To: <sboyd@codeaurora.org>, <mturquette@linaro.org>
CC: <dinh.linux@gmail.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: [PATCHv3 1/2] clk: of: helper for filling parent clock array and return num of parents
Date: Fri, 5 Jun 2015 11:26:13 -0500
Message-ID: <1433521574-31052-2-git-send-email-dinguyen@opensource.altera.com>
In-Reply-To: <1433521574-31052-1-git-send-email-dinguyen@opensource.altera.com>
References: <1433521574-31052-1-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: dinguyen@opensource.altera.com
List-ID: <linux-clk.vger.kernel.org>

From: Dinh Nguyen <dinguyen@opensource.altera.com>

Sprinkled all through the platform clock drivers are code like this to
fill the clock parent array:

for (i = 0; i < num_parents; ++i)
	parent_names[i] = of_clk_get_parent_name(np, i);

The of_clk_parent_fill() will do the same as the code above, and while
at it, return the number of parents as well since the logic of the
function is to the walk the clock node to look for the parent.

Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
---
v3: shorten and clean up function comment, use EXPORT_SYMBOL_GPL
v2: use unsigned int for size
---
 drivers/clk/clk.c            | 20 ++++++++++++++++++++
 include/linux/clk-provider.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 459ce9d..5130622 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3060,6 +3060,26 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
 }
 EXPORT_SYMBOL_GPL(of_clk_get_parent_name);
 
+/**
+ * of_clk_parent_fill(): Fill @parents with names of @np's parents and return
+ * number of parents.
+ * @np: Device node pointer associated with clock provider
+ * @parents: pointer to char array that hold the parents' name
+ * @size: size of the parents array
+ *
+ * Returns number of parents for the clock node.
+ */
+int of_clk_parent_fill(struct device_node *np, const char **parents, unsigned int size)
+{
+	unsigned int i = 0;
+
+	while (i < size && (parents[i] = of_clk_get_parent_name(np, i)) != NULL)
+		i++;
+
+	return i;
+}
+EXPORT_SYMBOL_GPL(of_clk_parent_fill);
+
 struct clock_provider {
 	of_clk_init_cb_t clk_init_cb;
 	struct device_node *np;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index df69531..3ab66d3 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -624,6 +624,7 @@ struct clk *of_clk_src_simple_get(struct of_phandle_args *clkspec,
 				  void *data);
 struct clk *of_clk_src_onecell_get(struct of_phandle_args *clkspec, void *data);
 int of_clk_get_parent_count(struct device_node *np);
+int of_clk_parent_fill(struct device_node *np, const char **parents, unsigned int size);
 const char *of_clk_get_parent_name(struct device_node *np, int index);
 
 void of_clk_init(const struct of_device_id *matches);
-- 
2.2.1

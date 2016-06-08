Return-Path: <ricardo.ribalda@gmail.com>
Return-Path: <ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	s.hauer@pengutronix.de,
	jeremy.kerr@canonical.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH 1/3] clk: Add new function of_clk_is_provider()
Date: Wed,  8 Jun 2016 12:19:59 +0200
Message-Id: <1465381201-11537-2-git-send-email-ricardo.ribalda@gmail.com>
In-Reply-To: <1465381201-11537-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1465381201-11537-1-git-send-email-ricardo.ribalda@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

of_clk_is_provider() checks if a device_node has already been added to
the clk provider list. This can be used to avoid adding the same clock
provider twice.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/clk/clk.c            | 20 ++++++++++++++++++++
 include/linux/clk-provider.h |  5 +++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index d584004f7af7..2423c6373906 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3120,6 +3120,26 @@ __of_clk_get_hw_from_provider(struct of_clk_provider *provider,
 	return hw;
 }
 
+/**
+ * of_clk_is_provider() - Reports if a device node is already a clk provider
+ * @np: Device node pointer under test
+ */
+bool of_clk_is_provider(struct device_node *np)
+{
+	struct of_clk_provider *cp;
+
+	mutex_lock(&of_clk_mutex);
+	list_for_each_entry(cp, &of_clk_providers, link) {
+		if (cp->node == np) {
+			mutex_unlock(&of_clk_mutex);
+			return true;
+		}
+	}
+	mutex_unlock(&of_clk_mutex);
+	return false;
+}
+EXPORT_SYMBOL_GPL(of_clk_is_provider);
+
 struct clk *__of_clk_get_from_provider(struct of_phandle_args *clkspec,
 				       const char *dev_id, const char *con_id)
 {
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index fb39d5add173..a01b18797418 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -787,6 +787,7 @@ int of_clk_add_hw_provider(struct device_node *np,
 						 void *data),
 			   void *data);
 void of_clk_del_provider(struct device_node *np);
+bool of_clk_is_provider(struct device_node *np);
 struct clk *of_clk_src_simple_get(struct of_phandle_args *clkspec,
 				  void *data);
 struct clk_hw *of_clk_hw_simple_get(struct of_phandle_args *clkspec,
@@ -819,6 +820,10 @@ static inline int of_clk_add_hw_provider(struct device_node *np,
 	return 0;
 }
 static inline void of_clk_del_provider(struct device_node *np) {}
+static inline bool of_clk_is_provider(struct device_node *np)
+{
+	return false;
+}
 static inline struct clk *of_clk_src_simple_get(
 	struct of_phandle_args *clkspec, void *data)
 {
-- 
2.8.1

Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Tirupathi Reddy <tirupath@codeaurora.org>
Subject: [PATCH 1/2] clk: Add devm_of_clk_add_hw_provider()/del_provider() APIs
Date: Fri,  1 Sep 2017 16:16:40 -0700
Message-Id: <20170901231641.19141-2-sboyd@codeaurora.org>
In-Reply-To: <20170901231641.19141-1-sboyd@codeaurora.org>
References: <20170901231641.19141-1-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Sometimes we only have one of_clk_del_provider() call in driver
error and remove paths, because we're missing a
devm_of_clk_add_hw_provider() API. Introduce the API so we can
convert drivers to use this and potentially reduce the amount of
code needed to remove providers in drivers.

Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 Documentation/driver-model/devres.txt |  1 +
 drivers/clk/clk.c                     | 52 +++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h          | 13 +++++++++
 3 files changed, 66 insertions(+)

diff --git a/Documentation/driver-model/devres.txt b/Documentation/driver-model/devres.txt
index 30e04f7a690d..6b5e5e642b49 100644
--- a/Documentation/driver-model/devres.txt
+++ b/Documentation/driver-model/devres.txt
@@ -237,6 +237,7 @@ CLOCK
   devm_clk_get()
   devm_clk_put()
   devm_clk_hw_register()
+  devm_of_clk_add_hw_provider()
 
 DMA
   dmam_alloc_coherent()
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index c8d83acda006..d50398a79cbc 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3177,6 +3177,37 @@ int of_clk_add_hw_provider(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(of_clk_add_hw_provider);
 
+static void devm_of_clk_release_provider(struct device *dev, void *res)
+{
+	of_clk_del_provider(*(struct device_node **)res);
+}
+
+int devm_of_clk_add_hw_provider(struct device *dev,
+			struct clk_hw *(*get)(struct of_phandle_args *clkspec,
+					      void *data),
+			void *data)
+{
+	struct device_node **ptr, *np;
+	int ret;
+
+	ptr = devres_alloc(devm_of_clk_release_provider, sizeof(*ptr),
+			   GFP_KERNEL);
+	if (!ptr)
+		return -ENOMEM;
+
+	np = dev->of_node;
+	ret = of_clk_add_hw_provider(np, get, data);
+	if (!ret) {
+		*ptr = np;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return ret;;
+}
+EXPORT_SYMBOL_GPL(devm_of_clk_add_hw_provider);
+
 /**
  * of_clk_del_provider() - Remove a previously registered clock provider
  * @np: Device node pointer associated with clock provider
@@ -3198,6 +3229,27 @@ void of_clk_del_provider(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(of_clk_del_provider);
 
+static int devm_clk_provider_match(struct device *dev, void *res, void *data)
+{
+	struct device_node **np = res;
+
+	if (WARN_ON(!np || !*np))
+		return 0;
+
+	return *np == data;
+}
+
+void devm_of_clk_del_provider(struct device *dev)
+{
+	int ret;
+
+	ret = devres_release(dev, devm_of_clk_release_provider,
+			     devm_clk_provider_match, dev->of_node);
+
+	WARN_ON(ret);
+}
+EXPORT_SYMBOL(devm_of_clk_del_provider);
+
 static struct clk_hw *
 __of_clk_get_hw_from_provider(struct of_clk_provider *provider,
 			      struct of_phandle_args *clkspec)
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 1fc113fbf955..5a002e64999b 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -814,7 +814,12 @@ int of_clk_add_hw_provider(struct device_node *np,
 			   struct clk_hw *(*get)(struct of_phandle_args *clkspec,
 						 void *data),
 			   void *data);
+int devm_of_clk_add_hw_provider(struct device *dev,
+			   struct clk_hw *(*get)(struct of_phandle_args *clkspec,
+						 void *data),
+			   void *data);
 void of_clk_del_provider(struct device_node *np);
+void devm_of_clk_del_provider(struct device *dev);
 struct clk *of_clk_src_simple_get(struct of_phandle_args *clkspec,
 				  void *data);
 struct clk_hw *of_clk_hw_simple_get(struct of_phandle_args *clkspec,
@@ -846,7 +851,15 @@ static inline int of_clk_add_hw_provider(struct device_node *np,
 {
 	return 0;
 }
+static inline int devm_of_clk_add_hw_provider(struct device *dev,
+			   struct clk_hw *(*get)(struct of_phandle_args *clkspec,
+						 void *data),
+			   void *data)
+{
+	return 0;
+}
 static inline void of_clk_del_provider(struct device_node *np) {}
+static inline void devm_of_clk_del_provider(struct device *dev) {}
 static inline struct clk *of_clk_src_simple_get(
 	struct of_phandle_args *clkspec, void *data)
 {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

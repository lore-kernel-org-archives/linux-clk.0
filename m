Return-Path: <t-kristo@ti.com>
From: Tero Kristo <t-kristo@ti.com>
To: <linux-clk@vger.kernel.org>, <sboyd@kernel.org>, <mturquette@baylibre.com>
CC: <linux-omap@vger.kernel.org>, <tony@atomide.com>
Subject: [PATCH 04/11] clk: ti: clkctrl: support multiple clkctrl nodes under a cm node
Date: Fri, 31 Aug 2018 18:07:00 +0300
Message-ID: <1535728027-24573-5-git-send-email-t-kristo@ti.com>
In-Reply-To: <1535728027-24573-1-git-send-email-t-kristo@ti.com>
References: <1535728027-24573-1-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Currently, only one clkctrl node can be added under a specific CM node
due to limitation with the implementation. Modify the code to pick-up
clockdomain name from the clkctrl node instead of CM node if provided.
Also, add a new flag to the TI clock driver so that both modes can
be supported simultaneously.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/clk.c     |  7 ++++--
 drivers/clk/ti/clkctrl.c | 61 +++++++++++++++++++++++++++++++++++-------------
 drivers/clk/ti/clock.h   |  2 ++
 include/linux/clk/ti.h   |  1 +
 4 files changed, 53 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
index 27e0979..8b89be1 100644
--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -34,7 +34,7 @@
 struct ti_clk_ll_ops *ti_clk_ll_ops;
 static struct device_node *clocks_node_ptr[CLK_MAX_MEMMAPS];
 
-static struct ti_clk_features ti_clk_features;
+struct ti_clk_features ti_clk_features;
 
 struct clk_iomap {
 	struct regmap *regmap;
@@ -140,6 +140,9 @@ void __init ti_dt_clocks_register(struct ti_dt_clk oclks[])
 	int ret;
 	static bool clkctrl_nodes_missing;
 	static bool has_clkctrl_data;
+	static bool compat_mode;
+
+	compat_mode = ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT;
 
 	for (c = oclks; c->node_name != NULL; c++) {
 		strcpy(buf, c->node_name);
@@ -164,7 +167,7 @@ void __init ti_dt_clocks_register(struct ti_dt_clk oclks[])
 			continue;
 
 		node = of_find_node_by_name(NULL, buf);
-		if (num_args) {
+		if (num_args && compat_mode) {
 			parent = node;
 			node = of_get_child_by_name(parent, "clk");
 			of_node_put(parent);
diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
index 421b0539..51cb73a 100644
--- a/drivers/clk/ti/clkctrl.c
+++ b/drivers/clk/ti/clkctrl.c
@@ -259,8 +259,13 @@ static struct clk_hw *_ti_omap4_clkctrl_xlate(struct of_phandle_args *clkspec,
 	struct omap_clkctrl_clk *clkctrl_clk;
 	int ret = 0;
 
-	init.name = kasprintf(GFP_KERNEL, "%s:%s:%04x:%d", node->parent->name,
-			      node->name, offset, bit);
+	if (ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT)
+		init.name = kasprintf(GFP_KERNEL, "%s:%s:%04x:%d",
+				      node->parent->name, node->name, offset,
+				      bit);
+	else
+		init.name = kasprintf(GFP_KERNEL, "%s:%04x:%d", node->name,
+				      offset, bit);
 	clkctrl_clk = kzalloc(sizeof(*clkctrl_clk), GFP_KERNEL);
 	if (!init.name || !clkctrl_clk) {
 		ret = -ENOMEM;
@@ -441,6 +446,10 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 	u32 addr;
 	int ret;
 
+	if (!(ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT) &&
+	    !strcmp(node->name, "clk"))
+		ti_clk_features.flags |= TI_CLK_CLKCTRL_COMPAT;
+
 	addrp = of_get_address(node, 0, NULL, NULL);
 	addr = (u32)of_translate_address(node, addrp);
 
@@ -492,19 +501,35 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 
 	provider->base = of_iomap(node, 0);
 
-	provider->clkdm_name = kmalloc(strlen(node->parent->name) + 3,
-				       GFP_KERNEL);
-	if (!provider->clkdm_name) {
-		kfree(provider);
-		return;
+	if (ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT) {
+		provider->clkdm_name = kmalloc(strlen(node->parent->name) + 3,
+					       GFP_KERNEL);
+		if (!provider->clkdm_name) {
+			kfree(provider);
+			return;
+		}
+
+		/*
+		 * Create default clkdm name, replace _cm from end of parent
+		 * node name with _clkdm
+		 */
+		strcpy(provider->clkdm_name, node->parent->name);
+		provider->clkdm_name[strlen(provider->clkdm_name) - 2] = 0;
+	} else {
+		provider->clkdm_name = kmalloc(strlen(node->name), GFP_KERNEL);
+		if (!provider->clkdm_name) {
+			kfree(provider);
+			return;
+		}
+
+		/*
+		 * Create default clkdm name, replace _clkctrl from end of
+		 * node name with _clkdm
+		 */
+		strcpy(provider->clkdm_name, node->name);
+		provider->clkdm_name[strlen(provider->clkdm_name) - 7] = 0;
 	}
 
-	/*
-	 * Create default clkdm name, replace _cm from end of parent node
-	 * name with _clkdm
-	 */
-	strcpy(provider->clkdm_name, node->parent->name);
-	provider->clkdm_name[strlen(provider->clkdm_name) - 2] = 0;
 	strcat(provider->clkdm_name, "clkdm");
 
 	INIT_LIST_HEAD(&provider->clocks);
@@ -539,9 +564,13 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
 		init.flags = 0;
 		if (reg_data->flags & CLKF_SET_RATE_PARENT)
 			init.flags |= CLK_SET_RATE_PARENT;
-		init.name = kasprintf(GFP_KERNEL, "%s:%s:%04x:%d",
-				      node->parent->name, node->name,
-				      reg_data->offset, 0);
+		if (ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT)
+			init.name = kasprintf(GFP_KERNEL, "%s:%s:%04x:%d",
+					      node->parent->name, node->name,
+					      reg_data->offset, 0);
+		else
+			init.name = kasprintf(GFP_KERNEL, "%s:%04x:%d",
+					      node->name, reg_data->offset, 0);
 		clkctrl_clk = kzalloc(sizeof(*clkctrl_clk), GFP_KERNEL);
 		if (!init.name || !clkctrl_clk)
 			goto cleanup;
diff --git a/drivers/clk/ti/clock.h b/drivers/clk/ti/clock.h
index b582780..ce4aad6 100644
--- a/drivers/clk/ti/clock.h
+++ b/drivers/clk/ti/clock.h
@@ -233,6 +233,8 @@ int ti_clk_retry_init(struct device_node *node, void *user,
 extern const struct clk_ops ti_clk_mux_ops;
 extern const struct clk_ops omap_gate_clk_ops;
 
+extern struct ti_clk_features ti_clk_features;
+
 void omap2_init_clk_clkdm(struct clk_hw *hw);
 int omap2_clkops_enable_clkdm(struct clk_hw *hw);
 void omap2_clkops_disable_clkdm(struct clk_hw *hw);
diff --git a/include/linux/clk/ti.h b/include/linux/clk/ti.h
index a8faa38..3301bd0 100644
--- a/include/linux/clk/ti.h
+++ b/include/linux/clk/ti.h
@@ -290,6 +290,7 @@ struct ti_clk_features {
 #define TI_CLK_DPLL4_DENY_REPROGRAM		BIT(1)
 #define TI_CLK_DISABLE_CLKDM_CONTROL		BIT(2)
 #define TI_CLK_ERRATA_I810			BIT(3)
+#define TI_CLK_CLKCTRL_COMPAT			BIT(4)
 
 void ti_clk_setup_features(struct ti_clk_features *features);
 const struct ti_clk_features *ti_clk_get_features(void);
-- 
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

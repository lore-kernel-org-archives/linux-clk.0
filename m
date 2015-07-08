Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Gabriel Fernandez <gabriel.fernandez@linaro.org>,
	Pankaj Dev <pankaj.dev@st.com>
Subject: [PATCH] clk: st: Fix error paths and allocation style
Date: Tue,  7 Jul 2015 18:50:27 -0700
Message-Id: <1436320227-28896-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The error paths in this file leak memory and mappings and test
for pointers being valid after dereferencing them. Fix these
problems and properly free resources on errors. Fix some
stylistic things too like using sizeof(*ptr) and fitting more
code on a single line. Note that we don't unregister clocks here.
That needs a clk_composite_unregister() API that we don't have
right now.

Cc: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Cc: Pankaj Dev <pankaj.dev@st.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/st/clkgen-mux.c | 83 ++++++++++++++++++++++++---------------------
 1 file changed, 45 insertions(+), 38 deletions(-)

diff --git a/drivers/clk/st/clkgen-mux.c b/drivers/clk/st/clkgen-mux.c
index 717c4a91a17b..ab9298395264 100644
--- a/drivers/clk/st/clkgen-mux.c
+++ b/drivers/clk/st/clkgen-mux.c
@@ -30,7 +30,7 @@ static const char ** __init clkgen_mux_get_parents(struct device_node *np,
 	if (WARN_ON(nparents <= 0))
 		return ERR_PTR(-EINVAL);
 
-	parents = kzalloc(nparents * sizeof(const char *), GFP_KERNEL);
+	parents = kcalloc(nparents, sizeof(const char *), GFP_KERNEL);
 	if (!parents)
 		return ERR_PTR(-ENOMEM);
 
@@ -215,7 +215,7 @@ static const struct clk_ops clkgena_divmux_ops = {
 /**
  * clk_register_genamux - register a genamux clock with the clock framework
  */
-static struct clk *clk_register_genamux(const char *name,
+static struct clk * __init clk_register_genamux(const char *name,
 				const char **parent_names, u8 num_parents,
 				void __iomem *reg,
 				const struct clkgena_divmux_data *muxdata,
@@ -369,11 +369,10 @@ static const struct of_device_id clkgena_divmux_of_match[] = {
 	{}
 };
 
-static void __iomem * __init clkgen_get_register_base(
-				struct device_node *np)
+static void __iomem * __init clkgen_get_register_base(struct device_node *np)
 {
 	struct device_node *pnode;
-	void __iomem *reg = NULL;
+	void __iomem *reg;
 
 	pnode = of_get_parent(np);
 	if (!pnode)
@@ -398,7 +397,7 @@ static void __init st_of_clkgena_divmux_setup(struct device_node *np)
 	if (WARN_ON(!match))
 		return;
 
-	data = (struct clkgena_divmux_data *)match->data;
+	data = match->data;
 
 	reg = clkgen_get_register_base(np);
 	if (!reg)
@@ -406,18 +405,18 @@ static void __init st_of_clkgena_divmux_setup(struct device_node *np)
 
 	parents = clkgen_mux_get_parents(np, &num_parents);
 	if (IS_ERR(parents))
-		return;
+		goto err_parents;
 
 	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
 	if (!clk_data)
-		goto err;
+		goto err_alloc;
 
 	clk_data->clk_num = data->num_outputs;
-	clk_data->clks = kzalloc(clk_data->clk_num * sizeof(struct clk *),
+	clk_data->clks = kcalloc(clk_data->clk_num, sizeof(struct clk *),
 				 GFP_KERNEL);
 
 	if (!clk_data->clks)
-		goto err;
+		goto err_alloc_clks;
 
 	for (i = 0; i < clk_data->clk_num; i++) {
 		struct clk *clk;
@@ -447,11 +446,13 @@ static void __init st_of_clkgena_divmux_setup(struct device_node *np)
 	of_clk_add_provider(np, of_clk_src_onecell_get, clk_data);
 	return;
 err:
-	if (clk_data)
-		kfree(clk_data->clks);
-
+	kfree(clk_data->clks);
+err_alloc_clks:
 	kfree(clk_data);
+err_alloc:
 	kfree(parents);
+err_parents:
+	iounmap(reg);
 }
 CLK_OF_DECLARE(clkgenadivmux, "st,clkgena-divmux", st_of_clkgena_divmux_setup);
 
@@ -491,7 +492,7 @@ static void __init st_of_clkgena_prediv_setup(struct device_node *np)
 	void __iomem *reg;
 	const char *parent_name, *clk_name;
 	struct clk *clk;
-	struct clkgena_prediv_data *data;
+	const struct clkgena_prediv_data *data;
 
 	match = of_match_node(clkgena_prediv_of_match, np);
 	if (!match) {
@@ -499,7 +500,7 @@ static void __init st_of_clkgena_prediv_setup(struct device_node *np)
 		return;
 	}
 
-	data = (struct clkgena_prediv_data *)match->data;
+	data = match->data;
 
 	reg = clkgen_get_register_base(np);
 	if (!reg)
@@ -507,18 +508,18 @@ static void __init st_of_clkgena_prediv_setup(struct device_node *np)
 
 	parent_name = of_clk_get_parent_name(np, 0);
 	if (!parent_name)
-		return;
+		goto err;
 
 	if (of_property_read_string_index(np, "clock-output-names",
 					  0, &clk_name))
-		return;
+		goto err;
 
 	clk = clk_register_divider_table(NULL, clk_name, parent_name,
 					 CLK_GET_RATE_NOCACHE,
 					 reg + data->offset, data->shift, 1,
 					 0, data->table, NULL);
 	if (IS_ERR(clk))
-		return;
+		goto err;
 
 	of_clk_add_provider(np, of_clk_src_simple_get, clk);
 	pr_debug("%s: parent %s rate %u\n",
@@ -527,6 +528,8 @@ static void __init st_of_clkgena_prediv_setup(struct device_node *np)
 		(unsigned int)clk_get_rate(clk));
 
 	return;
+err:
+	iounmap(reg);
 }
 CLK_OF_DECLARE(clkgenaprediv, "st,clkgena-prediv", st_of_clkgena_prediv_setup);
 
@@ -630,7 +633,7 @@ static void __init st_of_clkgen_mux_setup(struct device_node *np)
 	void __iomem *reg;
 	const char **parents;
 	int num_parents;
-	struct clkgen_mux_data *data;
+	const struct clkgen_mux_data *data;
 
 	match = of_match_node(mux_of_match, np);
 	if (!match) {
@@ -638,7 +641,7 @@ static void __init st_of_clkgen_mux_setup(struct device_node *np)
 		return;
 	}
 
-	data = (struct clkgen_mux_data *)match->data;
+	data = match->data;
 
 	reg = of_iomap(np, 0);
 	if (!reg) {
@@ -650,7 +653,7 @@ static void __init st_of_clkgen_mux_setup(struct device_node *np)
 	if (IS_ERR(parents)) {
 		pr_err("%s: Failed to get parents (%ld)\n",
 				__func__, PTR_ERR(parents));
-		return;
+		goto err_parents;
 	}
 
 	clk = clk_register_mux(NULL, np->name, parents, num_parents,
@@ -666,12 +669,14 @@ static void __init st_of_clkgen_mux_setup(struct device_node *np)
 			__clk_get_name(clk_get_parent(clk)),
 			(unsigned int)clk_get_rate(clk));
 
+	kfree(parents);
 	of_clk_add_provider(np, of_clk_src_simple_get, clk);
+	return;
 
 err:
 	kfree(parents);
-
-	return;
+err_parents:
+	iounmap(reg);
 }
 CLK_OF_DECLARE(clkgen_mux, "st,clkgen-mux", st_of_clkgen_mux_setup);
 
@@ -707,12 +712,12 @@ static void __init st_of_clkgen_vcc_setup(struct device_node *np)
 	const char **parents;
 	int num_parents, i;
 	struct clk_onecell_data *clk_data;
-	struct clkgen_vcc_data *data;
+	const struct clkgen_vcc_data *data;
 
 	match = of_match_node(vcc_of_match, np);
 	if (WARN_ON(!match))
 		return;
-	data = (struct clkgen_vcc_data *)match->data;
+	data = match->data;
 
 	reg = of_iomap(np, 0);
 	if (!reg)
@@ -720,18 +725,18 @@ static void __init st_of_clkgen_vcc_setup(struct device_node *np)
 
 	parents = clkgen_mux_get_parents(np, &num_parents);
 	if (IS_ERR(parents))
-		return;
+		goto err_parents;
 
 	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
 	if (!clk_data)
-		goto err;
+		goto err_alloc;
 
 	clk_data->clk_num = VCC_MAX_CHANNELS;
-	clk_data->clks = kzalloc(clk_data->clk_num * sizeof(struct clk *),
+	clk_data->clks = kcalloc(clk_data->clk_num, sizeof(struct clk *),
 				 GFP_KERNEL);
 
 	if (!clk_data->clks)
-		goto err;
+		goto err_alloc_clks;
 
 	for (i = 0; i < clk_data->clk_num; i++) {
 		struct clk *clk;
@@ -750,21 +755,21 @@ static void __init st_of_clkgen_vcc_setup(struct device_node *np)
 		if (*clk_name == '\0')
 			continue;
 
-		gate = kzalloc(sizeof(struct clk_gate), GFP_KERNEL);
+		gate = kzalloc(sizeof(*gate), GFP_KERNEL);
 		if (!gate)
-			break;
+			goto err;
 
-		div = kzalloc(sizeof(struct clk_divider), GFP_KERNEL);
+		div = kzalloc(sizeof(*div), GFP_KERNEL);
 		if (!div) {
 			kfree(gate);
-			break;
+			goto err;
 		}
 
-		mux = kzalloc(sizeof(struct clk_mux), GFP_KERNEL);
+		mux = kzalloc(sizeof(*mux), GFP_KERNEL);
 		if (!mux) {
 			kfree(gate);
 			kfree(div);
-			break;
+			goto err;
 		}
 
 		gate->reg = reg + VCC_GATE_OFFSET;
@@ -823,10 +828,12 @@ err:
 		kfree(container_of(composite->mux_hw, struct clk_mux, hw));
 	}
 
-	if (clk_data)
-		kfree(clk_data->clks);
-
+	kfree(clk_data->clks);
+err_alloc_clks:
 	kfree(clk_data);
+err_alloc:
 	kfree(parents);
+err_parents:
+	iounmap(reg);
 }
 CLK_OF_DECLARE(clkgen_vcc, "st,clkgen-vcc", st_of_clkgen_vcc_setup);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


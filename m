Return-Path: <dinguyen@opensource.altera.com>
From: <dinguyen@opensource.altera.com>
To: <sboyd@codeaurora.org>, <mturquette@linaro.org>
CC: <dinh.linux@gmail.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@opensource.altera.com>,
	Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv2 6/6] clk: ti: make use of of_clk_parent_fill helper function
Date: Mon, 6 Jul 2015 22:59:06 -0500
Message-ID: <1436241546-16731-7-git-send-email-dinguyen@opensource.altera.com>
In-Reply-To: <1436241546-16731-1-git-send-email-dinguyen@opensource.altera.com>
References: <1436241546-16731-1-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: dinguyen@opensource.altera.com
List-ID: <linux-clk.vger.kernel.org>

From: Dinh Nguyen <dinguyen@opensource.altera.com>

Use of_clk_parent_fill to fill in the parent clock names' array.

Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
Cc: Tero Kristo <t-kristo@ti.com>
---
 drivers/clk/ti/apll.c      |    4 +---
 drivers/clk/ti/composite.c |    4 +---
 drivers/clk/ti/dpll.c      |    4 +---
 drivers/clk/ti/fapll.c     |    3 +--
 drivers/clk/ti/mux.c       |    4 +---
 5 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/ti/apll.c b/drivers/clk/ti/apll.c
index 49baf38..523880e 100644
--- a/drivers/clk/ti/apll.c
+++ b/drivers/clk/ti/apll.c
@@ -170,7 +170,6 @@ static void __init of_dra7_apll_setup(struct device_node *node)
 	struct clk_hw_omap *clk_hw = NULL;
 	struct clk_init_data *init = NULL;
 	const char **parent_names = NULL;
-	int i;
 
 	ad = kzalloc(sizeof(*ad), GFP_KERNEL);
 	clk_hw = kzalloc(sizeof(*clk_hw), GFP_KERNEL);
@@ -195,8 +194,7 @@ static void __init of_dra7_apll_setup(struct device_node *node)
 	if (!parent_names)
 		goto cleanup;
 
-	for (i = 0; i < init->num_parents; i++)
-		parent_names[i] = of_clk_get_parent_name(node, i);
+	of_clk_parent_fill(node, parent_names, init->num_parents);
 
 	init->parent_names = parent_names;
 
diff --git a/drivers/clk/ti/composite.c b/drivers/clk/ti/composite.c
index 96f83ce..dbef218 100644
--- a/drivers/clk/ti/composite.c
+++ b/drivers/clk/ti/composite.c
@@ -276,7 +276,6 @@ int __init ti_clk_add_component(struct device_node *node, struct clk_hw *hw,
 	int num_parents;
 	const char **parent_names;
 	struct component_clk *clk;
-	int i;
 
 	num_parents = of_clk_get_parent_count(node);
 
@@ -289,8 +288,7 @@ int __init ti_clk_add_component(struct device_node *node, struct clk_hw *hw,
 	if (!parent_names)
 		return -ENOMEM;
 
-	for (i = 0; i < num_parents; i++)
-		parent_names[i] = of_clk_get_parent_name(node, i);
+	of_clk_parent_fill(node, parent_names, num_parents);
 
 	clk = kzalloc(sizeof(*clk), GFP_KERNEL);
 	if (!clk) {
diff --git a/drivers/clk/ti/dpll.c b/drivers/clk/ti/dpll.c
index 2aacf7a..49acdf2 100644
--- a/drivers/clk/ti/dpll.c
+++ b/drivers/clk/ti/dpll.c
@@ -341,7 +341,6 @@ static void __init of_ti_dpll_setup(struct device_node *node,
 	struct clk_init_data *init = NULL;
 	const char **parent_names = NULL;
 	struct dpll_data *dd = NULL;
-	int i;
 	u8 dpll_mode = 0;
 
 	dd = kzalloc(sizeof(*dd), GFP_KERNEL);
@@ -370,8 +369,7 @@ static void __init of_ti_dpll_setup(struct device_node *node,
 	if (!parent_names)
 		goto cleanup;
 
-	for (i = 0; i < init->num_parents; i++)
-		parent_names[i] = of_clk_get_parent_name(node, i);
+	of_clk_parent_fill(node, parent_names, init->num_parents);
 
 	init->parent_names = parent_names;
 
diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
index 730aa62..b1c741b 100644
--- a/drivers/clk/ti/fapll.c
+++ b/drivers/clk/ti/fapll.c
@@ -558,8 +558,7 @@ static void __init ti_fapll_setup(struct device_node *node)
 		goto free;
 	}
 
-	parent_name[0] = of_clk_get_parent_name(node, 0);
-	parent_name[1] = of_clk_get_parent_name(node, 1);
+	of_clk_parent_fill(node, parent_name, 2);
 	init->parent_names = parent_name;
 
 	fd->clk_ref = of_clk_get(node, 0);
diff --git a/drivers/clk/ti/mux.c b/drivers/clk/ti/mux.c
index 5cdeed5..99fe27e 100644
--- a/drivers/clk/ti/mux.c
+++ b/drivers/clk/ti/mux.c
@@ -190,7 +190,6 @@ static void of_mux_clk_setup(struct device_node *node)
 	void __iomem *reg;
 	int num_parents;
 	const char **parent_names;
-	int i;
 	u8 clk_mux_flags = 0;
 	u32 mask = 0;
 	u32 shift = 0;
@@ -205,8 +204,7 @@ static void of_mux_clk_setup(struct device_node *node)
 	if (!parent_names)
 		goto cleanup;
 
-	for (i = 0; i < num_parents; i++)
-		parent_names[i] = of_clk_get_parent_name(node, i);
+	of_clk_parent_fill(node, parent_names, num_parents);
 
 	reg = ti_clk_get_reg_addr(node, 0);
 
-- 
1.7.9.5

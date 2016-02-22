Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 7/9] clk: ti: Update for of_clk_get_parent_count() returning unsigned int
Date: Mon, 22 Feb 2016 12:54:45 -0800
Message-Id: <1456174487-28397-8-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1456174487-28397-1-git-send-email-sboyd@codeaurora.org>
References: <1456174487-28397-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

Change the types here to unsigned int instead of int and update
the checks for == 0 instead < 1 to be more explicit about what's
going on now that of_clk_get_parent_count() has changed return
types.

Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/ti/clockdomain.c | 2 +-
 drivers/clk/ti/composite.c   | 8 ++++----
 drivers/clk/ti/dpll.c        | 2 +-
 drivers/clk/ti/mux.c         | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/ti/clockdomain.c b/drivers/clk/ti/clockdomain.c
index b9bc3b8df659..6cf9dd189a92 100644
--- a/drivers/clk/ti/clockdomain.c
+++ b/drivers/clk/ti/clockdomain.c
@@ -109,7 +109,7 @@ static void __init of_ti_clockdomain_setup(struct device_node *node)
 	struct clk_hw *clk_hw;
 	const char *clkdm_name = node->name;
 	int i;
-	int num_clks;
+	unsigned int num_clks;
 
 	num_clks = of_clk_get_parent_count(node);
 
diff --git a/drivers/clk/ti/composite.c b/drivers/clk/ti/composite.c
index 43345c417815..1cf70f452e1e 100644
--- a/drivers/clk/ti/composite.c
+++ b/drivers/clk/ti/composite.c
@@ -234,14 +234,14 @@ cleanup:
 
 static void __init of_ti_composite_clk_setup(struct device_node *node)
 {
-	int num_clks;
+	unsigned int num_clks;
 	int i;
 	struct clk_hw_omap_comp *cclk;
 
 	/* Number of component clocks to be put inside this clock */
 	num_clks = of_clk_get_parent_count(node);
 
-	if (num_clks < 1) {
+	if (!num_clks) {
 		pr_err("composite clk %s must have component(s)\n", node->name);
 		return;
 	}
@@ -271,13 +271,13 @@ CLK_OF_DECLARE(ti_composite_clock, "ti,composite-clock",
 int __init ti_clk_add_component(struct device_node *node, struct clk_hw *hw,
 				int type)
 {
-	int num_parents;
+	unsigned int num_parents;
 	const char **parent_names;
 	struct component_clk *clk;
 
 	num_parents = of_clk_get_parent_count(node);
 
-	if (num_parents < 1) {
+	if (!num_parents) {
 		pr_err("component-clock %s must have parent(s)\n", node->name);
 		return -EINVAL;
 	}
diff --git a/drivers/clk/ti/dpll.c b/drivers/clk/ti/dpll.c
index 5519b386edc0..4e54d25b2c6a 100644
--- a/drivers/clk/ti/dpll.c
+++ b/drivers/clk/ti/dpll.c
@@ -361,7 +361,7 @@ static void __init of_ti_dpll_setup(struct device_node *node,
 	init->ops = ops;
 
 	init->num_parents = of_clk_get_parent_count(node);
-	if (init->num_parents < 1) {
+	if (!init->num_parents) {
 		pr_err("%s must have parent(s)\n", node->name);
 		goto cleanup;
 	}
diff --git a/drivers/clk/ti/mux.c b/drivers/clk/ti/mux.c
index 618ded96ace3..44777ab6fdeb 100644
--- a/drivers/clk/ti/mux.c
+++ b/drivers/clk/ti/mux.c
@@ -178,7 +178,7 @@ static void of_mux_clk_setup(struct device_node *node)
 {
 	struct clk *clk;
 	void __iomem *reg;
-	int num_parents;
+	unsigned int num_parents;
 	const char **parent_names;
 	u8 clk_mux_flags = 0;
 	u32 mask = 0;
@@ -261,7 +261,7 @@ struct clk_hw *ti_clk_build_component_mux(struct ti_clk_mux *setup)
 static void __init of_ti_composite_mux_clk_setup(struct device_node *node)
 {
 	struct clk_mux *mux;
-	int num_parents;
+	unsigned int num_parents;
 	u32 val;
 
 	mux = kzalloc(sizeof(*mux), GFP_KERNEL);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

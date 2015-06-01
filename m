Return-Path: <dinguyen@opensource.altera.com>
From: <dinguyen@opensource.altera.com>
To: <sboyd@codeaurora.org>, <mturquette@linaro.org>
CC: <dinh.linux@gmail.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: [RFC/PATCHv1 2/2] clk: socfpga: make use of of_clk_parent_fill helper function
Date: Mon, 1 Jun 2015 16:46:26 -0500
Message-ID: <1433195186-14867-3-git-send-email-dinguyen@opensource.altera.com>
In-Reply-To: <1433195186-14867-1-git-send-email-dinguyen@opensource.altera.com>
References: <1433195186-14867-1-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: dinguyen@opensource.altera.com
List-ID: <linux-clk.vger.kernel.org>

From: Dinh Nguyen <dinguyen@opensource.altera.com>

Use of_clk_parent_fill to fill in the parent clock's array.

Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
---
 drivers/clk/socfpga/clk-gate.c | 6 +-----
 drivers/clk/socfpga/clk-pll.c  | 7 +------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/socfpga/clk-gate.c b/drivers/clk/socfpga/clk-gate.c
index dd3a78c..fb5a5d7 100644
--- a/drivers/clk/socfpga/clk-gate.c
+++ b/drivers/clk/socfpga/clk-gate.c
@@ -194,7 +194,6 @@ static void __init __socfpga_gate_init(struct device_node *node,
 	const char *parent_name[SOCFPGA_MAX_PARENTS];
 	struct clk_init_data init;
 	int rc;
-	int i = 0;
 
 	socfpga_clk = kzalloc(sizeof(*socfpga_clk), GFP_KERNEL);
 	if (WARN_ON(!socfpga_clk))
@@ -238,12 +237,9 @@ static void __init __socfpga_gate_init(struct device_node *node,
 	init.name = clk_name;
 	init.ops = ops;
 	init.flags = 0;
-	while (i < SOCFPGA_MAX_PARENTS && (parent_name[i] =
-			of_clk_get_parent_name(node, i)) != NULL)
-		i++;
 
+	init.num_parents = of_clk_parent_fill(node, parent_name, SOCFPGA_MAX_PARENTS);
 	init.parent_names = parent_name;
-	init.num_parents = i;
 	socfpga_clk->hw.hw.init = &init;
 
 	clk = clk_register(NULL, &socfpga_clk->hw.hw);
diff --git a/drivers/clk/socfpga/clk-pll.c b/drivers/clk/socfpga/clk-pll.c
index de6da95..8f26b52 100644
--- a/drivers/clk/socfpga/clk-pll.c
+++ b/drivers/clk/socfpga/clk-pll.c
@@ -92,7 +92,6 @@ static __init struct clk *__socfpga_pll_init(struct device_node *node,
 	struct clk_init_data init;
 	struct device_node *clkmgr_np;
 	int rc;
-	int i = 0;
 
 	of_property_read_u32(node, "reg", &reg);
 
@@ -111,11 +110,7 @@ static __init struct clk *__socfpga_pll_init(struct device_node *node,
 	init.ops = ops;
 	init.flags = 0;
 
-	while (i < SOCFPGA_MAX_PARENTS && (parent_name[i] =
-			of_clk_get_parent_name(node, i)) != NULL)
-		i++;
-
-	init.num_parents = i;
+	init.num_parents = of_clk_parent_fill(node, parent_name, SOCFPGA_MAX_PARENTS);
 	init.parent_names = parent_name;
 	pll_clk->hw.hw.init = &init;
 
-- 
2.2.1

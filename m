Return-Path: <dinguyen@opensource.altera.com>
From: <dinguyen@opensource.altera.com>
To: <sboyd@codeaurora.org>
CC: <dinh.linux@gmail.com>, <mturquette@baylibre.com>,
	<mgerlach@opensource.altera.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@opensource.altera.com>
Subject: [PATCHv2] clk: socfpga: allow for multiple parents on Arria10 periph clocks
Date: Mon, 22 Feb 2016 15:52:46 -0600
Message-ID: <1456177966-5839-1-git-send-email-dinguyen@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: dinguyen@opensource.altera.com
List-ID: <linux-clk.vger.kernel.org>

From: Dinh Nguyen <dinguyen@opensource.altera.com>

There are some Arria10 clocks of type "altr,socfpga-a10-perip-clk" that can
have multiple parents. Fix up the __socfpga_periph_init() to call
of_clk_parent_fill() that will return the appropriate number of parents.

Also, update __socfpga_gate_init() to call of_clk_parent_fill() helper
function.

Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
---
v2: fix compile warnings
---
 drivers/clk/socfpga/clk-gate-a10.c   | 6 +-----
 drivers/clk/socfpga/clk-periph-a10.c | 7 +++----
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/socfpga/clk-gate-a10.c b/drivers/clk/socfpga/clk-gate-a10.c
index 1cebf25..c2d5727 100644
--- a/drivers/clk/socfpga/clk-gate-a10.c
+++ b/drivers/clk/socfpga/clk-gate-a10.c
@@ -115,7 +115,6 @@ static void __init __socfpga_gate_init(struct device_node *node,
 	const char *parent_name[SOCFPGA_MAX_PARENTS];
 	struct clk_init_data init;
 	int rc;
-	int i = 0;
 
 	socfpga_clk = kzalloc(sizeof(*socfpga_clk), GFP_KERNEL);
 	if (WARN_ON(!socfpga_clk))
@@ -167,12 +166,9 @@ static void __init __socfpga_gate_init(struct device_node *node,
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
diff --git a/drivers/clk/socfpga/clk-periph-a10.c b/drivers/clk/socfpga/clk-periph-a10.c
index 1f397cb..70993f1 100644
--- a/drivers/clk/socfpga/clk-periph-a10.c
+++ b/drivers/clk/socfpga/clk-periph-a10.c
@@ -74,7 +74,7 @@ static __init void __socfpga_periph_init(struct device_node *node,
 	struct clk *clk;
 	struct socfpga_periph_clk *periph_clk;
 	const char *clk_name = node->name;
-	const char *parent_name;
+	const char *parent_name[SOCFPGA_MAX_PARENTS];
 	struct clk_init_data init;
 	int rc;
 	u32 fixed_div;
@@ -109,9 +109,8 @@ static __init void __socfpga_periph_init(struct device_node *node,
 	init.ops = ops;
 	init.flags = 0;
 
-	parent_name = of_clk_get_parent_name(node, 0);
-	init.num_parents = 1;
-	init.parent_names = &parent_name;
+	init.num_parents = of_clk_parent_fill(node, parent_name, SOCFPGA_MAX_PARENTS);
+	init.parent_names = parent_name;
 
 	periph_clk->hw.hw.init = &init;
 
-- 
2.6.2

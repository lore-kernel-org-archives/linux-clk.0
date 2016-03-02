Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: [PATCH] clk: sunxi: Remove use of VLAIS
Date: Tue,  1 Mar 2016 16:20:48 -0800
Message-Id: <1456878048-23393-1-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <20160226194830.GA21652@lukather>
List-ID: <linux-clk.vger.kernel.org>

Using an array allocated on the stack may lead to stack overflows
and other problems. Furthermore, VLAIS doesn't work well with
LLVM compilers, so move the allocation to the heap and avoid the
use of VLAIS here.

Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/sunxi/clk-sun8i-mbus.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi/clk-sun8i-mbus.c b/drivers/clk/sunxi/clk-sun8i-mbus.c
index 3aaa9cbef791..8e7128e69823 100644
--- a/drivers/clk/sunxi/clk-sun8i-mbus.c
+++ b/drivers/clk/sunxi/clk-sun8i-mbus.c
@@ -33,7 +33,7 @@ static DEFINE_SPINLOCK(sun8i_a23_mbus_lock);
 static void __init sun8i_a23_mbus_setup(struct device_node *node)
 {
 	int num_parents = of_clk_get_parent_count(node);
-	const char *parents[num_parents];
+	const char **parents;
 	const char *clk_name = node->name;
 	struct resource res;
 	struct clk_divider *div;
@@ -43,10 +43,14 @@ static void __init sun8i_a23_mbus_setup(struct device_node *node)
 	void __iomem *reg;
 	int err;
 
+	parents = kcalloc(num_parents, sizeof(*parents), GFP_KERNEL);
+	if (!parents)
+		return;
+
 	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
 	if (!reg) {
 		pr_err("Could not get registers for sun8i-mbus-clk\n");
-		return;
+		goto err_free_parents;
 	}
 
 	div = kzalloc(sizeof(*div), GFP_KERNEL);
@@ -107,6 +111,8 @@ err_free_div:
 	kfree(div);
 err_unmap:
 	iounmap(reg);
+err_free_parents:
+	kfree(parents);
 	of_address_to_resource(node, 0, &res);
 	release_mem_region(res.start, resource_size(&res));
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

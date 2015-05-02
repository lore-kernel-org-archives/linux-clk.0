Return-Path: <maxime.ripard@free-electrons.com>
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: linux-kernel@vger.kernel.org
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>,
	Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/6] clk: sunxi: Fix of_io_request_and_map error check
Date: Sat,  2 May 2015 17:03:22 +0200
Message-Id: <1430579006-32702-3-git-send-email-maxime.ripard@free-electrons.com>
In-Reply-To: <1430579006-32702-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1430579006-32702-1-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

of_io_request_and map returns an error pointer, but the current code assumes
that on error the returned pointer will be NULL.

Obviously, that makes the check completely useless. Change the test to actually
check for the proper error code.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org
---
 drivers/clk/sunxi/clk-sun9i-core.c | 10 +++++-----
 drivers/clk/sunxi/clk-sunxi.c      |  2 ++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/sunxi/clk-sun9i-core.c b/drivers/clk/sunxi/clk-sun9i-core.c
index d8da77d72861..887f4ea161bb 100644
--- a/drivers/clk/sunxi/clk-sun9i-core.c
+++ b/drivers/clk/sunxi/clk-sun9i-core.c
@@ -93,7 +93,7 @@ static void __init sun9i_a80_pll4_setup(struct device_node *node)
 	void __iomem *reg;
 
 	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
-	if (!reg) {
+	if (IS_ERR(reg)) {
 		pr_err("Could not get registers for a80-pll4-clk: %s\n",
 		       node->name);
 		return;
@@ -154,7 +154,7 @@ static void __init sun9i_a80_gt_setup(struct device_node *node)
 	struct clk *gt;
 
 	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
-	if (!reg) {
+	if (IS_ERR(reg)) {
 		pr_err("Could not get registers for a80-gt-clk: %s\n",
 		       node->name);
 		return;
@@ -218,7 +218,7 @@ static void __init sun9i_a80_ahb_setup(struct device_node *node)
 	void __iomem *reg;
 
 	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
-	if (!reg) {
+	if (IS_ERR(reg)) {
 		pr_err("Could not get registers for a80-ahb-clk: %s\n",
 		       node->name);
 		return;
@@ -244,7 +244,7 @@ static void __init sun9i_a80_apb0_setup(struct device_node *node)
 	void __iomem *reg;
 
 	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
-	if (!reg) {
+	if (IS_ERR(reg)) {
 		pr_err("Could not get registers for a80-apb0-clk: %s\n",
 		       node->name);
 		return;
@@ -310,7 +310,7 @@ static void __init sun9i_a80_apb1_setup(struct device_node *node)
 	void __iomem *reg;
 
 	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
-	if (!reg) {
+	if (IS_ERR(reg)) {
 		pr_err("Could not get registers for a80-apb1-clk: %s\n",
 		       node->name);
 		return;
diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
index 7e1e2bd189b6..9a82f17d2d73 100644
--- a/drivers/clk/sunxi/clk-sunxi.c
+++ b/drivers/clk/sunxi/clk-sunxi.c
@@ -198,6 +198,8 @@ static void __init sun6i_ahb1_clk_setup(struct device_node *node)
 	int i = 0;
 
 	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
+	if (IS_ERR(reg))
+		return;
 
 	/* we have a mux, we will have >1 parents */
 	while (i < SUN6I_AHB1_MAX_PARENTS &&
-- 
2.3.6

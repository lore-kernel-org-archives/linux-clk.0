Return-Path: <stephen.boyd@linaro.org>
Return-Path: <stephen.boyd@linaro.org>
From: Stephen Boyd <stephen.boyd@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	uclinux-h8-devel@lists.sourceforge.jp
Subject: [PATCH] clk: h8300: Migrate to clk_hw based registration APIs
Date: Tue, 16 Aug 2016 15:37:57 -0700
Message-Id: <20160816223757.726-1-stephen.boyd@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Now that we have clk_hw based provider APIs to register clks, we
can get rid of struct clk pointers while registering clks in
these drivers, allowing us to move closer to a clear split of
consumer and provider clk APIs.

Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: <uclinux-h8-devel@lists.sourceforge.jp>
Signed-off-by: Stephen Boyd <stephen.boyd@linaro.org>
---
 drivers/clk/h8300/clk-div.c     | 10 +++++-----
 drivers/clk/h8300/clk-h8s2678.c | 12 ++++++------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/h8300/clk-div.c b/drivers/clk/h8300/clk-div.c
index 4bf44a25d950..715b882205a8 100644
--- a/drivers/clk/h8300/clk-div.c
+++ b/drivers/clk/h8300/clk-div.c
@@ -14,7 +14,7 @@ static DEFINE_SPINLOCK(clklock);
 static void __init h8300_div_clk_setup(struct device_node *node)
 {
 	unsigned int num_parents;
-	struct clk *clk;
+	struct clk_hw *hw;
 	const char *clk_name = node->name;
 	const char *parent_name;
 	void __iomem *divcr = NULL;
@@ -38,15 +38,15 @@ static void __init h8300_div_clk_setup(struct device_node *node)
 
 	parent_name = of_clk_get_parent_name(node, 0);
 	of_property_read_u32(node, "renesas,width", &width);
-	clk = clk_register_divider(NULL, clk_name, parent_name,
+	hw = clk_hw_register_divider(NULL, clk_name, parent_name,
 				   CLK_SET_RATE_GATE, divcr, offset, width,
 				   CLK_DIVIDER_POWER_OF_TWO, &clklock);
-	if (!IS_ERR(clk)) {
-		of_clk_add_provider(node, of_clk_src_simple_get, clk);
+	if (!IS_ERR(hw)) {
+		of_clk_add_hw_provider(node, of_clk_hw_simple_get, hw);
 		return;
 	}
 	pr_err("%s: failed to register %s div clock (%ld)\n",
-	       __func__, clk_name, PTR_ERR(clk));
+	       __func__, clk_name, PTR_ERR(hw));
 error:
 	if (divcr)
 		iounmap(divcr);
diff --git a/drivers/clk/h8300/clk-h8s2678.c b/drivers/clk/h8300/clk-h8s2678.c
index c9c2fd575ef7..a26312460621 100644
--- a/drivers/clk/h8300/clk-h8s2678.c
+++ b/drivers/clk/h8300/clk-h8s2678.c
@@ -84,11 +84,11 @@ static const struct clk_ops pll_ops = {
 static void __init h8s2678_pll_clk_setup(struct device_node *node)
 {
 	unsigned int num_parents;
-	struct clk *clk;
 	const char *clk_name = node->name;
 	const char *parent_name;
 	struct pll_clock *pll_clock;
 	struct clk_init_data init;
+	int ret;
 
 	num_parents = of_clk_get_parent_count(node);
 	if (!num_parents) {
@@ -121,14 +121,14 @@ static void __init h8s2678_pll_clk_setup(struct device_node *node)
 	init.num_parents = 1;
 	pll_clock->hw.init = &init;
 
-	clk = clk_register(NULL, &pll_clock->hw);
-	if (IS_ERR(clk)) {
-		pr_err("%s: failed to register %s div clock (%ld)\n",
-		       __func__, clk_name, PTR_ERR(clk));
+	ret = clk_hw_register(NULL, &pll_clock->hw);
+	if (ret) {
+		pr_err("%s: failed to register %s div clock (%d)\n",
+		       __func__, clk_name, ret);
 		goto unmap_pllcr;
 	}
 
-	of_clk_add_provider(node, of_clk_src_simple_get, clk);
+	of_clk_add_hw_provider(node, of_clk_hw_simple_get, &pll_clock->hw);
 	return;
 
 unmap_pllcr:
-- 
2.9.0.rc2.8.ga28705d

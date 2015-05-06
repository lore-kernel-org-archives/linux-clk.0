Return-Path: <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 13/19] clk: ti: Silence sparse warnings
Date: Wed,  6 May 2015 00:39:50 -0700
Message-Id: <1430897996-11597-14-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
References: <1430897996-11597-1-git-send-email-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

drivers/clk/ti/clk.c:125:31: warning: incorrect type in return expression (different address spaces)
drivers/clk/ti/clk.c:125:31:    expected void [noderef] <asn:2>*
drivers/clk/ti/clk.c:125:31:    got void *
drivers/clk/ti/clk.c:132:31: warning: incorrect type in return expression (different address spaces)
drivers/clk/ti/clk.c:132:31:    expected void [noderef] <asn:2>*
drivers/clk/ti/clk.c:132:31:    got void *
drivers/clk/ti/dpll.c:180:14: warning: symbol '_get_reg' was not declared. Should it be static?
drivers/clk/ti/fapll.c:624:32: warning: Using plain integer as NULL pointer
drivers/clk/ti/fapll.c:625:31: warning: Using plain integer as NULL pointer
drivers/clk/ti/fapll.c:630:40: warning: Using plain integer as NULL pointer
drivers/clk/ti/clk-dra7-atl.c:158:22: warning: symbol 'atl_clk_ops' was not declared. Should it be static?
drivers/clk/ti/clk-dra7-atl.c:170:39: warning: Using plain integer as NULL pointer

Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/ti/clk-dra7-atl.c | 4 ++--
 drivers/clk/ti/clk.c          | 4 ++--
 drivers/clk/ti/dpll.c         | 2 +-
 drivers/clk/ti/fapll.c        | 6 +++---
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/ti/clk-dra7-atl.c b/drivers/clk/ti/clk-dra7-atl.c
index d86bc46b93bd..1fe7429a7536 100644
--- a/drivers/clk/ti/clk-dra7-atl.c
+++ b/drivers/clk/ti/clk-dra7-atl.c
@@ -155,7 +155,7 @@ static int atl_clk_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-const struct clk_ops atl_clk_ops = {
+static const struct clk_ops atl_clk_ops = {
 	.enable		= atl_clk_enable,
 	.disable	= atl_clk_disable,
 	.is_enabled	= atl_clk_is_enabled,
@@ -167,7 +167,7 @@ const struct clk_ops atl_clk_ops = {
 static void __init of_dra7_atl_clock_setup(struct device_node *node)
 {
 	struct dra7_atl_desc *clk_hw = NULL;
-	struct clk_init_data init = { 0 };
+	struct clk_init_data init = { NULL };
 	const char **parent_names = NULL;
 	struct clk *clk;
 
diff --git a/drivers/clk/ti/clk.c b/drivers/clk/ti/clk.c
index 0ebe5c51062b..64bb5e8a3b8c 100644
--- a/drivers/clk/ti/clk.c
+++ b/drivers/clk/ti/clk.c
@@ -122,14 +122,14 @@ void __iomem *ti_clk_get_reg_addr(struct device_node *node, int index)
 
 	if (i == CLK_MAX_MEMMAPS) {
 		pr_err("clk-provider not found for %s!\n", node->name);
-		return ERR_PTR(-ENOENT);
+		return IOMEM_ERR_PTR(-ENOENT);
 	}
 
 	reg->index = i;
 
 	if (of_property_read_u32_index(node, "reg", index, &val)) {
 		pr_err("%s must have reg[%d]!\n", node->name, index);
-		return ERR_PTR(-EINVAL);
+		return IOMEM_ERR_PTR(-EINVAL);
 	}
 
 	reg->offset = val;
diff --git a/drivers/clk/ti/dpll.c b/drivers/clk/ti/dpll.c
index 11478a501c30..2aacf7a3bcae 100644
--- a/drivers/clk/ti/dpll.c
+++ b/drivers/clk/ti/dpll.c
@@ -177,7 +177,7 @@ cleanup:
 }
 
 #if defined(CONFIG_ARCH_OMAP3) && defined(CONFIG_ATAGS)
-void __iomem *_get_reg(u8 module, u16 offset)
+static void __iomem *_get_reg(u8 module, u16 offset)
 {
 	u32 reg;
 	struct clk_omap_reg *reg_setup;
diff --git a/drivers/clk/ti/fapll.c b/drivers/clk/ti/fapll.c
index ffcd8e09e85b..730aa62454a2 100644
--- a/drivers/clk/ti/fapll.c
+++ b/drivers/clk/ti/fapll.c
@@ -621,13 +621,13 @@ static void __init ti_fapll_setup(struct device_node *node)
 
 		/* Check for hardwired audio_pll_clk1 */
 		if (is_audio_pll_clk1(freq)) {
-			freq = 0;
-			div = 0;
+			freq = NULL;
+			div = NULL;
 		} else {
 			/* Does the synthesizer have a FREQ register? */
 			v = readl_relaxed(freq);
 			if (!v)
-				freq = 0;
+				freq = NULL;
 		}
 		synth_clk = ti_fapll_synth_setup(fd, freq, div, output_instance,
 						 output_name, node->name,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

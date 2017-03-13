Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/4] clk: renesas: cpg-mssr: Add support for fixing up clock tables
Date: Mon, 13 Mar 2017 18:12:30 +0100
Message-Id: <1489425153-22623-2-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1489425153-22623-1-git-send-email-geert+renesas@glider.be>
References: <1489425153-22623-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

The same SoC may have different clocks and/or module clock parents,
depending on SoC revision.  One option is to use different sets of clock
tables for each SoC revision.  However, if the differences are small, it
is much more space-efficient to have a single set of clock tables, and
fix those up at runtime instead.

Hence provide three helpers:
  - Two helpers to NULLify core and module clocks that do not exist on
    some revisions (NULLified clocks are skipped during the registration
    phase),
  - One helper to reparent module clocks that have different clock
    parents.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Drop RFC state.
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 50 ++++++++++++++++++++++++++++++++++
 drivers/clk/renesas/renesas-cpg-mssr.h | 22 +++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index eadcbd43ff88319b..99eeec6f24ec6c6b 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -265,6 +265,11 @@ static void __init cpg_mssr_register_core_clk(const struct cpg_core_clk *core,
 	WARN_DEBUG(id >= priv->num_core_clks);
 	WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
 
+	if (!core->name) {
+		/* Skip NULLified clock */
+		return;
+	}
+
 	switch (core->type) {
 	case CLK_TYPE_IN:
 		clk = of_clk_get_by_name(priv->dev->of_node, core->name);
@@ -335,6 +340,11 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
 	WARN_DEBUG(mod->parent >= priv->num_core_clks + priv->num_mod_clks);
 	WARN_DEBUG(PTR_ERR(priv->clks[id]) != -ENOENT);
 
+	if (!mod->name) {
+		/* Skip NULLified clock */
+		return;
+	}
+
 	parent = priv->clks[mod->parent];
 	if (IS_ERR(parent)) {
 		clk = parent;
@@ -734,5 +744,45 @@ static int __init cpg_mssr_init(void)
 
 subsys_initcall(cpg_mssr_init);
 
+void __init cpg_core_nullify_range(struct cpg_core_clk *core_clks,
+				   unsigned int num_core_clks,
+				   unsigned int first_clk,
+				   unsigned int last_clk)
+{
+	unsigned int i;
+
+	for (i = 0; i < num_core_clks; i++)
+		if (core_clks[i].id >= first_clk &&
+		    core_clks[i].id <= last_clk)
+			core_clks[i].name = NULL;
+}
+
+void __init mssr_mod_nullify(struct mssr_mod_clk *mod_clks,
+			     unsigned int num_mod_clks,
+			     const unsigned int *clks, unsigned int n)
+{
+	unsigned int i, j;
+
+	for (i = 0, j = 0; i < num_mod_clks && j < n; i++)
+		if (mod_clks[i].id == clks[j]) {
+			mod_clks[i].name = NULL;
+			j++;
+		}
+}
+
+void __init mssr_mod_reparent(struct mssr_mod_clk *mod_clks,
+			      unsigned int num_mod_clks,
+			      const struct mssr_mod_reparent *clks,
+			      unsigned int n)
+{
+	unsigned int i, j;
+
+	for (i = 0, j = 0; i < num_mod_clks && j < n; i++)
+		if (mod_clks[i].id == clks[j].clk) {
+			mod_clks[i].parent = clks[j].parent;
+			j++;
+		}
+}
+
 MODULE_DESCRIPTION("Renesas CPG/MSSR Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index 4bb7a80c6469e12e..148f4f0aa2a487b0 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -134,4 +134,26 @@ extern const struct cpg_mssr_info r8a7743_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a7745_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a7795_cpg_mssr_info;
 extern const struct cpg_mssr_info r8a7796_cpg_mssr_info;
+
+
+    /*
+     * Helpers for fixing up clock tables depending on SoC revision
+     */
+
+struct mssr_mod_reparent {
+	unsigned int clk, parent;
+};
+
+
+extern void cpg_core_nullify_range(struct cpg_core_clk *core_clks,
+				   unsigned int num_core_clks,
+				   unsigned int first_clk,
+				   unsigned int last_clk);
+extern void mssr_mod_nullify(struct mssr_mod_clk *mod_clks,
+			     unsigned int num_mod_clks,
+			     const unsigned int *clks, unsigned int n);
+extern void mssr_mod_reparent(struct mssr_mod_clk *mod_clks,
+			      unsigned int num_mod_clks,
+			      const struct mssr_mod_reparent *clks,
+			      unsigned int n);
 #endif
-- 
2.7.4

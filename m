Return-Path: <ykaneko0929@gmail.com>
Return-Path: <ykaneko0929@gmail.com>
From: Yoshihiro Kaneko <ykaneko0929@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] clk: renesas: rcar-gen3: Add Z clock divider support
Date: Thu, 20 Apr 2017 02:46:21 +0900
Message-Id: <1492624001-3758-1-git-send-email-ykaneko0929@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This patch adds Z clock divider support for R-Car Gen3 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
This patch is based on the clk-next branch of linux-clk tree.

 drivers/clk/renesas/rcar-gen3-cpg.c | 143 ++++++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rcar-gen3-cpg.h |   1 +
 2 files changed, 144 insertions(+)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 3dee900..8419f27 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -29,6 +29,145 @@
 #define CPG_PLL2CR		0x002c
 #define CPG_PLL4CR		0x01f4
 
+/** Modify for Z-clock
+ * -----------------------------------------------------------------------------
+ * Z Clock
+ *
+ * Traits of this clock:
+ * prepare - clk_prepare only ensures that parents are prepared
+ * enable - clk_enable only ensures that parents are enabled
+ * rate - rate is adjustable.  clk->rate = parent->rate * mult / 32
+ * parent - fixed parent.  No clk_set_parent support
+ */
+#define CPG_FRQCRB			0x00000004
+#define CPG_FRQCRB_KICK			BIT(31)
+#define CPG_FRQCRC			0x000000e0
+#define CPG_FRQCRC_ZFC_MASK		(0x1f << 8)
+#define CPG_FRQCRC_ZFC_SHIFT		8
+
+
+struct cpg_z_clk {
+	struct clk_hw hw;
+	void __iomem *reg;
+	void __iomem *kick_reg;
+};
+
+#define to_z_clk(_hw)	container_of(_hw, struct cpg_z_clk, hw)
+
+static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
+					   unsigned long parent_rate)
+{
+	struct cpg_z_clk *zclk = to_z_clk(hw);
+	unsigned int mult;
+	unsigned int val;
+	unsigned long rate;
+
+	val = (clk_readl(zclk->reg) & CPG_FRQCRC_ZFC_MASK)
+	    >> CPG_FRQCRC_ZFC_SHIFT;
+	mult = 32 - val;
+
+	rate = div_u64((u64)parent_rate * mult + 16, 32);
+	/* Round to closest value at 100MHz unit */
+	rate = 100000000*DIV_ROUND_CLOSEST(rate, 100000000);
+	return rate;
+}
+
+static long cpg_z_clk_round_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long *parent_rate)
+{
+	unsigned long prate  = *parent_rate;
+	unsigned int mult;
+
+	if (!prate)
+		prate = 1;
+
+	mult = div_u64((u64)rate * 32 + prate/2, prate);
+	mult = clamp(mult, 1U, 32U);
+
+	return *parent_rate / 32 * mult;
+}
+
+static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
+			      unsigned long parent_rate)
+{
+	struct cpg_z_clk *zclk = to_z_clk(hw);
+	unsigned int mult;
+	u32 val, kick;
+	unsigned int i;
+
+	mult = div_u64((u64)rate * 32 + parent_rate/2, parent_rate);
+	mult = clamp(mult, 1U, 32U);
+
+	if (clk_readl(zclk->kick_reg) & CPG_FRQCRB_KICK)
+		return -EBUSY;
+
+	val = clk_readl(zclk->reg);
+	val &= ~CPG_FRQCRC_ZFC_MASK;
+	val |= (32 - mult) << CPG_FRQCRC_ZFC_SHIFT;
+	clk_writel(val, zclk->reg);
+
+	/*
+	 * Set KICK bit in FRQCRB to update hardware setting and wait for
+	 * clock change completion.
+	 */
+	kick = clk_readl(zclk->kick_reg);
+	kick |= CPG_FRQCRB_KICK;
+	clk_writel(kick, zclk->kick_reg);
+
+	/*
+	 * Note: There is no HW information about the worst case latency.
+	 *
+	 * Using experimental measurements, it seems that no more than
+	 * ~10 iterations are needed, independently of the CPU rate.
+	 * Since this value might be dependent of external xtal rate, pll1
+	 * rate or even the other emulation clocks rate, use 1000 as a
+	 * "super" safe value.
+	 */
+	for (i = 1000; i; i--) {
+		if (!(clk_readl(zclk->kick_reg) & CPG_FRQCRB_KICK))
+			return 0;
+
+		cpu_relax();
+	}
+
+	return -ETIMEDOUT;
+}
+
+static const struct clk_ops cpg_z_clk_ops = {
+	.recalc_rate = cpg_z_clk_recalc_rate,
+	.round_rate = cpg_z_clk_round_rate,
+	.set_rate = cpg_z_clk_set_rate,
+};
+
+static struct clk * __init cpg_z_clk_register(const char *name,
+					      const char *parent_name,
+					      void __iomem *reg)
+{
+	struct clk_init_data init;
+	struct cpg_z_clk *zclk;
+	struct clk *clk;
+
+	zclk = kzalloc(sizeof(*zclk), GFP_KERNEL);
+	if (!zclk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &cpg_z_clk_ops;
+	init.flags = 0;
+	init.parent_names = &parent_name;
+	init.num_parents = 1;
+
+	zclk->reg = reg + CPG_FRQCRC;
+	zclk->kick_reg = reg + CPG_FRQCRB;
+	zclk->hw.init = &init;
+
+	clk = clk_register(NULL, &zclk->hw);
+	if (IS_ERR(clk))
+		kfree(zclk);
+
+	return clk;
+}
+/** End of modifying for Z-clock */
 
 /*
  * SDn Clock
@@ -360,6 +499,10 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 			parent = clks[cpg_clk_extalr];
 		break;
 
+	case CLK_TYPE_GEN3_Z:
+		return cpg_z_clk_register(core->name, __clk_get_name(parent),
+					  base);
+
 	default:
 		return ERR_PTR(-EINVAL);
 	}
diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
index 073be54..b1e883d 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.h
+++ b/drivers/clk/renesas/rcar-gen3-cpg.h
@@ -20,6 +20,7 @@ enum rcar_gen3_clk_types {
 	CLK_TYPE_GEN3_PLL4,
 	CLK_TYPE_GEN3_SD,
 	CLK_TYPE_GEN3_R,
+	CLK_TYPE_GEN3_Z,
 };
 
 #define DEF_GEN3_SD(_name, _id, _parent, _offset)	\
-- 
1.9.1

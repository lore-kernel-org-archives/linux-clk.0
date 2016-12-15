Return-Path: <chris.brandt@renesas.com>
From: Chris Brandt <chris.brandt@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: Simon Horman <horms+renesas@verge.net.au>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH] clk: renesas: mstp: Support 8-bit registers for r7s72100
Date: Wed, 14 Dec 2016 21:11:34 -0500
Message-Id: <20161215021134.14902-1-chris.brandt@renesas.com>
List-ID: <linux-clk.vger.kernel.org>

The RZ/A1 is different than the other Renesas SOCs because the MSTP
registers are 8-bit instead of 32-bit and if you try writing values as
32-bit nothing happens...meaning this driver never worked for r7s72100.

Fixes: b6face404f38 ("ARM: shmobile: r7s72100: add essential clock nodes to dtsi")
Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/clk/renesas/clk-mstp.c | 33 ++++++++++++++++++++++++++++-----
 1 file changed, 28 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index 9375777..69c3604 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -59,6 +59,21 @@ struct mstp_clock {
 
 #define to_mstp_clock(_hw) container_of(_hw, struct mstp_clock, hw)
 
+/**
+ * Some devices only have 8-bit registers
+ */
+bool reg_width_8bit;
+
+static inline u32 cpg_mstp_read(u32 __iomem *reg)
+{
+	return reg_width_8bit ? readb(reg) : clk_readl(reg);
+}
+
+static inline void cpg_mstp_write(u32 val, u32 __iomem *reg)
+{
+	reg_width_8bit ? writeb(val, reg) : clk_writel(val, reg);
+}
+
 static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 {
 	struct mstp_clock *clock = to_mstp_clock(hw);
@@ -70,12 +85,12 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 
 	spin_lock_irqsave(&group->lock, flags);
 
-	value = clk_readl(group->smstpcr);
+	value = cpg_mstp_read(group->smstpcr);
 	if (enable)
 		value &= ~bitmask;
 	else
 		value |= bitmask;
-	clk_writel(value, group->smstpcr);
+	cpg_mstp_write(value, group->smstpcr);
 
 	spin_unlock_irqrestore(&group->lock, flags);
 
@@ -83,7 +98,7 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 		return 0;
 
 	for (i = 1000; i > 0; --i) {
-		if (!(clk_readl(group->mstpsr) & bitmask))
+		if (!(cpg_mstp_read(group->mstpsr) & bitmask))
 			break;
 		cpu_relax();
 	}
@@ -114,9 +129,9 @@ static int cpg_mstp_clock_is_enabled(struct clk_hw *hw)
 	u32 value;
 
 	if (group->mstpsr)
-		value = clk_readl(group->mstpsr);
+		value = cpg_mstp_read(group->mstpsr);
 	else
-		value = clk_readl(group->smstpcr);
+		value = cpg_mstp_read(group->smstpcr);
 
 	return !(value & BIT(clock->bit_index));
 }
@@ -243,6 +258,14 @@ static void __init cpg_mstp_clocks_init(struct device_node *np)
 }
 CLK_OF_DECLARE(cpg_mstp_clks, "renesas,cpg-mstp-clocks", cpg_mstp_clocks_init);
 
+static void __init cpg_mstp_clocks_init8(struct device_node *np)
+{
+	reg_width_8bit = true;
+	cpg_mstp_clocks_init(np);
+}
+CLK_OF_DECLARE(cpg_mstp_clks8, "renesas,r7s72100-mstp-clocks",
+	       cpg_mstp_clocks_init8);
+
 int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev)
 {
 	struct device_node *np = dev->of_node;
-- 
2.10.1

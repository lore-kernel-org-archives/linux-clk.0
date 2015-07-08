Return-Path: <jun.nie@linaro.org>
Return-Path: <jun.nie@linaro.org>
From: Jun Nie <jun.nie@linaro.org>
To: mturquette@linaro.org,
	sboyd@codeaurora.org,
	linux-clk@vger.kernel.org
Cc: shawn.guo@linaro.org,
	jason.liu@linaro.org,
	wan.zhijun@zte.com.cn,
	Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 1/2] clk: zx: Add audio div clock method for zx296702
Date: Wed,  8 Jul 2015 17:58:12 +0800
Message-Id: <1436349493-5453-1-git-send-email-jun.nie@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

Add SPDIF/I2S divider clock method for zx296702

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/clk/zte/clk-pll.c | 113 ++++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/zte/clk.h     |  11 +++++
 2 files changed, 124 insertions(+)

diff --git a/drivers/clk/zte/clk-pll.c b/drivers/clk/zte/clk-pll.c
index c3b221a..63f8852 100644
--- a/drivers/clk/zte/clk-pll.c
+++ b/drivers/clk/zte/clk-pll.c
@@ -13,10 +13,12 @@
 #include <linux/iopoll.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <asm/div64.h>
 
 #include "clk.h"
 
 #define to_clk_zx_pll(_hw) container_of(_hw, struct clk_zx_pll, hw)
+#define to_clk_zx_audio(_hw) container_of(_hw, struct clk_zx_audio, hw)
 
 #define CFG0_CFG1_OFFSET 4
 #define LOCK_FLAG BIT(30)
@@ -170,3 +172,114 @@ struct clk *clk_register_zx_pll(const char *name, const char *parent_name,
 
 	return clk;
 }
+
+#define BPAR 1000000
+static unsigned long zx_audio_recalc_rate(struct clk_hw *hw,
+		unsigned long parent_rate)
+{
+	struct clk_zx_audio *zx_audio = to_clk_zx_audio(hw);
+	u32 sel, integ, fra_div, tmp;
+	u64 tmp64 = (u64)parent_rate * BPAR;
+
+	tmp = readl_relaxed(zx_audio->reg_base);
+	sel = (tmp >> 24) & BIT(0);
+	integ = (tmp >> 16) & 0xff;
+	fra_div = tmp & 0xff;
+
+	tmp = fra_div * BPAR;
+	tmp = tmp / 0x255;
+	tmp += sel * BPAR;
+	tmp += 2 * integ * BPAR;
+	do_div(tmp64, tmp);
+
+	return (u32)tmp64;
+}
+
+static long zx_audio_round_rate(struct clk_hw *hw, unsigned long rate,
+			      unsigned long *prate)
+{
+	return rate;
+}
+
+static int zx_audio_set_rate(struct clk_hw *hw, unsigned long rate,
+			   unsigned long parent_rate)
+{
+	struct clk_zx_audio *zx_audio = to_clk_zx_audio(hw);
+	u32 sel, integ, fra_div, tmp;
+	u64 tmp64 = (u64)parent_rate * BPAR;
+
+	do_div(tmp64, rate);
+	integ = (u32)tmp64 / BPAR;
+
+	tmp = (u32)tmp64 % BPAR;
+	tmp = tmp * 2;
+	sel = tmp / BPAR;
+
+	tmp = tmp % BPAR;
+	fra_div = tmp * 0xff / BPAR;
+	tmp = (sel << 24) | (integ << 16) | (0xff << 8) | fra_div;
+
+	/* Set I2S integer divider as 1. This bit is reserved for SPDIF
+	 * and do no harm.
+	 */
+	tmp |= BIT(28);
+	writel_relaxed(tmp, zx_audio->reg_base);
+
+	return 0;
+}
+
+#define ZX_AUDIO_EN BIT(25)
+static int zx_audio_enable(struct clk_hw *hw)
+{
+	struct clk_zx_audio *zx_audio = to_clk_zx_audio(hw);
+	u32 reg;
+
+	reg = readl_relaxed(zx_audio->reg_base);
+	writel_relaxed(reg & ~ZX_AUDIO_EN, zx_audio->reg_base);
+	return 0;
+}
+
+static void zx_audio_disable(struct clk_hw *hw)
+{
+	struct clk_zx_audio *zx_audio = to_clk_zx_audio(hw);
+	u32 reg;
+
+	reg = readl_relaxed(zx_audio->reg_base);
+	writel_relaxed(reg | ZX_AUDIO_EN, zx_audio->reg_base);
+}
+
+static const struct clk_ops zx_audio_ops = {
+	.recalc_rate = zx_audio_recalc_rate,
+	.round_rate = zx_audio_round_rate,
+	.set_rate = zx_audio_set_rate,
+	.enable = zx_audio_enable,
+	.disable = zx_audio_disable,
+};
+
+struct clk *clk_register_zx_audio(const char *name, const char *parent_name,
+	unsigned long flags, void __iomem *reg_base)
+{
+	struct clk_zx_audio *zx_audio;
+	struct clk *clk;
+	struct clk_init_data init;
+
+	zx_audio = kzalloc(sizeof(*zx_audio), GFP_KERNEL);
+	if (!zx_audio)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.ops = &zx_audio_ops;
+	init.flags = flags;
+	init.parent_names = parent_name ? &parent_name : NULL;
+	init.num_parents = parent_name ? 1 : 0;
+
+	zx_audio->reg_base = reg_base;
+	zx_audio->hw.init = &init;
+
+	clk = clk_register(NULL, &zx_audio->hw);
+
+	if (IS_ERR(clk))
+		kfree(zx_audio);
+
+	return clk;
+}
diff --git a/drivers/clk/zte/clk.h b/drivers/clk/zte/clk.h
index 0914a82..eca4a87 100644
--- a/drivers/clk/zte/clk.h
+++ b/drivers/clk/zte/clk.h
@@ -29,4 +29,15 @@ struct clk_zx_pll {
 struct clk *clk_register_zx_pll(const char *name, const char *parent_name,
 	unsigned long flags, void __iomem *reg_base,
 	const struct zx_pll_config *lookup_table, int count, spinlock_t *lock);
+
+
+struct clk_zx_audio {
+	struct clk_hw hw;
+	void __iomem *reg_base;
+	const struct zx_audio_config *lookup_table; /* order by rate asc */
+	int count;
+};
+
+struct clk *clk_register_zx_audio(const char *name, const char *parent_name,
+	unsigned long flags, void __iomem *reg_base);
 #endif
-- 
1.9.1

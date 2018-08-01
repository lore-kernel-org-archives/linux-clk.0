Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 1/4] clk: meson: clk-pll: add enable bit
Date: Wed,  1 Aug 2018 16:00:50 +0200
Message-Id: <20180801140053.25899-2-jbrunet@baylibre.com>
In-Reply-To: <20180801140053.25899-1-jbrunet@baylibre.com>
References: <20180801140053.25899-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add the enable the bit of the pll clocks.
These pll clocks may be disabled but we can't model this as an external
gate since the pll needs to lock when enabled.

Adding this bit allows to drop the poke of the first register of PLL.
This will be useful to model the different components of the pll using
generic clocks elements

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg.c     | 28 +++++++++++++++++++---
 drivers/clk/meson/clk-pll.c | 47 +++++++++++++++++++++++++++++++++----
 drivers/clk/meson/clkc.h    |  1 +
 drivers/clk/meson/gxbb.c    | 32 +++++++++++++++++++++++--
 drivers/clk/meson/meson8b.c | 15 ++++++++++++
 5 files changed, 113 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 00ce62ad6416..6d8976554656 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -24,6 +24,11 @@ static DEFINE_SPINLOCK(meson_clk_lock);
 
 static struct clk_regmap axg_fixed_pll = {
 	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = HHI_MPLL_CNTL,
+			.shift   = 30,
+			.width   = 1,
+		},
 		.m = {
 			.reg_off = HHI_MPLL_CNTL,
 			.shift   = 0,
@@ -65,6 +70,11 @@ static struct clk_regmap axg_fixed_pll = {
 
 static struct clk_regmap axg_sys_pll = {
 	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = HHI_SYS_PLL_CNTL,
+			.shift   = 30,
+			.width   = 1,
+		},
 		.m = {
 			.reg_off = HHI_SYS_PLL_CNTL,
 			.shift   = 0,
@@ -197,11 +207,15 @@ static const struct reg_sequence axg_gp0_init_regs[] = {
 	{ .reg = HHI_GP0_PLL_CNTL3,	.def = 0x0a59a288 },
 	{ .reg = HHI_GP0_PLL_CNTL4,	.def = 0xc000004d },
 	{ .reg = HHI_GP0_PLL_CNTL5,	.def = 0x00078000 },
-	{ .reg = HHI_GP0_PLL_CNTL,	.def = 0x40010250 },
 };
 
 static struct clk_regmap axg_gp0_pll = {
 	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = HHI_GP0_PLL_CNTL,
+			.shift   = 30,
+			.width   = 1,
+		},
 		.m = {
 			.reg_off = HHI_GP0_PLL_CNTL,
 			.shift   = 0,
@@ -250,11 +264,15 @@ static const struct reg_sequence axg_hifi_init_regs[] = {
 	{ .reg = HHI_HIFI_PLL_CNTL3,	.def = 0x0a6a3a88 },
 	{ .reg = HHI_HIFI_PLL_CNTL4,	.def = 0xc000004d },
 	{ .reg = HHI_HIFI_PLL_CNTL5,	.def = 0x00058000 },
-	{ .reg = HHI_HIFI_PLL_CNTL,	.def = 0x40010250 },
 };
 
 static struct clk_regmap axg_hifi_pll = {
 	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = HHI_HIFI_PLL_CNTL,
+			.shift   = 30,
+			.width   = 1,
+		},
 		.m = {
 			.reg_off = HHI_HIFI_PLL_CNTL,
 			.shift   = 0,
@@ -637,7 +655,6 @@ static const struct pll_rate_table axg_pcie_pll_rate_table[] = {
 };
 
 static const struct reg_sequence axg_pcie_init_regs[] = {
-	{ .reg = HHI_PCIE_PLL_CNTL,	.def = 0x400106c8 },
 	{ .reg = HHI_PCIE_PLL_CNTL1,	.def = 0x0084a2aa },
 	{ .reg = HHI_PCIE_PLL_CNTL2,	.def = 0xb75020be },
 	{ .reg = HHI_PCIE_PLL_CNTL3,	.def = 0x0a47488e },
@@ -648,6 +665,11 @@ static const struct reg_sequence axg_pcie_init_regs[] = {
 
 static struct clk_regmap axg_pcie_pll = {
 	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = HHI_PCIE_PLL_CNTL,
+			.shift   = 30,
+			.width   = 1,
+		},
 		.m = {
 			.reg_off = HHI_PCIE_PLL_CNTL,
 			.shift   = 0,
diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 3e04617ac47f..8aaefe67025f 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -185,12 +185,45 @@ static void meson_clk_pll_init(struct clk_hw *hw)
 	}
 }
 
+static int meson_clk_pll_enable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
+
+	/* Make sure the pll is in reset */
+	meson_parm_write(clk->map, &pll->rst, 1);
+
+	/* Enable the pll */
+	meson_parm_write(clk->map, &pll->en, 1);
+
+	/* Take the pll out reset */
+	meson_parm_write(clk->map, &pll->rst, 0);
+
+	if (meson_clk_pll_wait_lock(hw))
+		return -EIO;
+
+	return 0;
+}
+
+static void meson_clk_pll_disable(struct clk_hw *hw)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
+
+	/* Put the pll is in reset */
+	meson_parm_write(clk->map, &pll->rst, 1);
+
+	/* Disable the pll */
+	meson_parm_write(clk->map, &pll->en, 0);
+}
+
 static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 				  unsigned long parent_rate)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 	const struct pll_rate_table *pllt;
+	unsigned int enabled;
 	unsigned long old_rate;
 	u16 frac = 0;
 
@@ -203,8 +236,9 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (!pllt)
 		return -EINVAL;
 
-	/* Put the pll in reset to write the params */
-	meson_parm_write(clk->map, &pll->rst, 1);
+	enabled = meson_parm_read(clk->map, &pll->en);
+	if (enabled)
+		meson_clk_pll_disable(hw);
 
 	meson_parm_write(clk->map, &pll->n, pllt->n);
 	meson_parm_write(clk->map, &pll->m, pllt->m);
@@ -221,10 +255,11 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 		meson_parm_write(clk->map, &pll->frac, frac);
 	}
 
-	/* make sure the reset is cleared at this point */
-	meson_parm_write(clk->map, &pll->rst, 0);
+	/* If the pll is stopped, bail out now */
+	if (!enabled)
+		return 0;
 
-	if (meson_clk_pll_wait_lock(hw)) {
+	if (meson_clk_pll_enable(hw)) {
 		pr_warn("%s: pll did not lock, trying to restore old rate %lu\n",
 			__func__, old_rate);
 		/*
@@ -244,6 +279,8 @@ const struct clk_ops meson_clk_pll_ops = {
 	.recalc_rate	= meson_clk_pll_recalc_rate,
 	.round_rate	= meson_clk_pll_round_rate,
 	.set_rate	= meson_clk_pll_set_rate,
+	.enable		= meson_clk_pll_enable,
+	.disable	= meson_clk_pll_disable
 };
 
 const struct clk_ops meson_clk_pll_ro_ops = {
diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index 24cec16b6038..c2ee37a78ceb 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -63,6 +63,7 @@ struct pll_rate_table {
 #define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
 
 struct meson_clk_pll_data {
+	struct parm en;
 	struct parm m;
 	struct parm n;
 	struct parm frac;
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 86d3ae58e84c..5ed34566917c 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -177,6 +177,11 @@ static const struct pll_rate_table gxl_gp0_pll_rate_table[] = {
 
 static struct clk_regmap gxbb_fixed_pll = {
 	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = HHI_MPLL_CNTL,
+			.shift   = 30,
+			.width   = 1,
+		},
 		.m = {
 			.reg_off = HHI_MPLL_CNTL,
 			.shift   = 0,
@@ -230,6 +235,11 @@ static struct clk_fixed_factor gxbb_hdmi_pll_pre_mult = {
 
 static struct clk_regmap gxbb_hdmi_pll = {
 	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = HHI_HDMI_PLL_CNTL,
+			.shift   = 30,
+			.width   = 1,
+		},
 		.m = {
 			.reg_off = HHI_HDMI_PLL_CNTL,
 			.shift   = 0,
@@ -282,6 +292,11 @@ static struct clk_regmap gxbb_hdmi_pll = {
 
 static struct clk_regmap gxl_hdmi_pll = {
 	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = HHI_HDMI_PLL_CNTL,
+			.shift   = 30,
+			.width   = 1,
+		},
 		.m = {
 			.reg_off = HHI_HDMI_PLL_CNTL,
 			.shift   = 0,
@@ -340,6 +355,11 @@ static struct clk_regmap gxl_hdmi_pll = {
 
 static struct clk_regmap gxbb_sys_pll = {
 	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = HHI_SYS_PLL_CNTL,
+			.shift   = 30,
+			.width   = 1,
+		},
 		.m = {
 			.reg_off = HHI_SYS_PLL_CNTL,
 			.shift   = 0,
@@ -379,11 +399,15 @@ static const struct reg_sequence gxbb_gp0_init_regs[] = {
 	{ .reg = HHI_GP0_PLL_CNTL2,	.def = 0x69c80000 },
 	{ .reg = HHI_GP0_PLL_CNTL3,	.def = 0x0a5590c4 },
 	{ .reg = HHI_GP0_PLL_CNTL4,	.def = 0x0000500d },
-	{ .reg = HHI_GP0_PLL_CNTL,	.def = 0x4a000228 },
 };
 
 static struct clk_regmap gxbb_gp0_pll = {
 	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = HHI_GP0_PLL_CNTL,
+			.shift   = 30,
+			.width   = 1,
+		},
 		.m = {
 			.reg_off = HHI_GP0_PLL_CNTL,
 			.shift   = 0,
@@ -428,11 +452,15 @@ static const struct reg_sequence gxl_gp0_init_regs[] = {
 	{ .reg = HHI_GP0_PLL_CNTL3,	.def = 0x0a59a288 },
 	{ .reg = HHI_GP0_PLL_CNTL4,	.def = 0xc000004d },
 	{ .reg = HHI_GP0_PLL_CNTL5,	.def = 0x00078000 },
-	{ .reg = HHI_GP0_PLL_CNTL,	.def = 0x40010250 },
 };
 
 static struct clk_regmap gxl_gp0_pll = {
 	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = HHI_GP0_PLL_CNTL,
+			.shift   = 30,
+			.width   = 1,
+		},
 		.m = {
 			.reg_off = HHI_GP0_PLL_CNTL,
 			.shift   = 0,
diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 7447d96a265f..fd4c414893f5 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -96,6 +96,11 @@ static struct clk_fixed_rate meson8b_xtal = {
 
 static struct clk_regmap meson8b_fixed_pll = {
 	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = HHI_MPLL_CNTL,
+			.shift   = 30,
+			.width   = 1,
+		},
 		.m = {
 			.reg_off = HHI_MPLL_CNTL,
 			.shift   = 0,
@@ -138,6 +143,11 @@ static struct clk_regmap meson8b_fixed_pll = {
 
 static struct clk_regmap meson8b_vid_pll = {
 	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = HHI_VID_PLL_CNTL,
+			.shift   = 30,
+			.width   = 1,
+		},
 		.m = {
 			.reg_off = HHI_VID_PLL_CNTL,
 			.shift   = 0,
@@ -175,6 +185,11 @@ static struct clk_regmap meson8b_vid_pll = {
 
 static struct clk_regmap meson8b_sys_pll = {
 	.data = &(struct meson_clk_pll_data){
+		.en = {
+			.reg_off = HHI_SYS_PLL_CNTL,
+			.shift   = 30,
+			.width   = 1,
+		},
 		.m = {
 			.reg_off = HHI_SYS_PLL_CNTL,
 			.shift   = 0,
-- 
2.17.1

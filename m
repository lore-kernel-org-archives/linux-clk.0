Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/9] clk: meson: add od3 to the pll driver
Date: Fri, 19 Jan 2018 16:55:25 +0100
Message-Id: <20180119155529.11532-6-jbrunet@baylibre.com>
In-Reply-To: <20180119155529.11532-1-jbrunet@baylibre.com>
References: <20180119155529.11532-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Some meson plls, such as the hdmi pll, are using a 3rd od parameter,
which is yet another "power of 2" post divider. Add it to fix the
calculation of the hdmi_pll rate

Fixes: 738f66d3211d ("clk: gxbb: add AmLogic GXBB clk controller driver")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/clk-pll.c | 19 ++++++++++++++++---
 drivers/clk/meson/clkc.h    |  2 ++
 drivers/clk/meson/gxbb.c    |  5 +++++
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 50923d004d96..1595f02f610f 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -53,7 +53,7 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
 	struct meson_clk_pll *pll = to_meson_clk_pll(hw);
 	struct parm *p;
 	u64 rate;
-	u16 n, m, frac = 0, od, od2 = 0;
+	u16 n, m, frac = 0, od, od2 = 0, od3 = 0;
 	u32 reg;
 
 	p = &pll->n;
@@ -74,7 +74,13 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
 		od2 = PARM_GET(p->width, p->shift, reg);
 	}
 
-	rate = (u64)parent_rate * m;
+	p = &pll->od3;
+	if (p->width) {
+		reg = readl(pll->base + p->reg_off);
+		od3 = PARM_GET(p->width, p->shift, reg);
+	}
+
+	rate = (u64)m * parent_rate;
 
 	p = &pll->frac;
 	if (p->width) {
@@ -85,7 +91,7 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
 		rate *= 2;
 	}
 
-	return div_u64(rate, n) >> od >> od2;
+	return div_u64(rate, n) >> od >> od2 >> od3;
 }
 
 static long meson_clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
@@ -226,6 +232,13 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 		writel(reg, pll->base + p->reg_off);
 	}
 
+	p = &pll->od3;
+	if (p->width) {
+		reg = readl(pll->base + p->reg_off);
+		reg = PARM_SET(p->width, p->shift, reg, rate_set->od3);
+		writel(reg, pll->base + p->reg_off);
+	}
+
 	p = &pll->frac;
 	if (p->width) {
 		reg = readl(pll->base + p->reg_off);
diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index c2ff0520ce53..4acb35bda669 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -41,6 +41,7 @@ struct pll_rate_table {
 	u16		n;
 	u16		od;
 	u16		od2;
+	u16		od3;
 	u16		frac;
 };
 
@@ -92,6 +93,7 @@ struct meson_clk_pll {
 	struct parm frac;
 	struct parm od;
 	struct parm od2;
+	struct parm od3;
 	const struct pll_setup_params params;
 	const struct pll_rate_table *rate_table;
 	unsigned int rate_count;
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 2d851bad13fa..cf083a1906d1 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -238,6 +238,11 @@ static struct meson_clk_pll gxbb_hdmi_pll = {
 		.shift   = 22,
 		.width   = 2,
 	},
+	.od3 = {
+		.reg_off = HHI_HDMI_PLL_CNTL2,
+		.shift   = 18,
+		.width   = 2,
+	},
 	.lock = &meson_clk_lock,
 	.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pll",
-- 
2.14.3

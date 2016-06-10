Return-Path: <mturquette@baylibre.com>
From: Michael Turquette <mturquette@baylibre.com>
To: linux-clk@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com,
	carlo@endlessm.com,
	victor.wan@amlogic.com,
	jerry.cao@amlogic.com,
	xing.xu@amlogic.com
Subject: [PATCH 3/7] clk: meson: fractional pll support
Date: Thu,  9 Jun 2016 17:32:50 -0700
Message-Id: <1465518774-26924-4-git-send-email-mturquette@baylibre.com>
In-Reply-To: <1465518774-26924-1-git-send-email-mturquette@baylibre.com>
References: <1465518774-26924-1-git-send-email-mturquette@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Michael Turquette <mturquette@baylibre.com>
---
 drivers/clk/meson/clk-pll.c | 32 ++++++++++++++++++++++++++++++--
 drivers/clk/meson/clkc.h    | 15 +++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 60c6b94..4adc1e8 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -53,7 +53,7 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
 	struct parm *p;
 	unsigned long parent_rate_mhz = parent_rate / 1000000;
 	unsigned long rate_mhz;
-	u16 n, m, od;
+	u16 n, m, frac = 0, od, od2 = 0;
 	u32 reg;
 
 	p = &pll->n;
@@ -68,7 +68,21 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
 	reg = readl(pll->base + p->reg_off);
 	od = PARM_GET(p->width, p->shift, reg);
 
-	rate_mhz = (parent_rate_mhz * m / n) >> od;
+	p = &pll->od2;
+	if (p->width) {
+		reg = readl(pll->base + p->reg_off);
+		od2 = PARM_GET(p->width, p->shift, reg);
+	}
+
+	p = &pll->frac;
+	if (p->width) {
+		reg = readl(pll->base + p->reg_off);
+		frac = PARM_GET(p->width, p->shift, reg);
+		rate_mhz = (parent_rate_mhz * m + \
+				(parent_rate_mhz * frac >> 12)) * 2 / n;
+		rate_mhz = rate_mhz >> od >> od2;
+	} else
+		rate_mhz = (parent_rate_mhz * m / n) >> od >> od2;
 
 	return rate_mhz * 1000000;
 }
@@ -155,6 +169,20 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	reg = PARM_SET(p->width, p->shift, reg, rate_set->od);
 	writel(reg, pll->base + p->reg_off);
 
+	p = &pll->od2;
+	if (p->width) {
+		reg = readl(pll->base + p->reg_off);
+		reg = PARM_SET(p->width, p->shift, reg, rate_set->od2);
+		writel(reg, pll->base + p->reg_off);
+	}
+
+	p = &pll->frac;
+	if (p->width) {
+		reg = readl(pll->base + p->reg_off);
+		reg = PARM_SET(p->width, p->shift, reg, rate_set->frac);
+		writel(reg, pll->base + p->reg_off);
+	}
+
 	p = &pll->n;
 	ret = meson_clk_pll_wait_lock(pll, p);
 	if (ret) {
diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index 73f0146..53326c3 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -40,7 +40,10 @@ struct pll_rate_table {
 	u16		m;
 	u16		n;
 	u16		od;
+	u16		od2;
+	u16		frac;
 };
+
 #define PLL_RATE(_r, _m, _n, _od)					\
 	{								\
 		.rate		= (_r),					\
@@ -49,12 +52,24 @@ struct pll_rate_table {
 		.od		= (_od),				\
 	}								\
 
+#define PLL_FRAC_RATE(_r, _m, _n, _od, _od2, _frac)			\
+	{								\
+		.rate		= (_r),					\
+		.m		= (_m),					\
+		.n		= (_n),					\
+		.od		= (_od),				\
+		.od2		= (_od2),				\
+		.frac		= (_frac),				\
+	}								\
+
 struct meson_clk_pll {
 	struct clk_hw hw;
 	void __iomem *base;
 	struct parm m;
 	struct parm n;
+	struct parm frac;
 	struct parm od;
+	struct parm od2;
 	const struct pll_rate_table *rate_table;
 	unsigned int rate_count;
 	spinlock_t *lock;
-- 
2.1.4

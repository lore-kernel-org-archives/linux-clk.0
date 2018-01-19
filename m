Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: meson: add axg misc bit to the mpll driver
Date: Fri, 19 Jan 2018 16:42:36 +0100
Message-Id: <20180119154236.9797-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

On axg, the rate of the mpll is stuck as if sdm value was 4 and could not
change (expect for mpll2 strangely). Looking at the vendor kernel, it
turns out a new magic bit from the undocumented HHI_PLL_TOP_MISC register
is required.

Setting this bit solves the problem and the mpll rates are back to normal

Fixes: 78b4af312f91 ("clk: meson-axg: add clock controller drivers")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg.c      | 20 ++++++++++++++++++++
 drivers/clk/meson/clk-mpll.c |  7 +++++++
 drivers/clk/meson/clkc.h     |  1 +
 3 files changed, 28 insertions(+)

diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
index 953e119635a2..2f2b3845c01d 100644
--- a/drivers/clk/meson/axg.c
+++ b/drivers/clk/meson/axg.c
@@ -292,6 +292,11 @@ static struct meson_clk_mpll axg_mpll0 = {
 		.shift   = 25,
 		.width	 = 1,
 	},
+	.misc = {
+		.reg_off = HHI_PLL_TOP_MISC,
+		.shift   = 0,
+		.width	 = 1,
+	},
 	.lock = &meson_clk_lock,
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll0",
@@ -322,6 +327,11 @@ static struct meson_clk_mpll axg_mpll1 = {
 		.shift   = 14,
 		.width	 = 1,
 	},
+	.misc = {
+		.reg_off = HHI_PLL_TOP_MISC,
+		.shift   = 1,
+		.width	 = 1,
+	},
 	.lock = &meson_clk_lock,
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll1",
@@ -352,6 +362,11 @@ static struct meson_clk_mpll axg_mpll2 = {
 		.shift   = 14,
 		.width	 = 1,
 	},
+	.misc = {
+		.reg_off = HHI_PLL_TOP_MISC,
+		.shift   = 2,
+		.width	 = 1,
+	},
 	.lock = &meson_clk_lock,
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll2",
@@ -382,6 +397,11 @@ static struct meson_clk_mpll axg_mpll3 = {
 		.shift   = 0,
 		.width	 = 1,
 	},
+	.misc = {
+		.reg_off = HHI_PLL_TOP_MISC,
+		.shift   = 3,
+		.width	 = 1,
+	},
 	.lock = &meson_clk_lock,
 	.hw.init = &(struct clk_init_data){
 		.name = "mpll3",
diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
index 5144360e2c80..6d79d6daadc4 100644
--- a/drivers/clk/meson/clk-mpll.c
+++ b/drivers/clk/meson/clk-mpll.c
@@ -173,6 +173,13 @@ static int mpll_set_rate(struct clk_hw *hw,
 	reg = PARM_SET(p->width, p->shift, reg, n2);
 	writel(reg, mpll->base + p->reg_off);
 
+	p = &mpll->misc;
+	if (p->width != 0) {
+		reg = readl(mpll->base + p->reg_off);
+		reg = PARM_SET(p->width, p->shift, reg, 1);
+		writel(reg, mpll->base + p->reg_off);
+	}
+
 	if (mpll->lock)
 		spin_unlock_irqrestore(mpll->lock, flags);
 	else
diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index 4acb35bda669..07aaba26a857 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -121,6 +121,7 @@ struct meson_clk_mpll {
 	struct parm n2;
 	struct parm en;
 	struct parm ssen;
+	struct parm misc;
 	spinlock_t *lock;
 };
 
-- 
2.14.3

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
Subject: [PATCH v2 3/9] clk: meson: remove unnecessary rounding in the pll clock
Date: Fri, 19 Jan 2018 16:55:23 +0100
Message-Id: <20180119155529.11532-4-jbrunet@baylibre.com>
In-Reply-To: <20180119155529.11532-1-jbrunet@baylibre.com>
References: <20180119155529.11532-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

The pll driver performs the rate calculation in Mhz, which adds an
unnecessary rounding down to the Mhz of the rate. Use 64bits long
integers to perform this calculation safely on meson8b and perform the
calculation in Hz instead

Fixes: 7a29a869434e ("clk: meson: Add support for Meson clock controller")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/clk-pll.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 2614341fc4ad..087dfc532ba8 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -34,6 +34,7 @@
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/slab.h>
@@ -51,8 +52,7 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
 {
 	struct meson_clk_pll *pll = to_meson_clk_pll(hw);
 	struct parm *p;
-	unsigned long parent_rate_mhz = parent_rate / 1000000;
-	unsigned long rate_mhz;
+	u64 rate;
 	u16 n, m, frac = 0, od, od2 = 0;
 	u32 reg;
 
@@ -74,17 +74,18 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
 		od2 = PARM_GET(p->width, p->shift, reg);
 	}
 
+	rate = (u64)parent_rate * m;
+
 	p = &pll->frac;
 	if (p->width) {
 		reg = readl(pll->base + p->reg_off);
 		frac = PARM_GET(p->width, p->shift, reg);
-		rate_mhz = (parent_rate_mhz * m + \
-				(parent_rate_mhz * frac >> 12)) * 2 / n;
-		rate_mhz = rate_mhz >> od >> od2;
-	} else
-		rate_mhz = (parent_rate_mhz * m / n) >> od >> od2;
 
-	return rate_mhz * 1000000;
+		rate += mul_u64_u32_shr(parent_rate, frac, 12);
+		rate *= 2;
+	}
+
+	return div_u64(rate, n) >> od >> od2;
 }
 
 static long meson_clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-- 
2.14.3

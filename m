Return-Path: <linux-amlogic-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] clk: meson: mpll: add round closest support
Date: Fri, 20 Apr 2018 11:56:02 +0200
Message-Id: <20180420095603.29964-2-jbrunet@baylibre.com>
In-Reply-To: <20180420095603.29964-1-jbrunet@baylibre.com>
References: <20180420095603.29964-1-jbrunet@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Allow the mpll driver to round the requested rate up if
CLK_MESON_MPLL_ROUND_CLOSEST is set and it provides a rate closer to the
requested rate.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/clk-mpll.c | 25 ++++++++++++++++++++-----
 drivers/clk/meson/clkc.h     |  3 +++
 2 files changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
index 0df1227b65b3..4e5283eb892a 100644
--- a/drivers/clk/meson/clk-mpll.c
+++ b/drivers/clk/meson/clk-mpll.c
@@ -89,10 +89,23 @@ static long rate_from_params(unsigned long parent_rate,
 static void params_from_rate(unsigned long requested_rate,
 			     unsigned long parent_rate,
 			     unsigned int *sdm,
-			     unsigned int *n2)
+			     unsigned int *n2,
+			     u8 flags)
 {
 	uint64_t div = parent_rate;
-	unsigned long rem = do_div(div, requested_rate);
+	uint64_t frac = do_div(div, requested_rate);
+	unsigned long rem;
+
+	frac *= SDM_DEN;
+	rem = do_div(frac, requested_rate);
+
+	/* Should we round up ? */
+	if (flags & CLK_MESON_MPLL_ROUND_CLOSEST
+	    && rem > (requested_rate / 2)) {
+		frac = (frac + 1) % SDM_DEN;
+		if (frac == 0)
+			div += 1;
+	}
 
 	if (div < N2_MIN) {
 		*n2 = N2_MIN;
@@ -102,7 +115,7 @@ static void params_from_rate(unsigned long requested_rate,
 		*sdm = SDM_DEN - 1;
 	} else {
 		*n2 = div;
-		*sdm = DIV_ROUND_UP_ULL((u64)rem * SDM_DEN, requested_rate);
+		*sdm = frac;
 	}
 }
 
@@ -125,9 +138,11 @@ static long mpll_round_rate(struct clk_hw *hw,
 			    unsigned long rate,
 			    unsigned long *parent_rate)
 {
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct meson_clk_mpll_data *mpll = meson_clk_mpll_data(clk);
 	unsigned int sdm, n2;
 
-	params_from_rate(rate, *parent_rate, &sdm, &n2);
+	params_from_rate(rate, *parent_rate, &sdm, &n2, mpll->flags);
 	return rate_from_params(*parent_rate, sdm, n2);
 }
 
@@ -140,7 +155,7 @@ static int mpll_set_rate(struct clk_hw *hw,
 	unsigned int sdm, n2;
 	unsigned long flags = 0;
 
-	params_from_rate(rate, parent_rate, &sdm, &n2);
+	params_from_rate(rate, parent_rate, &sdm, &n2, mpll->flags);
 
 	if (mpll->lock)
 		spin_lock_irqsave(mpll->lock, flags);
diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
index 8fe73c4edca8..8cc265cd3d2b 100644
--- a/drivers/clk/meson/clkc.h
+++ b/drivers/clk/meson/clkc.h
@@ -97,8 +97,11 @@ struct meson_clk_mpll_data {
 	struct parm ssen;
 	struct parm misc;
 	spinlock_t *lock;
+	u8 flags;
 };
 
+#define CLK_MESON_MPLL_ROUND_CLOSEST	BIT(0)
+
 struct meson_clk_audio_div_data {
 	struct parm div;
 	u8 flags;
-- 
2.14.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

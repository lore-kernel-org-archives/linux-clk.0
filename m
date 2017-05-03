Return-Path: <ukl@pengutronix.de>
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not operated too fast
Date: Wed,  3 May 2017 20:56:25 +0200
Message-Id: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Since commits 7d81397cd93d ("clk: mxs: add clock support for imx28") and
64e2bc413047 ("clk: mxs: imx28: decrease the frequency of ref_io1 for
SSP2 and SSP3") the frequencies for ref_io0 and ref_io1 are initialized
to 288 MHz because the initial frequency "seems too high to be ssp clock
source directly". However this isn't enough to ensure that the frequency
isn't increased later again. In fact this happens on my machine as the
mxs-spi driver calls clk_set_rate(ssp->clk, 160000000) with ssp being
ssp2 which is resolved to

	ref_io1.rate = 320 MHz
	ssp2_sel.parent = ref_io1
	ssp2_div.divider = 2

. The observed effect is that reading MISO reliably fails: Instead of
the least significant bit the second least significant bit is reported
twice. This is probably related to the reports

	https://community.nxp.com/thread/290209
	https://community.nxp.com/thread/310434
	https://community.nxp.com/thread/385546

So additionally to initializing ref_io0 and ref_io1 to 288 MHz ensure
that their frequency is never set to something bigger later on. This is
done by adding a parameter min_frac to clk-ref and use that instead of
the hard coded 18 to limit the valid values for FRAC. For all ref clocks
but ref_io0 and ref_io1 18 is used and so there is no functional change
for those.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

I'd expect this to go in as a fix as it repairs reading from an EEPROM which
should be a fairly common task.

It would be nice to get confirmation from NXP that this is a right fix and
that spi transfers are supposed to be reliable with ref_ioX <= 288 MHz.

Best regards
Uwe

 drivers/clk/mxs/clk-imx23.c |  8 ++++----
 drivers/clk/mxs/clk-imx28.c | 14 +++++++-------
 drivers/clk/mxs/clk-ref.c   | 18 ++++++++++++------
 drivers/clk/mxs/clk.h       |  2 +-
 4 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/mxs/clk-imx23.c b/drivers/clk/mxs/clk-imx23.c
index f01876af6bb8..b7d3c44bbcbb 100644
--- a/drivers/clk/mxs/clk-imx23.c
+++ b/drivers/clk/mxs/clk-imx23.c
@@ -117,10 +117,10 @@ static void __init mx23_clocks_init(struct device_node *np)
 
 	clks[ref_xtal] = mxs_clk_fixed("ref_xtal", 24000000);
 	clks[pll] = mxs_clk_pll("pll", "ref_xtal", PLLCTRL0, 16, 480000000);
-	clks[ref_cpu] = mxs_clk_ref("ref_cpu", "pll", FRAC, 0);
-	clks[ref_emi] = mxs_clk_ref("ref_emi", "pll", FRAC, 1);
-	clks[ref_pix] = mxs_clk_ref("ref_pix", "pll", FRAC, 2);
-	clks[ref_io] = mxs_clk_ref("ref_io", "pll", FRAC, 3);
+	clks[ref_cpu] = mxs_clk_ref("ref_cpu", "pll", FRAC, 0, 18);
+	clks[ref_emi] = mxs_clk_ref("ref_emi", "pll", FRAC, 1, 18);
+	clks[ref_pix] = mxs_clk_ref("ref_pix", "pll", FRAC, 2, 18);
+	clks[ref_io] = mxs_clk_ref("ref_io", "pll", FRAC, 3, 18);
 	clks[saif_sel] = mxs_clk_mux("saif_sel", CLKSEQ, 0, 1, sel_pll, ARRAY_SIZE(sel_pll));
 	clks[lcdif_sel] = mxs_clk_mux("lcdif_sel", CLKSEQ, 1, 1, sel_pix, ARRAY_SIZE(sel_pix));
 	clks[gpmi_sel] = mxs_clk_mux("gpmi_sel", CLKSEQ, 4, 1, sel_io, ARRAY_SIZE(sel_io));
diff --git a/drivers/clk/mxs/clk-imx28.c b/drivers/clk/mxs/clk-imx28.c
index 6b572b759f9a..09e324cbd32f 100644
--- a/drivers/clk/mxs/clk-imx28.c
+++ b/drivers/clk/mxs/clk-imx28.c
@@ -174,13 +174,13 @@ static void __init mx28_clocks_init(struct device_node *np)
 	clks[pll0] = mxs_clk_pll("pll0", "ref_xtal", PLL0CTRL0, 17, 480000000);
 	clks[pll1] = mxs_clk_pll("pll1", "ref_xtal", PLL1CTRL0, 17, 480000000);
 	clks[pll2] = mxs_clk_pll("pll2", "ref_xtal", PLL2CTRL0, 23, 50000000);
-	clks[ref_cpu] = mxs_clk_ref("ref_cpu", "pll0", FRAC0, 0);
-	clks[ref_emi] = mxs_clk_ref("ref_emi", "pll0", FRAC0, 1);
-	clks[ref_io1] = mxs_clk_ref("ref_io1", "pll0", FRAC0, 2);
-	clks[ref_io0] = mxs_clk_ref("ref_io0", "pll0", FRAC0, 3);
-	clks[ref_pix] = mxs_clk_ref("ref_pix", "pll0", FRAC1, 0);
-	clks[ref_hsadc] = mxs_clk_ref("ref_hsadc", "pll0", FRAC1, 1);
-	clks[ref_gpmi] = mxs_clk_ref("ref_gpmi", "pll0", FRAC1, 2);
+	clks[ref_cpu] = mxs_clk_ref("ref_cpu", "pll0", FRAC0, 0, 18);
+	clks[ref_emi] = mxs_clk_ref("ref_emi", "pll0", FRAC0, 1, 18);
+	clks[ref_io1] = mxs_clk_ref("ref_io1", "pll0", FRAC0, 2, 30);
+	clks[ref_io0] = mxs_clk_ref("ref_io0", "pll0", FRAC0, 3, 30);
+	clks[ref_pix] = mxs_clk_ref("ref_pix", "pll0", FRAC1, 0, 18);
+	clks[ref_hsadc] = mxs_clk_ref("ref_hsadc", "pll0", FRAC1, 1, 18);
+	clks[ref_gpmi] = mxs_clk_ref("ref_gpmi", "pll0", FRAC1, 2, 18);
 	clks[saif0_sel] = mxs_clk_mux("saif0_sel", CLKSEQ, 0, 1, sel_pll0, ARRAY_SIZE(sel_pll0));
 	clks[saif1_sel] = mxs_clk_mux("saif1_sel", CLKSEQ, 1, 1, sel_pll0, ARRAY_SIZE(sel_pll0));
 	clks[gpmi_sel] = mxs_clk_mux("gpmi_sel", CLKSEQ, 2, 1, sel_gpmi, ARRAY_SIZE(sel_gpmi));
diff --git a/drivers/clk/mxs/clk-ref.c b/drivers/clk/mxs/clk-ref.c
index 495f99b7965e..9385563b3ea8 100644
--- a/drivers/clk/mxs/clk-ref.c
+++ b/drivers/clk/mxs/clk-ref.c
@@ -23,13 +23,17 @@
  *
  * The mxs reference clock sources from pll.  Every 4 reference clocks share
  * one register space, and @idx is used to identify them.  Each reference
- * clock has a gate control and a fractional * divider.  The rate is calculated
+ * clock has a gate control and a fractional divider.  The rate is calculated
  * as pll rate  * (18 / FRAC), where FRAC = 18 ~ 35.
+ *
+ * As some clocks are not reliable at high speed (imx28 io0 and io1), the clock
+ * can be limited to not use FRAC < min_frac.
  */
 struct clk_ref {
 	struct clk_hw hw;
 	void __iomem *reg;
 	u8 idx;
+	u8 min_frac;
 };
 
 #define to_clk_ref(_hw) container_of(_hw, struct clk_ref, hw)
@@ -66,6 +70,7 @@ static unsigned long clk_ref_recalc_rate(struct clk_hw *hw,
 static long clk_ref_round_rate(struct clk_hw *hw, unsigned long rate,
 			       unsigned long *prate)
 {
+	struct clk_ref *ref = to_clk_ref(hw);
 	unsigned long parent_rate = *prate;
 	u64 tmp = parent_rate;
 	u8 frac;
@@ -74,8 +79,8 @@ static long clk_ref_round_rate(struct clk_hw *hw, unsigned long rate,
 	do_div(tmp, rate);
 	frac = tmp;
 
-	if (frac < 18)
-		frac = 18;
+	if (frac < ref->min_frac)
+		frac = ref->min_frac;
 	else if (frac > 35)
 		frac = 35;
 
@@ -99,8 +104,8 @@ static int clk_ref_set_rate(struct clk_hw *hw, unsigned long rate,
 	do_div(tmp, rate);
 	frac = tmp;
 
-	if (frac < 18)
-		frac = 18;
+	if (frac < ref->min_frac)
+		frac = ref->min_frac;
 	else if (frac > 35)
 		frac = 35;
 
@@ -125,7 +130,7 @@ static const struct clk_ops clk_ref_ops = {
 };
 
 struct clk *mxs_clk_ref(const char *name, const char *parent_name,
-			void __iomem *reg, u8 idx)
+			void __iomem *reg, u8 idx, u8 min_frac)
 {
 	struct clk_ref *ref;
 	struct clk *clk;
@@ -143,6 +148,7 @@ struct clk *mxs_clk_ref(const char *name, const char *parent_name,
 
 	ref->reg = reg;
 	ref->idx = idx;
+	ref->min_frac = min_frac;
 	ref->hw.init = &init;
 
 	clk = clk_register(NULL, &ref->hw);
diff --git a/drivers/clk/mxs/clk.h b/drivers/clk/mxs/clk.h
index 5a264a486ad9..fb63462a78cd 100644
--- a/drivers/clk/mxs/clk.h
+++ b/drivers/clk/mxs/clk.h
@@ -28,7 +28,7 @@ struct clk *mxs_clk_pll(const char *name, const char *parent_name,
 			void __iomem *base, u8 power, unsigned long rate);
 
 struct clk *mxs_clk_ref(const char *name, const char *parent_name,
-			void __iomem *reg, u8 idx);
+			void __iomem *reg, u8 idx, u8 min_frac);
 
 struct clk *mxs_clk_div(const char *name, const char *parent_name,
 			void __iomem *reg, u8 shift, u8 width, u8 busy);
-- 
2.11.0

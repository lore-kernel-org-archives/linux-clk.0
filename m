Return-Path: <nikita.yoush@cogentembedded.com>
Return-Path: <nikita.yoush@cogentembedded.com>
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Cc: Chris Healy <cphealy@gmail.com>,
	linux-kernel@vger.kernel.org,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH v3] clk: imx: pllv3: support fractional multiplier on vf610 PLL1/PLL2
Date: Mon, 19 Dec 2016 11:12:09 +0300
Message-Id: <1482135129-28570-1-git-send-email-nikita.yoush@cogentembedded.com>
List-ID: <linux-clk.vger.kernel.org>

On vf610, PLL1 and PLL2 have registers to configure fractional part of
frequency multiplier.

This patch adds support for these registers.

This fixes "fast system clock" issue on boards where bootloader sets
fractional multiplier for PLL1.

Suggested-by: Andrey Smirnov <andrew.smirnov@gmail.com>
CC: Chris Healy <cphealy@gmail.com>
Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Tested-by: Andrey Smirnov <andrew.smirnov@gmail.com>
---
Changes since v2:
- restructured per suggesions by Andrey Smirnov:
  - returned register access routines back to recalc_rate() / set_rate(),
  - renamed mf <-> rate convertion routines
- fixed spelling errors.

Changes since v1:
- restructured:
  - introduce explicit structure to store mf (multiply factor) consisting of
    integer part, numerator and denominator,
  - provide routines that:
    - calculate rate based on parent rate and mf,
    - read mf from hw,
    - write mf to hw,
    - calculate best mf for wanted rate;
  - implement recalc_rate() / round_rate() / set_rate() based on these.

 drivers/clk/imx/clk-pllv3.c | 99 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/imx/clk-vf610.c |  4 +-
 drivers/clk/imx/clk.h       |  1 +
 3 files changed, 102 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-pllv3.c b/drivers/clk/imx/clk-pllv3.c
index 7a6acc3e4a92..321c7a5e35d1 100644
--- a/drivers/clk/imx/clk-pllv3.c
+++ b/drivers/clk/imx/clk-pllv3.c
@@ -21,6 +21,9 @@
 #define PLL_NUM_OFFSET		0x10
 #define PLL_DENOM_OFFSET	0x20
 
+#define PLL_VF610_NUM_OFFSET	0x20
+#define PLL_VF610_DENOM_OFFSET	0x30
+
 #define BM_PLL_POWER		(0x1 << 12)
 #define BM_PLL_LOCK		(0x1 << 31)
 #define IMX7_ENET_PLL_POWER	(0x1 << 5)
@@ -292,6 +295,99 @@ static const struct clk_ops clk_pllv3_av_ops = {
 	.set_rate	= clk_pllv3_av_set_rate,
 };
 
+struct clk_pllv3_vf610_mf {
+	u32 mfi;	/* integer part, can be 20 or 22 */
+	u32 mfn;	/* numerator, 30-bit value */
+	u32 mfd;	/* denominator, 30-bit value, must be less than mfn */
+};
+
+static unsigned long clk_pllv3_vf610_mf_to_rate(unsigned long parent_rate,
+		struct clk_pllv3_vf610_mf mf)
+{
+	u64 temp64;
+
+	temp64 = parent_rate;
+	temp64 *= mf.mfn;
+	do_div(temp64, mf.mfd);
+
+	return (parent_rate * mf.mfi) + temp64;
+}
+
+static struct clk_pllv3_vf610_mf clk_pllv3_vf610_rate_to_mf(
+		unsigned long parent_rate, unsigned long rate)
+{
+	struct clk_pllv3_vf610_mf mf;
+	u64 temp64;
+
+	mf.mfi = (rate >= 22 * parent_rate) ? 22 : 20;
+	mf.mfd = 0x3fffffff;	/* use max supported value for best accuracy */
+
+	if (rate <= parent_rate * mf.mfi)
+		mf.mfn = 0;
+	else if (rate >= parent_rate * (mf.mfi + 1))
+		mf.mfn = mf.mfd - 1;
+	else {
+		/* rate = parent_rate * (mfi + mfn/mfd) */
+		temp64 = rate - parent_rate * mf.mfi;
+		temp64 *= mf.mfd;
+		do_div(temp64, parent_rate);
+		mf.mfn = temp64;
+	}
+
+	return mf;
+}
+
+static unsigned long clk_pllv3_vf610_recalc_rate(struct clk_hw *hw,
+					      unsigned long parent_rate)
+{
+	struct clk_pllv3 *pll = to_clk_pllv3(hw);
+	struct clk_pllv3_vf610_mf mf;
+
+	mf.mfn = readl_relaxed(pll->base + PLL_VF610_NUM_OFFSET);
+	mf.mfd = readl_relaxed(pll->base + PLL_VF610_DENOM_OFFSET);
+	mf.mfi = (readl_relaxed(pll->base) & pll->div_mask) ? 22 : 20;
+
+	return clk_pllv3_vf610_mf_to_rate(parent_rate, mf);
+}
+
+static long clk_pllv3_vf610_round_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long *prate)
+{
+	struct clk_pllv3_vf610_mf mf = clk_pllv3_vf610_rate_to_mf(*prate, rate);
+
+	return clk_pllv3_vf610_mf_to_rate(*prate, mf);
+}
+
+static int clk_pllv3_vf610_set_rate(struct clk_hw *hw, unsigned long rate,
+		unsigned long parent_rate)
+{
+	struct clk_pllv3 *pll = to_clk_pllv3(hw);
+	struct clk_pllv3_vf610_mf mf =
+			clk_pllv3_vf610_rate_to_mf(parent_rate, rate);
+	u32 val;
+
+	val = readl_relaxed(pll->base);
+	if (mf.mfi == 20)
+		val &= ~pll->div_mask;	/* clear bit for mfi=20 */
+	else
+		val |= pll->div_mask;	/* set bit for mfi=22 */
+	writel_relaxed(val, pll->base);
+
+	writel_relaxed(mf.mfn, pll->base + PLL_VF610_NUM_OFFSET);
+	writel_relaxed(mf.mfd, pll->base + PLL_VF610_DENOM_OFFSET);
+
+	return clk_pllv3_wait_lock(pll);
+}
+
+static const struct clk_ops clk_pllv3_vf610_ops = {
+	.prepare	= clk_pllv3_prepare,
+	.unprepare	= clk_pllv3_unprepare,
+	.is_prepared	= clk_pllv3_is_prepared,
+	.recalc_rate	= clk_pllv3_vf610_recalc_rate,
+	.round_rate	= clk_pllv3_vf610_round_rate,
+	.set_rate	= clk_pllv3_vf610_set_rate,
+};
+
 static unsigned long clk_pllv3_enet_recalc_rate(struct clk_hw *hw,
 						unsigned long parent_rate)
 {
@@ -326,6 +422,9 @@ struct clk *imx_clk_pllv3(enum imx_pllv3_type type, const char *name,
 	case IMX_PLLV3_SYS:
 		ops = &clk_pllv3_sys_ops;
 		break;
+	case IMX_PLLV3_SYS_VF610:
+		ops = &clk_pllv3_vf610_ops;
+		break;
 	case IMX_PLLV3_USB_VF610:
 		pll->div_shift = 1;
 	case IMX_PLLV3_USB:
diff --git a/drivers/clk/imx/clk-vf610.c b/drivers/clk/imx/clk-vf610.c
index 0476353ab423..59b1863deb88 100644
--- a/drivers/clk/imx/clk-vf610.c
+++ b/drivers/clk/imx/clk-vf610.c
@@ -219,8 +219,8 @@ static void __init vf610_clocks_init(struct device_node *ccm_node)
 	clk[VF610_CLK_PLL6_BYPASS_SRC] = imx_clk_mux("pll6_bypass_src", PLL6_CTRL, 14, 1, pll_bypass_src_sels, ARRAY_SIZE(pll_bypass_src_sels));
 	clk[VF610_CLK_PLL7_BYPASS_SRC] = imx_clk_mux("pll7_bypass_src", PLL7_CTRL, 14, 1, pll_bypass_src_sels, ARRAY_SIZE(pll_bypass_src_sels));
 
-	clk[VF610_CLK_PLL1] = imx_clk_pllv3(IMX_PLLV3_GENERIC, "pll1", "pll1_bypass_src", PLL1_CTRL, 0x1);
-	clk[VF610_CLK_PLL2] = imx_clk_pllv3(IMX_PLLV3_GENERIC, "pll2", "pll2_bypass_src", PLL2_CTRL, 0x1);
+	clk[VF610_CLK_PLL1] = imx_clk_pllv3(IMX_PLLV3_SYS_VF610, "pll1", "pll1_bypass_src", PLL1_CTRL, 0x1);
+	clk[VF610_CLK_PLL2] = imx_clk_pllv3(IMX_PLLV3_SYS_VF610, "pll2", "pll2_bypass_src", PLL2_CTRL, 0x1);
 	clk[VF610_CLK_PLL3] = imx_clk_pllv3(IMX_PLLV3_USB_VF610,     "pll3", "pll3_bypass_src", PLL3_CTRL, 0x2);
 	clk[VF610_CLK_PLL4] = imx_clk_pllv3(IMX_PLLV3_AV,      "pll4", "pll4_bypass_src", PLL4_CTRL, 0x7f);
 	clk[VF610_CLK_PLL5] = imx_clk_pllv3(IMX_PLLV3_ENET,    "pll5", "pll5_bypass_src", PLL5_CTRL, 0x3);
diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
index 3799ff82a9b4..99a617897831 100644
--- a/drivers/clk/imx/clk.h
+++ b/drivers/clk/imx/clk.h
@@ -34,6 +34,7 @@ enum imx_pllv3_type {
 	IMX_PLLV3_AV,
 	IMX_PLLV3_ENET,
 	IMX_PLLV3_ENET_IMX7,
+	IMX_PLLV3_SYS_VF610,
 };
 
 struct clk *imx_clk_pllv3(enum imx_pllv3_type type, const char *name,
-- 
2.1.4

Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4264FC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 08:29:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238101AbiBYIaO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 03:30:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238515AbiBYIaN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 03:30:13 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23CC92399FD
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 00:29:41 -0800 (PST)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1nNVyt-0007PI-As; Fri, 25 Feb 2022 09:29:39 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1nNVys-00BWSu-Hb; Fri, 25 Feb 2022 09:29:38 +0100
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     linux-clk@vger.kernel.org
Cc:     Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Adrian Alonso <adrian.alonso@nxp.com>,
        Mads Bligaard Nielsen <bli@bang-olufsen.dk>,
        Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v2 8/8] clk: imx: pll14xx: Support dynamic rates
Date:   Fri, 25 Feb 2022 09:29:37 +0100
Message-Id: <20220225082937.2746176-9-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225082937.2746176-1-s.hauer@pengutronix.de>
References: <20220225082937.2746176-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The pll1443x PLL so far only supports rates from a rate table passed
during initialization. Calculating PLL settings dynamically helps audio
applications to get their desired rates, so support for this is added
in this patch.

The strategy to get to the PLL setting for a rate is:

- First try to only adjust kdiv which specifies the fractional part of the PLL.
  This setting can be changed without glitches on the output and is therefore
  preferred
- When that isn't possible then the rate table is searched for suitable rates,
  so for standard rates the same settings are used as without this patch
- As a last resort the best settings are calculated dynamically

The code in this patch is based on patches from Adrian Alonso <adrian.alonso@nxp.com>
and Mads Bligaard Nielsen <bli@bang-olufsen.dk>

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/clk/imx/clk-pll14xx.c | 143 ++++++++++++++++++++++++++++++----
 1 file changed, 126 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index 646e0ce7d6242..eef0f3b693ed9 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -29,6 +29,8 @@
 #define PDIV_MASK	GENMASK(9, 4)
 #define SDIV_MASK	GENMASK(2, 0)
 #define KDIV_MASK	GENMASK(15, 0)
+#define KDIV_MIN	SHRT_MIN
+#define KDIV_MAX	SHRT_MAX
 
 #define LOCK_TIMEOUT_US		10000
 
@@ -113,7 +115,106 @@ static long pll14xx_calc_rate(struct clk_pll14xx *pll, int mdiv, int pdiv,
 	return fvco;
 }
 
-static long clk_pll14xx_round_rate(struct clk_hw *hw, unsigned long rate,
+static long pll1443x_calc_kdiv(int mdiv, int pdiv, int sdiv,
+		unsigned long rate, unsigned long prate)
+{
+	long kdiv;
+
+	/* calc kdiv = round(rate * pdiv * 65536 * 2^sdiv / prate) - (mdiv * 65536) */
+	kdiv = ((rate * ((pdiv * 65536) << sdiv) + prate / 2) / prate) - (mdiv * 65536);
+
+	return clamp_t(short, kdiv, KDIV_MIN, KDIV_MAX);
+}
+
+static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rate,
+				      unsigned long prate, struct imx_pll14xx_rate_table *t)
+{
+	u32 pll_div_ctl0, pll_div_ctl1;
+	int mdiv, pdiv, sdiv, kdiv;
+	long fvco, rate_min, rate_max, dist, best = LONG_MAX;
+	const struct imx_pll14xx_rate_table *tt;
+
+	/*
+	 * Fractional PLL constrains:
+	 *
+	 * a) 6MHz <= prate <= 25MHz
+	 * b) 1 <= p <= 63 (1 <= p <= 4 prate = 24MHz)
+	 * c) 64 <= m <= 1023
+	 * d) 0 <= s <= 6
+	 * e) -32768 <= k <= 32767
+	 *
+	 * fvco = (m * 65536 + k) * prate / (p * 65536)
+	 */
+
+	pll_div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
+	mdiv = FIELD_GET(MDIV_MASK, pll_div_ctl0);
+	pdiv = FIELD_GET(PDIV_MASK, pll_div_ctl0);
+	sdiv = FIELD_GET(SDIV_MASK, pll_div_ctl0);
+	pll_div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
+
+	/* First see if we can get the desired rate by only adjusting kdiv (glitch free) */
+	rate_min = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, KDIV_MIN, prate);
+	rate_max = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, KDIV_MAX, prate);
+
+	if (rate >= rate_min && rate <= rate_max) {
+		kdiv = pll1443x_calc_kdiv(mdiv, pdiv, sdiv, rate, prate);
+		pr_debug("%s: in=%ld, want=%ld Only adjust kdiv %ld -> %d\n",
+			 clk_hw_get_name(&pll->hw), prate, rate,
+			 FIELD_GET(KDIV_MASK, pll_div_ctl1), kdiv);
+		fvco = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, kdiv, prate);
+		t->rate = (unsigned int)fvco;
+		t->mdiv = mdiv;
+		t->pdiv = pdiv;
+		t->sdiv = sdiv;
+		t->kdiv = kdiv;
+		return;
+	}
+
+	/* Then try if we can get the desired rate from one of the static entries */
+	tt = imx_get_pll_settings(pll, rate);
+	if (tt) {
+		pr_debug("%s: in=%ld, want=%ld, Using PLL setting from table\n",
+			 clk_hw_get_name(&pll->hw), prate, rate);
+		t->rate = tt->rate;
+		t->mdiv = tt->mdiv;
+		t->pdiv = tt->pdiv;
+		t->sdiv = tt->sdiv;
+		t->kdiv = tt->kdiv;
+		return;
+	}
+
+	/* Finally calculate best values */
+	for (pdiv = 1; pdiv <= 7; pdiv++) {
+		for (sdiv = 0; sdiv <= 6; sdiv++) {
+			/* calc mdiv = round(rate * pdiv * 2^sdiv) / prate) */
+			mdiv = DIV_ROUND_CLOSEST(rate * (pdiv << sdiv), prate);
+			mdiv = clamp(mdiv, 64, 1023);
+
+			kdiv = pll1443x_calc_kdiv(mdiv, pdiv, sdiv, rate, prate);
+			fvco = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, kdiv, prate);
+
+			/* best match */
+			dist = abs((long)rate - (long)fvco);
+			if (dist < best) {
+				best = dist;
+				t->rate = (unsigned int)fvco;
+				t->mdiv = mdiv;
+				t->pdiv = pdiv;
+				t->sdiv = sdiv;
+				t->kdiv = kdiv;
+
+				if (!dist)
+					goto found;
+			}
+		}
+	}
+found:
+	pr_debug("%s: in=%ld, want=%ld got=%d (pdiv=%d sdiv=%d mdiv=%d kdiv=%d)\n",
+		 clk_hw_get_name(&pll->hw), prate, rate, t->rate, t->pdiv, t->sdiv,
+		 t->mdiv, t->kdiv);
+}
+
+static long clk_pll1416x_round_rate(struct clk_hw *hw, unsigned long rate,
 			unsigned long *prate)
 {
 	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
@@ -129,6 +230,17 @@ static long clk_pll14xx_round_rate(struct clk_hw *hw, unsigned long rate,
 	return rate_table[pll->rate_count - 1].rate;
 }
 
+static long clk_pll1443x_round_rate(struct clk_hw *hw, unsigned long rate,
+			unsigned long *prate)
+{
+	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
+	struct imx_pll14xx_rate_table t;
+
+	imx_pll14xx_calc_settings(pll, rate, *prate, &t);
+
+	return t.rate;
+}
+
 static unsigned long clk_pll14xx_recalc_rate(struct clk_hw *hw,
 						  unsigned long parent_rate)
 {
@@ -239,25 +351,21 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 				 unsigned long prate)
 {
 	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
-	const struct imx_pll14xx_rate_table *rate;
+	struct imx_pll14xx_rate_table rate;
 	u32 gnrl_ctl, div_ctl0;
 	int ret;
 
-	rate = imx_get_pll_settings(pll, drate);
-	if (!rate) {
-		pr_err("%s: Invalid rate : %lu for pll clk %s\n", __func__,
-			drate, clk_hw_get_name(hw));
-		return -EINVAL;
-	}
+	imx_pll14xx_calc_settings(pll, drate, prate, &rate);
 
 	div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
 
-	if (!clk_pll14xx_mp_change(rate, div_ctl0)) {
+	if (!clk_pll14xx_mp_change(&rate, div_ctl0)) {
+		/* only sdiv and/or kdiv changed - no need to RESET PLL */
 		div_ctl0 &= ~SDIV_MASK;
-		div_ctl0 |= FIELD_PREP(SDIV_MASK, rate->sdiv);
+		div_ctl0 |= FIELD_PREP(SDIV_MASK, rate.sdiv);
 		writel_relaxed(div_ctl0, pll->base + DIV_CTL0);
 
-		writel_relaxed(FIELD_PREP(KDIV_MASK, rate->kdiv),
+		writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv),
 			       pll->base + DIV_CTL1);
 
 		return 0;
@@ -272,11 +380,12 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 	gnrl_ctl |= BYPASS_MASK;
 	writel_relaxed(gnrl_ctl, pll->base + GNRL_CTL);
 
-	div_ctl0 = FIELD_PREP(MDIV_MASK, rate->mdiv) |
-		   FIELD_PREP(PDIV_MASK, rate->pdiv) |
-		   FIELD_PREP(SDIV_MASK, rate->sdiv);
+	div_ctl0 = FIELD_PREP(MDIV_MASK, rate.mdiv) |
+		   FIELD_PREP(PDIV_MASK, rate.pdiv) |
+		   FIELD_PREP(SDIV_MASK, rate.sdiv);
 	writel_relaxed(div_ctl0, pll->base + DIV_CTL0);
-	writel_relaxed(FIELD_PREP(KDIV_MASK, rate->kdiv), pll->base + DIV_CTL1);
+
+	writel_relaxed(FIELD_PREP(KDIV_MASK, rate.kdiv), pll->base + DIV_CTL1);
 
 	/*
 	 * According to SPEC, t3 - t2 need to be greater than
@@ -359,7 +468,7 @@ static const struct clk_ops clk_pll1416x_ops = {
 	.unprepare	= clk_pll14xx_unprepare,
 	.is_prepared	= clk_pll14xx_is_prepared,
 	.recalc_rate	= clk_pll14xx_recalc_rate,
-	.round_rate	= clk_pll14xx_round_rate,
+	.round_rate	= clk_pll1416x_round_rate,
 	.set_rate	= clk_pll1416x_set_rate,
 };
 
@@ -372,7 +481,7 @@ static const struct clk_ops clk_pll1443x_ops = {
 	.unprepare	= clk_pll14xx_unprepare,
 	.is_prepared	= clk_pll14xx_is_prepared,
 	.recalc_rate	= clk_pll14xx_recalc_rate,
-	.round_rate	= clk_pll14xx_round_rate,
+	.round_rate	= clk_pll1443x_round_rate,
 	.set_rate	= clk_pll1443x_set_rate,
 };
 
-- 
2.30.2


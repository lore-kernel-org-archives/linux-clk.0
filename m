Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 766E0C433F5
	for <linux-clk@archiver.kernel.org>; Fri,  4 Mar 2022 12:53:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233587AbiCDMxt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Mar 2022 07:53:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbiCDMxt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Mar 2022 07:53:49 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4136443AE2
        for <linux-clk@vger.kernel.org>; Fri,  4 Mar 2022 04:53:00 -0800 (PST)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1nQ7QY-0002sq-Gs; Fri, 04 Mar 2022 13:52:58 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1nQ7QX-008v48-Jh; Fri, 04 Mar 2022 13:52:57 +0100
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
Subject: [PATCH v3 4/8] clk: imx: pll14xx: consolidate rate calculation
Date:   Fri,  4 Mar 2022 13:52:52 +0100
Message-Id: <20220304125256.2125023-5-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304125256.2125023-1-s.hauer@pengutronix.de>
References: <20220304125256.2125023-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The PLL driver has support for two different PLLs: The pll1416x and
the pll1443x. The latter has support for an additional kdiv value.
recalc_rate can be the same calculation when kdiv is assumed to be zero
for the PLL which doesn't support that value.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Reviewed-by: Abel Vesa <abel.vesa@nxp.com>
---
 drivers/clk/imx/clk-pll14xx.c | 59 +++++++++++++++--------------------
 1 file changed, 26 insertions(+), 33 deletions(-)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index fabb380b87305..ebd5d888fea6d 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -97,6 +97,20 @@ static const struct imx_pll14xx_rate_table *imx_get_pll_settings(
 	return NULL;
 }
 
+static long pll14xx_calc_rate(struct clk_pll14xx *pll, int mdiv, int pdiv,
+			      int sdiv, int kdiv, unsigned long prate)
+{
+	u64 fvco = prate;
+
+	/* fvco = (m * 65536 + k) * Fin / (p * 65536) */
+	fvco *= (mdiv * 65536 + kdiv);
+	pdiv *= 65536;
+
+	do_div(fvco, pdiv << sdiv);
+
+	return fvco;
+}
+
 static long clk_pll14xx_round_rate(struct clk_hw *hw, unsigned long rate,
 			unsigned long *prate)
 {
@@ -113,46 +127,25 @@ static long clk_pll14xx_round_rate(struct clk_hw *hw, unsigned long rate,
 	return rate_table[i - 1].rate;
 }
 
-static unsigned long clk_pll1416x_recalc_rate(struct clk_hw *hw,
-						  unsigned long parent_rate)
-{
-	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
-	u32 mdiv, pdiv, sdiv, pll_div;
-	u64 fvco = parent_rate;
-
-	pll_div = readl_relaxed(pll->base + DIV_CTL0);
-	mdiv = FIELD_GET(MDIV_MASK, pll_div);
-	pdiv = FIELD_GET(PDIV_MASK, pll_div);
-	sdiv = FIELD_GET(SDIV_MASK, pll_div);
-
-	fvco *= mdiv;
-	do_div(fvco, pdiv << sdiv);
-
-	return fvco;
-}
-
-static unsigned long clk_pll1443x_recalc_rate(struct clk_hw *hw,
+static unsigned long clk_pll14xx_recalc_rate(struct clk_hw *hw,
 						  unsigned long parent_rate)
 {
 	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
-	u32 mdiv, pdiv, sdiv, pll_div_ctl0, pll_div_ctl1;
-	short int kdiv;
-	u64 fvco = parent_rate;
+	u32 mdiv, pdiv, sdiv, kdiv, pll_div_ctl0, pll_div_ctl1;
 
 	pll_div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
-	pll_div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
 	mdiv = FIELD_GET(MDIV_MASK, pll_div_ctl0);
 	pdiv = FIELD_GET(PDIV_MASK, pll_div_ctl0);
 	sdiv = FIELD_GET(SDIV_MASK, pll_div_ctl0);
-	kdiv = FIELD_GET(KDIV_MASK, pll_div_ctl1);
 
-	/* fvco = (m * 65536 + k) * Fin / (p * 65536) */
-	fvco *= (mdiv * 65536 + kdiv);
-	pdiv *= 65536;
-
-	do_div(fvco, pdiv << sdiv);
+	if (pll->type == PLL_1443X) {
+		pll_div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
+		kdiv = FIELD_GET(KDIV_MASK, pll_div_ctl1);
+	} else {
+		kdiv = 0;
+	}
 
-	return fvco;
+	return pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, kdiv, parent_rate);
 }
 
 static inline bool clk_pll14xx_mp_change(const struct imx_pll14xx_rate_table *rate,
@@ -363,20 +356,20 @@ static const struct clk_ops clk_pll1416x_ops = {
 	.prepare	= clk_pll14xx_prepare,
 	.unprepare	= clk_pll14xx_unprepare,
 	.is_prepared	= clk_pll14xx_is_prepared,
-	.recalc_rate	= clk_pll1416x_recalc_rate,
+	.recalc_rate	= clk_pll14xx_recalc_rate,
 	.round_rate	= clk_pll14xx_round_rate,
 	.set_rate	= clk_pll1416x_set_rate,
 };
 
 static const struct clk_ops clk_pll1416x_min_ops = {
-	.recalc_rate	= clk_pll1416x_recalc_rate,
+	.recalc_rate	= clk_pll14xx_recalc_rate,
 };
 
 static const struct clk_ops clk_pll1443x_ops = {
 	.prepare	= clk_pll14xx_prepare,
 	.unprepare	= clk_pll14xx_unprepare,
 	.is_prepared	= clk_pll14xx_is_prepared,
-	.recalc_rate	= clk_pll1443x_recalc_rate,
+	.recalc_rate	= clk_pll14xx_recalc_rate,
 	.round_rate	= clk_pll14xx_round_rate,
 	.set_rate	= clk_pll1443x_set_rate,
 };
-- 
2.30.2


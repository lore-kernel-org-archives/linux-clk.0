Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 200C5C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 23 Feb 2022 07:57:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238913AbiBWH5i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Feb 2022 02:57:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238939AbiBWH53 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 02:57:29 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B5B9369CC
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 23:56:46 -0800 (PST)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1nMmVJ-0006yb-3m; Wed, 23 Feb 2022 08:56:05 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1nMmVH-00FNha-SI; Wed, 23 Feb 2022 08:56:03 +0100
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
Subject: [PATCH 3/8] clk: imx: pll14xx: Use FIELD_GET/FIELD_PREP
Date:   Wed, 23 Feb 2022 08:55:56 +0100
Message-Id: <20220223075601.3652543-4-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220223075601.3652543-1-s.hauer@pengutronix.de>
References: <20220223075601.3652543-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Linux has these marvelous FIELD_GET/FIELD_PREP macros for easy access
to bitfields in registers. Use them and remove the now unused *_SHIFT
defines.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/clk/imx/clk-pll14xx.c | 39 ++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index b295d8a049009..3852a42b539e9 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -22,13 +22,9 @@
 #define CLKE_MASK	BIT(11)
 #define RST_MASK	BIT(9)
 #define BYPASS_MASK	BIT(4)
-#define MDIV_SHIFT	12
 #define MDIV_MASK	GENMASK(21, 12)
-#define PDIV_SHIFT	4
 #define PDIV_MASK	GENMASK(9, 4)
-#define SDIV_SHIFT	0
 #define SDIV_MASK	GENMASK(2, 0)
-#define KDIV_SHIFT	0
 #define KDIV_MASK	GENMASK(15, 0)
 
 #define LOCK_TIMEOUT_US		10000
@@ -124,9 +120,9 @@ static unsigned long clk_pll1416x_recalc_rate(struct clk_hw *hw,
 	u64 fvco = parent_rate;
 
 	pll_div = readl_relaxed(pll->base + DIV_CTL0);
-	mdiv = (pll_div & MDIV_MASK) >> MDIV_SHIFT;
-	pdiv = (pll_div & PDIV_MASK) >> PDIV_SHIFT;
-	sdiv = (pll_div & SDIV_MASK) >> SDIV_SHIFT;
+	mdiv = FIELD_GET(MDIV_MASK, pll_div);
+	pdiv = FIELD_GET(PDIV_MASK, pll_div);
+	sdiv = FIELD_GET(SDIV_MASK, pll_div);
 
 	fvco *= mdiv;
 	do_div(fvco, pdiv << sdiv);
@@ -144,10 +140,10 @@ static unsigned long clk_pll1443x_recalc_rate(struct clk_hw *hw,
 
 	pll_div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
 	pll_div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
-	mdiv = (pll_div_ctl0 & MDIV_MASK) >> MDIV_SHIFT;
-	pdiv = (pll_div_ctl0 & PDIV_MASK) >> PDIV_SHIFT;
-	sdiv = (pll_div_ctl0 & SDIV_MASK) >> SDIV_SHIFT;
-	kdiv = pll_div_ctl1 & KDIV_MASK;
+	mdiv = FIELD_GET(MDIV_MASK, pll_div_ctl0);
+	pdiv = FIELD_GET(PDIV_MASK, pll_div_ctl0);
+	sdiv = FIELD_GET(SDIV_MASK, pll_div_ctl0);
+	kdiv = FIELD_GET(KDIV_MASK, pll_div_ctl1);
 
 	/* fvco = (m * 65536 + k) * Fin / (p * 65536) */
 	fvco *= (mdiv * 65536 + kdiv);
@@ -163,8 +159,8 @@ static inline bool clk_pll14xx_mp_change(const struct imx_pll14xx_rate_table *ra
 {
 	u32 old_mdiv, old_pdiv;
 
-	old_mdiv = (pll_div & MDIV_MASK) >> MDIV_SHIFT;
-	old_pdiv = (pll_div & PDIV_MASK) >> PDIV_SHIFT;
+	old_mdiv = FIELD_GET(MDIV_MASK, pll_div);
+	old_pdiv = FIELD_GET(PDIV_MASK, pll_div);
 
 	return rate->mdiv != old_mdiv || rate->pdiv != old_pdiv;
 }
@@ -196,7 +192,7 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 
 	if (!clk_pll14xx_mp_change(rate, tmp)) {
 		tmp &= ~SDIV_MASK;
-		tmp |= rate->sdiv << SDIV_SHIFT;
+		tmp |= FIELD_PREP(SDIV_MASK, rate->sdiv);
 		writel_relaxed(tmp, pll->base + DIV_CTL0);
 
 		return 0;
@@ -215,8 +211,8 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 	tmp |= BYPASS_MASK;
 	writel(tmp, pll->base + GNRL_CTL);
 
-	div_val = (rate->mdiv << MDIV_SHIFT) | (rate->pdiv << PDIV_SHIFT) |
-		(rate->sdiv << SDIV_SHIFT);
+	div_val = FIELD_PREP(MDIV_MASK, rate->mdiv) | FIELD_PREP(PDIV_MASK, rate->pdiv) |
+		FIELD_PREP(SDIV_MASK, rate->sdiv);
 	writel_relaxed(div_val, pll->base + DIV_CTL0);
 
 	/*
@@ -262,10 +258,10 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 
 	if (!clk_pll14xx_mp_change(rate, tmp)) {
 		tmp &= ~SDIV_MASK;
-		tmp |= rate->sdiv << SDIV_SHIFT;
+		tmp |= FIELD_PREP(SDIV_MASK, rate->sdiv);
 		writel_relaxed(tmp, pll->base + DIV_CTL0);
 
-		tmp = rate->kdiv << KDIV_SHIFT;
+		tmp = FIELD_PREP(KDIV_MASK, rate->kdiv);
 		writel_relaxed(tmp, pll->base + DIV_CTL1);
 
 		return 0;
@@ -280,10 +276,11 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 	tmp |= BYPASS_MASK;
 	writel_relaxed(tmp, pll->base + GNRL_CTL);
 
-	div_val = (rate->mdiv << MDIV_SHIFT) | (rate->pdiv << PDIV_SHIFT) |
-		(rate->sdiv << SDIV_SHIFT);
+	div_val = FIELD_PREP(MDIV_MASK, rate->mdiv) |
+		  FIELD_PREP(PDIV_MASK, rate->pdiv) |
+		  FIELD_PREP(SDIV_MASK, rate->sdiv);
 	writel_relaxed(div_val, pll->base + DIV_CTL0);
-	writel_relaxed(rate->kdiv << KDIV_SHIFT, pll->base + DIV_CTL1);
+	writel_relaxed(FIELD_PREP(KDIV_MASK, rate->kdiv), pll->base + DIV_CTL1);
 
 	/*
 	 * According to SPEC, t3 - t2 need to be greater than
-- 
2.30.2


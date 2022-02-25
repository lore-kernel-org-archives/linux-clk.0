Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7576EC4332F
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 08:29:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238515AbiBYIaO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 03:30:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238513AbiBYIaN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 03:30:13 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F71239D79
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 00:29:41 -0800 (PST)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1nNVyt-0007PF-Ao; Fri, 25 Feb 2022 09:29:39 +0100
Received: from sha by dude02.hi.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <sha@pengutronix.de>)
        id 1nNVys-00BWSl-Fi; Fri, 25 Feb 2022 09:29:38 +0100
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
Subject: [PATCH v2 5/8] clk: imx: pll14xx: name variables after usage
Date:   Fri, 25 Feb 2022 09:29:34 +0100
Message-Id: <20220225082937.2746176-6-s.hauer@pengutronix.de>
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

In clk_pll1443x_set_rate() 'tmp' is used for the content of different
registers which makes it a bit hard to follow. Use different variables
named after the registers to make it clearer. No functional change
intended.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/clk/imx/clk-pll14xx.c | 42 +++++++++++++++++------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index ebd5d888fea6d..b464e1155e25b 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -238,7 +238,7 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 {
 	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
 	const struct imx_pll14xx_rate_table *rate;
-	u32 tmp, div_val;
+	u32 gnrl_ctl, div_ctl0;
 	int ret;
 
 	rate = imx_get_pll_settings(pll, drate);
@@ -248,32 +248,32 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 		return -EINVAL;
 	}
 
-	tmp = readl_relaxed(pll->base + DIV_CTL0);
+	div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
 
-	if (!clk_pll14xx_mp_change(rate, tmp)) {
-		tmp &= ~SDIV_MASK;
-		tmp |= FIELD_PREP(SDIV_MASK, rate->sdiv);
-		writel_relaxed(tmp, pll->base + DIV_CTL0);
+	if (!clk_pll14xx_mp_change(rate, div_ctl0)) {
+		div_ctl0 &= ~SDIV_MASK;
+		div_ctl0 |= FIELD_PREP(SDIV_MASK, rate->sdiv);
+		writel_relaxed(div_ctl0, pll->base + DIV_CTL0);
 
-		tmp = FIELD_PREP(KDIV_MASK, rate->kdiv);
-		writel_relaxed(tmp, pll->base + DIV_CTL1);
+		writel_relaxed(FIELD_PREP(KDIV_MASK, rate->kdiv),
+			       pll->base + DIV_CTL1);
 
 		return 0;
 	}
 
 	/* Enable RST */
-	tmp = readl_relaxed(pll->base + GNRL_CTL);
-	tmp &= ~RST_MASK;
-	writel_relaxed(tmp, pll->base + GNRL_CTL);
+	gnrl_ctl = readl_relaxed(pll->base + GNRL_CTL);
+	gnrl_ctl &= ~RST_MASK;
+	writel_relaxed(gnrl_ctl, pll->base + GNRL_CTL);
 
 	/* Enable BYPASS */
-	tmp |= BYPASS_MASK;
-	writel_relaxed(tmp, pll->base + GNRL_CTL);
+	gnrl_ctl |= BYPASS_MASK;
+	writel_relaxed(gnrl_ctl, pll->base + GNRL_CTL);
 
-	div_val = FIELD_PREP(MDIV_MASK, rate->mdiv) |
-		  FIELD_PREP(PDIV_MASK, rate->pdiv) |
-		  FIELD_PREP(SDIV_MASK, rate->sdiv);
-	writel_relaxed(div_val, pll->base + DIV_CTL0);
+	div_ctl0 = FIELD_PREP(MDIV_MASK, rate->mdiv) |
+		   FIELD_PREP(PDIV_MASK, rate->pdiv) |
+		   FIELD_PREP(SDIV_MASK, rate->sdiv);
+	writel_relaxed(div_ctl0, pll->base + DIV_CTL0);
 	writel_relaxed(FIELD_PREP(KDIV_MASK, rate->kdiv), pll->base + DIV_CTL1);
 
 	/*
@@ -285,8 +285,8 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 	udelay(3);
 
 	/* Disable RST */
-	tmp |= RST_MASK;
-	writel_relaxed(tmp, pll->base + GNRL_CTL);
+	gnrl_ctl |= RST_MASK;
+	writel_relaxed(gnrl_ctl, pll->base + GNRL_CTL);
 
 	/* Wait Lock*/
 	ret = clk_pll14xx_wait_lock(pll);
@@ -294,8 +294,8 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 		return ret;
 
 	/* Bypass */
-	tmp &= ~BYPASS_MASK;
-	writel_relaxed(tmp, pll->base + GNRL_CTL);
+	gnrl_ctl &= ~BYPASS_MASK;
+	writel_relaxed(gnrl_ctl, pll->base + GNRL_CTL);
 
 	return 0;
 }
-- 
2.30.2


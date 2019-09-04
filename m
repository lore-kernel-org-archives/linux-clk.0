Return-Path: <SRS0=96bN=W7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899C7C3A5A7
	for <linux-clk@archiver.kernel.org>; Wed,  4 Sep 2019 09:49:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 675DC2339E
	for <linux-clk@archiver.kernel.org>; Wed,  4 Sep 2019 09:49:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbfIDJtY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Sep 2019 05:49:24 -0400
Received: from inva021.nxp.com ([92.121.34.21]:49754 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726304AbfIDJtX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 4 Sep 2019 05:49:23 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 318DE2001B1;
        Wed,  4 Sep 2019 11:49:21 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 196FF200096;
        Wed,  4 Sep 2019 11:49:21 +0200 (CEST)
Received: from fsr-ub1864-112.ea.freescale.net (fsr-ub1864-112.ea.freescale.net [10.171.82.98])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 7AE1E20612;
        Wed,  4 Sep 2019 11:49:20 +0200 (CEST)
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Peng Fan <peng.fan@nxp.com>
Cc:     Jacky Bai <ping.bai@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Viorel Suman <viorel.suman@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: imx: pll14xx: Fix quick switch of S/K parameter
Date:   Wed,  4 Sep 2019 12:49:18 +0300
Message-Id: <c3e86b5a832a14278e8ba670d51defc70ee78d84.1567590349.git.leonard.crestez@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The PLL14xx on imx8m can change the S and K parameter without requiring
a reset and relock of the whole PLL.

Fix clk_pll144xx_mp_change register reading and use it for pll1443 as
well since no reset+relock is required on K changes either.

Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>
---
 drivers/clk/imx/clk-pll14xx.c | 40 +++++++----------------------------
 1 file changed, 8 insertions(+), 32 deletions(-)

The PLLs are currently table-based and none of the entries differ only
in S/K so further work would be required to make use of this. The
prospective user is audio doing tiny freq adjustments and there is no
standard API for that.

Lacking users is not a good reason to carry broken code around.

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index b7213023b238..25342297e5a6 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -110,47 +110,21 @@ static unsigned long clk_pll1443x_recalc_rate(struct clk_hw *hw,
 	do_div(fvco, pdiv << sdiv);
 
 	return fvco;
 }
 
-static inline bool clk_pll1416x_mp_change(const struct imx_pll14xx_rate_table *rate,
+static inline bool clk_pll14xx_mp_change(const struct imx_pll14xx_rate_table *rate,
 					  u32 pll_div)
 {
 	u32 old_mdiv, old_pdiv;
 
-	old_mdiv = (pll_div >> MDIV_SHIFT) & MDIV_MASK;
-	old_pdiv = (pll_div >> PDIV_SHIFT) & PDIV_MASK;
+	old_mdiv = (pll_div & MDIV_MASK) >> MDIV_SHIFT;
+	old_pdiv = (pll_div & PDIV_MASK) >> PDIV_SHIFT;
 
 	return rate->mdiv != old_mdiv || rate->pdiv != old_pdiv;
 }
 
-static inline bool clk_pll1443x_mpk_change(const struct imx_pll14xx_rate_table *rate,
-					  u32 pll_div_ctl0, u32 pll_div_ctl1)
-{
-	u32 old_mdiv, old_pdiv, old_kdiv;
-
-	old_mdiv = (pll_div_ctl0 >> MDIV_SHIFT) & MDIV_MASK;
-	old_pdiv = (pll_div_ctl0 >> PDIV_SHIFT) & PDIV_MASK;
-	old_kdiv = (pll_div_ctl1 >> KDIV_SHIFT) & KDIV_MASK;
-
-	return rate->mdiv != old_mdiv || rate->pdiv != old_pdiv ||
-		rate->kdiv != old_kdiv;
-}
-
-static inline bool clk_pll1443x_mp_change(const struct imx_pll14xx_rate_table *rate,
-					  u32 pll_div_ctl0, u32 pll_div_ctl1)
-{
-	u32 old_mdiv, old_pdiv, old_kdiv;
-
-	old_mdiv = (pll_div_ctl0 >> MDIV_SHIFT) & MDIV_MASK;
-	old_pdiv = (pll_div_ctl0 >> PDIV_SHIFT) & PDIV_MASK;
-	old_kdiv = (pll_div_ctl1 >> KDIV_SHIFT) & KDIV_MASK;
-
-	return rate->mdiv != old_mdiv || rate->pdiv != old_pdiv ||
-		rate->kdiv != old_kdiv;
-}
-
 static int clk_pll14xx_wait_lock(struct clk_pll14xx *pll)
 {
 	u32 val;
 
 	return readl_poll_timeout(pll->base, val, val & LOCK_TIMEOUT_US, 0,
@@ -172,11 +146,11 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 		return -EINVAL;
 	}
 
 	tmp = readl_relaxed(pll->base + 4);
 
-	if (!clk_pll1416x_mp_change(rate, tmp)) {
+	if (!clk_pll14xx_mp_change(rate, tmp)) {
 		tmp &= ~(SDIV_MASK) << SDIV_SHIFT;
 		tmp |= rate->sdiv << SDIV_SHIFT;
 		writel_relaxed(tmp, pll->base + 4);
 
 		return 0;
@@ -233,17 +207,19 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
 			drate, clk_hw_get_name(hw));
 		return -EINVAL;
 	}
 
 	tmp = readl_relaxed(pll->base + 4);
-	div_val = readl_relaxed(pll->base + 8);
 
-	if (!clk_pll1443x_mpk_change(rate, tmp, div_val)) {
+	if (!clk_pll14xx_mp_change(rate, tmp)) {
 		tmp &= ~(SDIV_MASK) << SDIV_SHIFT;
 		tmp |= rate->sdiv << SDIV_SHIFT;
 		writel_relaxed(tmp, pll->base + 4);
 
+		tmp = rate->kdiv << KDIV_SHIFT;
+		writel_relaxed(tmp, pll->base + 8);
+
 		return 0;
 	}
 
 	/* Enable RST */
 	tmp = readl_relaxed(pll->base);
-- 
2.17.1


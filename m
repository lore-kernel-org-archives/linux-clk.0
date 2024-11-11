Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0C4171650
	for <linux-clk@vger.kernel.org>; Mon, 11 Nov 2024 21:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731361536; cv=none; b=m/OF9/aOzlSr5oa/OClXeY7TP+VfWwJGq/AJ4mb+1JhNgyHvslrzMQlg8W5TJoZLPPRFl5Wdg4vntqQ1l5mKEdxIkjVPsUZ9yNzz8hRZf2waEMZJFuvyKpfTCbZ604hlQl4X3v+iJlAKxomWdVjI/7D3G1a1Oo+b1DrKcMU7QAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731361536; c=relaxed/simple;
	bh=GJiZfVtwqlPJxTs6tzyTLMZkg1w3QWU60EFk2yXniJo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C8ZvVExdJVN83sjM80F154m8AFYd8pPPXp50JgeqtuL9/Ocs6XvYY9p5d4leU4wCdWXue7WUp3c2cq+MZG2Nh7E+kkLd6nhsXmqfXpu8iSjpL48oMWkFE8PoaXBK1OV8QRIm3AzjJ+OoybbSUkAJ/3r9QMLbVVuwpq2EK4PHvdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=MSW7/Axj; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="MSW7/Axj"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id E809A8938A;
	Mon, 11 Nov 2024 22:45:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731361531;
	bh=BKz2VN1nWMnbQqfmx/ND1K/EZd0XbehhCz5EUh9qlIY=;
	h=From:To:Cc:Subject:Date:From;
	b=MSW7/AxjmzAKcgjprOCXGUC1ar47jLaWXMZer/XZOGGBF6UsP5sNzye1O63zU81Gx
	 Hr8IzHdjo6r/nn03pANvlXmNoPbSqjt42N+ZYlpmnOJGUoGuTsuoCOU1B4u0vEFukU
	 NibFZmb+nDu6c23lUr3eR0mC4+0HCyg+czmFtT7tHkNT7GkbaLr9pZ56YNVAEPNCDV
	 vsSuTAzIE8AyKgt1ScrfB4gv+KVMXBwDIm5fDFPAzhtk9c/eez8ELA4Jpl98HsVNzf
	 zT4b5hrAYDBqxC1U8Y6Bz1vRw4QVAecF3Na3le1Nl1JU3WyACTZhrmi0fdEvRYdP+X
	 fnlXM/8z0DZ/g==
From: Marek Vasut <marex@denx.de>
To: linux-clk@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: imx: pll14xx: Extend dynamic rates support to PLL1416x
Date: Mon, 11 Nov 2024 22:44:54 +0100
Message-ID: <20241111214516.208820-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The pll1416x PLL so far only supports rates from a rate table passed
during initialization. Calculating PLL settings dynamically helps in
case e.g. multiple video outputs are used and they each need their own
separate source of accurate pixel clock on i.MX8MP. In that case, e.g.
PLL1416x PLL3 can be used as another Video PLL for another output.

Extend the existing PLL1443x dynamic rate support to also apply to PLL1416x .

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/clk/imx/clk-pll14xx.c | 39 ++++++++---------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
index d63564dbb12ca..19b9f764a0015 100644
--- a/drivers/clk/imx/clk-pll14xx.c
+++ b/drivers/clk/imx/clk-pll14xx.c
@@ -214,23 +214,7 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
 		 t->mdiv, t->kdiv);
 }
 
-static long clk_pll1416x_round_rate(struct clk_hw *hw, unsigned long rate,
-			unsigned long *prate)
-{
-	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
-	const struct imx_pll14xx_rate_table *rate_table = pll->rate_table;
-	int i;
-
-	/* Assuming rate_table is in descending order */
-	for (i = 0; i < pll->rate_count; i++)
-		if (rate >= rate_table[i].rate)
-			return rate_table[i].rate;
-
-	/* return minimum supported value */
-	return rate_table[pll->rate_count - 1].rate;
-}
-
-static long clk_pll1443x_round_rate(struct clk_hw *hw, unsigned long rate,
+static long clk_pll14xx_round_rate(struct clk_hw *hw, unsigned long rate,
 			unsigned long *prate)
 {
 	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
@@ -285,22 +269,17 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 				 unsigned long prate)
 {
 	struct clk_pll14xx *pll = to_clk_pll14xx(hw);
-	const struct imx_pll14xx_rate_table *rate;
+	struct imx_pll14xx_rate_table rate;
 	u32 tmp, div_val;
 	int ret;
 
-	rate = imx_get_pll_settings(pll, drate);
-	if (!rate) {
-		pr_err("Invalid rate %lu for pll clk %s\n", drate,
-		       clk_hw_get_name(hw));
-		return -EINVAL;
-	}
+	imx_pll14xx_calc_settings(pll, drate, prate, &rate);
 
 	tmp = readl_relaxed(pll->base + DIV_CTL0);
 
-	if (!clk_pll14xx_mp_change(rate, tmp)) {
+	if (!clk_pll14xx_mp_change(&rate, tmp)) {
 		tmp &= ~SDIV_MASK;
-		tmp |= FIELD_PREP(SDIV_MASK, rate->sdiv);
+		tmp |= FIELD_PREP(SDIV_MASK, rate.sdiv);
 		writel_relaxed(tmp, pll->base + DIV_CTL0);
 
 		return 0;
@@ -319,8 +298,8 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
 	tmp |= BYPASS_MASK;
 	writel(tmp, pll->base + GNRL_CTL);
 
-	div_val = FIELD_PREP(MDIV_MASK, rate->mdiv) | FIELD_PREP(PDIV_MASK, rate->pdiv) |
-		FIELD_PREP(SDIV_MASK, rate->sdiv);
+	div_val = FIELD_PREP(MDIV_MASK, rate.mdiv) | FIELD_PREP(PDIV_MASK, rate.pdiv) |
+		FIELD_PREP(SDIV_MASK, rate.sdiv);
 	writel_relaxed(div_val, pll->base + DIV_CTL0);
 
 	/*
@@ -468,7 +447,7 @@ static const struct clk_ops clk_pll1416x_ops = {
 	.unprepare	= clk_pll14xx_unprepare,
 	.is_prepared	= clk_pll14xx_is_prepared,
 	.recalc_rate	= clk_pll14xx_recalc_rate,
-	.round_rate	= clk_pll1416x_round_rate,
+	.round_rate	= clk_pll14xx_round_rate,
 	.set_rate	= clk_pll1416x_set_rate,
 };
 
@@ -481,7 +460,7 @@ static const struct clk_ops clk_pll1443x_ops = {
 	.unprepare	= clk_pll14xx_unprepare,
 	.is_prepared	= clk_pll14xx_is_prepared,
 	.recalc_rate	= clk_pll14xx_recalc_rate,
-	.round_rate	= clk_pll1443x_round_rate,
+	.round_rate	= clk_pll14xx_round_rate,
 	.set_rate	= clk_pll1443x_set_rate,
 };
 
-- 
2.45.2


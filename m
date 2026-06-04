Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7B7480359
	for <linux-clk@vger.kernel.org>; Thu,  4 Jun 2026 13:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579609; cv=none; b=Yt15PrszIe8VHy+LbpHLLAxxCdyl4QIfLKeE7g2Vz8vl/JXtJz7HmQ4qMdCBIev+M2LEEzHu6u+XxpPrssqCPXJR70OLcpE2rqmUSqsgMV9FQzscAeBoLMctRqTQH2DkBMRVRJPY09pyQ5GJte+XG8cc28Xqw0vDMGv5RuogVnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579609; c=relaxed/simple;
	bh=xEojNvh9wcGXsaLfvfjpd534NWtxI2Qm7gWmBUbYltI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A0Y1oKtAHkdHBmxnOxb/Dh530sgW3W9aNsM1EYcP2JHK5u9m2zS3j/gPoKKVcllAck5B3m34UCUZmwxejYj8i5d0pBpHKWdhVyee+VGxAO1D9KQspwIhLUilXFkVfuhjrqtmREUk602pOOSJK3bKeB/ms962t9Twi2aHjz8r5sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=roms416k; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="roms416k"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AD4D54E40664;
	Thu,  4 Jun 2026 13:26:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 824585FEF7;
	Thu,  4 Jun 2026 13:26:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 56FE3106A18F4;
	Thu,  4 Jun 2026 15:26:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780579603; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p9kbywf1m6jX1K1F70xwsWcy5sEuN2hpYCNYcBnjz9k=;
	b=roms416kzk2sm28ZIgu9vlaT8VF19dqRB62p6O16l+aMB4NSqxbzMgCkybnC8O0UacnE+3
	hqttshTkGzj2wSEM9xbif2fXgSDhYGTgnareFJ4ewShj83YvEkg+DLoP2WyGjDUg7FB7Tc
	U+n+A54DWRS93KTpjg+yBIdEKO4gxXoTgm52JULEywll8iKTTAmlMBjB/DrNYjJD4Ka1XR
	6n6b6Aq0BYMO17IkYhx/s00V6R5CTloAuF0+AGGEBTeG+2AAuOvrwv9wgXfCy8g8FOVSmN
	8BKv9gfZlw3BdZPj8EZYQqFA9XuPWXOmlZ51n1H56iyhjtmzEsmudRWt2Gp8dg==
From: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Date: Thu, 04 Jun 2026 15:26:16 +0200
Subject: [PATCH v8 8/9] clk: eyeq: Drop PLL, dividers, and fixed factors
 structs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260604-clk-eyeq7-v8-8-53f618174cf6@bootlin.com>
References: <20260604-clk-eyeq7-v8-0-53f618174cf6@bootlin.com>
In-Reply-To: <20260604-clk-eyeq7-v8-0-53f618174cf6@bootlin.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-mips@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

Now that there are no users of the eqc_pll, eqc_div, and eqc_fixed_factor
structures since they have been converted to eqc_clock, remove these
structs and the code related to their parsing in probe and early
initialization.

Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
---
 drivers/clk/clk-eyeq.c | 192 +------------------------------------------------
 1 file changed, 3 insertions(+), 189 deletions(-)

diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
index 8a38ad9afb5e..5200d5f0ff06 100644
--- a/drivers/clk/clk-eyeq.c
+++ b/drivers/clk/clk-eyeq.c
@@ -78,33 +78,6 @@
 #define PARENT_BY_FWNAME			(-1)
 #define PARENT_BY_NAME				(-2)
 
-struct eqc_pll {
-	unsigned int	index;
-	const char	*name;
-	unsigned int	reg64;
-};
-
-/*
- * Divider clock. Divider is 2*(v+1), with v the register value.
- * Min divider is 2, max is 2*(2^width).
- */
-struct eqc_div {
-	unsigned int	index;
-	const char	*name;
-	unsigned int	parent;
-	unsigned int	reg;
-	u8		shift;
-	u8		width;
-};
-
-struct eqc_fixed_factor {
-	unsigned int	index;
-	const char	*name;
-	unsigned int	mult;
-	unsigned int	div;
-	unsigned int	parent;
-};
-
 struct eqc_clock {
 	int		index;
 	int		parent_idx;
@@ -133,15 +106,6 @@ struct eqc_clock {
 };
 
 struct eqc_match_data {
-	unsigned int		pll_count;
-	const struct eqc_pll	*plls;
-
-	unsigned int		div_count;
-	const struct eqc_div	*divs;
-
-	unsigned int			fixed_factor_count;
-	const struct eqc_fixed_factor	*fixed_factors;
-
 	unsigned int		clk_count;
 	const struct eqc_clock	*clks;
 
@@ -153,12 +117,6 @@ struct eqc_match_data {
 };
 
 struct eqc_early_match_data {
-	unsigned int		early_pll_count;
-	const struct eqc_pll	*early_plls;
-
-	unsigned int			early_fixed_factor_count;
-	const struct eqc_fixed_factor	*early_fixed_factors;
-
 	unsigned int		early_clk_count;
 	const struct eqc_clock	*early_clks;
 
@@ -271,97 +229,6 @@ static int eqc_pll_parse_fracg(void __iomem *base, unsigned long *mult,
 	return 0;
 }
 
-static void eqc_probe_init_plls(struct device *dev, const struct eqc_match_data *data,
-				void __iomem *base, struct clk_hw_onecell_data *cells)
-{
-	unsigned long mult, div, acc;
-	const struct eqc_pll *pll;
-	struct clk_hw *hw;
-	unsigned int i;
-	int ret;
-
-	for (i = 0; i < data->pll_count; i++) {
-		pll = &data->plls[i];
-
-		ret = eqc_pll_parse_fracg(base + pll->reg64, &mult, &div, &acc);
-		if (ret) {
-			dev_warn(dev, "failed parsing state of %s\n", pll->name);
-			cells->hws[pll->index] = ERR_PTR(ret);
-			continue;
-		}
-
-		hw = clk_hw_register_fixed_factor_with_accuracy_fwname(dev,
-				dev->of_node, pll->name, "ref", 0, mult, div, acc);
-		cells->hws[pll->index] = hw;
-		if (IS_ERR(hw))
-			dev_warn(dev, "failed registering %s: %pe\n", pll->name, hw);
-	}
-}
-
-static void eqc_probe_init_divs(struct device *dev, const struct eqc_match_data *data,
-				void __iomem *base, struct clk_hw_onecell_data *cells)
-{
-	struct clk_parent_data parent_data = { };
-	const struct eqc_div *div;
-	struct clk_hw *parent;
-	void __iomem *reg;
-	struct clk_hw *hw;
-	unsigned int i;
-
-	for (i = 0; i < data->div_count; i++) {
-		div = &data->divs[i];
-		reg = base + div->reg;
-		parent = cells->hws[div->parent];
-
-		if (IS_ERR(parent)) {
-			/* Parent is in early clk provider. */
-			parent_data.index = div->parent;
-			parent_data.hw = NULL;
-		} else {
-			/* Avoid clock lookup when we already have the hw reference. */
-			parent_data.index = 0;
-			parent_data.hw = parent;
-		}
-
-		hw = clk_hw_register_divider_table_parent_data(dev, div->name,
-				&parent_data, 0, reg, div->shift, div->width,
-				CLK_DIVIDER_EVEN_INTEGERS, NULL, NULL);
-		cells->hws[div->index] = hw;
-		if (IS_ERR(hw))
-			dev_warn(dev, "failed registering %s: %pe\n",
-				 div->name, hw);
-	}
-}
-
-static void eqc_probe_init_fixed_factors(struct device *dev,
-					 const struct eqc_match_data *data,
-					 struct clk_hw_onecell_data *cells)
-{
-	const struct eqc_fixed_factor *ff;
-	struct clk_hw *hw, *parent_hw;
-	unsigned int i;
-
-	for (i = 0; i < data->fixed_factor_count; i++) {
-		ff = &data->fixed_factors[i];
-		parent_hw = cells->hws[ff->parent];
-
-		if (IS_ERR(parent_hw)) {
-			/* Parent is in early clk provider. */
-			hw = clk_hw_register_fixed_factor_index(dev, ff->name,
-					ff->parent, 0, ff->mult, ff->div);
-		} else {
-			/* Avoid clock lookup when we already have the hw reference. */
-			hw = clk_hw_register_fixed_factor_parent_hw(dev, ff->name,
-					parent_hw, 0, ff->mult, ff->div);
-		}
-
-		cells->hws[ff->index] = hw;
-		if (IS_ERR(hw))
-			dev_warn(dev, "failed registering %s: %pe\n",
-				 ff->name, hw);
-	}
-}
-
 static void eqc_auxdev_create_optional(struct device *dev, void __iomem *base,
 				       const char *name)
 {
@@ -500,12 +367,10 @@ static int eqc_probe(struct platform_device *pdev)
 	eqc_auxdev_create_optional(dev, base, data->pinctrl_auxdev_name);
 	eqc_auxdev_create_optional(dev, base, data->eth_phy_auxdev_name);
 
-	if (data->pll_count + data->div_count + data->fixed_factor_count + data->clk_count == 0)
+	if (data->clk_count == 0)
 		return 0; /* Zero clocks, we are done. */
 
-	clk_count = data->pll_count + data->div_count +
-		    data->fixed_factor_count + data->clk_count +
-		    data->early_clk_count;
+	clk_count = data->clk_count + data->early_clk_count;
 	cells = kzalloc_flex(*cells, hws, clk_count);
 	if (!cells)
 		return -ENOMEM;
@@ -516,12 +381,6 @@ static int eqc_probe(struct platform_device *pdev)
 	for (i = 0; i < clk_count; i++)
 		cells->hws[i] = ERR_PTR(-EINVAL);
 
-	eqc_probe_init_plls(dev, data, base, cells);
-
-	eqc_probe_init_divs(dev, data, base, cells);
-
-	eqc_probe_init_fixed_factors(dev, data, cells);
-
 	for (i = 0; i < data->clk_count; i++) {
 		const struct eqc_clock *clk = &data->clks[i];
 
@@ -872,8 +731,7 @@ static void __init eqc_early_init(struct device_node *np,
 	void __iomem *base;
 	int ret;
 
-	clk_count = early_data->early_pll_count + early_data->early_fixed_factor_count +
-		    early_data->early_clk_count + early_data->late_clk_count;
+	clk_count = early_data->early_clk_count + early_data->late_clk_count;
 	cells = kzalloc_flex(*cells, hws, clk_count);
 	if (!cells) {
 		ret = -ENOMEM;
@@ -899,42 +757,6 @@ static void __init eqc_early_init(struct device_node *np,
 		goto err;
 	}
 
-	for (i = 0; i < early_data->early_pll_count; i++) {
-		const struct eqc_pll *pll = &early_data->early_plls[i];
-		unsigned long mult, div, acc;
-		struct clk_hw *hw;
-
-		ret = eqc_pll_parse_fracg(base + pll->reg64, &mult, &div, &acc);
-		if (ret) {
-			pr_err("failed parsing state of %s\n", pll->name);
-			goto err;
-		}
-
-		hw = clk_hw_register_fixed_factor_with_accuracy_fwname(NULL,
-				np, pll->name, "ref", 0, mult, div, acc);
-		cells->hws[pll->index] = hw;
-		if (IS_ERR(hw)) {
-			pr_err("failed registering %s: %pe\n", pll->name, hw);
-			ret = PTR_ERR(hw);
-			goto err;
-		}
-	}
-
-	for (i = 0; i < early_data->early_fixed_factor_count; i++) {
-		const struct eqc_fixed_factor *ff = &early_data->early_fixed_factors[i];
-		struct clk_hw *parent_hw = cells->hws[ff->parent];
-		struct clk_hw *hw;
-
-		hw = clk_hw_register_fixed_factor_parent_hw(NULL, ff->name,
-				parent_hw, 0, ff->mult, ff->div);
-		cells->hws[ff->index] = hw;
-		if (IS_ERR(hw)) {
-			pr_err("failed registering %s: %pe\n", ff->name, hw);
-			ret = PTR_ERR(hw);
-			goto err;
-		}
-	}
-
 	for (i = 0; i < early_data->early_clk_count; i++) {
 		const struct eqc_clock *clk = &early_data->early_clks[i];
 
@@ -969,14 +791,6 @@ static void __init eqc_early_init(struct device_node *np,
 	if (cells) {
 		of_clk_del_provider(np);
 
-		for (i = 0; i < early_data->early_pll_count; i++) {
-			const struct eqc_pll *pll = &early_data->early_plls[i];
-			struct clk_hw *hw = cells->hws[pll->index];
-
-			if (!IS_ERR_OR_NULL(hw))
-				clk_hw_unregister_fixed_factor(hw);
-		}
-
 		for (i = 0; i < early_data->early_clk_count; i++) {
 			const struct eqc_clock *clk = &early_data->early_clks[i];
 			struct clk_hw *hw = cells->hws[clk->index];

-- 
2.54.0


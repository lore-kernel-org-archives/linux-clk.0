Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A1719CC2F;
	Tue,  3 Sep 2024 21:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725399628; cv=none; b=tlrjrgm+VPNdWRrIV+YcY98vbOd2yIM5yRYLVYO8f+GcUezyzLWM/+cN9l+4GJ9ULSXMLrVhTV5JYwCFKaRJtt25Md6qokyo5r+oN+hRWqLjzhj/gFNYzPGhBUzDmEhLZiDuAnRo1VhJ5XJzlselw30HY/B09NT8vCidQT/r0yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725399628; c=relaxed/simple;
	bh=PW8ddy+pXAnxNJrPOQZKDlj/hwvRV8Ogci5h4BqHNeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lCoRY4rHebJoycAkfLW41IqFfnxbonZrtW1fkoOp12ezgA1AcfW/4VGad1AjzmXJ/hgaWeRBpZ3BUa0XR4Gux1j6XHJbOjW9sk9fBdcBNZ4HZf8stsVYA+39rgWDN5kAAriv3bfMvYj1TvENhws5JQ+Hel17A+SKaTbngV70v08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PA65CrZN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PA65CrZN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6C50C4CEC4;
	Tue,  3 Sep 2024 21:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725399627;
	bh=PW8ddy+pXAnxNJrPOQZKDlj/hwvRV8Ogci5h4BqHNeU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PA65CrZNNZKdzTjDfxNzpdiZnyyGffoGo68wGzKwCXM8wBeIMzx1slE/C1VXMStym
	 PE4tCN/8iSqqjucQHGLcHRA28oQjsoftvIYu3aTspX4YXp9DRyqDX+jZqKTMDWjG9p
	 78Cex56wXjgu5ORgj0EPUYzX6UgWRpCkNjRsQQPTnY+uNCWLhEbRbtWFIJO3IAOybE
	 YAHbEWl7y5oloBuPuJMdXLBmCKCdBDj1rp4A9aEu7fur9/k37+UUwYk1wrb4BszwgP
	 34Fd8BqZMrg3jltkJirlms5M+javUZAh0+ml9V7oZM1rEiQD/rQHuCkzp33p0bxIa6
	 M/Y9DS63uD7sQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 03 Sep 2024 23:39:50 +0200
Subject: [PATCH v2 6/7] clk: en7523: move en7581_reset_register() in
 en7581_clk_hw_init()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-clk-en7581-syscon-v2-6-86fbe2fc15c3@kernel.org>
References: <20240903-clk-en7581-syscon-v2-0-86fbe2fc15c3@kernel.org>
In-Reply-To: <20240903-clk-en7581-syscon-v2-0-86fbe2fc15c3@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 upstream@airoha.com, angelogioacchino.delregno@collabora.com, 
 linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, 
 ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.1

Move en7581_reset_register routine in en7581_clk_hw_init() since reset
feature is supported just by EN7581 SoC.
Get rid of reset struct in en_clk_soc_data data struct.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 93 +++++++++++++++++-------------------------------
 1 file changed, 33 insertions(+), 60 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index fdd8ea989ed2..60dc938144d7 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -76,11 +76,6 @@ struct en_rst_data {
 
 struct en_clk_soc_data {
 	const struct clk_ops pcie_ops;
-	struct {
-		const u16 *bank_ofs;
-		const u16 *idx_map;
-		u16 idx_map_nr;
-	} reset;
 	int (*hw_init)(struct platform_device *pdev,
 		       struct clk_hw_onecell_data *clk_data);
 };
@@ -595,32 +590,6 @@ static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 	clk_data->num = EN7523_NUM_CLOCKS;
 }
 
-static int en7581_clk_hw_init(struct platform_device *pdev,
-			      struct clk_hw_onecell_data *clk_data)
-{
-	void __iomem *np_base;
-	struct regmap *map;
-	u32 val;
-
-	map = syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
-	if (IS_ERR(map))
-		return PTR_ERR(map);
-
-	np_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(np_base))
-		return PTR_ERR(np_base);
-
-	en7581_register_clocks(&pdev->dev, clk_data, map, np_base);
-
-	val = readl(np_base + REG_NP_SCU_SSTR);
-	val &= ~(REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
-	writel(val, np_base + REG_NP_SCU_SSTR);
-	val = readl(np_base + REG_NP_SCU_PCIC);
-	writel(val | 3, np_base + REG_NP_SCU_PCIC);
-
-	return 0;
-}
-
 static int en7523_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
@@ -670,23 +639,18 @@ static int en7523_reset_xlate(struct reset_controller_dev *rcdev,
 	return rst_data->idx_map[reset_spec->args[0]];
 }
 
-static const struct reset_control_ops en7523_reset_ops = {
+static const struct reset_control_ops en7581_reset_ops = {
 	.assert = en7523_reset_assert,
 	.deassert = en7523_reset_deassert,
 	.status = en7523_reset_status,
 };
 
-static int en7523_reset_register(struct platform_device *pdev,
-				 const struct en_clk_soc_data *soc_data)
+static int en7581_reset_register(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct en_rst_data *rst_data;
 	void __iomem *base;
 
-	/* no reset lines available */
-	if (!soc_data->reset.idx_map_nr)
-		return 0;
-
 	base = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
@@ -695,13 +659,13 @@ static int en7523_reset_register(struct platform_device *pdev,
 	if (!rst_data)
 		return -ENOMEM;
 
-	rst_data->bank_ofs = soc_data->reset.bank_ofs;
-	rst_data->idx_map = soc_data->reset.idx_map;
+	rst_data->bank_ofs = en7581_rst_ofs;
+	rst_data->idx_map = en7581_rst_map;
 	rst_data->base = base;
 
-	rst_data->rcdev.nr_resets = soc_data->reset.idx_map_nr;
+	rst_data->rcdev.nr_resets = ARRAY_SIZE(en7581_rst_map);
 	rst_data->rcdev.of_xlate = en7523_reset_xlate;
-	rst_data->rcdev.ops = &en7523_reset_ops;
+	rst_data->rcdev.ops = &en7581_reset_ops;
 	rst_data->rcdev.of_node = dev->of_node;
 	rst_data->rcdev.of_reset_n_cells = 1;
 	rst_data->rcdev.owner = THIS_MODULE;
@@ -710,6 +674,32 @@ static int en7523_reset_register(struct platform_device *pdev,
 	return devm_reset_controller_register(dev, &rst_data->rcdev);
 }
 
+static int en7581_clk_hw_init(struct platform_device *pdev,
+			      struct clk_hw_onecell_data *clk_data)
+{
+	void __iomem *np_base;
+	struct regmap *map;
+	u32 val;
+
+	map = syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	np_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(np_base))
+		return PTR_ERR(np_base);
+
+	en7581_register_clocks(&pdev->dev, clk_data, map, np_base);
+
+	val = readl(np_base + REG_NP_SCU_SSTR);
+	val &= ~(REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
+	writel(val, np_base + REG_NP_SCU_SSTR);
+	val = readl(np_base + REG_NP_SCU_PCIC);
+	writel(val | 3, np_base + REG_NP_SCU_PCIC);
+
+	return en7581_reset_register(pdev);
+}
+
 static int en7523_clk_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
@@ -728,19 +718,7 @@ static int en7523_clk_probe(struct platform_device *pdev)
 	if (r)
 		return r;
 
-	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
-	if (r)
-		return dev_err_probe(&pdev->dev, r, "Could not register clock provider: %s\n",
-				     pdev->name);
-
-	r = en7523_reset_register(pdev, soc_data);
-	if (r) {
-		of_clk_del_provider(node);
-		return dev_err_probe(&pdev->dev, r, "Could not register reset controller: %s\n",
-				     pdev->name);
-	}
-
-	return 0;
+	return of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 }
 
 static const struct en_clk_soc_data en7523_data = {
@@ -758,11 +736,6 @@ static const struct en_clk_soc_data en7581_data = {
 		.enable = en7581_pci_enable,
 		.disable = en7581_pci_disable,
 	},
-	.reset = {
-		.bank_ofs = en7581_rst_ofs,
-		.idx_map = en7581_rst_map,
-		.idx_map_nr = ARRAY_SIZE(en7581_rst_map),
-	},
 	.hw_init = en7581_clk_hw_init,
 };
 

-- 
2.46.0


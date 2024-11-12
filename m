Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D873033F9;
	Tue, 12 Nov 2024 00:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731370188; cv=none; b=a7qL67N+2Upy7hc8KwqOf+VXQ/i1hAMdGlWFWqMeoCsicAmlifCJSTwphzQcx0jmtheIRIv2itRQZGRbbpDginG2QgbdEubxHPtsQc2oCF15ni8PdJjoYH3bQK93Qo1hJ3r88uco0jiThUlgcWTbdM6a/T8owcrfI1qbgoDY3ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731370188; c=relaxed/simple;
	bh=jywWh2uc1zrJHhjROAkqgIkXxB1CixWs4MZLFKXBMuI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PD6fzC7EmOeRSTKT78JDlcPfJQtbVj7C/SpLV6QlN27fD5+utDio+AHb9Ciqazva/CaM/m9dVukPxAvmEvLXhCcf9TPAZRCwDFljQZ36+SqEXw2hclVTI06S4Nznnwpov8Cdee7Quro7/qpCYPF9Avz1BA7EsAci+AvWaB3jGUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TV2gu0Mm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TV2gu0Mm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59531C4CECF;
	Tue, 12 Nov 2024 00:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731370188;
	bh=jywWh2uc1zrJHhjROAkqgIkXxB1CixWs4MZLFKXBMuI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TV2gu0MmVr3ipOgZZ97RWGtrtFWCw1bTkLWp7Y/S1sGX9Zms7xoV/cuSaWx1LmrXd
	 iUriHG10GZSd+XnxeJZpzkzH9/QuM4VWv4xSV4MmRoKzK98wmDyZw6uxQlf1YXBjbe
	 onobG6j2eyC7Cugnh2nW3TL03/RH1xRQqaXoDaTQ/Mec7QikY6YoxpiKdYYZ3MIZKZ
	 nJd/ycnfza74faGJ4TJUesD4kSR5x0H8mXYywBDyvaE8n8iirqCY8DZYcCNAplVeK5
	 a5bj9ZJQQBuVtVBl+vSuFuI650c2uswaXUSN8+/UvdKZCY3wpeu+uy5NTehHbjY2La
	 3lATVyp66fuWQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 12 Nov 2024 01:08:53 +0100
Subject: [PATCH RESEND v2 6/7] clk: en7523: move en7581_reset_register() in
 en7581_clk_hw_init()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-clk-en7581-syscon-v2-6-8ada5e394ae4@kernel.org>
References: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org>
In-Reply-To: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 upstream@airoha.com, angelogioacchino.delregno@collabora.com, 
 linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, 
 ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2

Move en7581_reset_register routine in en7581_clk_hw_init() since reset
feature is supported just by EN7581 SoC.
Get rid of reset struct in en_clk_soc_data data struct.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 93 +++++++++++++++++-------------------------------
 1 file changed, 33 insertions(+), 60 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index fdd8ea989ed24a5967a42091bb3fee59500b4353..60dc938144d75b5fa21c9109ff05ed1083a16678 100644
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
2.47.0


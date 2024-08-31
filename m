Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBAC16A94A;
	Sat, 31 Aug 2024 07:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725088764; cv=none; b=oEISC3ALCuvAn/zRdOcRRBnl/TYK2lX/uZNDGLSb40yE1qTIOW3Q4g2MUGtpPJnw1NeTjUmUiV/b1lTgJLwwARWglEQ3jWdC2LZRfIXf4kWxBRPD/FdLSRqvAR+85m8JefMIbG3vc2gNSGiAcKDNHfqdCMMjlkUUTmZzcSy6Isc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725088764; c=relaxed/simple;
	bh=oSjqHUxHhFTQQpQZ02qWUHUFeOJxU9IRo9BaPP4vfX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iw/K0qPGuPQySZKGbykM4ppMwanhC91/cubgCvQ650rw9SJ9820DVzVfB8sU4ENrcCcG+uV1kU+oxbuYIVzlhnFwqh8QVTbsuQS5w2T/9J/0e9habiur3HtXjRH32PdNx541aYCefUeplu5/GRqEcJ4fcqopVcj0R5GpA7dZhqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPl6khfH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPl6khfH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5DEFC4CEC0;
	Sat, 31 Aug 2024 07:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725088764;
	bh=oSjqHUxHhFTQQpQZ02qWUHUFeOJxU9IRo9BaPP4vfX4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VPl6khfH5sMkPxxAB4w2JwPe57q7ELcmArGHeLjeuRHNnkgkBJLc+2WUnb61SziJX
	 lX6kTW+tvArqVapvCDxsalwGezw8j2dyOUdYa5QtB3hVrfWHn43YTFIg/AZrmsVylS
	 w6LlZ/8ffXa+l7z583NDFZT9kWlxEedZN5FUBPDy7xUBS3tzK4GPLJBm9pcnAX9vMg
	 Bumi4K3qexg7E3SMuf/wsv/mhY4VubST3ZHsrvZA5a7Amz071BvvFQZ20JpGu6H26h
	 lUq/ynPCIABpzA0zk0aXryaOAlMsJIqSSNGSWogytiwsvpbwE7OYxxQbWOmltlIUd+
	 KCgvFvuD3rlow==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 31 Aug 2024 09:18:48 +0200
Subject: [PATCH 6/7] clk: en7523: move en7581_reset_register() in
 en7581_clk_hw_init()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240831-clk-en7581-syscon-v1-6-5c2683541068@kernel.org>
References: <20240831-clk-en7581-syscon-v1-0-5c2683541068@kernel.org>
In-Reply-To: <20240831-clk-en7581-syscon-v1-0-5c2683541068@kernel.org>
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
 drivers/clk/clk-en7523.c | 115 ++++++++++++++++++-----------------------------
 1 file changed, 44 insertions(+), 71 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index f9ebbdb70393..946c85a89102 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -82,11 +82,6 @@ struct en_rst_data {
 
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
@@ -598,43 +593,6 @@ static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_dat
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
-	map = syscon_regmap_lookup_by_compatible("airoha,en7581-pbus-csr");
-	if (IS_ERR(map))
-		return PTR_ERR(map);
-
-	regmap_write(map, REG_PCIE0_MEM, 0x20000000);
-	regmap_write(map, REG_PCIE0_MEM_MASK, 0xfc000000);
-	regmap_write(map, REG_PCIE1_MEM, 0x24000000);
-	regmap_write(map, REG_PCIE1_MEM_MASK, 0xfc000000);
-	regmap_write(map, REG_PCIE2_MEM, 0x28000000);
-	regmap_write(map, REG_PCIE2_MEM_MASK, 0xfc000000);
-
-	return 0;
-}
-
 static int en7523_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
@@ -684,23 +642,18 @@ static int en7523_reset_xlate(struct reset_controller_dev *rcdev,
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
@@ -709,13 +662,13 @@ static int en7523_reset_register(struct platform_device *pdev,
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
@@ -724,6 +677,43 @@ static int en7523_reset_register(struct platform_device *pdev,
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
+	map = syscon_regmap_lookup_by_compatible("airoha,en7581-pbus-csr");
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	regmap_write(map, REG_PCIE0_MEM, 0x20000000);
+	regmap_write(map, REG_PCIE0_MEM_MASK, 0xfc000000);
+	regmap_write(map, REG_PCIE1_MEM, 0x24000000);
+	regmap_write(map, REG_PCIE1_MEM_MASK, 0xfc000000);
+	regmap_write(map, REG_PCIE2_MEM, 0x28000000);
+	regmap_write(map, REG_PCIE2_MEM_MASK, 0xfc000000);
+
+	return en7581_reset_register(pdev);
+}
+
 static int en7523_clk_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
@@ -742,19 +732,7 @@ static int en7523_clk_probe(struct platform_device *pdev)
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
@@ -772,11 +750,6 @@ static const struct en_clk_soc_data en7581_data = {
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


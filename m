Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCD91662E4;
	Sat, 31 Aug 2024 07:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725088756; cv=none; b=T4pAGTxyTCI/tR9svdKFKOLjJ/Jm0xu3DRHk5Z9Pq1nsuFM85FQAlSgCzHUXwcbxJbfAnQWZNuj6ofHzSG8WGjUugg5qT+xFbSVzPRpHZxgIHqy5Q94TA4Jm8yqQAdQkI3Q0UOhcpZTusB0VoRco9cWWSHA4AbCiuGFrzi5Uk1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725088756; c=relaxed/simple;
	bh=wxirsGQfghx8sEXgTMK+2xTQCHoa8BxdA/oLCL1aN0s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CyiYXCm9TZRP4WKLNMEeEq7H/PkkZvImlKp+muQ1h6cP2LPvb/2PxlITweweYiBIvugsKsnbePVEm4D/nnkqu69AnN7MZwmQhxE+N8Ec7FEyLFg1L6lWmFCrFjhpduBmkxp4nVnDXMjj7GVFw6LB3p216/1+RI8F6loDTqZJ4cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jX1Azl5l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jX1Azl5l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7AE0C4CEC0;
	Sat, 31 Aug 2024 07:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725088756;
	bh=wxirsGQfghx8sEXgTMK+2xTQCHoa8BxdA/oLCL1aN0s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jX1Azl5lP4/FwYU9pqvlKFNenySIHMvYdRfDza99ppPYMg3egRdlKqJ0c3DcfNPB6
	 TWN3/LknTyL29O4MDnJQzHc+Zy1e2rCX3pahqK4bYIsv0gWneGCy0TppI8EWaafCfk
	 pHIBlQ5GLNVpR62DH07AyHBXEcxOr6tSgLxxzd4jumwVqTQvd7IGuCmbTBMiPZZ5bU
	 lCMNlOEOhZzC5QeC6sl1a7b2sZJ64MZvWF9XG/ROVU3g/+NUJmBHby9gvvtaMbGTLM
	 dMvmYXkaTwnLX2He9LLXITwL4EnoFC/vWg7fqio4qVHubQx/g4AnXDjs6QA+f2QjxC
	 iJqKjbQ1Y0SwA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 31 Aug 2024 09:18:45 +0200
Subject: [PATCH 3/7] clk: en7523: move clock_register in hw_init callback
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240831-clk-en7581-syscon-v1-3-5c2683541068@kernel.org>
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

Move en7523_register_clocks routine in hw_init callback.
Introduce en7523_clk_hw_init callback for EN7523 SoC.
This is a preliminary patch to differentiate IO mapped region between
EN7523 and EN7581 SoCs in order to access chip-scu IO region
<0x1fa20000 0x384> on EN7581 SoC as syscon device since it contains
miscellaneous registers needed by multiple devices (clock, pinctrl ..).

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 106 +++++++++++++++++++++++++++--------------------
 1 file changed, 62 insertions(+), 44 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 2bc1bf4afbed..78bcb0ce77a5 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -86,7 +86,8 @@ struct en_clk_soc_data {
 		const u16 *idx_map;
 		u16 idx_map_nr;
 	} reset;
-	int (*hw_init)(struct platform_device *pdev, void __iomem *np_base);
+	int (*hw_init)(struct platform_device *pdev,
+		       struct clk_hw_onecell_data *clk_data);
 };
 
 static const u32 gsw_base[] = { 400000000, 500000000 };
@@ -414,32 +415,6 @@ static void en7581_pci_disable(struct clk_hw *hw)
 	usleep_range(1000, 2000);
 }
 
-static int en7581_clk_hw_init(struct platform_device *pdev,
-			      void __iomem *np_base)
-{
-	struct regmap *map;
-	u32 val;
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
 static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
 				   void __iomem *base, void __iomem *np_base)
 {
@@ -469,6 +444,61 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 	clk_data->num = EN7523_NUM_CLOCKS;
 }
 
+static int en7523_clk_hw_init(struct platform_device *pdev,
+			      struct clk_hw_onecell_data *clk_data)
+{
+	void __iomem *base, *np_base;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	np_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(np_base))
+		return PTR_ERR(np_base);
+
+	en7523_register_clocks(&pdev->dev, clk_data, base, np_base);
+
+	return 0;
+}
+
+static int en7581_clk_hw_init(struct platform_device *pdev,
+			      struct clk_hw_onecell_data *clk_data)
+{
+	void __iomem *base, *np_base;
+	struct regmap *map;
+	u32 val;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	np_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(np_base))
+		return PTR_ERR(np_base);
+
+	en7523_register_clocks(&pdev->dev, clk_data, base, np_base);
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
+	return 0;
+}
+
 static int en7523_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
@@ -563,31 +593,18 @@ static int en7523_clk_probe(struct platform_device *pdev)
 	struct device_node *node = pdev->dev.of_node;
 	const struct en_clk_soc_data *soc_data;
 	struct clk_hw_onecell_data *clk_data;
-	void __iomem *base, *np_base;
 	int r;
 
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	np_base = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(np_base))
-		return PTR_ERR(np_base);
-
-	soc_data = device_get_match_data(&pdev->dev);
-	if (soc_data->hw_init) {
-		r = soc_data->hw_init(pdev, np_base);
-		if (r)
-			return r;
-	}
-
 	clk_data = devm_kzalloc(&pdev->dev,
 				struct_size(clk_data, hws, EN7523_NUM_CLOCKS),
 				GFP_KERNEL);
 	if (!clk_data)
 		return -ENOMEM;
 
-	en7523_register_clocks(&pdev->dev, clk_data, base, np_base);
+	soc_data = device_get_match_data(&pdev->dev);
+	r = soc_data->hw_init(pdev, clk_data);
+	if (r)
+		return r;
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
@@ -610,6 +627,7 @@ static const struct en_clk_soc_data en7523_data = {
 		.prepare = en7523_pci_prepare,
 		.unprepare = en7523_pci_unprepare,
 	},
+	.hw_init = en7523_clk_hw_init,
 };
 
 static const struct en_clk_soc_data en7581_data = {

-- 
2.46.0


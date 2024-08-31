Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4D616A92E;
	Sat, 31 Aug 2024 07:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725088759; cv=none; b=iPsg0bSYqXfHLCHpu0GV1ekZRAYaChR7ic2MQvrsCLfLK0cOOC4pK9lN6FJUdtNDem2fxMqMWdv9+82NQ6BWdfWPQMkpY/8BUUa+fMCRV7LYv0+9co94aoxeQ3feebwWB7dvRD1CFoz30UD2FZpjjliEj4HdPjAkz01xblnTsYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725088759; c=relaxed/simple;
	bh=YHZJ988FcV1F6uBvvv9QjPxEj5imGTvAZwqhOOIKZMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tsvWuY//5x8iEMgUTDrQrPEn5LHGOWc920+7YBCl0lfCWRPfi1XeupnqX09cJX6JL7fjTsf3HeNZhnw/1l8lK6sFq1cXIStBPndfGQyK3a8XFd59oq6XbHTdMCTVer0L6hYcsKH/eb3elnfVd1jPLtOeVu1Gid+pvuUqobPgal0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oq3xgBpJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oq3xgBpJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 801AAC4CEC0;
	Sat, 31 Aug 2024 07:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725088759;
	bh=YHZJ988FcV1F6uBvvv9QjPxEj5imGTvAZwqhOOIKZMw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oq3xgBpJHlfBfoOOTOeVBPqjHOlKNrS7FVMEgo3Vz1dXy47NgTCxqpkGs1G5Lw4wN
	 uaWTYp6t6ONiteLlQXhVbDH4FdDQ0hh3qv0TPgYXCxbJPIozBPWvJ7bJZ68FjCs07J
	 d6LCaNYx52miNtfp3K0t3WBOD6f6pv6B040/0HE0KqDc3PqblXfdHz6LUp+Mq7Bq53
	 wx7ca/UWvA6TGLatelI9HsuiSMTvrB0UNW2U19P588SQ2Q0TgPT5tkDqvYSE0bgmUT
	 mq6AFct3R09R/ycDb3F3tL1Lu0/BS8nz56H6iogzgR52J4mXb7k2FGbwCaCS8glwCR
	 KpZihWPlEqZbQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 31 Aug 2024 09:18:46 +0200
Subject: [PATCH 4/7] clk: en7523: introduce chip_scu regmap
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240831-clk-en7581-syscon-v1-4-5c2683541068@kernel.org>
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

Introduce chip_scu regmap pointer since EN7581 SoC will access chip-scu
memory area through a syscon node. Remove first memory region mapping
for EN7581 SoC. This patch does not introduce any backward incompatibility
since the dts for EN7581 SoC is not public yet.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 75 +++++++++++++++++++++++++++++++++++-------------
 1 file changed, 55 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 78bcb0ce77a5..d0f936ec6bb2 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -255,15 +255,11 @@ static const u16 en7581_rst_map[] = {
 	[EN7581_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
 };
 
-static unsigned int en7523_get_base_rate(void __iomem *base, unsigned int i)
+static u32 en7523_get_base_rate(const struct en_clk_desc *desc, u32 val)
 {
-	const struct en_clk_desc *desc = &en7523_base_clks[i];
-	u32 val;
-
 	if (!desc->base_bits)
 		return desc->base_value;
 
-	val = readl(base + desc->base_reg);
 	val >>= desc->base_shift;
 	val &= (1 << desc->base_bits) - 1;
 
@@ -273,16 +269,11 @@ static unsigned int en7523_get_base_rate(void __iomem *base, unsigned int i)
 	return desc->base_values[val];
 }
 
-static u32 en7523_get_div(void __iomem *base, int i)
+static u32 en7523_get_div(const struct en_clk_desc *desc, u32 val)
 {
-	const struct en_clk_desc *desc = &en7523_base_clks[i];
-	u32 reg, val;
-
 	if (!desc->div_bits)
 		return 1;
 
-	reg = desc->div_reg ? desc->div_reg : desc->base_reg;
-	val = readl(base + reg);
 	val >>= desc->div_shift;
 	val &= (1 << desc->div_bits) - 1;
 
@@ -424,9 +415,12 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 
 	for (i = 0; i < ARRAY_SIZE(en7523_base_clks); i++) {
 		const struct en_clk_desc *desc = &en7523_base_clks[i];
+		u32 reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+		u32 val = readl(base + desc->base_reg);
 
-		rate = en7523_get_base_rate(base, i);
-		rate /= en7523_get_div(base, i);
+		rate = en7523_get_base_rate(desc, val);
+		val = readl(base + reg);
+		rate /= en7523_get_div(desc, val);
 
 		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
@@ -462,22 +456,63 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
 	return 0;
 }
 
+static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
+				   struct regmap *map, void __iomem *base)
+{
+	struct clk_hw *hw;
+	u32 rate;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(en7523_base_clks); i++) {
+		const struct en_clk_desc *desc = &en7523_base_clks[i];
+		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
+
+		if (regmap_read(map, desc->base_reg, &val)) {
+			pr_err("Failed reading fixed clk rate %s: %ld\n",
+			       desc->name, PTR_ERR(hw));
+			continue;
+		}
+		rate = en7523_get_base_rate(desc, val);
+
+		if (regmap_read(map, reg, &val)) {
+			pr_err("Failed reading fixed clk div %s: %ld\n",
+			       desc->name, PTR_ERR(hw));
+			continue;
+		}
+		rate /= en7523_get_div(desc, val);
+
+		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
+		if (IS_ERR(hw)) {
+			pr_err("Failed to register clk %s: %ld\n",
+			       desc->name, PTR_ERR(hw));
+			continue;
+		}
+
+		clk_data->hws[desc->id] = hw;
+	}
+
+	hw = en7523_register_pcie_clk(dev, base);
+	clk_data->hws[EN7523_CLK_PCIE] = hw;
+
+	clk_data->num = EN7523_NUM_CLOCKS;
+}
+
 static int en7581_clk_hw_init(struct platform_device *pdev,
 			      struct clk_hw_onecell_data *clk_data)
 {
-	void __iomem *base, *np_base;
+	void __iomem *np_base;
 	struct regmap *map;
 	u32 val;
 
-	base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	map = syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
+	if (IS_ERR(map))
+		return PTR_ERR(map);
 
-	np_base = devm_platform_ioremap_resource(pdev, 1);
+	np_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(np_base))
 		return PTR_ERR(np_base);
 
-	en7523_register_clocks(&pdev->dev, clk_data, base, np_base);
+	en7581_register_clocks(&pdev->dev, clk_data, map, np_base);
 
 	val = readl(np_base + REG_NP_SCU_SSTR);
 	val &= ~(REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
@@ -565,7 +600,7 @@ static int en7523_reset_register(struct platform_device *pdev,
 	if (!soc_data->reset.idx_map_nr)
 		return 0;
 
-	base = devm_platform_ioremap_resource(pdev, 2);
+	base = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 

-- 
2.46.0


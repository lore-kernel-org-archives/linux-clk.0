Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED95219CC2F;
	Tue,  3 Sep 2024 21:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725399630; cv=none; b=SzVJ9/LS9SRSUsE2leWhANn0pDd8/GZ8emTV062vle4KBG4LENwnCJogHJzOf/Ot5JuSE7oPlf0EkThctZSJ1S2frIgc/bJgXccCgnV6bjaxd2kGn2qONMY3MeEmggdAi+BMBlj5uuVQV804lwCLrZoMdJP8cKwjmd1VbLQK12g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725399630; c=relaxed/simple;
	bh=AdkbPzAh+zDtLdmmxzCPVT53dh7L9hVnwre5LDtz2N0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jdWGylyLXZo4Ut+Y+yhwNMngyjKA4Y8rsN9ob79o4gFEesrQYatsW7y0u4QvIuc202nt8e94nvHWf2zz2fivTGJVWo/I24KL4Hp76rR/2G9I+wzynkPexNqLLnQzqJkZk2ptAHxfzOsDMdkfganON+/f285jKQbT3kpNVp/1xRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rkEN7c+Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rkEN7c+Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A49CC4CEC4;
	Tue,  3 Sep 2024 21:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725399629;
	bh=AdkbPzAh+zDtLdmmxzCPVT53dh7L9hVnwre5LDtz2N0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rkEN7c+QLFi3PkKiTLLPiJSJI/+KkD3tRMmDSlF+iGIFbbliG0HzyShYCEdPFHmz0
	 eKnw9KanqOTKrtxu+LL8bEwRPwQFDdaqaTpbcLadTtnakLvhwYYY0PwhCZMNg2r0n6
	 qSIjVF06hWYuskyMD22r16eoHpgwOOjBRtBFVoOO7sI+AdT2C8C+KO0XmRzoWOy7nX
	 mifRmc+d5ZwKOtuCUrIsYL/p3eWht66l2zvhJg6vnUVdNnyt8pOsDLgUVKVXaoRTmS
	 jhXa96/a5YKKvhF7YIo71xJ9d5sAbWu2UkLBMaUArPmgW0hNC2cLd9kw6qQtn2oD01
	 BW2/f8YyEPlrQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 03 Sep 2024 23:39:51 +0200
Subject: [PATCH v2 7/7] clk: en7523: map io region in a single block
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-clk-en7581-syscon-v2-7-86fbe2fc15c3@kernel.org>
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

Map all clock-controller memory region in a single block.
This patch does not introduce any backward incompatibility since the dts
for EN7581 SoC is not upstream yet.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 60dc938144d7..e52c5460e927 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -39,8 +39,8 @@
 #define REG_PCIE_XSI1_SEL_MASK		GENMASK(12, 11)
 #define REG_CRYPTO_CLKSRC2		0x20c
 
-#define REG_RST_CTRL2			0x00
-#define REG_RST_CTRL1			0x04
+#define REG_RST_CTRL2			0x830
+#define REG_RST_CTRL1			0x834
 
 struct en_clk_desc {
 	int id;
@@ -645,15 +645,9 @@ static const struct reset_control_ops en7581_reset_ops = {
 	.status = en7523_reset_status,
 };
 
-static int en7581_reset_register(struct platform_device *pdev)
+static int en7581_reset_register(struct device *dev, void __iomem *base)
 {
-	struct device *dev = &pdev->dev;
 	struct en_rst_data *rst_data;
-	void __iomem *base;
-
-	base = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
 
 	rst_data = devm_kzalloc(dev, sizeof(*rst_data), GFP_KERNEL);
 	if (!rst_data)
@@ -677,27 +671,27 @@ static int en7581_reset_register(struct platform_device *pdev)
 static int en7581_clk_hw_init(struct platform_device *pdev,
 			      struct clk_hw_onecell_data *clk_data)
 {
-	void __iomem *np_base;
 	struct regmap *map;
+	void __iomem *base;
 	u32 val;
 
 	map = syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
 	if (IS_ERR(map))
 		return PTR_ERR(map);
 
-	np_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(np_base))
-		return PTR_ERR(np_base);
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
-	en7581_register_clocks(&pdev->dev, clk_data, map, np_base);
+	en7581_register_clocks(&pdev->dev, clk_data, map, base);
 
-	val = readl(np_base + REG_NP_SCU_SSTR);
+	val = readl(base + REG_NP_SCU_SSTR);
 	val &= ~(REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
-	writel(val, np_base + REG_NP_SCU_SSTR);
-	val = readl(np_base + REG_NP_SCU_PCIC);
-	writel(val | 3, np_base + REG_NP_SCU_PCIC);
+	writel(val, base + REG_NP_SCU_SSTR);
+	val = readl(base + REG_NP_SCU_PCIC);
+	writel(val | 3, base + REG_NP_SCU_PCIC);
 
-	return en7581_reset_register(pdev);
+	return en7581_reset_register(&pdev->dev, base);
 }
 
 static int en7523_clk_probe(struct platform_device *pdev)

-- 
2.46.0


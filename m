Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6404F16A94A;
	Sat, 31 Aug 2024 07:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725088767; cv=none; b=bFhYW9blbIW+lQcd1f7boRJ43tqtDpp8TYGIH9d90ZBjlwiMtjh6FgzIZVs2EAjOIlXVzESvEngv68gOJOQUIaRXZgN5bz1ZfZf+zigmMJprsQyr4m3v0qIyfthP30ZkQxR+GVfu/Iv0Yuo5aC2jiRG9s6c4ZHslsLMvsMOmWak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725088767; c=relaxed/simple;
	bh=PKPRn9PaxXEJstoqEqCr0zTFtympizdBdFTWRSAtK0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OU09nbz2yF/7R/JU8sGa2auMAy87Fq1pYx5Xar5KwPYyDvR6puw1q5wYj8fKCThai7KQ6Wh4BhRbDtAMehwjulKdLxW3/zYZjM94hnNzJpYYwlL+lZRCKuxGm+17Eqd+/ef0382v3lntuG49gL2UtMQJI3DXaypDK+kKfje7Owg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QOW/VliC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QOW/VliC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 986F7C4CEC0;
	Sat, 31 Aug 2024 07:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725088767;
	bh=PKPRn9PaxXEJstoqEqCr0zTFtympizdBdFTWRSAtK0w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QOW/VliCP4unaYsOhpeHByO519dUR2jOOGjw6XWHrehuHJhPK/CX3hOmRdgpirmP2
	 eHzXGfnB0le0nxZcfY9mjcnHayHJp4s/TllpdmYVCeGRVU8arjWYTREECL7N3hMK/G
	 TeSe41c4NIwfg3M3AdOfXoe2EuSPrr3h16hRNrEIbCYt92tMSQ4eX5CswlwHVb9tpI
	 nn8y1moVdWZyzz7k0XBZVsk8K/CEKeqxFi+i35HpMl2bYVRG8qMODHqP4qV0gqnCTa
	 AJcq8zQtTaJ50QXic4p6MsemOJOrJCbIQiwzQXTPBbwdKaplnzXZsf22DD4jNl5v6V
	 MrxtNS/6opWrg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sat, 31 Aug 2024 09:18:49 +0200
Subject: [PATCH 7/7] clk: en7523: map io region in a single block
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240831-clk-en7581-syscon-v1-7-5c2683541068@kernel.org>
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

Map all clock-controller memory region in a single block.
This patch does not introduce any backward incompatibility since the dts
for EN7581 SoC is not public yet.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 946c85a89102..c62120c1d26e 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -45,8 +45,8 @@
 #define REG_PCIE_XSI1_SEL_MASK		GENMASK(12, 11)
 #define REG_CRYPTO_CLKSRC2		0x20c
 
-#define REG_RST_CTRL2			0x00
-#define REG_RST_CTRL1			0x04
+#define REG_RST_CTRL2			0x830
+#define REG_RST_CTRL1			0x834
 
 struct en_clk_desc {
 	int id;
@@ -648,15 +648,9 @@ static const struct reset_control_ops en7581_reset_ops = {
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
@@ -680,25 +674,25 @@ static int en7581_reset_register(struct platform_device *pdev)
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
 
 	map = syscon_regmap_lookup_by_compatible("airoha,en7581-pbus-csr");
 	if (IS_ERR(map))
@@ -711,7 +705,7 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	regmap_write(map, REG_PCIE2_MEM, 0x28000000);
 	regmap_write(map, REG_PCIE2_MEM_MASK, 0xfc000000);
 
-	return en7581_reset_register(pdev);
+	return en7581_reset_register(&pdev->dev, base);
 }
 
 static int en7523_clk_probe(struct platform_device *pdev)

-- 
2.46.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FC54A1D;
	Tue, 12 Nov 2024 00:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731370191; cv=none; b=YVOOL6p/gIgHEN85jo6HnbOaSyr5Z0trlYtFnY2jUXpmLRs5o1wpJ/wZiK/KQxlc0oXozWhuuTZ+mO4+L+u997bCuBv3FKaIzMOVrg+bOQGmmMBuCE+xPa6c5zXpQFREKCGWtl2L9M+QM43Fu+gsDTuXgJ+GwDZC/OxKE8crkBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731370191; c=relaxed/simple;
	bh=jlZDDRZ80YrCEZP6PYAXZ69UYnlvobdXU8ley54UQpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FFAuTcpXTkcVhD2N5aOh4KzYe7VLQqT3cJcQEWWTBzddq6sB6Kzjs6O/ZbnQ5hgVjXIKdQtKjOePbTNf1PsxLNziYP8Mg+yDW1hBzjw44lYFB5Sh3XfGUHqAsRn9w1o2so7/yWnGiTdpPVcxAWob2ekorWTfBgVFYthUbixQaEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qVaPw2fv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qVaPw2fv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E312C4CECF;
	Tue, 12 Nov 2024 00:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731370191;
	bh=jlZDDRZ80YrCEZP6PYAXZ69UYnlvobdXU8ley54UQpI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qVaPw2fvkRToBcVxLLIsxMuauCg2zome8OYWw76HP/s20Dl8eZGruInFOXZD5TNoP
	 K9b15iy41vRBcb02RgKm7Xl4g7g0vMX1p/eF7bmImn9zsfGaHOhO6NzPFrsSYPNts0
	 JukCIB6rzrxeRKuxeyFmZSV23Q5fV/Z9M9O2AOQds67dhNaVwwo33plhY9t6sftz14
	 S0I9x0LPQwXdJf4Qst+hr9HgyjCt+F+xMf5/xA7hV6CHdXNS+xg7NN+EFRA8xwpJJS
	 uCCYY1pnvQiPANxgqCmvOl/jIE98LfhRJlCw245OCrLlHunjLl9c8G7D+exYmQy1zk
	 3ug2L1UVuqHYQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 12 Nov 2024 01:08:54 +0100
Subject: [PATCH RESEND v2 7/7] clk: en7523: map io region in a single block
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-clk-en7581-syscon-v2-7-8ada5e394ae4@kernel.org>
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

Map all clock-controller memory region in a single block.
This patch does not introduce any backward incompatibility since the dts
for EN7581 SoC is not upstream yet.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 60dc938144d75b5fa21c9109ff05ed1083a16678..e52c5460e927f54c6df152c60560f438f89ec928 100644
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
2.47.0


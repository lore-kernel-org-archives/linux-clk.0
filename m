Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8693F1442EF;
	Thu, 13 Jun 2024 12:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718282870; cv=none; b=QrMfiRpaAyF/i5PW0K8Exw9cnwVkJwoFHc2qDe1nTUUaryoyqQEJHeW0Rb62FuxqawQ9moXn0a1VvYuO5w+qwoUoTUbD4Q/NH1HxZ3Ok+9YyZhOzwCZACS4uFWs6lv8UTiMfAPaXqXd8AnKCf3e1y16Y2Juqb+APb57v9XdK9vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718282870; c=relaxed/simple;
	bh=XOhLNu1Gw/6tXu5zO2Hw9R364lU9DFB5MHOLEurSqIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AE1DbGNKdlypaspX/G4y7/YqmQhAJd3VRJSuBpN+unvMr9gtrZhpYZq4ixcz4QX2Y2u9oG1sZGv6/CQ1zaFSbm/cprcpDp9yZsjQiLKcz8ZMPERKKX+95ZKMIeSfII5gOAR65vwicWG1hoIA5I/7TzJHgqluusp0vULcvW+sXNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKuPfWQA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKuPfWQA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FBDBC2BBFC;
	Thu, 13 Jun 2024 12:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718282870;
	bh=XOhLNu1Gw/6tXu5zO2Hw9R364lU9DFB5MHOLEurSqIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dKuPfWQAaMZlQt005MkwZu20B6WIQNhXHhCu1aBYyceW5tYmOdsh7SINeATbJX6Ju
	 NezndLegtJZQ5eMil/uzICvhcUypsVIbET+lQnZmKsyary1A1fGRoG3FSupP2StWsW
	 CFsuVy2DNWlLSGRTdIAaF84JNMOykrDHVxm8Fxgme3vtaXlCBQMrk+BGHB6EMEYNov
	 f8fiUjzbx3BkE9L58+KkDm7NTsX3du7rSklZ9S6V1ZgN8NVwOGdUV/qpoU0pyfn34J
	 7UvvmCKB9Ew6s5h0Y2pltqtJ+IZ+RN0B7sRZE1EmjFAf8RdtkJu1Da220XqDXMW+zh
	 BKJ1+yWPnIJ8Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-clk@vger.kernel.org
Cc: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lorenzo.bianconi83@gmail.com,
	conor@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	nbd@nbd.name,
	john@phrozen.org,
	dd@embedd.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v3 3/4] clk: en7523: Remove pcie prepare/unpreare callbacks for EN7581 SoC
Date: Thu, 13 Jun 2024 14:47:05 +0200
Message-ID: <048cda25962ee98ebab31b374164d78ad09e09bb.1718282056.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1718282056.git.lorenzo@kernel.org>
References: <cover.1718282056.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Get rid of prepare and unpreare callbacks for PCIe clock since they can
be modeled as a reset line cosumed by the PCIe driver
(pcie-mediatek-gen3)

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 41 ++--------------------------------------
 1 file changed, 2 insertions(+), 39 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 00638714fe08..ad8a4d1ad62c 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -361,9 +361,8 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	cg->base = np_base;
 	cg->hw.init = &init;
 
-	if (init.ops->disable)
-		init.ops->disable(&cg->hw);
-	init.ops->unprepare(&cg->hw);
+	if (init.ops->unprepare)
+		init.ops->unprepare(&cg->hw);
 
 	if (clk_hw_register(dev, &cg->hw))
 		return NULL;
@@ -381,23 +380,6 @@ static int en7581_pci_is_enabled(struct clk_hw *hw)
 	return (val & mask) == mask;
 }
 
-static int en7581_pci_prepare(struct clk_hw *hw)
-{
-	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
-	void __iomem *np_base = cg->base;
-	u32 val, mask;
-
-	mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
-	       REG_RESET_CONTROL_PCIEHB;
-	val = readl(np_base + REG_RESET_CONTROL1);
-	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
-	val = readl(np_base + REG_RESET_CONTROL2);
-	writel(val & ~REG_RESET2_CONTROL_PCIE2, np_base + REG_RESET_CONTROL2);
-	usleep_range(5000, 10000);
-
-	return 0;
-}
-
 static int en7581_pci_enable(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
@@ -414,23 +396,6 @@ static int en7581_pci_enable(struct clk_hw *hw)
 	return 0;
 }
 
-static void en7581_pci_unprepare(struct clk_hw *hw)
-{
-	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
-	void __iomem *np_base = cg->base;
-	u32 val, mask;
-
-	mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
-	       REG_RESET_CONTROL_PCIEHB;
-	val = readl(np_base + REG_RESET_CONTROL1);
-	writel(val | mask, np_base + REG_RESET_CONTROL1);
-	mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2;
-	writel(val | mask, np_base + REG_RESET_CONTROL1);
-	val = readl(np_base + REG_RESET_CONTROL2);
-	writel(val | REG_RESET_CONTROL_PCIE2, np_base + REG_RESET_CONTROL2);
-	msleep(100);
-}
-
 static void en7581_pci_disable(struct clk_hw *hw)
 {
 	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
@@ -663,9 +628,7 @@ static const struct en_clk_soc_data en7523_data = {
 static const struct en_clk_soc_data en7581_data = {
 	.pcie_ops = {
 		.is_enabled = en7581_pci_is_enabled,
-		.prepare = en7581_pci_prepare,
 		.enable = en7581_pci_enable,
-		.unprepare = en7581_pci_unprepare,
 		.disable = en7581_pci_disable,
 	},
 	.reset = {
-- 
2.45.1


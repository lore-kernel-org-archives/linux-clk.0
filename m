Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D0D3BB4D;
	Wed, 15 May 2024 12:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715777960; cv=none; b=AF+uMmZm5RF/Rfyt5OwMgZwP0n2beagUeCaKZeB4iCUmnV1TTRHD46MZOsSHvmrZ/PMAYfgi8Z+fiXl+ljblN9ht5nPb2LVTscLzUWlKzDaAHorQlsw2B34JZEItZdx+YhkwNDR09n4BE4APWP4EW2ueF1OeGximDX+usQyw3sQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715777960; c=relaxed/simple;
	bh=t31bk/mDVqDcjRyQf5UPlVkeFHJ51T4adyE2JP2QztA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BK5ZO36W7azeJ2KuaKhKxPlS6bMsabIOG2gujofsMeddTv+KtAWghWRr/ToYLWr7Y8picIzTqZGkqGlv7ymczh9QQdjHGk1Qz9p385xCrvbtHuC8sIkXISO2nk2CoFuF78U4rr9G0qc02rLVTxnMnX8L3pDL8uyC0R+dIzngAa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HbiDBg0U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HbiDBg0U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F246AC32786;
	Wed, 15 May 2024 12:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715777960;
	bh=t31bk/mDVqDcjRyQf5UPlVkeFHJ51T4adyE2JP2QztA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HbiDBg0UDUi6lhs5TVLRbS1FyYTKm/3ELbRp77tin5xmJYsnm9bAUZuAWcK34eylC
	 GXP0hejfLweOE7q8XuwEG/fVZ5iY21zYzMPX1EvXE8kpmSBieA99vXcb8tQxpUWrVI
	 6eteGkXKpttGEnsaIR2VTNZQHMILIM7orilijoEluI4j0rec4ufWsm+UL41qNLkNV4
	 W1fBh3q+s9CKTTtCCjmOFQsLa21qG2ssrHZteW0fWepB34YunxbybXX17zlZgF3E6d
	 jXjcnxWuJE371jr3IIBAJfkXWPtXRJn89S8yw9Ar6sezJUPLfyO1DQFUkIe23rrB0+
	 Jq8L9O/X3eFvA==
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
Subject: [PATCH 5/5] clk: en7523: Remove pcie prepare/unpreare callbacks for EN7581 SoC
Date: Wed, 15 May 2024 14:58:51 +0200
Message-ID: <92afb628058a31357e0c85ed7e41eed0a780bc0f.1715777643.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1715777643.git.lorenzo@kernel.org>
References: <cover.1715777643.git.lorenzo@kernel.org>
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

Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 41 ++--------------------------------------
 1 file changed, 2 insertions(+), 39 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 18798b692b68..5f2127a4b150 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -291,9 +291,8 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	cg->base = np_base;
 	cg->hw.init = &init;
 
-	if (init.ops->disable)
-		init.ops->disable(&cg->hw);
-	init.ops->unprepare(&cg->hw);
+	if (init.ops->unprepare)
+		init.ops->unprepare(&cg->hw);
 
 	if (clk_hw_register(dev, &cg->hw))
 		return NULL;
@@ -311,23 +310,6 @@ static int en7581_pci_is_enabled(struct clk_hw *hw)
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
@@ -344,23 +326,6 @@ static int en7581_pci_enable(struct clk_hw *hw)
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
@@ -563,9 +528,7 @@ static const struct en_clk_soc_data en7523_data = {
 static const struct en_clk_soc_data en7581_data = {
 	.pcie_ops = {
 		.is_enabled = en7581_pci_is_enabled,
-		.prepare = en7581_pci_prepare,
 		.enable = en7581_pci_enable,
-		.unprepare = en7581_pci_unprepare,
 		.disable = en7581_pci_disable,
 	},
 	.reset_data = {
-- 
2.45.0


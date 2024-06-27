Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A5B13E8B9;
	Thu, 27 Jun 2024 11:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719486310; cv=none; b=FyKVp6T3ro+YH8F31OUBED+eL2BRBrX2qyiqRFknq+i6QMRGEQ8w/3ZW1XY+oOBT87VCn2/t32GOZOEZCzfTHBGi1nFgQHCCPs21v5zMW6wF0+4l/BMfai0JdV84PyUVdyqhVLjCPyS58nF5jciOhr1awg216GITfxjF2IRS1hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719486310; c=relaxed/simple;
	bh=ek4+PAY8/cvLVH71a4c19ArzDNAgRpGILNbEZyd11sY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V9dBzBsVMhT1uNikPu4ZadrDnjHWjVCTkP2Qx96IcvLquFaSVYAmmwx4desKinvK41Bs0L58VZyJb628ycVM9xnzMXqB/d2bWyJjjTyJUrb1x0SAlutUIMHCkP2W8M+eNSgF8qtujmpC8X63CyBUrpo4roVt5z8OQUWJjmDMdBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJGm5V25; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJGm5V25"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D79AC2BBFC;
	Thu, 27 Jun 2024 11:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719486309;
	bh=ek4+PAY8/cvLVH71a4c19ArzDNAgRpGILNbEZyd11sY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aJGm5V25tVsLgQelED4y4Z6pYyluil36uImoHRkDs2A3cgHLAuOxxkzwF3Zm6Ys9h
	 sRwULjUNEyrXpmbM3XwxE+ebFzlHnPaL5b+7+3mPe4Vs/qY33vsHq/QiL9/C5D/ahG
	 7pBthLmBj5IOpeW1xJTt8mjbn4KIkeIvHpGlQe/y6XwOVtSCHZvbEMzOx4iDnMjQbF
	 yfKhBNcGUK4FQhSX+SINCdyc5hBuyOy/9/dPxJNAAoZ4+t2oy3qPK2ztNC+qSZ/mYL
	 2Lbqp8JN+AdB2ibQ4EkoLTjrgEAgFR5YgxvgIT+sZ3f6dSXhL+jRSZr3YQ+hziOUtB
	 DMOJz+WZGlY7w==
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
Subject: [PATCH v4 3/4] clk: en7523: Remove pcie prepare/unpreare callbacks for EN7581 SoC
Date: Thu, 27 Jun 2024 13:04:24 +0200
Message-ID: <16df149975514d3030499c48fc1c64f090093595.1719485847.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719485847.git.lorenzo@kernel.org>
References: <cover.1719485847.git.lorenzo@kernel.org>
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
index 5cd501b86557..b134821b23c1 100644
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
@@ -651,9 +616,7 @@ static const struct en_clk_soc_data en7523_data = {
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
2.45.2


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC88344C7B;
	Fri, 17 May 2024 12:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715948938; cv=none; b=cqvoKuHVaTYbKB2N6+6OD737zzHnSXoZErdoELltZl7YbJ1tCcFGHyS1RsE83h/4kQ6h1FJSaZ9tnhdxvdeHSNCGMPJjlCHFQBzJd9MsDDnGgTxeOb3D3KXkB4UhmNGjgZsA5uoGLP0o4+vos0DJ2Z0vvZZzf1e9IMo+Ydj1MhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715948938; c=relaxed/simple;
	bh=FdSTuE2YpVqOmqiYSUoSfo303JKv11MGhoc7elYCiD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EGpjrjRL5KmMe8aYMO7uLjAmpi8A6Db5YcHpmpuceV171FrllgEdGBK0AaN7t+pZJmYst2QEHCtknFjY9tkqQnr8omHlKoz5Xj7UZ30IEfIcJ42NVCwHWMd9MHKB1py1G6quLLM/09IzvuBcPpx6KDgYCdCFIrjU1QTfVo5ombc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jWJFdgb9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jWJFdgb9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8317C2BD11;
	Fri, 17 May 2024 12:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715948938;
	bh=FdSTuE2YpVqOmqiYSUoSfo303JKv11MGhoc7elYCiD4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jWJFdgb9qMoFLPRCmtvcDV2H0lWmHtZPwXVc9YoXwM2lUuIvPnVo+0GaXNWuPIezb
	 Mt3hXd+nhCZ9aPXvAJjiZtO6jJD8cSEoQmJfhemY9oVQy0sxs7rPDiVoowhWFraBGT
	 FAK9pvC05SBLYdOo+Y89+Fd+SJlZa8E4ke1zL8gRknyNzxdGqeCwKHqFXa5dms/omn
	 3DjKRydrnaJ/vacavJmkeNoU+DFQqAejAkTvnoahW3VpPg4JGkvCIdKQcpIizpSK74
	 Pf9QoLS+erHCp+4Wob1y/tShOzYOElpSp/obE8508YQU+LbWzJef5zqbrLVkXT4OWB
	 04Lr0K6A8cyJg==
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
Subject: [PATCH v2 4/4] clk: en7523: Remove pcie prepare/unpreare callbacks for EN7581 SoC
Date: Fri, 17 May 2024 14:28:14 +0200
Message-ID: <da8bef53a91b109789e223a3730483a9437502ed.1715948628.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1715948628.git.lorenzo@kernel.org>
References: <cover.1715948628.git.lorenzo@kernel.org>
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
index 20edfb2c43c7..781aaae68d68 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -359,9 +359,8 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	cg->base = np_base;
 	cg->hw.init = &init;
 
-	if (init.ops->disable)
-		init.ops->disable(&cg->hw);
-	init.ops->unprepare(&cg->hw);
+	if (init.ops->unprepare)
+		init.ops->unprepare(&cg->hw);
 
 	if (clk_hw_register(dev, &cg->hw))
 		return NULL;
@@ -379,23 +378,6 @@ static int en7581_pci_is_enabled(struct clk_hw *hw)
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
@@ -412,23 +394,6 @@ static int en7581_pci_enable(struct clk_hw *hw)
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
@@ -655,9 +620,7 @@ static const struct en_clk_soc_data en7523_data = {
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
2.45.0


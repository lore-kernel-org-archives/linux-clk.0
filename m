Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6B114F12B;
	Wed,  3 Apr 2024 16:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712161285; cv=none; b=GuxtB416OIHn1EN9aaygSEEyFtI8XtXWUT9MFcPZRk0Mxfgklbo2EmFmozP/iSZIOUStwxe0FjjnV8d951O8XBSwZAj6Oet0gdK3PFpGETBAOmwQ1QPEyPNbDjbCJ0vhlVBld14DE8wxrtGS8tUI9TFtIrEOTcuZ7XPxW/hMPNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712161285; c=relaxed/simple;
	bh=AaHst2Jf0vHwQ7OHGptaWr3uKz5EntjSR1A8lyMilrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HS1EJ324C/GTvCQExpxCJpCTcWTnB+6Ree087UHkNk0r0vX71X6JSAn5Yvuf82Oi30gSbBQbecNY2ppShiSUFFeSOdZZieH8dBMclaPyeWb7QXAWF9O+bJ7CGnUQ/ailnt4AaF58EAIevN6YKHIP0u8ZmoH6Qzlu0RyktLDEjQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HFRvBOQL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HFRvBOQL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB34C433F1;
	Wed,  3 Apr 2024 16:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712161284;
	bh=AaHst2Jf0vHwQ7OHGptaWr3uKz5EntjSR1A8lyMilrc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HFRvBOQLzJE5JBNz/dcEnxnE21YmiebFYWVzeDpjKFDGPo+NMwkmt5spmCOTSFW75
	 9n9e6y08Qs9coeMI/WXLTjZjshgtiDI6kC/15xygfcRMRDgYOSj8G21h4Cxia/XABD
	 lIU97lMtEmH0OEEVBNz9MpTxl5BpbV/TlyzwdE2hutMD2TWOspoAw56+ELUiKKbwSb
	 Bgue2wKmNJO7QscMmnmR+RWd0q748+6CQAl+50yjR5vxaxpJoouB67AnnCJI1jlu3J
	 ZpNa8mvVYX6B/iLWxkcClettO93azyxHrxaO9DQy44S9Ibychtw7QluThHG0oK/H3L
	 9lcRBfzExui3g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	nbd@nbd.name,
	john@phrozen.org,
	devicetree@vger.kernel.org,
	dd@embedd.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	upstream@airoha.com,
	lorenzo.bianconi83@gmail.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH 3/4] clk: en7523: make pcie clk_ops accessible through of_device_id struct
Date: Wed,  3 Apr 2024 18:20:44 +0200
Message-ID: <3eba4d9bd16c7598c42400c0ce1bf6c2f80cdbad.1712160869.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1712160869.git.lorenzo@kernel.org>
References: <cover.1712160869.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make pcie clk_ops structure accessible through of_device_id data
pointer in order to define multiple clk_ops for each supported SoC.
This is a preliminary patch to introduce EN7581 clock support.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 7cde328495e2..c7def87b74c6 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -145,11 +145,6 @@ static const struct en_clk_desc en7523_base_clks[] = {
 	}
 };
 
-static const struct of_device_id of_match_clk_en7523[] = {
-	{ .compatible = "airoha,en7523-scu", },
-	{ /* sentinel */ }
-};
-
 static unsigned int en7523_get_base_rate(void __iomem *base, unsigned int i)
 {
 	const struct en_clk_desc *desc = &en7523_base_clks[i];
@@ -247,14 +242,9 @@ static void en7523_pci_unprepare(struct clk_hw *hw)
 static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 					       void __iomem *np_base)
 {
-	static const struct clk_ops pcie_gate_ops = {
-		.is_enabled = en7523_pci_is_enabled,
-		.prepare = en7523_pci_prepare,
-		.unprepare = en7523_pci_unprepare,
-	};
 	struct clk_init_data init = {
 		.name = "pcie",
-		.ops = &pcie_gate_ops,
+		.ops = of_device_get_match_data(dev),
 	};
 	struct en_clk_gate *cg;
 
@@ -264,7 +254,7 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 
 	cg->base = np_base;
 	cg->hw.init = &init;
-	en7523_pci_unprepare(&cg->hw);
+	init.ops->unprepare(&cg->hw);
 
 	if (clk_hw_register(dev, &cg->hw))
 		return NULL;
@@ -333,6 +323,17 @@ static int en7523_clk_probe(struct platform_device *pdev)
 	return r;
 }
 
+static const struct clk_ops en7523_pcie_ops = {
+	.is_enabled = en7523_pci_is_enabled,
+	.prepare = en7523_pci_prepare,
+	.unprepare = en7523_pci_unprepare,
+};
+
+static const struct of_device_id of_match_clk_en7523[] = {
+	{ .compatible = "airoha,en7523-scu", .data = &en7523_pcie_ops },
+	{ /* sentinel */ }
+};
+
 static struct platform_driver clk_en7523_drv = {
 	.probe = en7523_clk_probe,
 	.driver = {
-- 
2.44.0


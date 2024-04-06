Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DA51BC5C;
	Sat,  6 Apr 2024 10:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712400249; cv=none; b=fxdzaV2ZC2x9/riLBRYLQI74vHtEyFHaa5zVWEy9FvVKKcgBqFW5w37p5u/rXdghRACQUgHwnyiJAK74FMtF+TU+wbreMuUQZsGRciWksxdxwOoAZRlRU+gwlC8cdYYhJFfZLBkj5IogojcZLl4lOE70F1XD3JCIad2+4Lsmyr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712400249; c=relaxed/simple;
	bh=GE2IZ9RvgQIMl9MNh/4V8Kp3ZMK8KCv7LOHfHSTlgD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gCQRIOcZx+k//T52l9LIcH32FRQQElvklsOQfIjOVHS+AuYknkvzVrc7VOEn4mJCF+CxCKmBHtIvfN+2QdvC8vT65ZZolyqtMEFdxmEla0MI3JuA0IK2xqWBmlmHqXF3mvmSBtZb/z0d4KVejOU69BnxGnJG0oG/Zo7TBZ1vPz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKIQhppC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKIQhppC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAC8CC433F1;
	Sat,  6 Apr 2024 10:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712400249;
	bh=GE2IZ9RvgQIMl9MNh/4V8Kp3ZMK8KCv7LOHfHSTlgD0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mKIQhppC1WCoCtsmYgRiz1L2JsHJ4UtkBobF9JXFnXez+sRjbv1JNSggnARoLARL0
	 pb5Qogkq0DMjbyAObq4XlM8pCPaaXnFzhVOaiQPRqPm4Je3VPieR8JPEDRo+ezT0JO
	 cEwaktnL1YqYE4CFHCObjIymdxC8acsaTtO4ZiN3z63PgYSbmo/nGNo4bELaVzBh4c
	 8VlJ2Fu+JtO8GY6pEBivF4lYRgnNaKImpIzN4/5BDPGJwiWNWJUpIQf9Dt87EUhRMn
	 jgrWRHtlbQ+p0Zap5xl1JZNZeeI/FScgTn8wsRkrh/1iDbZ++u5RFerdeLl+64AvqI
	 15WOlMpa9/2jg==
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
Subject: [PATCH v2 3/4] clk: en7523: Add en_clk_soc_data data structure
Date: Sat,  6 Apr 2024 12:43:43 +0200
Message-ID: <562a0da8d7874a02a324687c152c87a1549924bd.1712399981.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1712399980.git.lorenzo@kernel.org>
References: <cover.1712399980.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce en_clk_soc_data data structure in order to define multiple
clk_ops for each supported SoC. This is a preliminary patch to
introduce EN7581 clock support.

Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 7cde328495e2..7eee921ab575 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -47,6 +47,10 @@ struct en_clk_gate {
 	struct clk_hw hw;
 };
 
+struct en_clk_soc_data {
+	const struct clk_ops pcie_ops;
+};
+
 static const u32 gsw_base[] = { 400000000, 500000000 };
 static const u32 emi_base[] = { 333000000, 400000000 };
 static const u32 bus_base[] = { 500000000, 540000000 };
@@ -145,11 +149,6 @@ static const struct en_clk_desc en7523_base_clks[] = {
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
@@ -247,14 +246,10 @@ static void en7523_pci_unprepare(struct clk_hw *hw)
 static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 					       void __iomem *np_base)
 {
-	static const struct clk_ops pcie_gate_ops = {
-		.is_enabled = en7523_pci_is_enabled,
-		.prepare = en7523_pci_prepare,
-		.unprepare = en7523_pci_unprepare,
-	};
+	const struct en_clk_soc_data *soc_data = of_device_get_match_data(dev);
 	struct clk_init_data init = {
 		.name = "pcie",
-		.ops = &pcie_gate_ops,
+		.ops = &soc_data->pcie_ops,
 	};
 	struct en_clk_gate *cg;
 
@@ -264,7 +259,7 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 
 	cg->base = np_base;
 	cg->hw.init = &init;
-	en7523_pci_unprepare(&cg->hw);
+	init.ops->unprepare(&cg->hw);
 
 	if (clk_hw_register(dev, &cg->hw))
 		return NULL;
@@ -333,6 +328,19 @@ static int en7523_clk_probe(struct platform_device *pdev)
 	return r;
 }
 
+static const struct en_clk_soc_data en7523_data = {
+	.pcie_ops = {
+		.is_enabled = en7523_pci_is_enabled,
+		.prepare = en7523_pci_prepare,
+		.unprepare = en7523_pci_unprepare,
+	},
+};
+
+static const struct of_device_id of_match_clk_en7523[] = {
+	{ .compatible = "airoha,en7523-scu", .data = &en7523_data },
+	{ /* sentinel */ }
+};
+
 static struct platform_driver clk_en7523_drv = {
 	.probe = en7523_clk_probe,
 	.driver = {
-- 
2.44.0


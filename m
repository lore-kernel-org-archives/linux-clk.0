Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB64433F9;
	Tue, 12 Nov 2024 00:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731370184; cv=none; b=FC6r9BF8vF6pUSZ3r7a9Dw5XAOAsuR3DbuVbf5zaUGD3iE9q/DbSqOhDGI70KZJBoxLUOHrF4rZ62AJzW7AcV/5HEI4ogZ3ffv6a5Pf/rY4Qf/lBzLN60rHrpZvE4Kmn7FD1XA8Tb0t5+loINR0wxSvMB+axCn+VFVNrrH0P0n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731370184; c=relaxed/simple;
	bh=+wNaAMYromdcohDAezTNDP7dAaqSxh5Qc6S+kfA9zok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FE/RWJYmpE7BUkkiibrkZUzeW1pcKxZolC1H+Cwo/hxertKQ5VJ5XUGfyLPy97b/SmqsKX8uQ3mxadhugWW2vXzXvr1m1ANNbGqiqO0vR9Iui+4TvodmKWjQZmzaWNUO1jzdXXrGvd2Jobs9OOHaCXphVgt3WCTMO4NIGdltu7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aD4mRna3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aD4mRna3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17BC4C4CECF;
	Tue, 12 Nov 2024 00:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731370183;
	bh=+wNaAMYromdcohDAezTNDP7dAaqSxh5Qc6S+kfA9zok=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aD4mRna3ugPKQWM4cOYBiWxmDjX8BBgEW3HwVF0euRUOzCg+b1GAAbaHZE3Y0o+k9
	 JnNOHrLfmGtIEMYwwqTtlZnEJLgaT4yftDzmVSZx24luoTKag42NJvoqcJd78byrAa
	 8jHx/cqfb15RX8atqTbCVGK3poX1q6W4aG55VvSOYBt4tV9L3BAEe+LRcnezeRbXAy
	 zYzD/rBRFFX+NhJINS4s5kcA24/R3RF0lWGweVNt0XPN6ZSmLKhB+wmUJOesYox+kH
	 JFB/AfciI47J5VSOewVU657plCOvGYMWscYd2TwmyE1J7u/M0Zqbngv5SfixE94Bns
	 1UJ79QHI3ZuwQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 12 Nov 2024 01:08:51 +0100
Subject: [PATCH RESEND v2 4/7] clk: en7523: introduce chip_scu regmap
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241112-clk-en7581-syscon-v2-4-8ada5e394ae4@kernel.org>
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

Introduce chip_scu regmap pointer since EN7581 SoC will access chip-scu
memory area via a syscon node. Remove first memory region mapping
for EN7581 SoC. This patch does not introduce any backward incompatibility
since the dts for EN7581 SoC is not upstream yet.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 81 ++++++++++++++++++++++++++++++++++++------------
 1 file changed, 61 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index da112c9fe8ef94e830449a64f54e77885b7dda83..7f83cbce01eeb852597d3f0bea11255aa78572c1 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -3,8 +3,10 @@
 #include <linux/delay.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/regmap.h>
 #include <linux/reset-controller.h>
 #include <dt-bindings/clock/en7523-clk.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
@@ -247,15 +249,11 @@ static const u16 en7581_rst_map[] = {
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
 
@@ -265,16 +263,11 @@ static unsigned int en7523_get_base_rate(void __iomem *base, unsigned int i)
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
 
@@ -416,9 +409,12 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 
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
@@ -454,21 +450,66 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
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
+		int err;
+
+		err = regmap_read(map, desc->base_reg, &val);
+		if (err) {
+			pr_err("Failed reading fixed clk rate %s: %d\n",
+			       desc->name, err);
+			continue;
+		}
+		rate = en7523_get_base_rate(desc, val);
+
+		err = regmap_read(map, reg, &val);
+		if (err) {
+			pr_err("Failed reading fixed clk div %s: %d\n",
+			       desc->name, err);
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
+	struct regmap *map;
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
@@ -545,7 +586,7 @@ static int en7523_reset_register(struct platform_device *pdev,
 	if (!soc_data->reset.idx_map_nr)
 		return 0;
 
-	base = devm_platform_ioremap_resource(pdev, 2);
+	base = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 

-- 
2.47.0


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5462E1BC5C;
	Sat,  6 Apr 2024 10:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712400253; cv=none; b=X9j20Ok3jG0HCb18WZ52pYF8en3kQSl3Ld1mU4juh2+KerlmpXbP6RHSv4dfVRLbJc0gAD3xSfQlKNN/k4Bxoy9TBabWbP/RhPBWzV2WuiepPH1OTW26Y7tH06kUFVsa5YXXS7GA2nK9R0fNE3xV9NWhZAKpW9WH3VwCVNo3ge0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712400253; c=relaxed/simple;
	bh=IYd7JOa745hTjfMeihJfVCVBddb9XQSx17VJwDwVj5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZsA6KpOW0D7TwW+YsaotgavnvVfq6TgYhhOOqGrE1axymOKfqZJbVFyeNrFcbcI3FAb2EHWWZuqw2BRUslDBT4Q31Dq88qNh04EacRgKWJKDjHNAaXYJ+Y8h0BHeueGSJF/flzqHkMbwXENyIxB/ZsuwBeMzm/leZskpBjEqeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BzHwa6XF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BzHwa6XF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9AC6C43390;
	Sat,  6 Apr 2024 10:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712400253;
	bh=IYd7JOa745hTjfMeihJfVCVBddb9XQSx17VJwDwVj5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BzHwa6XFEltnTgWjU+vm24yOFtxE18mCJH2Nzhr+vuSygnWFQCE0U9d+GtYJYDEj6
	 GvpiNx0TBUR4ry/nXTg3R3JAIiIiYbD7dOxVj4k/U9vBNHXx7hefRfAb2WhEGE0Rlb
	 q52dfuXbODdkh0kr1DzXrcnFlODlk/U1MRvvVz7ndVSa9nwhY9KnIKPj9MNLnuMyJF
	 mJdZ6+tT1Te+Pm7bHy02F7wVMLTan5u9+vUgkWOV6VNsiyJazf17ijZozpFfdgV8z9
	 aCQS/SzN+3fLqpxmuw2LY3lGxqKJOEYwwC7qS+Mw6Qtoz+O18oActZmj/SKtwvon8m
	 KZbAD2gp7N+iw==
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
Subject: [PATCH v2 4/4] clk: en7523: Add EN7581 support
Date: Sat,  6 Apr 2024 12:43:44 +0200
Message-ID: <57b6e53ed4d2b2e38abff6a3ea56841bad6be8a9.1712399981.git.lorenzo@kernel.org>
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

Introduce EN7581 clock support to clk-en7523 driver.
Add hw_init callback to en_clk_soc_data data structure.

Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 158 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 153 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 7eee921ab575..381605be333f 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -4,13 +4,16 @@
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <dt-bindings/clock/en7523-clk.h>
 
 #define REG_PCI_CONTROL			0x88
 #define   REG_PCI_CONTROL_PERSTOUT	BIT(29)
 #define   REG_PCI_CONTROL_PERSTOUT1	BIT(26)
+#define   REG_PCI_CONTROL_REFCLK_EN0	BIT(23)
 #define   REG_PCI_CONTROL_REFCLK_EN1	BIT(22)
+#define   REG_PCI_CONTROL_PERSTOUT2	BIT(16)
 #define REG_GSW_CLK_DIV_SEL		0x1b4
 #define REG_EMI_CLK_DIV_SEL		0x1b8
 #define REG_BUS_CLK_DIV_SEL		0x1bc
@@ -18,10 +21,25 @@
 #define REG_SPI_CLK_FREQ_SEL		0x1c8
 #define REG_NPU_CLK_DIV_SEL		0x1fc
 #define REG_CRYPTO_CLKSRC		0x200
-#define REG_RESET_CONTROL		0x834
+#define REG_RESET_CONTROL2		0x830
+#define   REG_RESET2_CONTROL_PCIE2	BIT(27)
+#define REG_RESET_CONTROL1		0x834
 #define   REG_RESET_CONTROL_PCIEHB	BIT(29)
 #define   REG_RESET_CONTROL_PCIE1	BIT(27)
 #define   REG_RESET_CONTROL_PCIE2	BIT(26)
+/* EN7581 */
+#define REG_PCIE0_MEM			0x00
+#define REG_PCIE0_MEM_MASK		0x04
+#define REG_PCIE1_MEM			0x08
+#define REG_PCIE1_MEM_MASK		0x0c
+#define REG_PCIE2_MEM			0x10
+#define REG_PCIE2_MEM_MASK		0x14
+#define REG_PCIE_RESET_OPEN_DRAIN	0x018c
+#define REG_PCIE_RESET_OPEN_DRAIN_MASK	GENMASK(2, 0)
+#define REG_NP_SCU_PCIC			0x88
+#define REG_NP_SCU_SSTR			0x9c
+#define REG_PCIE_XSI0_SEL_MASK		GENMASK(14, 13)
+#define REG_PCIE_XSI1_SEL_MASK		GENMASK(12, 11)
 
 struct en_clk_desc {
 	int id;
@@ -49,6 +67,8 @@ struct en_clk_gate {
 
 struct en_clk_soc_data {
 	const struct clk_ops pcie_ops;
+	int (*hw_init)(struct platform_device *pdev, void __iomem *base,
+		       void __iomem *np_base);
 };
 
 static const u32 gsw_base[] = { 400000000, 500000000 };
@@ -211,14 +231,14 @@ static int en7523_pci_prepare(struct clk_hw *hw)
 	usleep_range(1000, 2000);
 
 	/* Reset to default */
-	val = readl(np_base + REG_RESET_CONTROL);
+	val = readl(np_base + REG_RESET_CONTROL1);
 	mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
 	       REG_RESET_CONTROL_PCIEHB;
-	writel(val & ~mask, np_base + REG_RESET_CONTROL);
+	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
 	usleep_range(1000, 2000);
-	writel(val | mask, np_base + REG_RESET_CONTROL);
+	writel(val | mask, np_base + REG_RESET_CONTROL1);
 	msleep(100);
-	writel(val & ~mask, np_base + REG_RESET_CONTROL);
+	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
 	usleep_range(5000, 10000);
 
 	/* Release device */
@@ -259,6 +279,9 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 
 	cg->base = np_base;
 	cg->hw.init = &init;
+
+	if (init.ops->disable)
+		init.ops->disable(&cg->hw);
 	init.ops->unprepare(&cg->hw);
 
 	if (clk_hw_register(dev, &cg->hw))
@@ -267,6 +290,111 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
 	return &cg->hw;
 }
 
+static int en7581_pci_is_enabled(struct clk_hw *hw)
+{
+	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	u32 val, mask;
+
+	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
+	val = readl(cg->base + REG_PCI_CONTROL);
+	return (val & mask) == mask;
+}
+
+static int en7581_pci_prepare(struct clk_hw *hw)
+{
+	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	void __iomem *np_base = cg->base;
+	u32 val, mask;
+
+	mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
+	       REG_RESET_CONTROL_PCIEHB;
+	val = readl(np_base + REG_RESET_CONTROL1);
+	writel(val & ~mask, np_base + REG_RESET_CONTROL1);
+	val = readl(np_base + REG_RESET_CONTROL2);
+	writel(val & ~REG_RESET2_CONTROL_PCIE2, np_base + REG_RESET_CONTROL2);
+	usleep_range(5000, 10000);
+
+	return 0;
+}
+
+static int en7581_pci_enable(struct clk_hw *hw)
+{
+	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	void __iomem *np_base = cg->base;
+	u32 val, mask;
+
+	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |
+	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
+	       REG_PCI_CONTROL_PERSTOUT;
+	val = readl(np_base + REG_PCI_CONTROL);
+	writel(val | mask, np_base + REG_PCI_CONTROL);
+	msleep(250);
+
+	return 0;
+}
+
+static void en7581_pci_unprepare(struct clk_hw *hw)
+{
+	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	void __iomem *np_base = cg->base;
+	u32 val, mask;
+
+	mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
+	       REG_RESET_CONTROL_PCIEHB;
+	val = readl(np_base + REG_RESET_CONTROL1);
+	writel(val | mask, np_base + REG_RESET_CONTROL1);
+	mask = REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2;
+	writel(val | mask, np_base + REG_RESET_CONTROL1);
+	val = readl(np_base + REG_RESET_CONTROL2);
+	writel(val | REG_RESET_CONTROL_PCIE2, np_base + REG_RESET_CONTROL2);
+	msleep(100);
+}
+
+static void en7581_pci_disable(struct clk_hw *hw)
+{
+	struct en_clk_gate *cg = container_of(hw, struct en_clk_gate, hw);
+	void __iomem *np_base = cg->base;
+	u32 val, mask;
+
+	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |
+	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
+	       REG_PCI_CONTROL_PERSTOUT;
+	val = readl(np_base + REG_PCI_CONTROL);
+	writel(val & ~mask, np_base + REG_PCI_CONTROL);
+	usleep_range(1000, 2000);
+}
+
+static int en7581_clk_hw_init(struct platform_device *pdev,
+			      void __iomem *base,
+			      void __iomem *np_base)
+{
+	void __iomem *pb_base;
+	u32 val;
+
+	pb_base = devm_platform_ioremap_resource(pdev, 2);
+	if (IS_ERR(pb_base))
+		return PTR_ERR(pb_base);
+
+	val = readl(np_base + REG_NP_SCU_SSTR);
+	val &= ~(REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
+	writel(val, np_base + REG_NP_SCU_SSTR);
+	val = readl(np_base + REG_NP_SCU_PCIC);
+	writel(val | 3, np_base + REG_NP_SCU_PCIC);
+
+	writel(0x20000000, pb_base + REG_PCIE0_MEM);
+	writel(0xfc000000, pb_base + REG_PCIE0_MEM_MASK);
+	writel(0x24000000, pb_base + REG_PCIE1_MEM);
+	writel(0xfc000000, pb_base + REG_PCIE1_MEM_MASK);
+	writel(0x28000000, pb_base + REG_PCIE2_MEM);
+	writel(0xfc000000, pb_base + REG_PCIE2_MEM_MASK);
+
+	val = readl(base + REG_PCIE_RESET_OPEN_DRAIN);
+	writel(val | REG_PCIE_RESET_OPEN_DRAIN_MASK,
+	       base + REG_PCIE_RESET_OPEN_DRAIN);
+
+	return 0;
+}
+
 static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
 				   void __iomem *base, void __iomem *np_base)
 {
@@ -299,6 +427,7 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 static int en7523_clk_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
+	const struct en_clk_soc_data *soc_data;
 	struct clk_hw_onecell_data *clk_data;
 	void __iomem *base, *np_base;
 	int r;
@@ -311,6 +440,13 @@ static int en7523_clk_probe(struct platform_device *pdev)
 	if (IS_ERR(np_base))
 		return PTR_ERR(np_base);
 
+	soc_data = of_device_get_match_data(&pdev->dev);
+	if (soc_data->hw_init) {
+		r = soc_data->hw_init(pdev, base, np_base);
+		if (r)
+			return r;
+	}
+
 	clk_data = devm_kzalloc(&pdev->dev,
 				struct_size(clk_data, hws, EN7523_NUM_CLOCKS),
 				GFP_KERNEL);
@@ -336,8 +472,20 @@ static const struct en_clk_soc_data en7523_data = {
 	},
 };
 
+static const struct en_clk_soc_data en7581_data = {
+	.pcie_ops = {
+		.is_enabled = en7581_pci_is_enabled,
+		.prepare = en7581_pci_prepare,
+		.enable = en7581_pci_enable,
+		.unprepare = en7581_pci_unprepare,
+		.disable = en7581_pci_disable,
+	},
+	.hw_init = en7581_clk_hw_init,
+};
+
 static const struct of_device_id of_match_clk_en7523[] = {
 	{ .compatible = "airoha,en7523-scu", .data = &en7523_data },
+	{ .compatible = "airoha,en7581-scu", .data = &en7581_data },
 	{ /* sentinel */ }
 };
 
-- 
2.44.0


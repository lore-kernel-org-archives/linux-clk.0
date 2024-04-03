Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077FD14F9C3;
	Wed,  3 Apr 2024 16:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712161288; cv=none; b=UsnK3pBaNYQhyYYk9/MjBbNjSbdfNTB26i1sSA4OOv80Uc0w5i7lOWqpoteiSM9Fpr9x4ScXhpc2K42NzP+yjk/S7Q1V0rnYmO2Wzbh2cmDsLLMHDqsFvzisRg/Lpbet6uk8vP3NRQ4bvTTr7PzrPcpJ4TBWUzneKR3RagUN6fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712161288; c=relaxed/simple;
	bh=mS7lPB+f/6hy5j1P7T6iVW2jsky8/RPVdA6c6ORlOBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Of14mckCN7OgM5xt4mSYQ8kktfvPGJRgNJj4I+BMLSyhkL7lUJiP6Q6EmOT1traAjQi6mtEmJFlsZUp9Vx0AD7c6nEHxa4Q7hOREF1tjwd25Afdu4seck/vscyVGx/gtsG+MsO3zxCne3xf93U+SG2Dm4yTtea1WCWWHNP3dO7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kNrJgm3w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kNrJgm3w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51851C433C7;
	Wed,  3 Apr 2024 16:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712161287;
	bh=mS7lPB+f/6hy5j1P7T6iVW2jsky8/RPVdA6c6ORlOBc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kNrJgm3w3JzTQzmP3u4dIqyF25sLIcKkCurxl2xcItrLj1YoSdnLBGswkLJDpuZtx
	 1PKE1G3i3TZTqnpjOppiuVwaaRl9gR32fvYzTXI2heTe4YZnY/Y9UKH+Bqp/XxQxcr
	 IcFhy3noWbSydIK/vNjsiXb3+P0+aXLi+1sOBIpWiV9m/H4cPf6/vmQQQ9wkYQnUEw
	 7rLWF5Uw4Bn9N39/4Hjfk0t7VrQYWRODnl3Cw8oUwLqfs3G1S4zVVuOjblh/BKs5aZ
	 OcVgWHiuhIbCxJj4kpNfZos+QEGfNeBwjOxcevdeIHyR2sfrGPl860LFNC4+upCtgi
	 xkfZZQEz9nUzQ==
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
Subject: [PATCH 4/4] clk: en7523: add EN7581 support
Date: Wed,  3 Apr 2024 18:20:45 +0200
Message-ID: <3aaf638b846ecfdbfc1c903206b7d519d56c9130.1712160869.git.lorenzo@kernel.org>
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

Introduce EN7581 clock support to clk-en7523 driver.

Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 130 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 125 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index c7def87b74c6..51a6c0cc7f58 100644
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
@@ -207,14 +225,14 @@ static int en7523_pci_prepare(struct clk_hw *hw)
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
@@ -262,6 +280,64 @@ static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
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
+	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |
+	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
+	       REG_PCI_CONTROL_PERSTOUT;
+	val = readl(np_base + REG_PCI_CONTROL);
+	writel(val & ~mask, np_base + REG_PCI_CONTROL);
+	usleep_range(1000, 2000);
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
 static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
 				   void __iomem *base, void __iomem *np_base)
 {
@@ -291,6 +367,37 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 	clk_data->num = EN7523_NUM_CLOCKS;
 }
 
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
 static int en7523_clk_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
@@ -306,6 +413,12 @@ static int en7523_clk_probe(struct platform_device *pdev)
 	if (IS_ERR(np_base))
 		return PTR_ERR(np_base);
 
+	if (of_device_is_compatible(node, "airoha,en7581-scu")) {
+		r = en7581_clk_hw_init(pdev, base, np_base);
+		if (r)
+			return r;
+	}
+
 	clk_data = devm_kzalloc(&pdev->dev,
 				struct_size(clk_data, hws, EN7523_NUM_CLOCKS),
 				GFP_KERNEL);
@@ -329,8 +442,15 @@ static const struct clk_ops en7523_pcie_ops = {
 	.unprepare = en7523_pci_unprepare,
 };
 
+static const struct clk_ops en7581_pcie_ops = {
+	.is_enabled = en7581_pci_is_enabled,
+	.prepare = en7581_pci_prepare,
+	.unprepare = en7581_pci_unprepare,
+};
+
 static const struct of_device_id of_match_clk_en7523[] = {
 	{ .compatible = "airoha,en7523-scu", .data = &en7523_pcie_ops },
+	{ .compatible = "airoha,en7581-scu", .data = &en7581_pcie_ops },
 	{ /* sentinel */ }
 };
 
-- 
2.44.0


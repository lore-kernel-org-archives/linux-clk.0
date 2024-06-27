Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443ED13E8B9;
	Thu, 27 Jun 2024 11:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719486306; cv=none; b=kW0fSyaBCqQu69MUWqcgSmD4Oh50jEUKOMPH+f3pM4iRP2hRsYlIjiV/5yNcPL86dKlfFpg4LrJ+FKJ4u5RnDClaWcLxGHIheFkH326vzL97ekPl1j8A+OkByEpj8qdvJLv7zBRiLxhSFBrUA3IlWxqNEp1eOdOWyN+L5fHZ6no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719486306; c=relaxed/simple;
	bh=rJLnqNECMxwgylubhCINuV4UU6Ut3xQwA21m5Yr0idU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tozkW/4GOJi8AagU5rYN3xptvSRkhjoTlAAYF2ThBKkogNLhfbFbkC9Z/qg1/h2VRSAJm1TCN6GKr/FWw19b7ZStlgY7FG+B7zNws8hnpFXvkdNnJkBR1yTECm27qXbNDPeRUEd8km82Zv2xEbGHSBJWEL2nhE5XYy4InxK0IJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XhJJ2LYS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XhJJ2LYS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3935C2BBFC;
	Thu, 27 Jun 2024 11:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719486306;
	bh=rJLnqNECMxwgylubhCINuV4UU6Ut3xQwA21m5Yr0idU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XhJJ2LYSjal5rlgCzHpO/YmxXBFA1DGMqNS62tY2svbhHXqWAVJ1+fQ9k0up+itQM
	 BJYcFB9Cdnf/4f/pGzc9Y7YQOQaS0Z9Uxoa0SOh9w4ySBGnznEmWBR1Wt6KU9uW5vR
	 ZZWpFEk+OYoB0+jVKYWSuWDDWKWcR+7BgdFL+cgvMzmYYk8owkqM5IGoP3/fnKEZKd
	 XaIzhz5onEF/o1czt6su4NAfczjRiDY1+rDOZUP4mg0+TUJT9stGaCQ5+yglMVqsCx
	 LJ6GxvsTMhEa5fQilzLxjuTdNe3XhZHGeN6Z9dudaSgUsV+HCeXwEbMW51HWihA/l7
	 U9vU0oZJvYbIw==
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
Subject: [PATCH v4 2/4] clk: en7523: Add reset-controller support for EN7581 SoC
Date: Thu, 27 Jun 2024 13:04:23 +0200
Message-ID: <4f735d17e549ea53769bf5a3f50406debb879a44.1719485847.git.lorenzo@kernel.org>
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

Introduce reset API support to EN7581 clock driver.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 192 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 187 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index ccc394692671..5cd501b86557 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -5,7 +5,11 @@
 #include <linux/io.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/reset-controller.h>
 #include <dt-bindings/clock/en7523-clk.h>
+#include <dt-bindings/reset/airoha,en7581-reset.h>
+
+#define RST_NR_PER_BANK			32
 
 #define REG_PCI_CONTROL			0x88
 #define   REG_PCI_CONTROL_PERSTOUT	BIT(29)
@@ -40,6 +44,9 @@
 #define REG_PCIE_XSI0_SEL_MASK		GENMASK(14, 13)
 #define REG_PCIE_XSI1_SEL_MASK		GENMASK(12, 11)
 
+#define REG_RST_CTRL2			0x00
+#define REG_RST_CTRL1			0x04
+
 struct en_clk_desc {
 	int id;
 	const char *name;
@@ -64,8 +71,20 @@ struct en_clk_gate {
 	struct clk_hw hw;
 };
 
+struct en_rst_data {
+	const u16 *bank_ofs;
+	const u16 *idx_map;
+	void __iomem *base;
+	struct reset_controller_dev rcdev;
+};
+
 struct en_clk_soc_data {
 	const struct clk_ops pcie_ops;
+	struct {
+		const u16 *bank_ofs;
+		const u16 *idx_map;
+		u16 idx_map_nr;
+	} reset;
 	int (*hw_init)(struct platform_device *pdev, void __iomem *base,
 		       void __iomem *np_base);
 };
@@ -168,6 +187,69 @@ static const struct en_clk_desc en7523_base_clks[] = {
 	}
 };
 
+static const u16 en7581_rst_ofs[] = {
+	REG_RST_CTRL2,
+	REG_RST_CTRL1,
+};
+
+static const u16 en7581_rst_map[] = {
+	/* RST_CTRL2 */
+	[EN7581_XPON_PHY_RST]		= 0,
+	[EN7581_CPU_TIMER2_RST]		= 2,
+	[EN7581_HSUART_RST]		= 3,
+	[EN7581_UART4_RST]		= 4,
+	[EN7581_UART5_RST]		= 5,
+	[EN7581_I2C2_RST]		= 6,
+	[EN7581_XSI_MAC_RST]		= 7,
+	[EN7581_XSI_PHY_RST]		= 8,
+	[EN7581_NPU_RST]		= 9,
+	[EN7581_I2S_RST]		= 10,
+	[EN7581_TRNG_RST]		= 11,
+	[EN7581_TRNG_MSTART_RST]	= 12,
+	[EN7581_DUAL_HSI0_RST]		= 13,
+	[EN7581_DUAL_HSI1_RST]		= 14,
+	[EN7581_HSI_RST]		= 15,
+	[EN7581_DUAL_HSI0_MAC_RST]	= 16,
+	[EN7581_DUAL_HSI1_MAC_RST]	= 17,
+	[EN7581_HSI_MAC_RST]		= 18,
+	[EN7581_WDMA_RST]		= 19,
+	[EN7581_WOE0_RST]		= 20,
+	[EN7581_WOE1_RST]		= 21,
+	[EN7581_HSDMA_RST]		= 22,
+	[EN7581_TDMA_RST]		= 24,
+	[EN7581_EMMC_RST]		= 25,
+	[EN7581_SOE_RST]		= 26,
+	[EN7581_PCIE2_RST]		= 27,
+	[EN7581_XFP_MAC_RST]		= 28,
+	[EN7581_USB_HOST_P1_RST]	= 29,
+	[EN7581_USB_HOST_P1_U3_PHY_RST]	= 30,
+	/* RST_CTRL1 */
+	[EN7581_PCM1_ZSI_ISI_RST]	= RST_NR_PER_BANK + 0,
+	[EN7581_FE_PDMA_RST]		= RST_NR_PER_BANK + 1,
+	[EN7581_FE_QDMA_RST]		= RST_NR_PER_BANK + 2,
+	[EN7581_PCM_SPIWP_RST]		= RST_NR_PER_BANK + 4,
+	[EN7581_CRYPTO_RST]		= RST_NR_PER_BANK + 6,
+	[EN7581_TIMER_RST]		= RST_NR_PER_BANK + 8,
+	[EN7581_PCM1_RST]		= RST_NR_PER_BANK + 11,
+	[EN7581_UART_RST]		= RST_NR_PER_BANK + 12,
+	[EN7581_GPIO_RST]		= RST_NR_PER_BANK + 13,
+	[EN7581_GDMA_RST]		= RST_NR_PER_BANK + 14,
+	[EN7581_I2C_MASTER_RST]		= RST_NR_PER_BANK + 16,
+	[EN7581_PCM2_ZSI_ISI_RST]	= RST_NR_PER_BANK + 17,
+	[EN7581_SFC_RST]		= RST_NR_PER_BANK + 18,
+	[EN7581_UART2_RST]		= RST_NR_PER_BANK + 19,
+	[EN7581_GDMP_RST]		= RST_NR_PER_BANK + 20,
+	[EN7581_FE_RST]			= RST_NR_PER_BANK + 21,
+	[EN7581_USB_HOST_P0_RST]	= RST_NR_PER_BANK + 22,
+	[EN7581_GSW_RST]		= RST_NR_PER_BANK + 23,
+	[EN7581_SFC2_PCM_RST]		= RST_NR_PER_BANK + 25,
+	[EN7581_PCIE0_RST]		= RST_NR_PER_BANK + 26,
+	[EN7581_PCIE1_RST]		= RST_NR_PER_BANK + 27,
+	[EN7581_CPU_TIMER_RST]		= RST_NR_PER_BANK + 28,
+	[EN7581_PCIE_HB_RST]		= RST_NR_PER_BANK + 29,
+	[EN7581_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
+};
+
 static unsigned int en7523_get_base_rate(void __iomem *base, unsigned int i)
 {
 	const struct en_clk_desc *desc = &en7523_base_clks[i];
@@ -370,7 +452,7 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	void __iomem *pb_base;
 	u32 val;
 
-	pb_base = devm_platform_ioremap_resource(pdev, 2);
+	pb_base = devm_platform_ioremap_resource(pdev, 3);
 	if (IS_ERR(pb_base))
 		return PTR_ERR(pb_base);
 
@@ -423,6 +505,95 @@ static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_dat
 	clk_data->num = EN7523_NUM_CLOCKS;
 }
 
+static int en7523_reset_update(struct reset_controller_dev *rcdev,
+			       unsigned long id, bool assert)
+{
+	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
+	void __iomem *addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	u32 val;
+
+	val = readl(addr);
+	if (assert)
+		val |= BIT(id % RST_NR_PER_BANK);
+	else
+		val &= ~BIT(id % RST_NR_PER_BANK);
+	writel(val, addr);
+
+	return 0;
+}
+
+static int en7523_reset_assert(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	return en7523_reset_update(rcdev, id, true);
+}
+
+static int en7523_reset_deassert(struct reset_controller_dev *rcdev,
+				 unsigned long id)
+{
+	return en7523_reset_update(rcdev, id, false);
+}
+
+static int en7523_reset_status(struct reset_controller_dev *rcdev,
+			       unsigned long id)
+{
+	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
+	void __iomem *addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
+
+	return !!(readl(addr) & BIT(id % RST_NR_PER_BANK));
+}
+
+static int en7523_reset_xlate(struct reset_controller_dev *rcdev,
+			      const struct of_phandle_args *reset_spec)
+{
+	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
+
+	if (reset_spec->args[0] >= rcdev->nr_resets)
+		return -EINVAL;
+
+	return rst_data->idx_map[reset_spec->args[0]];
+}
+
+static const struct reset_control_ops en7523_reset_ops = {
+	.assert = en7523_reset_assert,
+	.deassert = en7523_reset_deassert,
+	.status = en7523_reset_status,
+};
+
+static int en7523_reset_register(struct platform_device *pdev,
+				 const struct en_clk_soc_data *soc_data)
+{
+	struct device *dev = &pdev->dev;
+	struct en_rst_data *rst_data;
+	void __iomem *base;
+
+	/* no reset lines available */
+	if (!soc_data->reset.idx_map_nr)
+		return 0;
+
+	base = devm_platform_ioremap_resource(pdev, 2);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	rst_data = devm_kzalloc(dev, sizeof(*rst_data), GFP_KERNEL);
+	if (!rst_data)
+		return -ENOMEM;
+
+	rst_data->bank_ofs = soc_data->reset.bank_ofs;
+	rst_data->idx_map = soc_data->reset.idx_map;
+	rst_data->base = base;
+
+	rst_data->rcdev.nr_resets = soc_data->reset.idx_map_nr;
+	rst_data->rcdev.of_xlate = en7523_reset_xlate;
+	rst_data->rcdev.ops = &en7523_reset_ops;
+	rst_data->rcdev.of_node = dev->of_node;
+	rst_data->rcdev.of_reset_n_cells = 1;
+	rst_data->rcdev.owner = THIS_MODULE;
+	rst_data->rcdev.dev = dev;
+
+	return devm_reset_controller_register(dev, &rst_data->rcdev);
+}
+
 static int en7523_clk_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
@@ -456,11 +627,17 @@ static int en7523_clk_probe(struct platform_device *pdev)
 
 	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
 	if (r)
-		dev_err(&pdev->dev,
-			"could not register clock provider: %s: %d\n",
-			pdev->name, r);
+		return dev_err_probe(&pdev->dev, r, "Could not register clock provider: %s\n",
+				     pdev->name);
+
+	r = en7523_reset_register(pdev, soc_data);
+	if (r) {
+		of_clk_del_provider(node);
+		return dev_err_probe(&pdev->dev, r, "Could not register reset controller: %s\n",
+				     pdev->name);
+	}
 
-	return r;
+	return 0;
 }
 
 static const struct en_clk_soc_data en7523_data = {
@@ -479,6 +656,11 @@ static const struct en_clk_soc_data en7581_data = {
 		.unprepare = en7581_pci_unprepare,
 		.disable = en7581_pci_disable,
 	},
+	.reset = {
+		.bank_ofs = en7581_rst_ofs,
+		.idx_map = en7581_rst_map,
+		.idx_map_nr = ARRAY_SIZE(en7581_rst_map),
+	},
 	.hw_init = en7581_clk_hw_init,
 };
 
-- 
2.45.2


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874E813212D
	for <linux-clk@vger.kernel.org>; Tue,  9 Jul 2024 07:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720511374; cv=none; b=SjVicW10QilpK3HQitCtKDJJiz7WOipX4e8R3lKdRrWlQ4Vj7WGfJN9xGRnUoBcymDFA7qPb/CCsHXyc2vyqojqCFzpW+H+E3SQbGmWqrVYci88fVPEJ2CgsS/oYIOoL+KcgIzFJxmVaAJiNNcrSJDKLLOd7cHKvR/t4Ns5TwLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720511374; c=relaxed/simple;
	bh=m9L7xAz2uPTEFudXdDFuLcR6MrFYkUjQ8WvIZTYYqPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sl86kOW80eO/dTYu+XGn/dyFNEe1ObN8YB4nncly4me5XCQqLGhniuXrSO2u4dYiI7tiXq6Fpb6x83T6hYQ9FLxX+VhHBWps5ou9LY1D/Cro0Rog1Ndv4WGAOURQJ8hft5lwUlt5pdcQMLp8mg5kuFp3BwhGwymw8foSsYQf8W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=klv+XvC5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="klv+XvC5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F2DC3277B;
	Tue,  9 Jul 2024 07:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720511374;
	bh=m9L7xAz2uPTEFudXdDFuLcR6MrFYkUjQ8WvIZTYYqPg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=klv+XvC5tykGXb7TVVEl8vEAtKMCAMlFp/47lpbdvj9YyySEB64R+33pQtdklUopY
	 LblubGkzZmMNDtR58yg8NsILRJy7DJU64DQOtq6qqGNvthHeOGFggxCaQZcvWiPA+L
	 AAZ5MYz7o+NE8PLLEDFu/Nj4SiWfur3yVc78ypN1fukdq0ur44cAiruFz8QUejzlKK
	 EEgmdtbwn/C+uTQ4nrPtrVfmzBoF3J1Wc4lnLpYdTCjL6CzYrAs4KGj5FGVfRsSCwV
	 bCvbLDA2eml9uItP0Kx6yFXWhJyFO+/rnJF1jcN4aIrS/8ohISMEHBc0WDeeul8+aQ
	 4y7QBo3ifp9Fw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	lorenzo.bianconi83@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	nbd@nbd.name,
	john@phrozen.org,
	upstream@airoha.com,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH 1/2] clk: en7523: fix estimation of fixed rate for EN7581
Date: Tue,  9 Jul 2024 09:48:54 +0200
Message-ID: <1f44e8624276845eab0f046666df86b443f8ecce.1720510991.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720510991.git.lorenzo@kernel.org>
References: <cover.1720510991.git.lorenzo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce fixed_rate in en_clk_soc_data struct in order to
define per-SoC fixed-rate clock parameters and fix wrong
parameters for emi, npu and crypto EN7581 clocks

Fixes: 66bc47326ce2 ("clk: en7523: Add EN7581 support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/clk/clk-en7523.c | 129 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 121 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 22fbea61c3dc..b20e56337a6b 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -31,6 +31,7 @@
 #define   REG_RESET_CONTROL_PCIE1	BIT(27)
 #define   REG_RESET_CONTROL_PCIE2	BIT(26)
 /* EN7581 */
+#define REG_CRYPTO_CLKSRC2		0x20c
 #define REG_PCIE0_MEM			0x00
 #define REG_PCIE0_MEM_MASK		0x04
 #define REG_PCIE1_MEM			0x08
@@ -78,6 +79,10 @@ struct en_rst_data {
 };
 
 struct en_clk_soc_data {
+	struct {
+		const struct en_clk_desc *desc;
+		u16 size;
+	} fixed_rate;
 	const struct clk_ops pcie_ops;
 	struct {
 		const u16 *bank_ofs;
@@ -92,6 +97,10 @@ static const u32 emi_base[] = { 333000000, 400000000 };
 static const u32 bus_base[] = { 500000000, 540000000 };
 static const u32 slic_base[] = { 100000000, 3125000 };
 static const u32 npu_base[] = { 333000000, 400000000, 500000000 };
+/* EN7581 */
+static const u32 emi7581_base[] = { 540000000, 480000000, 400000000, 300000000 };
+static const u32 npu7581_base[] = { 800000000, 750000000, 720000000, 600000000 };
+static const u32 crypto_base[] = { 540000000, 480000000 };
 
 static const struct en_clk_desc en7523_base_clks[] = {
 	{
@@ -189,6 +198,102 @@ static const struct en_clk_desc en7523_base_clks[] = {
 	}
 };
 
+static const struct en_clk_desc en7581_base_clks[] = {
+	{
+		.id = EN7523_CLK_GSW,
+		.name = "gsw",
+
+		.base_reg = REG_GSW_CLK_DIV_SEL,
+		.base_bits = 1,
+		.base_shift = 8,
+		.base_values = gsw_base,
+		.n_base_values = ARRAY_SIZE(gsw_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = EN7523_CLK_EMI,
+		.name = "emi",
+
+		.base_reg = REG_EMI_CLK_DIV_SEL,
+		.base_bits = 2,
+		.base_shift = 8,
+		.base_values = emi7581_base,
+		.n_base_values = ARRAY_SIZE(emi7581_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = EN7523_CLK_BUS,
+		.name = "bus",
+
+		.base_reg = REG_BUS_CLK_DIV_SEL,
+		.base_bits = 1,
+		.base_shift = 8,
+		.base_values = bus_base,
+		.n_base_values = ARRAY_SIZE(bus_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = EN7523_CLK_SLIC,
+		.name = "slic",
+
+		.base_reg = REG_SPI_CLK_FREQ_SEL,
+		.base_bits = 1,
+		.base_shift = 0,
+		.base_values = slic_base,
+		.n_base_values = ARRAY_SIZE(slic_base),
+
+		.div_reg = REG_SPI_CLK_DIV_SEL,
+		.div_bits = 5,
+		.div_shift = 24,
+		.div_val0 = 20,
+		.div_step = 2,
+	}, {
+		.id = EN7523_CLK_SPI,
+		.name = "spi",
+
+		.base_reg = REG_SPI_CLK_DIV_SEL,
+
+		.base_value = 400000000,
+
+		.div_bits = 5,
+		.div_shift = 8,
+		.div_val0 = 40,
+		.div_step = 2,
+	}, {
+		.id = EN7523_CLK_NPU,
+		.name = "npu",
+
+		.base_reg = REG_NPU_CLK_DIV_SEL,
+		.base_bits = 2,
+		.base_shift = 8,
+		.base_values = npu7581_base,
+		.n_base_values = ARRAY_SIZE(npu7581_base),
+
+		.div_bits = 3,
+		.div_shift = 0,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = EN7523_CLK_CRYPTO,
+		.name = "crypto",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+		.base_bits = 1,
+		.base_shift = 0,
+		.base_values = crypto_base,
+		.n_base_values = ARRAY_SIZE(crypto_base),
+	}
+};
+
 static const u16 en7581_rst_ofs[] = {
 	REG_RST_CTRL2,
 	REG_RST_CTRL1,
@@ -252,9 +357,9 @@ static const u16 en7581_rst_map[] = {
 	[EN7581_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
 };
 
-static unsigned int en7523_get_base_rate(void __iomem *base, unsigned int i)
+static unsigned int en7523_get_base_rate(const struct en_clk_desc *desc,
+					 void __iomem *base)
 {
-	const struct en_clk_desc *desc = &en7523_base_clks[i];
 	u32 val;
 
 	if (!desc->base_bits)
@@ -270,9 +375,8 @@ static unsigned int en7523_get_base_rate(void __iomem *base, unsigned int i)
 	return desc->base_values[val];
 }
 
-static u32 en7523_get_div(void __iomem *base, int i)
+static u32 en7523_get_div(const struct en_clk_desc *desc, void __iomem *base)
 {
-	const struct en_clk_desc *desc = &en7523_base_clks[i];
 	u32 reg, val;
 
 	if (!desc->div_bits)
@@ -441,15 +545,16 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 static void en7523_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
 				   void __iomem *base, void __iomem *np_base)
 {
+	const struct en_clk_soc_data *soc_data = device_get_match_data(dev);
 	struct clk_hw *hw;
 	u32 rate;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(en7523_base_clks); i++) {
-		const struct en_clk_desc *desc = &en7523_base_clks[i];
+	for (i = 0; i < soc_data->fixed_rate.size; i++) {
+		const struct en_clk_desc *desc = &soc_data->fixed_rate.desc[i];
 
-		rate = en7523_get_base_rate(base, i);
-		rate /= en7523_get_div(base, i);
+		rate = en7523_get_base_rate(desc, base);
+		rate /= en7523_get_div(desc, base);
 
 		hw = clk_hw_register_fixed_rate(dev, desc->name, NULL, 0, rate);
 		if (IS_ERR(hw)) {
@@ -603,6 +708,10 @@ static int en7523_clk_probe(struct platform_device *pdev)
 }
 
 static const struct en_clk_soc_data en7523_data = {
+	.fixed_rate = {
+		.desc = en7523_base_clks,
+		.size = ARRAY_SIZE(en7523_base_clks),
+	},
 	.pcie_ops = {
 		.is_enabled = en7523_pci_is_enabled,
 		.prepare = en7523_pci_prepare,
@@ -611,6 +720,10 @@ static const struct en_clk_soc_data en7523_data = {
 };
 
 static const struct en_clk_soc_data en7581_data = {
+	.fixed_rate = {
+		.desc = en7581_base_clks,
+		.size = ARRAY_SIZE(en7581_base_clks),
+	},
 	.pcie_ops = {
 		.is_enabled = en7581_pci_is_enabled,
 		.enable = en7581_pci_enable,
-- 
2.45.2


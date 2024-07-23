Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2910C14AD17
	for <linux-clk@vger.kernel.org>; Tue, 23 Jul 2024 07:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721720549; cv=none; b=ZFIuqh74PQU8O3eaJHl8VAzN8iVf7Ue7OfkHwEiNhrUMg5WD2BsPr88yR6JomUfXS04sgVHylmhZiMAA0ZJC5XAOMoYCaye6hrAPrERBtDkHdTmLqhrSksfHqWr5WZR2cRS5PROrFDIi5pRuls1/f90zJzuwHGc5H8OD8VzAP8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721720549; c=relaxed/simple;
	bh=S2WsnWxl661vGWXGcN0AZIv5Th2xKZ2vMpl2lvJc0R8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r45Sxp4ceM07FhadKtPp9XPA5UcB+muare5DJS+BLrIaTodGZO2fC9VwWBPSRYV+2mRQjFbtJuDuH55Lbiui0MD1ZRNUrn4cKJr51Na7/T1P3S5OMAO9YUADkQO25vJM86fQ/OtuJkE1FuD12a2L4+Qm+gkDkPKcepekhR/+Rz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FPxtm2kX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FPxtm2kX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28571C4AF09;
	Tue, 23 Jul 2024 07:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721720548;
	bh=S2WsnWxl661vGWXGcN0AZIv5Th2xKZ2vMpl2lvJc0R8=;
	h=From:To:Cc:Subject:Date:From;
	b=FPxtm2kXDSOD0XO0y5cGiviDxvkYGyYQaTaUt1n77ddDAXs1IrX4Vk/0uM73zd/UG
	 qTFJWfJTWtfaNu1RloHfK5qIeVwIWR8vghAe9f0zXz2WRQZnMcKRBUo4TwGpON6N+z
	 gO1cWkxfXVJZzmYO7U9ihu0/gL6IxmP30JrycrIJ7U66NNbWCjU4FWYSFbtMS4BdTi
	 wE8et/W/abugHzxxgsPl37dDGn9og3namU3K0oxX8vUz62kRMqFzuI+rDz1xwc6cAE
	 MJUe+iW4q2Ii2s/NufCQNzh6Y1NuGV/C/YiWKhnIY7AvUNsGvimfsJUNels7aTe18g
	 h0AEdMic37cWw==
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
Subject: [PATCH v2] clk: en7523: fix estimation of fixed rate for EN7581
Date: Tue, 23 Jul 2024 09:42:20 +0200
Message-ID: <ed151e5cedd4f6659d172141df655e851dcd482b.1721720316.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce fixed_rate in en_clk_soc_data struct in order to
define per-SoC fixed-rate clock parameters and fix wrong
parameters for emi, npu and crypto EN7581 clocks.
Moreover, since EN7581 clock driver shares the IO region with the
upcoming pinctrl one for Airoha EN7581 SoC, reduce the clk mapped region
to only used registers in order to not overlap with pinctrl ones.
This change is not introducing any backward compatibility issue since
the EN7581 dts is not upstream yet.

Fixes: 66bc47326ce2 ("clk: en7523: Add EN7581 support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes since v1:
- squash patch 1/2 and 2/2
---
 drivers/clk/clk-en7523.c | 136 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 128 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 22fbea61c3dc..d9ecbb6bf55a 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -31,6 +31,14 @@
 #define   REG_RESET_CONTROL_PCIE1	BIT(27)
 #define   REG_RESET_CONTROL_PCIE2	BIT(26)
 /* EN7581 */
+#define REG_GSW_CLK_DIV_SEL2		0x00
+#define REG_EMI_CLK_DIV_SEL2		0x04
+#define REG_BUS_CLK_DIV_SEL2		0x08
+#define REG_SPI_CLK_DIV_SEL2		0x10
+#define REG_SPI_CLK_FREQ_SEL2		0x14
+#define REG_NPU_CLK_DIV_SEL2		0x48
+#define REG_CRYPTO_CLKSRC2		0x58
+
 #define REG_PCIE0_MEM			0x00
 #define REG_PCIE0_MEM_MASK		0x04
 #define REG_PCIE1_MEM			0x08
@@ -78,6 +86,10 @@ struct en_rst_data {
 };
 
 struct en_clk_soc_data {
+	struct {
+		const struct en_clk_desc *desc;
+		u16 size;
+	} fixed_rate;
 	const struct clk_ops pcie_ops;
 	struct {
 		const u16 *bank_ofs;
@@ -92,6 +104,10 @@ static const u32 emi_base[] = { 333000000, 400000000 };
 static const u32 bus_base[] = { 500000000, 540000000 };
 static const u32 slic_base[] = { 100000000, 3125000 };
 static const u32 npu_base[] = { 333000000, 400000000, 500000000 };
+/* EN7581 */
+static const u32 emi7581_base[] = { 540000000, 480000000, 400000000, 300000000 };
+static const u32 npu7581_base[] = { 800000000, 750000000, 720000000, 600000000 };
+static const u32 crypto_base[] = { 540000000, 480000000 };
 
 static const struct en_clk_desc en7523_base_clks[] = {
 	{
@@ -189,6 +205,102 @@ static const struct en_clk_desc en7523_base_clks[] = {
 	}
 };
 
+static const struct en_clk_desc en7581_base_clks[] = {
+	{
+		.id = EN7523_CLK_GSW,
+		.name = "gsw",
+
+		.base_reg = REG_GSW_CLK_DIV_SEL2,
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
+		.base_reg = REG_EMI_CLK_DIV_SEL2,
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
+		.base_reg = REG_BUS_CLK_DIV_SEL2,
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
+		.base_reg = REG_SPI_CLK_FREQ_SEL2,
+		.base_bits = 1,
+		.base_shift = 0,
+		.base_values = slic_base,
+		.n_base_values = ARRAY_SIZE(slic_base),
+
+		.div_reg = REG_SPI_CLK_DIV_SEL2,
+		.div_bits = 5,
+		.div_shift = 24,
+		.div_val0 = 20,
+		.div_step = 2,
+	}, {
+		.id = EN7523_CLK_SPI,
+		.name = "spi",
+
+		.base_reg = REG_SPI_CLK_DIV_SEL2,
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
+		.base_reg = REG_NPU_CLK_DIV_SEL2,
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
@@ -252,9 +364,9 @@ static const u16 en7581_rst_map[] = {
 	[EN7581_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
 };
 
-static unsigned int en7523_get_base_rate(void __iomem *base, unsigned int i)
+static unsigned int en7523_get_base_rate(const struct en_clk_desc *desc,
+					 void __iomem *base)
 {
-	const struct en_clk_desc *desc = &en7523_base_clks[i];
 	u32 val;
 
 	if (!desc->base_bits)
@@ -270,9 +382,8 @@ static unsigned int en7523_get_base_rate(void __iomem *base, unsigned int i)
 	return desc->base_values[val];
 }
 
-static u32 en7523_get_div(void __iomem *base, int i)
+static u32 en7523_get_div(const struct en_clk_desc *desc, void __iomem *base)
 {
-	const struct en_clk_desc *desc = &en7523_base_clks[i];
 	u32 reg, val;
 
 	if (!desc->div_bits)
@@ -441,15 +552,16 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
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
@@ -603,6 +715,10 @@ static int en7523_clk_probe(struct platform_device *pdev)
 }
 
 static const struct en_clk_soc_data en7523_data = {
+	.fixed_rate = {
+		.desc = en7523_base_clks,
+		.size = ARRAY_SIZE(en7523_base_clks),
+	},
 	.pcie_ops = {
 		.is_enabled = en7523_pci_is_enabled,
 		.prepare = en7523_pci_prepare,
@@ -611,6 +727,10 @@ static const struct en_clk_soc_data en7523_data = {
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


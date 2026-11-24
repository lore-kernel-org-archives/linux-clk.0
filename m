Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795515155;
	b=NeBO9gZade6ofFlUAEGcB2ZCxR16buCbzXd2hzoslShqwT4XqTUOaSbuCF2sibLCAe45
	 FdCVLIJpX18dY8sAl4j27Z6b4F18on7ieEZjZv7qbDM10TZaOc8Kp3H95y5Txnl6h1KQZ
	 CePX0A0b73AzqztvLJRrnMOjn7WjPiPWYhvOSmmT3M4AJqeYbdBmAkidEVgSp33EBpOb9
	 +g4ZKcEL8FZEgaUF/QC1/yfvhMCfRdf/m3U0PS0OxQeMZ/9ZNtpfRiEgkOiQ+C4asT3n4
	 2WVBP39q94Fs6uFpJ00sKvCyBG2m3SUK6e1tqlZrQ2Z1g37UuzrZCgcUnQE/qy1xjIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795515155;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=wtI7URbhvuKP8pBBC88RwvOJX4OoTa0aQHjCsvb0d7E=;
	b=xOlzfpuPLuTfQxpkhDXVjVYEGhYYl+rTkALC8+aAQpqPnzhP+sKHC+hs+Bd3YL8Cle7y
	 B8pDl8PfpFUuPjZn5daeEsd/VMFQzXzU+8t6VCFaoOrOYHFZrP/5Nuy+YI2sRTBcUc7od
	 V2NL0eq79w1mFg+jubw9V83tHDUCpn/AyYV7Y4wG1BWnUPuc8nXpoCL4mzvI+Be+jiZn6
	 klkdqmq2rYactN4NVGqeGa8rskFRBhiNvMNMZBh6GWlQxTfrJefH3VIlSNs8FJsBHbgWw
	 adZiSE3Ygh3RqoojIByK/C2mUoXY0JIORNnjXY04Ng8y5hRyKivlhIxW4JIDB2n45aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C714606A32C;
	Tue, 24 Nov 2026 10:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C714606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:dffc:4a09:a431:737f:f29f] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xVnVj-007edJ-1q;
	Tue, 24 Nov 2026 11:12:27 +0100
From: John Crispin <john@phrozen.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH 4/6] clk: en7523: add support for Airoha AN7589
Date: Tue, 24 Nov 2026 11:12:18 +0100
Message-Id: <20261124101220.3888170-5-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124101220.3888170-1-john@phrozen.org>
References: <20261124101220.3888170-1-john@phrozen.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AN7589 SCU sits at the EN7581 register addresses with wider mux
fields, new base rate tables, new clocks in REG_CRYPTO_CLKSRC2 and
REG_PM_UPS_CLKSRC, and a third reset bank at REG_RST_CTRL3. Like the
AN7583 it reaches the PCIe clock registers through the chip SCU.

The GSW clock has no mux field in the Airoha SDK and is left out, so
the clock IDs are sparse. num_clocks is set from the largest ID,
AN7589_CLK_MDIO2, and the descriptor count is carried separately.

The rates and register fields come from the Airoha SDK.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/clk/clk-en7523.c | 323 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 323 insertions(+)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 2799b550401e..800de9a48594 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -14,6 +14,7 @@
 #include <linux/spinlock.h>
 #include <dt-bindings/clock/en7523-clk.h>
 #include <dt-bindings/reset/airoha,an7583-reset.h>
+#include <dt-bindings/reset/airoha,an7589-reset.h>
 #include <dt-bindings/reset/airoha,en7523-reset.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
 #include <dt-bindings/clock/econet,en751221-scu.h>
@@ -62,6 +63,8 @@
 #define REG_USB_PCIE_SEL_PCIE		FIELD_PREP_CONST(REG_USB_PCIE_SEL_MASK, 0x0)
 #define REG_USB_PCIE_SEL_USB		FIELD_PREP_CONST(REG_USB_PCIE_SEL_MASK, 0x1)
 #define REG_CRYPTO_CLKSRC2		0x20c
+/* AN7589 */
+#define REG_PM_UPS_CLKSRC		0x210
 /* EN751221 */
 #define EN751221_REG_SPI_DIV		0x0cc
 #define EN751221_REG_SPI_DIV_MASK	GENMASK(31, 8)
@@ -76,6 +79,7 @@
 #define REG_RST_CTRL2			0x830
 #define REG_RST_CTRL1			0x834
 #define   REG_PCIE_HB_RST		BIT(29)
+#define REG_RST_CTRL3			0x838
 #define EN751221_REG_RST_DMT		0x84
 #define EN751221_REG_RST_USB		0xec
 
@@ -177,6 +181,23 @@ static const u32 spi7583_base[] = { 400000000, 12500000 };
 static const u32 npu7583_base[] = { 666000000, 800000000, 720000000, 600000000 };
 static const u32 crypto7583_base[] = { 540672000, 400000000 };
 static const u32 emmc7583_base[] = { 150000000, 200000000 };
+/* AN7589 */
+static const u32 emi7589_base[] = { 400000000, 540672000, 480000000, 600000000,
+				    685000000, 720000000, 800000000, 800000000 };
+static const u32 bus7589_base[] = { 540672000, 600000000, 720000000, 800000000,
+				    850000000, 960000000, 960000000, 960000000 };
+static const u32 npu7589_base[] = { 540000000, 685000000, 720000000, 800000000,
+				    850000000, 600000000, 960000000, 960000000 };
+static const u32 crypto7589_base[] = { 480000000, 720000000, 960000000, 850000000 };
+static const u32 emmc7589_base[] = { 360000000, 400000000 };
+static const u32 efuse7589_base[] = { 200000000, 100000000 };
+static const u32 tinynpu7589_base[] = { 425000000, 480000000, 540000000, 720000000 };
+static const u32 ecc7589_base[] = { 300000000, 600000000 };
+static const u32 pm_ups7589_base[] = { 400000000, 480000000 };
+static const u32 dq_ups7589_base[] = { 200000000, 270000000, 480000000, 540000000 };
+static const u32 tm_ups7589_base[] = { 400000000, 540000000, 720000000, 800000000,
+				       720000000, 850000000, 600000000, 685000000 };
+static const u32 acp7589_base[] = { 480000000, 720000000 };
 
 static const struct en_clk_desc en7523_base_clks[] = {
 	{
@@ -511,12 +532,211 @@ static const struct en_clk_desc an7583_base_clks[] = {
 	}
 };
 
+static const struct en_clk_desc an7589_base_clks[] = {
+	{
+		.id = EN7523_CLK_EMI,
+		.name = "emi",
+
+		.base_reg = REG_EMI_CLK_DIV_SEL,
+		.base_bits = 3,
+		.base_shift = 8,
+		.base_values = emi7589_base,
+		.n_base_values = ARRAY_SIZE(emi7589_base),
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
+		.base_bits = 3,
+		.base_shift = 8,
+		.base_values = bus7589_base,
+		.n_base_values = ARRAY_SIZE(bus7589_base),
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
+		.base_reg = REG_SPI_CLK_FREQ_SEL,
+		.base_bits = 1,
+		.base_shift = 1,
+		.base_values = spi7583_base,
+		.n_base_values = ARRAY_SIZE(spi7583_base),
+
+		.div_reg = REG_SPI_CLK_DIV_SEL,
+		.div_bits = 5,
+		.div_shift = 8,
+		.div_val0 = 40,
+		.div_step = 2,
+	}, {
+		.id = EN7523_CLK_NPU,
+		.name = "npu",
+
+		.base_reg = REG_NPU_CLK_DIV_SEL,
+		.base_bits = 3,
+		.base_shift = 9,
+		.base_values = npu7589_base,
+		.n_base_values = ARRAY_SIZE(npu7589_base),
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
+		.base_bits = 2,
+		.base_shift = 0,
+		.base_values = crypto7589_base,
+		.n_base_values = ARRAY_SIZE(crypto7589_base),
+	}, {
+		.id = EN7581_CLK_EMMC,
+		.name = "emmc",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+		.base_bits = 1,
+		.base_shift = 16,
+		.base_values = emmc7589_base,
+		.n_base_values = ARRAY_SIZE(emmc7589_base),
+	}, {
+		.id = AN7583_CLK_MDIO0,
+		.name = "mdio0",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+
+		.base_value = 25000000,
+
+		.div_bits = 4,
+		.div_shift = 18,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = AN7583_CLK_MDIO1,
+		.name = "mdio1",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+
+		.base_value = 25000000,
+
+		.div_bits = 4,
+		.div_shift = 22,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = AN7589_CLK_MDIO2,
+		.name = "mdio2",
+
+		.base_reg = REG_NPU_CLK_DIV_SEL,
+
+		.base_value = 25000000,
+
+		.div_bits = 4,
+		.div_shift = 16,
+		.div_step = 1,
+		.div_offset = 1,
+	}, {
+		.id = AN7589_CLK_EFUSE,
+		.name = "efuse",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+		.base_bits = 1,
+		.base_shift = 6,
+		.base_values = efuse7589_base,
+		.n_base_values = ARRAY_SIZE(efuse7589_base),
+	}, {
+		.id = AN7589_CLK_TINY_NPU,
+		.name = "tinynpu",
+
+		.base_reg = REG_PM_UPS_CLKSRC,
+		.base_bits = 2,
+		.base_shift = 14,
+		.base_values = tinynpu7589_base,
+		.n_base_values = ARRAY_SIZE(tinynpu7589_base),
+	}, {
+		.id = AN7589_CLK_ECC,
+		.name = "ecc",
+
+		.base_reg = REG_PM_UPS_CLKSRC,
+		.base_bits = 1,
+		.base_shift = 8,
+		.base_values = ecc7589_base,
+		.n_base_values = ARRAY_SIZE(ecc7589_base),
+	}, {
+		.id = AN7589_CLK_PM_UPS,
+		.name = "pm_ups",
+
+		.base_reg = REG_PM_UPS_CLKSRC,
+		.base_bits = 1,
+		.base_shift = 0,
+		.base_values = pm_ups7589_base,
+		.n_base_values = ARRAY_SIZE(pm_ups7589_base),
+	}, {
+		.id = AN7589_CLK_DQ_UPS,
+		.name = "dq_ups",
+
+		.base_reg = REG_PM_UPS_CLKSRC,
+		.base_bits = 2,
+		.base_shift = 1,
+		.base_values = dq_ups7589_base,
+		.n_base_values = ARRAY_SIZE(dq_ups7589_base),
+	}, {
+		.id = AN7589_CLK_TM_UPS,
+		.name = "tm_ups",
+
+		.base_reg = REG_PM_UPS_CLKSRC,
+		.base_bits = 3,
+		.base_shift = 3,
+		.base_values = tm_ups7589_base,
+		.n_base_values = ARRAY_SIZE(tm_ups7589_base),
+	}, {
+		.id = AN7589_CLK_ACP,
+		.name = "acp",
+
+		.base_reg = REG_PM_UPS_CLKSRC,
+		.base_bits = 1,
+		.base_shift = 7,
+		.base_values = acp7589_base,
+		.n_base_values = ARRAY_SIZE(acp7589_base),
+	}
+};
+
 static const u16 en7581_rst_ofs[] = {
 	REG_RST_CTRL2,
 	REG_RST_CTRL1,
 	REG_NP_SCU_PCIC,
 };
 
+static const u16 an7589_rst_ofs[] = {
+	REG_RST_CTRL2,
+	REG_RST_CTRL1,
+	REG_RST_CTRL3,
+};
+
 static const u16 en751221_rst_ofs[] = {
 	REG_RST_CTRL2,
 	REG_RST_CTRL1,
@@ -744,6 +964,67 @@ static const u16 an7583_rst_map[] = {
 	[AN7583_PCIC_PERSTOUT1_RST]	= 2 * RST_NR_PER_BANK + 26,
 };
 
+static const u16 an7589_rst_map[] = {
+	/* RST_CTRL2 */
+	[AN7589_XPON_PHY_RST]		= 0,
+	[AN7589_GPON_OLT_RST]		= 1,
+	[AN7589_CPU_TIMER2_RST]		= 2,
+	[AN7589_HSUART_RST]		= 3,
+	[AN7589_UART4_RST]		= 4,
+	[AN7589_UART5_RST]		= 5,
+	[AN7589_I2C2_RST]		= 6,
+	[AN7589_XSI_MAC_RST]		= 7,
+	[AN7589_XSI_PHY_RST]		= 8,
+	[AN7589_NPU_RST]		= 9,
+	[AN7589_I2S_RST]		= 10,
+	[AN7589_TRNG_MSTART_RST]	= 12,
+	[AN7589_DUAL_HSI0_RST]		= 13,
+	[AN7589_DUAL_HSI1_RST]		= 14,
+	[AN7589_DUAL_HSI0_MAC_RST]	= 16,
+	[AN7589_DUAL_HSI1_MAC_RST]	= 17,
+	[AN7589_XPON_XFI_RST]		= 18,
+	[AN7589_WDMA_RST]		= 19,
+	[AN7589_WOE0_RST]		= 20,
+	[AN7589_HSDMA_RST]		= 22,
+	[AN7589_TDMA_RST]		= 24,
+	[AN7589_EMMC_RST]		= 25,
+	[AN7589_SOE_RST]		= 26,
+	[AN7589_XFP_MAC_RST]		= 28,
+	[AN7589_MDIO0_RST]		= 30,
+	[AN7589_MDIO1_RST]		= 31,
+	/* RST_CTRL1 */
+	[AN7589_PCM1_ZSI_ISI_RST]	= RST_NR_PER_BANK + 0,
+	[AN7589_FE_PDMA_RST]		= RST_NR_PER_BANK + 1,
+	[AN7589_FE_QDMA_RST]		= RST_NR_PER_BANK + 2,
+	[AN7589_PCM_SPIWP_RST]		= RST_NR_PER_BANK + 4,
+	[AN7589_CRYPTO_RST]		= RST_NR_PER_BANK + 6,
+	[AN7589_TIMER_RST]		= RST_NR_PER_BANK + 8,
+	[AN7589_PCM1_RST]		= RST_NR_PER_BANK + 11,
+	[AN7589_UART_RST]		= RST_NR_PER_BANK + 12,
+	[AN7589_GPIO_RST]		= RST_NR_PER_BANK + 13,
+	[AN7589_GDMA_RST]		= RST_NR_PER_BANK + 14,
+	[AN7589_I2C_MASTER_RST]		= RST_NR_PER_BANK + 16,
+	[AN7589_PCM2_ZSI_ISI_RST]	= RST_NR_PER_BANK + 17,
+	[AN7589_SFC_RST]		= RST_NR_PER_BANK + 18,
+	[AN7589_UART2_RST]		= RST_NR_PER_BANK + 19,
+	[AN7589_GDMP_RST]		= RST_NR_PER_BANK + 20,
+	[AN7589_FE_RST]			= RST_NR_PER_BANK + 21,
+	[AN7589_USB_HOST_P0_RST]	= RST_NR_PER_BANK + 22,
+	[AN7589_GSW_RST]		= RST_NR_PER_BANK + 23,
+	[AN7589_SFC2_PCM_RST]		= RST_NR_PER_BANK + 25,
+	[AN7589_PCIE0_RST]		= RST_NR_PER_BANK + 26,
+	[AN7589_PCIE1_RST]		= RST_NR_PER_BANK + 27,
+	[AN7589_CPU_TIMER_RST]		= RST_NR_PER_BANK + 28,
+	[AN7589_PCIE_HB_RST]		= RST_NR_PER_BANK + 29,
+	[AN7589_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
+	/* RST_CTRL3 */
+	[AN7589_I2C3_RST]		= 2 * RST_NR_PER_BANK + 0,
+	[AN7589_I2C4_RST]		= 2 * RST_NR_PER_BANK + 1,
+	[AN7589_I2C5_RST]		= 2 * RST_NR_PER_BANK + 2,
+	[AN7589_OPTL_SYS_RST]		= 2 * RST_NR_PER_BANK + 3,
+	[AN7589_MDIO2_RST]		= 2 * RST_NR_PER_BANK + 13,
+};
+
 static int en7581_reset_register(struct device *dev, void __iomem *base,
 				 const u16 *rst_map, int nr_resets,
 				 const u16 *rst_reg_ofs);
@@ -1381,6 +1662,35 @@ static int an7583_clk_hw_init(struct platform_device *pdev,
 	return en7581_serdes_phy_register(dev);
 }
 
+static int an7589_clk_hw_init(struct platform_device *pdev,
+			      struct clk_hw_onecell_data *clk_data)
+{
+	struct device *dev = &pdev->dev;
+	struct regmap *map;
+	void __iomem *base;
+	u32 val;
+
+	map = syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,chip-scu");
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	en7581_register_clocks(dev, clk_data, map, base);
+
+	val = readl(base + REG_NP_SCU_SSTR);
+	val &= ~(REG_PCIE_XSI0_SEL_MASK | REG_PCIE_XSI1_SEL_MASK);
+	writel(val, base + REG_NP_SCU_SSTR);
+	val = readl(base + REG_NP_SCU_PCIC);
+	writel(val | 3, base + REG_NP_SCU_PCIC);
+
+	return en7581_reset_register(dev, base, an7589_rst_map,
+				     ARRAY_SIZE(an7589_rst_map),
+				     an7589_rst_ofs);
+}
+
 static enum en_hir get_hw_id(void __iomem *np_base)
 {
 	u32 val = FIELD_GET(REG_HIR_MASK, readl(np_base + REG_HIR));
@@ -1550,6 +1860,18 @@ static const struct en_clk_soc_data an7583_data = {
 	.hw_init = an7583_clk_hw_init,
 };
 
+static const struct en_clk_soc_data an7589_data = {
+	.base_clks = an7589_base_clks,
+	.num_base_clks = ARRAY_SIZE(an7589_base_clks),
+	.num_clocks = AN7589_CLK_MDIO2,
+	.pcie_ops = {
+		.is_enabled = en7581_pci_is_enabled,
+		.enable = en7581_pci_enable,
+		.disable = en7581_pci_disable,
+	},
+	.hw_init = an7589_clk_hw_init,
+};
+
 static const struct en_clk_soc_data en751221_data = {
 	/* Decrease of one as PCIe is incremented internally with PCIe OPs */
 	.num_clocks = EN751221_MAX_CLKS - 1,
@@ -1566,6 +1888,7 @@ static const struct of_device_id of_match_clk_en7523[] = {
 	{ .compatible = "airoha,en7523-scu", .data = &en7523_data },
 	{ .compatible = "airoha,en7581-scu", .data = &en7581_data },
 	{ .compatible = "airoha,an7583-scu", .data = &an7583_data },
+	{ .compatible = "airoha,an7589-scu", .data = &an7589_data },
 	{ .compatible = "econet,en751221-scu", .data = &en751221_data },
 	{ /* sentinel */ }
 };
-- 
2.34.1


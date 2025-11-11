Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CB536C59D
	for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 15:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762876599; cv=none; b=R9YNIQ7wWXc7Owc8eeYDQGphqPVDac8WcAVxdCpCLyPKF/IzGLHJH+ER+qEhenFLsJPEOX+4DKRGIUL6CZ8VkRmANrBpg2+ZXBQW8dBE5g1i32GvLxM5741lvvvqFA8mwQfqEsWHSU/DQr/SnYnQHQ/SfQN++5q815/lZ+S+ppg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762876599; c=relaxed/simple;
	bh=jvnWathBhjeqNe4bD205E5KDqrWC1stIoxfmNcQDuzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lF98l6BPdQDG9q0j0+A+eScWfn0Td+hYeuYqoUkdR2r4R0W38aW0CsUif2b+2JfjNhLIRo20HiB2YkEmHCHeeVYXdhaY5/u4vNtVqYjeLQqyTgwTToIrYCYjjbIdmLyDemhaMZ4hFdtpyVUal4vqu/wWhRZFty4ZsT9yxhN8LY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cjIqQRjg; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cjIqQRjg"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b2e9ac45aso1903836f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 07:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762876596; x=1763481396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOks1DTqBajKKzUeH18oDqcK+YuzoZOEEjP55ETxcAo=;
        b=cjIqQRjgQDO99mNQhJ3/YCaWwIb6TttF94vuoR0x2cKr9CDejccDqp/N1/akhL5HLU
         w3VQVNZD+Yg7aWehPbL698LcL20fFbTPrW8fKQlsqA9SwzLHRy8hJRXkhv0d23ngUyz0
         hsvcv7dyFUIewWTKFa6oOTQqX7r6kP/Xtaoq/h+ek4qbhtn3TZd4bFlGzGKjH7iygCNY
         bUrfDJEUsjG1SCLf6iZX/nNeUf9XqlhEwNBnQi9L7A8URLO/gvv4j8hlnDMoCvAeHW3H
         2P+fo2DEXolu5+mMNeG1svSNvX2aA0PcGBVI7W/N4TSNDPzfyJrqmonGBRrGDVXN8GK2
         lqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762876596; x=1763481396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XOks1DTqBajKKzUeH18oDqcK+YuzoZOEEjP55ETxcAo=;
        b=aB45bMKsAxERFxhO7I2BpEc42qGdulE7chuPFwkASmr4x+H8Bx26k4H+sZRHbUK/PL
         rH/IaSd3h9sIWdKyglBA1uwdXOlKzVAUdoQqGYM6RL7iAYVfHF9VOJGxTJJ9GMbWG8OT
         PHFCyu19L+73xJwCmaCTAkjdNSocS0Awih79eWR5zIrEKmtN+yCvrJ388zMNPZlE9cVS
         VbNDD0XkMvn2tmYXD1yE9r5VJ3QdBvrf6GlXiAjwjuTJzQ0QWPQIYkxMp7hd/XOF3x7X
         8KpGoONPA+T0sWZgc119A2Q4mEfnMTUTsfLaE68R0vOpFsmJl4ER1CmOGrFxjj1yjeyg
         8PDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjKmr13XssRzlNskJWQSpUJ0UMkF+PbsnpBKhH7wDH6+SP40Xk31S3ZQmi8KlV78vzEezTyb7MiuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjeebtMgS03x4Yd4o0xDt3ZXqYuATJtXHft9ToS1l5unNQvf4Q
	tkHKiz1i/nTmCPcVzca0w2C0KXl4Sku9vn8aLp9Yne7wYHDvY+qOH2AE
X-Gm-Gg: ASbGnctVMS37aUILbV1Whovcdpp61ElfYOCSJ4751ngR87Z5ynde4cZrM5yt7wip+rI
	vayQFnEwY9pjPfGzXEoEUnQ3fCWycN15vgXL3bUCDfsjLM70RiFjgCLJWr9iVBDXBiqLYvddzSn
	LbssENvWVlVLDcevVUo2nPLF1Eq5jaPspWMTET4hvKDIrKoMrtokggyKDpWS8m/9leFC1IcleD0
	RwkHeoKB4rr54NfZ6NLaVSXBVz5gP6GbbUWILwSmh6gw8ggnq7gfEwjjOd/QiJt+S7e/1vBfG5E
	22CyTwO0SksMeWpsrVFF6X0VHhpBkfv4KxCzKqUwqA/xtwqtcU5yae/zFy3qI+gmkr2gzXMO0Ep
	Iwtsa7xx/pQ7RuEkZ/l2x/M7HCzV/ITPISZ9k+uaxxdokjYQSH8p5idkiJshSChlf4Hq0N8uU8j
	CF04vzWWpysUkxZle7dMJsA4gN9BgFQJJKmz53rJVt8LvnLaYdXkQ=
X-Google-Smtp-Source: AGHT+IGr/bTVwBY4nFwQ/0y7Q9ja3kr5eSmTXnyRJaQZxUc8pS8vnJA7PQdFqYGPBqmqGqGAvU2erg==
X-Received: by 2002:a05:6000:42c5:b0:42b:3083:5588 with SMTP id ffacd0b85a97d-42b30835697mr8621639f8f.39.1762876595641;
        Tue, 11 Nov 2025 07:56:35 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42abe63e13csm28676766f8f.19.2025.11.11.07.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 07:56:35 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v4 5/5] clk: en7523: add support for Airoha AN7583 clock
Date: Tue, 11 Nov 2025 16:56:21 +0100
Message-ID: <20251111155623.9024-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251111155623.9024-1-ansuelsmth@gmail.com>
References: <20251111155623.9024-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Airoha AN7583 clock and reset.

Airoha AN7583 SoC have the same register address of EN7581 but implement
different bits and additional base clocks. Also reset are different with
the introduction of 2 dedicated MDIO line and drop of some reset lines.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 259 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 259 insertions(+)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index d98990a157d3..feee0ad20fa8 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -11,6 +11,7 @@
 #include <linux/reset-controller.h>
 #include <dt-bindings/clock/en7523-clk.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
+#include <dt-bindings/reset/airoha,an7583-reset.h>
 
 #define RST_NR_PER_BANK			32
 
@@ -96,6 +97,14 @@ static const u32 bus7581_base[] = { 600000000, 540000000 };
 static const u32 npu7581_base[] = { 800000000, 750000000, 720000000, 600000000 };
 static const u32 crypto_base[] = { 540000000, 480000000 };
 static const u32 emmc7581_base[] = { 200000000, 150000000 };
+/* AN7583 */
+static const u32 gsw7583_base[] = { 540672000, 270336000, 400000000, 200000000 };
+static const u32 emi7583_base[] = { 540672000, 480000000, 400000000, 300000000 };
+static const u32 bus7583_base[] = { 600000000, 540672000, 480000000, 400000000 };
+static const u32 spi7583_base[] = { 100000000, 12500000 };
+static const u32 npu7583_base[] = { 666000000, 800000000, 720000000, 600000000 };
+static const u32 crypto7583_base[] = { 540672000, 400000000 };
+static const u32 emmc7583_base[] = { 150000000, 200000000 };
 
 static const struct en_clk_desc en7523_base_clks[] = {
 	{
@@ -298,6 +307,138 @@ static const struct en_clk_desc en7581_base_clks[] = {
 	}
 };
 
+static const struct en_clk_desc an7583_base_clks[] = {
+	{
+		.id = EN7523_CLK_GSW,
+		.name = "gsw",
+
+		.base_reg = REG_GSW_CLK_DIV_SEL,
+		.base_bits = 2,
+		.base_shift = 8,
+		.base_values = gsw7583_base,
+		.n_base_values = ARRAY_SIZE(gsw7583_base),
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
+		.base_values = emi7583_base,
+		.n_base_values = ARRAY_SIZE(emi7583_base),
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
+		.base_bits = 2,
+		.base_shift = 8,
+		.base_values = bus7583_base,
+		.n_base_values = ARRAY_SIZE(bus7583_base),
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
+		.base_bits = 2,
+		.base_shift = 9,
+		.base_values = npu7583_base,
+		.n_base_values = ARRAY_SIZE(npu7583_base),
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
+		.base_values = crypto7583_base,
+		.n_base_values = ARRAY_SIZE(crypto7583_base),
+	}, {
+		.id = EN7581_CLK_EMMC,
+		.name = "emmc",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+		.base_bits = 1,
+		.base_shift = 13,
+		.base_values = emmc7583_base,
+		.n_base_values = ARRAY_SIZE(emmc7583_base),
+	}, {
+		.id = AN7583_CLK_MDIO0,
+		.name = "mdio0",
+
+		.base_reg = REG_CRYPTO_CLKSRC2,
+
+		.base_value = 25000000,
+
+		.div_bits = 4,
+		.div_shift = 15,
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
+		.div_shift = 19,
+		.div_step = 1,
+		.div_offset = 1,
+	}
+};
+
 static const u16 en7581_rst_ofs[] = {
 	REG_RST_CTRL2,
 	REG_RST_CTRL1,
@@ -361,6 +502,60 @@ static const u16 en7581_rst_map[] = {
 	[EN7581_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
 };
 
+static const u16 an7583_rst_map[] = {
+	/* RST_CTRL2 */
+	[AN7583_XPON_PHY_RST]		= 0,
+	[AN7583_GPON_OLT_RST]		= 1,
+	[AN7583_CPU_TIMER2_RST]		= 2,
+	[AN7583_HSUART_RST]		= 3,
+	[AN7583_UART4_RST]		= 4,
+	[AN7583_UART5_RST]		= 5,
+	[AN7583_I2C2_RST]		= 6,
+	[AN7583_XSI_MAC_RST]		= 7,
+	[AN7583_XSI_PHY_RST]		= 8,
+	[AN7583_NPU_RST]		= 9,
+	[AN7583_TRNG_MSTART_RST]	= 12,
+	[AN7583_DUAL_HSI0_RST]		= 13,
+	[AN7583_DUAL_HSI1_RST]		= 14,
+	[AN7583_DUAL_HSI0_MAC_RST]	= 16,
+	[AN7583_DUAL_HSI1_MAC_RST]	= 17,
+	[AN7583_XPON_XFI_RST]		= 18,
+	[AN7583_WDMA_RST]		= 19,
+	[AN7583_WOE0_RST]		= 20,
+	[AN7583_HSDMA_RST]		= 22,
+	[AN7583_TDMA_RST]		= 24,
+	[AN7583_EMMC_RST]		= 25,
+	[AN7583_SOE_RST]		= 26,
+	[AN7583_XFP_MAC_RST]		= 28,
+	[AN7583_MDIO0]			= 30,
+	[AN7583_MDIO1]			= 31,
+	/* RST_CTRL1 */
+	[AN7583_PCM1_ZSI_ISI_RST]	= RST_NR_PER_BANK + 0,
+	[AN7583_FE_PDMA_RST]		= RST_NR_PER_BANK + 1,
+	[AN7583_FE_QDMA_RST]		= RST_NR_PER_BANK + 2,
+	[AN7583_PCM_SPIWP_RST]		= RST_NR_PER_BANK + 4,
+	[AN7583_CRYPTO_RST]		= RST_NR_PER_BANK + 6,
+	[AN7583_TIMER_RST]		= RST_NR_PER_BANK + 8,
+	[AN7583_PCM1_RST]		= RST_NR_PER_BANK + 11,
+	[AN7583_UART_RST]		= RST_NR_PER_BANK + 12,
+	[AN7583_GPIO_RST]		= RST_NR_PER_BANK + 13,
+	[AN7583_GDMA_RST]		= RST_NR_PER_BANK + 14,
+	[AN7583_I2C_MASTER_RST]		= RST_NR_PER_BANK + 16,
+	[AN7583_PCM2_ZSI_ISI_RST]	= RST_NR_PER_BANK + 17,
+	[AN7583_SFC_RST]		= RST_NR_PER_BANK + 18,
+	[AN7583_UART2_RST]		= RST_NR_PER_BANK + 19,
+	[AN7583_GDMP_RST]		= RST_NR_PER_BANK + 20,
+	[AN7583_FE_RST]			= RST_NR_PER_BANK + 21,
+	[AN7583_USB_HOST_P0_RST]	= RST_NR_PER_BANK + 22,
+	[AN7583_GSW_RST]		= RST_NR_PER_BANK + 23,
+	[AN7583_SFC2_PCM_RST]		= RST_NR_PER_BANK + 25,
+	[AN7583_PCIE0_RST]		= RST_NR_PER_BANK + 26,
+	[AN7583_PCIE1_RST]		= RST_NR_PER_BANK + 27,
+	[AN7583_CPU_TIMER_RST]		= RST_NR_PER_BANK + 28,
+	[AN7583_PCIE_HB_RST]		= RST_NR_PER_BANK + 29,
+	[AN7583_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
+};
+
 static u32 en7523_get_base_rate(const struct en_clk_desc *desc, u32 val)
 {
 	if (!desc->base_bits)
@@ -698,6 +893,57 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	return en7581_reset_register(&pdev->dev, clk_map);
 }
 
+static int an7583_reset_register(struct device *dev, struct regmap *map)
+{
+	struct en_rst_data *rst_data;
+
+	rst_data = devm_kzalloc(dev, sizeof(*rst_data), GFP_KERNEL);
+	if (!rst_data)
+		return -ENOMEM;
+
+	rst_data->bank_ofs = en7581_rst_ofs;
+	rst_data->idx_map = an7583_rst_map;
+	rst_data->map = map;
+
+	rst_data->rcdev.nr_resets = ARRAY_SIZE(an7583_rst_map);
+	rst_data->rcdev.of_xlate = en7523_reset_xlate;
+	rst_data->rcdev.ops = &en7581_reset_ops;
+	rst_data->rcdev.of_node = dev->of_node;
+	rst_data->rcdev.of_reset_n_cells = 1;
+	rst_data->rcdev.owner = THIS_MODULE;
+	rst_data->rcdev.dev = dev;
+
+	return devm_reset_controller_register(dev, &rst_data->rcdev);
+}
+
+static int an7583_clk_hw_init(struct platform_device *pdev,
+			      const struct en_clk_soc_data *soc_data,
+			      struct clk_hw_onecell_data *clk_data)
+{
+	struct device *dev = &pdev->dev;
+	struct regmap *map, *clk_map;
+	void __iomem *base;
+	int err;
+
+	map = syscon_regmap_lookup_by_compatible("airoha,en7581-chip-scu");
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	clk_map = devm_regmap_init_mmio(&pdev->dev, base, &en7523_clk_regmap_config);
+	if (IS_ERR(clk_map))
+		return PTR_ERR(clk_map);
+
+	err = en75xx_register_clocks(dev, soc_data, clk_data, map, clk_map);
+	if (err)
+		return err;
+
+	return an7583_reset_register(dev, clk_map);
+}
+
 static int en7523_clk_probe(struct platform_device *pdev)
 {
 	const struct en_clk_soc_data *soc_data;
@@ -746,9 +992,22 @@ static const struct en_clk_soc_data en7581_data = {
 	.hw_init = en7581_clk_hw_init,
 };
 
+static const struct en_clk_soc_data an7583_data = {
+	.base_clks = an7583_base_clks,
+	/* We increment num_clocks by 1 to account for additional PCIe clock */
+	.num_clocks = ARRAY_SIZE(an7583_base_clks) + 1,
+	.pcie_ops = {
+		.is_enabled = en7581_pci_is_enabled,
+		.enable = en7581_pci_enable,
+		.disable = en7581_pci_disable,
+	},
+	.hw_init = an7583_clk_hw_init,
+};
+
 static const struct of_device_id of_match_clk_en7523[] = {
 	{ .compatible = "airoha,en7523-scu", .data = &en7523_data },
 	{ .compatible = "airoha,en7581-scu", .data = &en7581_data },
+	{ .compatible = "airoha,an7583-scu", .data = &an7583_data },
 	{ /* sentinel */ }
 };
 
-- 
2.51.0


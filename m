Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA04A2E7378
	for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 19:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779994850; cv=none; b=kK7rmua0czYT/hWrzuDXsuD6KV2yQzRFeiCredvzp2z+Hn6I9kZoSU4KRYkxmcYf/C9BTeQ+1WKILcxT+vtdbiYiYhG/r1RHdHcuuT+fvwOa9+NjPkfaYnZY+VoN7rMKPfWSwh2un1uKISVYIenHlmg1lni8pcW1CFmQzYv/FQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779994850; c=relaxed/simple;
	bh=sVKr+Ljd/HgBE//Jn7CsxnMoftVP4dsFFtD2T7Rm8ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pIamXbuEuvbk/Xok5pctnqpHdmchuDHxfdP2Kakus4grkwVEQBAYehLKnYAMNzd66dfLL2MuTEdCqYCdPu/RjJSM+dejuxUU+vUNfSq5a/AsqSiy1LK2ATeYe0v4VDnc9pgg8cu6bwOnZOUhdJyurAMKYlClfeBm+d2Ny6AOq8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CR75kf56; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CR75kf56"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43d77f6092eso7461817f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 28 May 2026 12:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779994822; x=1780599622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HiMpBx8DWnbU+EjwsljF489n6ncux/Jd+DBSD+obYGE=;
        b=CR75kf56x1mzf9iqIdQkv4lInwrev8zOAJYnXLgzVk+jkIXDmjOdS5v63frE0+DzLN
         SwVKOEmpJbQEHNxU969Dk/JBHjr095i5qQwWklTkNMOnNayYuDWOSd0pFE5ytwKk56yK
         mdqxOLo0rE2EvHfBhinjA+s0z5s0FxgGeT1HZ1KC+l6wnGBCbDDkhm+yoBQK41hQuFkV
         OIssC/I+E4nca+pUalEhwW2xGkTODLmDkFOKxggJhXhFtQCakbG2bOJcONsx4PpvtXxc
         hfoKdXMARyr1JV5PuqOCCixA3VaLj9n01R9qUhVZiNT6AAyhrwQE4lMPwaAnFWkc1nAC
         oFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779994822; x=1780599622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HiMpBx8DWnbU+EjwsljF489n6ncux/Jd+DBSD+obYGE=;
        b=Lf/3DXWRrwG5vMISpywbbv4HnKmhtDKCobMQZjxjTdpUNNnh05hfoXZMQPt+t0nSDN
         etGCfWUhS88lm/MhexEqQv3J4FUIZKRa1eWZN9OJNv0W1H8/Mpv7JDt+X1/1aeLrfh2N
         hNupzc6ShoNSpy+c6A2hajmDIWVMVgwKdgewVYAAl0MJE7gq14M5tpfDZtq/wqbP+Gwk
         3IbzgndX56paaRI/8B80WqEhjkNwa6dlRwE3Z8aF4sdHFp2NXvet6Y6L/nt9biCbfjnN
         n5rklBYHsG8xFjw26AO9uPVo210eA3h3ofvNM1W/pbOmR8dk9d/wW8smADeoK7zBNIcK
         CWxw==
X-Forwarded-Encrypted: i=1; AFNElJ9+vvhKexwDw17JbsY/ZyUaiw1rtxYbyNEiFR9WoyGean1Bq2FQmiz8CrZNrMcOQCKgGmEmzMRVF9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCMnzXTw0g6Tbnw0c90WE6PkuDiOXiwgXTcpq8s3ri4iemyYee
	BSCCmf3iajmUxg5fZYQcbO0p5QNd1IyZRMwH3rMNgPS8lXx/NLFaQO4y
X-Gm-Gg: Acq92OHXezy+PStWnSjjt6mlvE6UkTcNITfCe4pIXBYtNS1JmMMF2jucoKc7Qy8ZT8X
	hsczTKNjEw2KlFaPW6oBIWPD3jqdJTcogE4gtOd+A2sw8GJqoDNE9+9ByuIFx+MUsWRQdPW66Ba
	miXoTMLm8tA5xZiQT7tQLCXMJkB4SyIsIqizs38/f5X6hfwl1vAeldRenGdTvTBEybn22gB0LBJ
	ybcQ5tkuy+wOf8vDEVzcunoV4O0UHyRsL6yp7NxSDOseZCc3xnueVCdduEtTb2rpf0TOvfJdWwf
	L8yYeYJ0Gmkm/xDytPuG5EXmK8PC0BnlkqWkt9ewctsxYs2nilwulMvaBrvSkmZg5EJXUUSzfdu
	pj5pnaWGomIoI0AUn9JlF6D9AUoxeJasifyyeSyCzhtvrCj5OspI4O5MCXHzEryayIRZEF4c647
	QH64tkWnwHrQ/X6MjoCnePAHDWSbCdZfN9aQLzCHdYRyZw4D+bkjvjOOsfYqazu3BxuEqJ8LnVP
	UEDe58=
X-Received: by 2002:a05:6000:15e8:b0:43c:fe66:43ec with SMTP id ffacd0b85a97d-45ef03b2240mr623055f8f.14.1779994821575;
        Thu, 28 May 2026 12:00:21 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-42-252-49.retail.telecomitalia.it. [79.42.252.49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45ee2a12a69sm8625408f8f.16.2026.05.28.12.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 12:00:21 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v5 3/3] clk: en7523: add support for Airoha AN7583 clock
Date: Thu, 28 May 2026 20:59:56 +0200
Message-ID: <20260528190000.9164-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528190000.9164-1-ansuelsmth@gmail.com>
References: <20260528190000.9164-1-ansuelsmth@gmail.com>
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
 drivers/clk/clk-en7523.c | 230 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 230 insertions(+)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 087ff4568124..217d5d5f932d 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -10,6 +10,7 @@
 #include <linux/regmap.h>
 #include <linux/reset-controller.h>
 #include <dt-bindings/clock/en7523-clk.h>
+#include <dt-bindings/reset/airoha,an7583-reset.h>
 #include <dt-bindings/reset/airoha,en7523-reset.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
 #include <dt-bindings/clock/econet,en751221-scu.h>
@@ -134,6 +135,14 @@ static const u32 crypto_base[] = { 540000000, 480000000 };
 static const u32 emmc7581_base[] = { 200000000, 150000000 };
 /* EN751221 */
 static const u32 gsw751221_base[] = { 500000000, 250000000, 400000000, 200000000 };
+/* AN7583 */
+static const u32 gsw7583_base[] = { 540672000, 270336000, 400000000, 200000000 };
+static const u32 emi7583_base[] = { 540672000, 480000000, 400000000, 300000000 };
+static const u32 bus7583_base[] = { 600000000, 540672000, 480000000, 400000000 };
+static const u32 spi7583_base[] = { 400000000, 12500000 };
+static const u32 npu7583_base[] = { 666000000, 800000000, 720000000, 600000000 };
+static const u32 crypto7583_base[] = { 540672000, 400000000 };
+static const u32 emmc7583_base[] = { 150000000, 200000000 };
 
 static const struct en_clk_desc en7523_base_clks[] = {
 	{
@@ -336,6 +345,138 @@ static const struct en_clk_desc en7581_base_clks[] = {
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
+		.base_shift = 1,
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
+		.base_shift = 0,
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
@@ -505,6 +646,60 @@ static const u16 en751221_rst_map[] = {
 	[EN751221_USB_PHY_P1_RST]	= 3 * RST_NR_PER_BANK + 7,
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
 static int en7581_reset_register(struct device *dev, void __iomem *base,
 				 const u16 *rst_map, int nr_resets,
 				 const u16 *rst_reg_ofs);
@@ -862,6 +1057,28 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 				     en7581_rst_ofs);
 }
 
+static int an7583_clk_hw_init(struct platform_device *pdev,
+			      struct clk_hw_onecell_data *clk_data)
+{
+	struct device *dev = &pdev->dev;
+	struct regmap *map;
+	void __iomem *base;
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
+	return en7581_reset_register(dev, base, an7583_rst_map,
+				     ARRAY_SIZE(an7583_rst_map),
+				     en7581_rst_ofs);
+}
+
 static enum en_hir get_hw_id(void __iomem *np_base)
 {
 	u32 val = FIELD_GET(REG_HIR_MASK, readl(np_base + REG_HIR));
@@ -1006,6 +1223,18 @@ static const struct en_clk_soc_data en7581_data = {
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
 static const struct en_clk_soc_data en751221_data = {
 	.num_clocks = EN751221_MAX_CLKS,
 	.pcie_ops = {
@@ -1019,6 +1248,7 @@ static const struct en_clk_soc_data en751221_data = {
 static const struct of_device_id of_match_clk_en7523[] = {
 	{ .compatible = "airoha,en7523-scu", .data = &en7523_data },
 	{ .compatible = "airoha,en7581-scu", .data = &en7581_data },
+	{ .compatible = "airoha,an7583-scu", .data = &an7583_data },
 	{ .compatible = "econet,en751221-scu", .data = &en751221_data },
 	{ /* sentinel */ }
 };
-- 
2.53.0


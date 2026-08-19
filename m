Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758653E2AB9
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 22:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787177718; cv=none; b=K/0jZ61RaIHGaseZn5zNzMx+wTX0F04qpZueuiNmHbUswq2Diz7ISRytoJi0cz5xg0zLK9J+hnIRt2tytgeaG0xOSz37tGGZfn7SFGkJhrXnHVuDm7paabPWbwJg2V5eDuUyTDGWztTugNF2arcMDFWcDfDNg/zgguGzW2gQVWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787177718; c=relaxed/simple;
	bh=6Qx6kfMw9tSQYqsPf3PiHLUvAQeX+4N7U0MspCV5iXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=itWxeOhc5bphLmFDxavvH1B2DJfhHrEFrmTVRYREG2wy27mp0SeDf4taABeOldRe+5ZLLyejQL+BcfbfW8MKVebn2TV8SD1RG/0a2FS5HjWYohUN8wN3wvlWI2gu2dDh+3hoPZdVCtqD5CKYTPeVxyD/K5SpWNqi3WnDwAV5HDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8Ov+1YF; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8Ov+1YF"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4998e0916faso12548335e9.2
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 15:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787177715; x=1787782515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4po/BpuVMmSH7orjF22R2xSAn8xfUnzmnHH811uV0xM=;
        b=V8Ov+1YFUrAgNpPEmasDNZ2OcKonM3F5bTBIjFdwOXenRibAGdfHIkzKx8qM6Fuz2z
         M2T7GHNNt8hiqkMmMyyXQ6E3JObBGJeL+wRi6FOLQtZuV8SgU5zCESg76mjAUlTIGqCn
         6QG92EC2qZk8XZlPWNG/26XZWaY3a91WF0OKGK2fGTSrs9gqhwOy1mOh4H2Vnof6sQmY
         Vd8DmNDYI5/jC84H4OiJE58kYVvxZ4FxF7132ToNZ29oSd0zRNvCtCw1OkkB+HLw1Wim
         UpjU0+aliJPkrrVjtoUx1IkFpg//UkaaKokQ9cxadyYqh1DdcABmgJ4ttfMU9Y+TtqsC
         XLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787177715; x=1787782515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4po/BpuVMmSH7orjF22R2xSAn8xfUnzmnHH811uV0xM=;
        b=desJYbXbCqTl1MOlB9/W9vwan0dCK8mYI5nVwhBv6PfvkTVg5t/bURtWQZHRWrfmMl
         JyC2v3UPwq3P/rrO/EvIQGfG2Ww9ZeE0tjNsC9r4wVYpS60trAqdbKOeffKzysMqKhht
         LhInfHKGCfKyp4oQ0NSAR+tAQGl8N2Rloj2TajqCCjy+Ayn8FpiqcuAOJ8KuLq4+TG9z
         PPzUPkcOsPNnztmpl4PIwkWl5znWHw4LHE3Y22l9w5Vj9yqJnUaeEl583YSMnbWNZgl1
         /WVpBvafZ8ItJ7l2WGE2eFR/Z6vPkj7jwsa2bzVXK8H/oiISuD4e39z2qQDvSTw8UFTV
         Sieg==
X-Forwarded-Encrypted: i=1; AHgh+RrQYRoGMidJK98h45b8LyOP8zqxns4WTuRVaYo/UUzLel2sNHSdIepOakOpdjqnC1lXUXD5lP5xGLw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyagbH+YmwscMZUxZMWp1nfgvVnwoZS1iu5rfcB6SzAuVufoQNz
	EnqxYCZ6zfE9RUEqkkyYRDOiL/FiN3Sv9UfXPltQpZpqY4RQA+2o3ZQE
X-Gm-Gg: AR+sD10NXaNHGY/y8KkMnSEAm1v2Oop7rTQXBB9l5/Nt01ZLZ7lB7Hn8buOmyOlqrE8
	KnCTyI9OM/FBocTWheczvnnxPAT7efssMfDX11FhkwpJ2UMxSyj9RjuCNllCYs08G/HJeOB+6qo
	P1U7R3i+RF709kNmeErQxKzb9fWqqdiU0VqILM4wucLp66jvF0/7h8cKfYhurVgI2ujbMBNe3yG
	6PyKSEp1G0o3h69EcEVQocC9kbMCdfPM0Eo74Q5D3i50N7E+GcZhD7Z7wKGW3hVVdDZh9759aQf
	M4ZoLdvMyxZ87/pt9eKmE62vntc2hvSJqJxtCM00Zp+Hgq507TT/ZuoVPXM9lqV8k0+Q6ZAw6eK
	L9VEkVSOv7TBamAHa9ep3yFRoDJN0Cn7/MkWH0nisyEsL0+JOs6L1zjGigXQBotjxGJvKEPC0l1
	GuHpmf+UmHuLg7q5Vpt6B8IeLmOEKB3sKwGxghimWRdNEEu3pFt5G4XqWGpy/6CUEa3Hjk2KYzK
	sRuV0LxgvPpej6ZhB12aABSkporFOGSgrpqDkiihHAuR9SNTxDr/Wg=
X-Received: by 2002:a05:600c:a47:b0:499:726a:a017 with SMTP id 5b1f17b1804b1-499aa14a6ebmr119885875e9.1.1787177714707;
        Wed, 19 Aug 2026 15:15:14 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-7-219.pool21345.interbusiness.it. [213.45.7.219])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-482b14c46f2sm9732950f8f.29.2026.08.19.15.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 15:15:13 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v6 3/3] clk: en7523: add support for Airoha AN7583 clock
Date: Thu, 20 Aug 2026 00:14:56 +0200
Message-ID: <20260819221458.30040-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260819221458.30040-1-ansuelsmth@gmail.com>
References: <20260819221458.30040-1-ansuelsmth@gmail.com>
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
 drivers/clk/clk-en7523.c | 241 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 241 insertions(+)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 924e4f3e36b6..f57541ecef84 100644
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
@@ -135,6 +136,14 @@ static const u32 crypto_base[] = { 540000000, 480000000 };
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
@@ -337,6 +346,138 @@ static const struct en_clk_desc en7581_base_clks[] = {
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
@@ -512,6 +653,64 @@ static const u16 en751221_rst_map[] = {
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
+	[AN7583_MDIO0_RST]		= 30,
+	[AN7583_MDIO1_RST]		= 31,
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
+
+	/* RST_PCIC */
+	[AN7583_PCIC_PERSTOUT0_RST]	= 2 * RST_NR_PER_BANK + 29,
+	[AN7583_PCIC_PERSTOUT1_RST]	= 2 * RST_NR_PER_BANK + 26,
+};
+
 static int en7581_reset_register(struct device *dev, void __iomem *base,
 				 const u16 *rst_map, int nr_resets,
 				 const u16 *rst_reg_ofs);
@@ -885,6 +1084,35 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 				     en7581_rst_ofs);
 }
 
+static int an7583_clk_hw_init(struct platform_device *pdev,
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
+	val = readl(base + REG_RST_CTRL1);
+	val |= REG_PCIE_HB_RST;
+	writel(val, base + REG_RST_CTRL1);
+	val &= ~REG_PCIE_HB_RST;
+	writel(val, base + REG_RST_CTRL1);
+
+	return en7581_reset_register(dev, base, an7583_rst_map,
+				     ARRAY_SIZE(an7583_rst_map),
+				     en7581_rst_ofs);
+}
+
 static enum en_hir get_hw_id(void __iomem *np_base)
 {
 	u32 val = FIELD_GET(REG_HIR_MASK, readl(np_base + REG_HIR));
@@ -1029,6 +1257,18 @@ static const struct en_clk_soc_data en7581_data = {
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
@@ -1042,6 +1282,7 @@ static const struct en_clk_soc_data en751221_data = {
 static const struct of_device_id of_match_clk_en7523[] = {
 	{ .compatible = "airoha,en7523-scu", .data = &en7523_data },
 	{ .compatible = "airoha,en7581-scu", .data = &en7581_data },
+	{ .compatible = "airoha,an7583-scu", .data = &an7583_data },
 	{ .compatible = "econet,en751221-scu", .data = &en751221_data },
 	{ /* sentinel */ }
 };
-- 
2.53.0


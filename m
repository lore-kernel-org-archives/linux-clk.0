Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296480;
	b=w8wn0rdHoZJ5eA06TodhDx41KxB2/LHKYVK5lCpuAgHaS1iQHKa6fmtul656RLHCrrZX
	 0/munvjlwrOYoTOMH1hMDy/e14Du0Y2XDSe8lucDU0Ix6iV7unc3OxneHA8zCPJv9fc3v
	 PSBGtymcB7wIH9O/CPA6Nwojmkia3e0ToXcl34MK13DzHJHOJgGpxqeRmLsfZdF7i9kDq
	 quM5EdeE0TS9clsZe2a8nGYfi/oEZrLQJmqHbDoNny0Ahe5runM/E0VYllmp2WRPV/pSV
	 dkNtr8ddnQ9WnKTFWidP6lH/6LwkbncIhMCqnqOYDBmsPKGSwZva9q9ETM72Svq8vlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9/5Ymjy5oyxeu3PGP7dCUEXnq1SZd70giaXWhsQ5gNA=;
	b=FG32YfZ+Uz0t0vLsULFmmZgmEm9oV/OD49p20XGyfzbYsDrrjMJ6FBmclaIcwma/n9G0
	 V0jzyDEwX496qWZcq9XDy6XKMo1+M9vxtrMoAMLRHuBeNktPynu74necXYXWUiTBVb7/2
	 peBoR6U55E+542eRn5S30YpPJHf7EPYHUZ0wY4zazAyCmQpS0BVf1o2lqKmTFxCeV9VJm
	 SlGoMzmYJFxu9SSWSn+8rMYckZfy9TrOUX6e+4Z9OgcOm8GJAuyVyqUswjFpn8Ct0OpcW
	 KHCbOFbJZjl7+7nvZGRLnBVdCPotQd9eA91AircJB5DzZHIhk1hud9GsCGkgBWFzcIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v9i+Tc1e;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27CE606A699
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 21:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A27CE606A699
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v9i+Tc1e
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso27727505e9.0
        for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 13:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795296478; x=1795901278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/5Ymjy5oyxeu3PGP7dCUEXnq1SZd70giaXWhsQ5gNA=;
        b=v9i+Tc1e0jPCAEQxrC4P9vQvbWdTDpArQZKppgR5DTi1wycrC26DpKNXK8iMuobMLK
         079iqftwxQkIVrtkH2zqumd/pzPyIrEFmUNy705+QJqy70HFT+FA+aPZBAt7z/DMmg73
         6/fr+8aL+A6PLWEGsAUWg3JCvpmhEGkQ0QnYFuVcv1sS9ORgFihNE1Bn/WopN60H7jf8
         EZFIJxlgboUmfn6UHSlCdNRD2q7dhl5G3b6U8jFlqCTW1PVBiMeEtkDED/VAQH7ViGho
         SFfmNVygbmXJUU0bh8UQjQcCAG5tBrXUpDrWUKBXURUR/le9aRdy+JnIkANwegg9fe7C
         KDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296478; x=1795901278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9/5Ymjy5oyxeu3PGP7dCUEXnq1SZd70giaXWhsQ5gNA=;
        b=s6xRGKV9Roba9Ac4+Wxe8Iy0APOM+a56t/AMXmc6X/jKd0dlvTa0q7CiSrLTI5pfEF
         FGFXlAlyEuLfngjJuINWv4D5v9RlbM9z124vwwlaOtFqMOBlWwWTm9/Q4mladP9YkHBJ
         9vomQ+Q9soQ7p7C0XriCYs8kyA6qf0V+AoPgw4MnzlmA9NcnRk2ixkehcvt6FFUuyzSz
         12OvGnd8PtYOM5UlErJSpyd2IffSJ03tH4iaLZFvUfF7rsn5fdKJhBvB/2KxQY30J3li
         9SvfSRpF66u6Nu9AVN4Szk+JyCIbGq/qyE5MiCiaSYETN6aaFUu1o4CRY9qUGlXVL1X5
         d2xg==
X-Forwarded-Encrypted: i=1; AL+hErHCN7hsbot0FCiehEBxt/lAJgs+sMTvZ3EaE1ioSK5SsAjnead2zRUE9tk35CCid/0sHX1ncRLImHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/077yZNT354pGCljxs+fSnJ5rSoJvzhxWyszDiE4UA36N0ASS/
	xVeeeIea94FHBu4GbAHTxgbMu1G70rPrzgGBF/01hNRj5B3dPK3FW61A
X-Gm-Gg: AZFdTZchvbLqVAEFkkSmd+HF7FCwHuUvVsNfBW7qd8cXM7TF0xLhB88r6n8fofYcsaa
	N5Qxy49WQ4GIuJe3501YCu0qCkgzAm3K2kUR0S+nQb4aWp/hO4aZiQAPjFmmjeu6DyikzY8o32Q
	Aes+JBIm4FwYGXwJTt7tTsjExpS0EFLJWu88Y51UxwMvJZ3P1toIfr6k7i8NX2lcEB65h2zwyl8
	qulId503q7P8y+rug6UWRNWGQ4CUm5hDF+vXQyAtISbxoGETO6t6phLmO4893gcmWqqYlWMEHSt
	PY/a/6c1JBgRsnbtKldCqZuquiqIcNnkwoK8OmBgzKyu8rSSzxUpUHu9WWzQCktvzZ7ksXaXWgh
	XmGQy23OV0X56wnVGChypaPrUwbuEZZ3gDVhTDXbPr3q9/nl/cbjKBJRkntP+duhIhkzTe1i0GF
	sHy1t+2n+SGmN64vrADyoTDUEKoT/1859I/tC+SDwfEDNDi+DW6lYq8FghZLQdF/5zN9cyt6IJ9
	pwfYa9f5+wYjJj6ibU7mDLAlXtiVGU0Re9HBlnT6epoA7Twrj07ucwOg12D5xMEnt4jT720lqCX
	umE6mAMp3m4A0jb/s4eJnmIFyFrL7mb3JrP8WeNidtzT3tBvcmntAokoXlkZVKqbpiRMtCUdcaX
	VIzbUc633k8P5Kl1cZDDEqEYWGuPy92ZBYYtwV6tygeJj+zakpNR5NmidlSUQJrrQiN+2QTWu
X-Received: by 2002:a05:600c:848a:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4bb887fb678mr151302725e9.4.1795296478044;
        Sat, 21 Nov 2026 13:27:58 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-87-17-253-173.retail.telecomitalia.it. [87.17.253.173])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm255668955e9.3.2026.11.21.13.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 13:27:57 -0800 (PST)
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
Subject: [PATCH v15 5/5] clk: en7523: add support for Airoha AN7583 clock
Date: Sat, 21 Nov 2026 22:27:35 +0100
Message-ID: <20261121212738.170775-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261121212738.170775-1-ansuelsmth@gmail.com>
References: <20261121212738.170775-1-ansuelsmth@gmail.com>
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

Add support for Airoha AN7583 clock and reset.

Airoha AN7583 SoC have the same register address of EN7581 but implement
different bits and additional base clocks. Also reset are different with
the introduction of 2 dedicated MDIO line and drop of some reset lines.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 248 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 248 insertions(+)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index a4a75b8063a5..d044841cdc05 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -13,6 +13,7 @@
 #include <linux/reset-controller.h>
 #include <linux/spinlock.h>
 #include <dt-bindings/clock/en7523-clk.h>
+#include <dt-bindings/reset/airoha,an7583-reset.h>
 #include <dt-bindings/reset/airoha,en7523-reset.h>
 #include <dt-bindings/reset/airoha,en7581-reset.h>
 #include <dt-bindings/clock/econet,en751221-scu.h>
@@ -167,6 +168,14 @@ static const u32 crypto_base[] = { 540000000, 480000000 };
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
@@ -369,6 +378,138 @@ static const struct en_clk_desc en7581_base_clks[] = {
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
@@ -544,6 +685,64 @@ static const u16 en751221_rst_map[] = {
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
@@ -1144,6 +1343,43 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
 	return en7581_serdes_phy_register(&pdev->dev);
 }
 
+static int an7583_clk_hw_init(struct platform_device *pdev,
+			      struct clk_hw_onecell_data *clk_data)
+{
+	struct en_clk_priv *priv = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+	struct regmap *map;
+	void __iomem *base;
+	u32 val;
+	int ret;
+
+	map = syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,chip-scu");
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	priv->base = base;
+
+	en7581_register_clocks(dev, clk_data, map, base);
+
+	val = readl(base + REG_RST_CTRL1);
+	val |= REG_PCIE_HB_RST;
+	writel(val, base + REG_RST_CTRL1);
+	val &= ~REG_PCIE_HB_RST;
+	writel(val, base + REG_RST_CTRL1);
+
+	ret = en7581_reset_register(dev, base, an7583_rst_map,
+				    ARRAY_SIZE(an7583_rst_map),
+				    en7581_rst_ofs);
+	if (ret)
+		return ret;
+
+	return en7581_serdes_phy_register(dev);
+}
+
 static enum en_hir get_hw_id(void __iomem *np_base)
 {
 	u32 val = FIELD_GET(REG_HIR_MASK, readl(np_base + REG_HIR));
@@ -1300,6 +1536,17 @@ static const struct en_clk_soc_data en7581_data = {
 	.hw_init = en7581_clk_hw_init,
 };
 
+static const struct en_clk_soc_data an7583_data = {
+	.base_clks = an7583_base_clks,
+	.num_clocks = ARRAY_SIZE(an7583_base_clks),
+	.pcie_ops = {
+		.is_enabled = en7581_pci_is_enabled,
+		.enable = en7581_pci_enable,
+		.disable = en7581_pci_disable,
+	},
+	.hw_init = an7583_clk_hw_init,
+};
+
 static const struct en_clk_soc_data en751221_data = {
 	/* Decrease of one as PCIe is incremented internally with PCIe OPs */
 	.num_clocks = EN751221_MAX_CLKS - 1,
@@ -1315,6 +1562,7 @@ static const struct en_clk_soc_data en751221_data = {
 static const struct of_device_id of_match_clk_en7523[] = {
 	{ .compatible = "airoha,en7523-scu", .data = &en7523_data },
 	{ .compatible = "airoha,en7581-scu", .data = &en7581_data },
+	{ .compatible = "airoha,an7583-scu", .data = &an7583_data },
 	{ .compatible = "econet,en751221-scu", .data = &en751221_data },
 	{ /* sentinel */ }
 };
-- 
2.55.0


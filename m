Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795132971;
	b=S/VJVbHUj9q5Cg+De/NA1JeLMDjwnubZlWkfaE+sLlFowMVbUaCmFkdMiAeZaE7lURLY
	 rEKMbCznbEPPX/BZR1Wc/unSiQLhIpvSGtbeyG2AvRpA8PjL0VNR+3o/vGmnIomemTB73
	 gOYFFiFFOS9pP1mA1UIL226yfo+hg7zwWUGvWnWbyk/K2D71uQdaxj1UsL388imaLx5PW
	 njv2DmCB0h/2i6aJTIsK2eLVSbJR2YKgidwymJ1sT2wa6gbQu4VTIEQpe1P2TLpYPT0hJ
	 dqs7tWqlKXomfcFDMztS4VXjNFbXC1FUrptibBrha2DP8DtHF8Wr65/vp8ryySoy8Zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795132971;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=kwALLFqo6VisnswPNL/IWCRObJN9tzxbIwz4f4mrkps=;
	b=vIMTS3HX5khZ+vZ3+iyvuLFuKa7rfKGaJRr5E7F+aFNEF1OfajUlzbjAmHiTN4dfSU5F
	 He+WBh3oF1szcLEaPvJOQGlHGqXzO9f5PU+qfaYBwK6g5wfkh3sfRdLNgTiz/IXZ67Ce0
	 kj5RgvtS31iusp8ULgKsefJQHPUXcafsKnfll20WMYk6hxeX0uLCF6jKmx6H0MmeYMPCB
	 CszWgI9lfwnYxUqOYTGtK8FaPcbimJlvGDspyNcHPU+cyLI9F9rVB4tbyRrXRwuk9CwV0
	 oPlFTEm4fwjyVKtOSnPoOtss5TYDYjAUKgK7Z8zWBPQX+kp+ZNUDoUn5ipja5+UHUOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cHsSxZQn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A3960A261E;
	Fri, 20 Nov 2026 00:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cHsSxZQn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B685A1F000D1;
	Fri, 20 Nov 2026 00:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795132971;
	bh=kwALLFqo6VisnswPNL/IWCRObJN9tzxbIwz4f4mrkps=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=cHsSxZQnF00cJF1C/Oov2Ryku5WsUHH56iOnFfRXmplsHwoZNnQ89j6+H2+ClG2ls
	 YONWHp++ek1Uo5n5VadKs2bixliCLX+j5+hJ04ch+/MhhOtS/8Cdjw5vKP3oArcFVF
	 pqEBm/4maSBy/eLKLVNmypjAq1sTc0qvtm4igHyBUmnGCn4IxqAEogdfJpGHP1IRbT
	 vZZZ5XXgsh92Kc9OGMiISLsPRSFIEx7pzTnKpPQ0BvErJnDVln2dJmckffIUNUifI3
	 5S0ki5N3rhu03K//18ZA99yzVCRYkylWxrwVTfxkCqsiVQdFvs+GF1oLYq8UCQfZ7r
	 f9SMEypyj2ROw==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v13 5/5] clk: en7523: add support for Airoha AN7583
 clock
From: Brian Masney <masneyb@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261117182444.103123-6-ansuelsmth@gmail.com>
References: <20261117182444.103123-1-ansuelsmth@gmail.com>
 <20261117182444.103123-6-ansuelsmth@gmail.com>
Date: Thu, 19 Nov 2026 19:02:30 -0500
Message-Id: <179513295004.301584.12820965897975670200.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=8583; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=qh0Q/XthkF1D2mx/tGC3JFLdzpfMgvweCF9jNR0nATE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLL+9ynx7a1PFmHNOX/7qMopv0lpzm37FfJW2VudZf6wb
 L5Xqmh7RykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABOxMGdk+HTTfOnfZuF3wm0V
 Eisvv3v0Z4PEzByxgFPBz4p/TFu4ppfhn97lU5wvp32rzzXteZGbclDuynWtVd/itm9Z+HrBoQ+
 3tHkA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

> Add support for Airoha AN7583 clock and reset.
> 
> Airoha AN7583 SoC have the same register address of EN7581 but implement
> different bits and additional base clocks. Also reset are different with
> the introduction of 2 dedicated MDIO line and drop of some reset lines.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  drivers/clk/clk-en7523.c | 249 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 249 insertions(+)
>
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index 90bb86427c29..a7cb8dbcb048 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -13,6 +13,7 @@
>  #include <linux/reset-controller.h>
>  #include <linux/spinlock.h>
>  #include <dt-bindings/clock/en7523-clk.h>
> +#include <dt-bindings/reset/airoha,an7583-reset.h>
>  #include <dt-bindings/reset/airoha,en7523-reset.h>
>  #include <dt-bindings/reset/airoha,en7581-reset.h>
>  #include <dt-bindings/clock/econet,en751221-scu.h>
> @@ -167,6 +168,14 @@ static const u32 crypto_base[] = { 540000000, 480000000 };
>  static const u32 emmc7581_base[] = { 200000000, 150000000 };
>  /* EN751221 */
>  static const u32 gsw751221_base[] = { 500000000, 250000000, 400000000, 200000000 };
> +/* AN7583 */
> +static const u32 gsw7583_base[] = { 540672000, 270336000, 400000000, 200000000 };
> +static const u32 emi7583_base[] = { 540672000, 480000000, 400000000, 300000000 };
> +static const u32 bus7583_base[] = { 600000000, 540672000, 480000000, 400000000 };
> +static const u32 spi7583_base[] = { 400000000, 12500000 };
> +static const u32 npu7583_base[] = { 666000000, 800000000, 720000000, 600000000 };
> +static const u32 crypto7583_base[] = { 540672000, 400000000 };
> +static const u32 emmc7583_base[] = { 150000000, 200000000 };
>  
>  static const struct en_clk_desc en7523_base_clks[] = {
>  	{
> @@ -369,6 +378,138 @@ static const struct en_clk_desc en7581_base_clks[] = {
>  	}
>  };
>  
> +static const struct en_clk_desc an7583_base_clks[] = {
> +	{
> +		.id = EN7523_CLK_GSW,
> +		.name = "gsw",
> +
> +		.base_reg = REG_GSW_CLK_DIV_SEL,
> +		.base_bits = 2,
> +		.base_shift = 8,
> +		.base_values = gsw7583_base,
> +		.n_base_values = ARRAY_SIZE(gsw7583_base),
> +
> +		.div_bits = 3,
> +		.div_shift = 0,
> +		.div_step = 1,
> +		.div_offset = 1,
> +	}, {
> +		.id = EN7523_CLK_EMI,
> +		.name = "emi",
> +
> +		.base_reg = REG_EMI_CLK_DIV_SEL,
> +		.base_bits = 2,
> +		.base_shift = 8,
> +		.base_values = emi7583_base,
> +		.n_base_values = ARRAY_SIZE(emi7583_base),
> +
> +		.div_bits = 3,
> +		.div_shift = 0,
> +		.div_step = 1,
> +		.div_offset = 1,
> +	}, {
> +		.id = EN7523_CLK_BUS,
> +		.name = "bus",
> +
> +		.base_reg = REG_BUS_CLK_DIV_SEL,
> +		.base_bits = 2,
> +		.base_shift = 8,
> +		.base_values = bus7583_base,
> +		.n_base_values = ARRAY_SIZE(bus7583_base),
> +
> +		.div_bits = 3,
> +		.div_shift = 0,
> +		.div_step = 1,
> +		.div_offset = 1,
> +	}, {
> +		.id = EN7523_CLK_SLIC,
> +		.name = "slic",
> +
> +		.base_reg = REG_SPI_CLK_FREQ_SEL,
> +		.base_bits = 1,
> +		.base_shift = 1,
> +		.base_values = slic_base,
> +		.n_base_values = ARRAY_SIZE(slic_base),
> +
> +		.div_reg = REG_SPI_CLK_DIV_SEL,
> +		.div_bits = 5,
> +		.div_shift = 24,
> +		.div_val0 = 20,
> +		.div_step = 2,
> +	}, {
> +		.id = EN7523_CLK_SPI,
> +		.name = "spi",
> +
> +		.base_reg = REG_SPI_CLK_FREQ_SEL,
> +		.base_bits = 1,
> +		.base_shift = 0,
> +		.base_values = spi7583_base,
> +		.n_base_values = ARRAY_SIZE(spi7583_base),
> +
> +		.div_reg = REG_SPI_CLK_DIV_SEL,
> +		.div_bits = 5,
> +		.div_shift = 8,
> +		.div_val0 = 40,
> +		.div_step = 2,
> +	}, {
> +		.id = EN7523_CLK_NPU,
> +		.name = "npu",
> +
> +		.base_reg = REG_NPU_CLK_DIV_SEL,
> +		.base_bits = 2,
> +		.base_shift = 9,
> +		.base_values = npu7583_base,
> +		.n_base_values = ARRAY_SIZE(npu7583_base),
> +
> +		.div_bits = 3,
> +		.div_shift = 0,
> +		.div_step = 1,
> +		.div_offset = 1,
> +	}, {
> +		.id = EN7523_CLK_CRYPTO,
> +		.name = "crypto",
> +
> +		.base_reg = REG_CRYPTO_CLKSRC2,
> +		.base_bits = 1,
> +		.base_shift = 0,
> +		.base_values = crypto7583_base,
> +		.n_base_values = ARRAY_SIZE(crypto7583_base),
> +	}, {
> +		.id = EN7581_CLK_EMMC,
> +		.name = "emmc",
> +
> +		.base_reg = REG_CRYPTO_CLKSRC2,
> +		.base_bits = 1,
> +		.base_shift = 13,
> +		.base_values = emmc7583_base,
> +		.n_base_values = ARRAY_SIZE(emmc7583_base),
> +	}, {
> +		.id = AN7583_CLK_MDIO0,
> +		.name = "mdio0",
> +
> +		.base_reg = REG_CRYPTO_CLKSRC2,
> +
> +		.base_value = 25000000,
> +
> +		.div_bits = 4,
> +		.div_shift = 15,
> +		.div_step = 1,
> +		.div_offset = 1,
> +	}, {
> +		.id = AN7583_CLK_MDIO1,
> +		.name = "mdio1",
> +
> +		.base_reg = REG_CRYPTO_CLKSRC2,
> +
> +		.base_value = 25000000,
> +
> +		.div_bits = 4,
> +		.div_shift = 19,
> +		.div_step = 1,
> +		.div_offset = 1,
> +	}
> +};
> +
>  static const u16 en7581_rst_ofs[] = {
>  	REG_RST_CTRL2,
>  	REG_RST_CTRL1,
> @@ -544,6 +685,64 @@ static const u16 en751221_rst_map[] = {
>  	[EN751221_USB_PHY_P1_RST]	= 3 * RST_NR_PER_BANK + 7,
>  };
>  
> +static const u16 an7583_rst_map[] = {
> +	/* RST_CTRL2 */
> +	[AN7583_XPON_PHY_RST]		= 0,
> +	[AN7583_GPON_OLT_RST]		= 1,
> +	[AN7583_CPU_TIMER2_RST]		= 2,
> +	[AN7583_HSUART_RST]		= 3,
> +	[AN7583_UART4_RST]		= 4,
> +	[AN7583_UART5_RST]		= 5,
> +	[AN7583_I2C2_RST]		= 6,
> +	[AN7583_XSI_MAC_RST]		= 7,
> +	[AN7583_XSI_PHY_RST]		= 8,
> +	[AN7583_NPU_RST]		= 9,
> +	[AN7583_TRNG_MSTART_RST]	= 12,
> +	[AN7583_DUAL_HSI0_RST]		= 13,
> +	[AN7583_DUAL_HSI1_RST]		= 14,
> +	[AN7583_DUAL_HSI0_MAC_RST]	= 16,
> +	[AN7583_DUAL_HSI1_MAC_RST]	= 17,
> +	[AN7583_XPON_XFI_RST]		= 18,
> +	[AN7583_WDMA_RST]		= 19,
> +	[AN7583_WOE0_RST]		= 20,
> +	[AN7583_HSDMA_RST]		= 22,
> +	[AN7583_TDMA_RST]		= 24,
> +	[AN7583_EMMC_RST]		= 25,
> +	[AN7583_SOE_RST]		= 26,
> +	[AN7583_XFP_MAC_RST]		= 28,
> +	[AN7583_MDIO0_RST]		= 30,
> +	[AN7583_MDIO1_RST]		= 31,
> +	/* RST_CTRL1 */
> +	[AN7583_PCM1_ZSI_ISI_RST]	= RST_NR_PER_BANK + 0,
> +	[AN7583_FE_PDMA_RST]		= RST_NR_PER_BANK + 1,
> +	[AN7583_FE_QDMA_RST]		= RST_NR_PER_BANK + 2,
> +	[AN7583_PCM_SPIWP_RST]		= RST_NR_PER_BANK + 4,
> +	[AN7583_CRYPTO_RST]		= RST_NR_PER_BANK + 6,
> +	[AN7583_TIMER_RST]		= RST_NR_PER_BANK + 8,
> +	[AN7583_PCM1_RST]		= RST_NR_PER_BANK + 11,
> +	[AN7583_UART_RST]		= RST_NR_PER_BANK + 12,
> +	[AN7583_GPIO_RST]		= RST_NR_PER_BANK + 13,
> +	[AN7583_GDMA_RST]		= RST_NR_PER_BANK + 14,
> +	[AN7583_I2C_MASTER_RST]		= RST_NR_PER_BANK + 16,
> +	[AN7583_PCM2_ZSI_ISI_RST]	= RST_NR_PER_BANK + 17,
> +	[AN7583_SFC_RST]		= RST_NR_PER_BANK + 18,
> +	[AN7583_UART2_RST]		= RST_NR_PER_BANK + 19,
> +	[AN7583_GDMP_RST]		= RST_NR_PER_BANK + 20,
> +	[AN7583_FE_RST]			= RST_NR_PER_BANK + 21,
> +	[AN7583_USB_HOST_P0_RST]	= RST_NR_PER_BANK + 22,
> +	[AN7583_GSW_RST]		= RST_NR_PER_BANK + 23,
> +	[AN7583_SFC2_PCM_RST]		= RST_NR_PER_BANK + 25,
> +	[AN7583_PCIE0_RST]		= RST_NR_PER_BANK + 26,
> +	[AN7583_PCIE1_RST]		= RST_NR_PER_BANK + 27,
> +	[AN7583_CPU_TIMER_RST]		= RST_NR_PER_BANK + 28,
> +	[AN7583_PCIE_HB_RST]		= RST_NR_PER_BANK + 29,
> +	[AN7583_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
> +
> +	/* RST_PCIC */
> +	[AN7583_PCIC_PERSTOUT0_RST]	= 2 * RST_NR_PER_BANK + 29,
> +	[AN7583_PCIC_PERSTOUT1_RST]	= 2 * RST_NR_PER_BANK + 26,
> +};
> +
>  static int en7581_reset_register(struct device *dev, void __iomem *base,
>  				 const u16 *rst_map, int nr_resets,
>  				 const u16 *rst_reg_ofs);
> @@ -1149,6 +1348,43 @@ static int en7581_clk_hw_init(struct platform_device *pdev,
>  	return en7581_serdes_phy_register(&pdev->dev);
>  }
>  
> +static int an7583_clk_hw_init(struct platform_device *pdev,
> +			      struct clk_hw_onecell_data *clk_data)
> +{
> +	struct en_clk_priv *priv = platform_get_drvdata(pdev);
> +	struct device *dev = &pdev->dev;
> +	struct regmap *map;
> +	void __iomem *base;
> +	u32 val;
> +	int ret;
> +
> +	map = syscon_regmap_lookup_by_phandle(dev->of_node, "airoha,chip-scu");
> +	if (IS_ERR(map))
> +		return PTR_ERR(map);
> +
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	priv->base = base;
> +
> +	en7581_register_clocks(dev, clk_data, map, base);

The Sashiko output looks legit here about the missing .set_rate,
.round_rate, or .determine_rate callbacks.

Brian

-- 
Brian Masney <masneyb@kernel.org>

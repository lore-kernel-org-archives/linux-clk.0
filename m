Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833120;
	b=Jr4rKdSMPzwVLUIu2MbrYaRM+Vq/1YOgJS7EXd+VsIe/tu04ckq9PdbiwO9AF/UzTCiv
	 eXSnlQ2vVAzfQHSri9CSDxXMe8ap9hldU9Ei0S8AKdx4BBsMx2asMOZkT/pJLyUxN3nbr
	 CX9WUyR4y4x1SxkbVwiEK1xLWdHl0+xRq0Rr2kNQlZIewd8K+zveDp7XlZUaugZ6UfVwl
	 QCMAcQzG0P1LtOZguOgRFOUG3AJ5XQp4p28qEXENja+VWl77Umu7NHgeuzZQbEUkzN1fH
	 Co01RIgobbdThkZ+zildeyPtXXD/Tz8cPzY8fDQLaqMZsyPoDb6JsWggwmRq7kUWQEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833120;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=eiBJTBFQf9YAHwnC/I4w5TIHr7VLqlllu3kFhUbXiHo=;
	b=R1d0Yq+gEzc2NYdHH0bTEspynsJfhIoOY2hAK9Ql5lu6k95juI/KQo4LlE05RItfp4Pe
	 Bmd/8mm82Dxg2pRcKFx12IqAnC22F/TpuuKB6UGG85oDGOaj8faSnuj4v/iK0lZPPCFHX
	 x2G3stzL4mydtv4wfs1aB41He/kDp/Avva6sJ90Rd+gvrIxlILPKr4z6ST1sa5Ad/XwlU
	 uTzKgRXTyy4pyeecU7SWYi1rWHWU4Hk+CHaGRNkNLwM6yvvReBQNuIGWYvYqnD7kvyScR
	 T1hajcn7qsh6OxNeY+DzyWj/956r+Q9jPaOVtliSl97XqItyxsdD0pn6f/pmMDpWNsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="QBp+Q/qh";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532E8606A31B;
	Wed,  4 Nov 2026 22:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QBp+Q/qh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B8611F00919;
	Wed,  4 Nov 2026 22:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793833119;
	bh=eiBJTBFQf9YAHwnC/I4w5TIHr7VLqlllu3kFhUbXiHo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=QBp+Q/qhkqA49iE7hiEg/DOPNKq5TQ1YfoV6HAYBX9eLL8IncwIhpt2MS6U7l2iyb
	 inRB6aD3jPHr56MTukOaxT9I1PKFaGi7Ff3cMXzp4t1cSBS3rmEoqrHvb0PZOXlDgt
	 Wu/4JJpphQPXkNab1PPV3SILD29P2dA4PgZPU3krN+JPumBkRkmc2OVip5Y8B5Bd+3
	 sm2RRs7FDpCjahRKFcW0cgBLaZFJbxFuPBmIfGUhdEc6xATf1MWMe7NK2o0j77fJUT
	 5f4rWlEbhIINIBUzAoXT5KijQC4tPhRVNRqcu3fnIC/BIw4ewQ9M7tq8dhZKDYVeTA
	 c7/JwA/ckXsYg==
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
Subject: Re: [PATCH v2 5/7] clk: stm32mp25: add clock for D3 peripherals
 allocation for Cortex-CM0
From: Brian Masney <masneyb@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gwenael Treuveur <gwenael.treuveur@foss.st.com>, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261023-ups_mp25_clk_update-v2-5-398d348ea8fd@foss.st.com>
References: <20261023-ups_mp25_clk_update-v2-0-398d348ea8fd@foss.st.com>
 <20261023-ups_mp25_clk_update-v2-5-398d348ea8fd@foss.st.com>
Date: Wed, 04 Nov 2026 17:58:29 -0500
Message-Id: <179383310949.724795.2248553531492904727.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=7845; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=SEVQkXUfKjajYOiqgWTGq0lvvrHvIZ320IKGWJ0E/t8=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJe75iZFKDqefrMc177a1eCL614ctqoMDojSGOHmOSZ9
 c131GbodpSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRDcYM/6y95VJDpxf9kl5/
 0uvverfNe+a2/hYK/s3J8+xp31/ZaiGGv/IMrMJHjOaHP3Ca0bzr5pXp8Vs59WPK6hilvruwzjg
 xgw8A
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Gabriel,

> GATE_<IP>AM allows to enable the Autonomous Mode of the D3 peripherals.
> GATE_<IP>C3 allows to enable the allocation of the peripherals to CPU3.
> 
> For any D3 peripheral allocated to CPU3 (CPU3 domain is used and AMEN),
> MSIKERON must be set to allow the Stop modes. That is why all the
> autonomous clocks have the MSI KER clock as their parent.
> 
> Add the HSI KER, HSE KER and MSI KER clocks as new RCC input clocks and
> register the C3 reset.
> 
> Update the number of clocks of the provider to cover the new IDs.
> 
> Signed-off-by: Gwenael Treuveur <gwenael.treuveur@foss.st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  drivers/clk/stm32/clk-stm32mp25.c | 176 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 175 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
> index 59abac0cc56a..3199cf18f4d3 100644
> --- a/drivers/clk/stm32/clk-stm32mp25.c
> +++ b/drivers/clk/stm32/clk-stm32mp25.c
> @@ -18,7 +18,7 @@
>  #include <dt-bindings/reset/st,stm32mp25-rcc.h>
>  
>  /* Number of clock identifiers of the binding, SCMI ones excluded: highest ID + 1 */
> -#define STM32MP25_LAST_CLK	(HSE_DIV2_CK + 1)
> +#define STM32MP25_LAST_CLK	(CK_SPI8_AM + 1)
>  
>  /* Clock security definition */
>  #define SECF_NONE		-1
> @@ -38,6 +38,7 @@
>  /* Register: RIFSC_SEMCR */
>  #define RCC_SEMCR_SEMCID_MASK	GENMASK(6, 4)
>  
> +#define MP25_RIF_RCC_C3		72
>  #define MP25_RIF_RCC_IS2M	107
>  #define MP25_RIF_RCC_MCO1	108
>  #define MP25_RIF_RCC_MCO2	109
> @@ -126,6 +127,9 @@ enum {
>  	TIMG2,
>  	PLL3,
>  	DSI_TXBYTE,
> +	HSI_KER_ON,
> +	HSE_KER_ON,
> +	MSI_KER_ON,
>  };
>  
>  static const struct clk_parent_data adc12_src[] = {
> @@ -225,6 +229,10 @@ enum enum_gate_cfg {
>  	GATE_ADC12,
>  	GATE_ADC3,
>  	GATE_ADF1,
> +	GATE_ADF1AM,
> +	GATE_ADF1C3,
> +	GATE_C3,
> +	GATE_C3AM,
>  	GATE_CCI,
>  	GATE_CRC,
>  	GATE_CRYP1,
> @@ -249,6 +257,7 @@ enum enum_gate_cfg {
>  	GATE_ETHSWMAC,
>  	GATE_ETHSWREF,
>  	GATE_FDCAN,
> +	GATE_GPIOZC3,
>  	GATE_GPU,
>  	GATE_HASH,
>  	GATE_HDP,
> @@ -260,22 +269,35 @@ enum enum_gate_cfg {
>  	GATE_I2C6,
>  	GATE_I2C7,
>  	GATE_I2C8,
> +	GATE_I2C8AM,
> +	GATE_I2C8C3,
>  	GATE_I3C1,
>  	GATE_I3C2,
>  	GATE_I3C3,
>  	GATE_I3C4,
> +	GATE_I3C4AM,
> +	GATE_I3C4C3,
>  	GATE_IS2M,
>  	GATE_IWDG1,
>  	GATE_IWDG2,
>  	GATE_IWDG3,
>  	GATE_IWDG4,
>  	GATE_IWDG5,
> +	GATE_LPDMAC3,
>  	GATE_LPTIM1,
>  	GATE_LPTIM2,
>  	GATE_LPTIM3,
> +	GATE_LPTIM3AM,
> +	GATE_LPTIM3C3,
>  	GATE_LPTIM4,
> +	GATE_LPTIM4AM,
> +	GATE_LPTIM4C3,
>  	GATE_LPTIM5,
> +	GATE_LPTIM5AM,
> +	GATE_LPTIM5C3,
>  	GATE_LPUART1,
> +	GATE_LPUART1AM,
> +	GATE_LPUART1C3,
>  	GATE_LTDC,
>  	GATE_LVDS,
>  	GATE_MCO1,
> @@ -285,6 +307,7 @@ enum enum_gate_cfg {
>  	GATE_PCIE,
>  	GATE_PKA,
>  	GATE_RNG,
> +	GATE_RTCC3,
>  	GATE_SAES,
>  	GATE_SAI1,
>  	GATE_SAI2,
> @@ -303,6 +326,8 @@ enum enum_gate_cfg {
>  	GATE_SPI6,
>  	GATE_SPI7,
>  	GATE_SPI8,
> +	GATE_SPI8AM,
> +	GATE_SPI8C3,
>  	GATE_TIM1,
>  	GATE_TIM10,
>  	GATE_TIM11,
> @@ -354,6 +379,10 @@ static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
>  	GATE_CFG(GATE_ADC12,		RCC_ADC12CFGR,		1,	0),
>  	GATE_CFG(GATE_ADC3,		RCC_ADC3CFGR,		1,	0),
>  	GATE_CFG(GATE_ADF1,		RCC_ADF1CFGR,		1,	0),
> +	GATE_CFG(GATE_ADF1AM,		RCC_ADF1CFGR,		3,	0),
> +	GATE_CFG(GATE_ADF1C3,		RCC_C3CFGR,		23,	0),
> +	GATE_CFG(GATE_C3,		RCC_C3CFGR,		1,	0),
> +	GATE_CFG(GATE_C3AM,		RCC_C3CFGR,		3,	0),
>  	GATE_CFG(GATE_CCI,		RCC_CCICFGR,		1,	0),
>  	GATE_CFG(GATE_CRC,		RCC_CRCCFGR,		1,	0),
>  	GATE_CFG(GATE_CRYP1,		RCC_CRYP1CFGR,		1,	0),
> @@ -378,6 +407,7 @@ static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
>  	GATE_CFG(GATE_ETHSWMAC,		RCC_ETHSWCFGR,		1,	0),
>  	GATE_CFG(GATE_ETHSWREF,		RCC_ETHSWCFGR,		21,	0),
>  	GATE_CFG(GATE_FDCAN,		RCC_FDCANCFGR,		1,	0),
> +	GATE_CFG(GATE_GPIOZC3,		RCC_C3CFGR,		24,	0),
>  	GATE_CFG(GATE_GPU,		RCC_GPUCFGR,		1,	0),
>  	GATE_CFG(GATE_HASH,		RCC_HASHCFGR,		1,	0),
>  	GATE_CFG(GATE_HDP,		RCC_HDPCFGR,		1,	0),
> @@ -389,22 +419,35 @@ static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
>  	GATE_CFG(GATE_I2C6,		RCC_I2C6CFGR,		1,	0),
>  	GATE_CFG(GATE_I2C7,		RCC_I2C7CFGR,		1,	0),
>  	GATE_CFG(GATE_I2C8,		RCC_I2C8CFGR,		1,	0),
> +	GATE_CFG(GATE_I2C8AM,		RCC_I2C8CFGR,		3,	0),
> +	GATE_CFG(GATE_I2C8C3,		RCC_C3CFGR,		21,	0),
>  	GATE_CFG(GATE_I3C1,		RCC_I3C1CFGR,		1,	0),
>  	GATE_CFG(GATE_I3C2,		RCC_I3C2CFGR,		1,	0),
>  	GATE_CFG(GATE_I3C3,		RCC_I3C3CFGR,		1,	0),
>  	GATE_CFG(GATE_I3C4,		RCC_I3C4CFGR,		1,	0),
> +	GATE_CFG(GATE_I3C4AM,		RCC_I3C4CFGR,		3,	0),
> +	GATE_CFG(GATE_I3C4C3,		RCC_C3CFGR,		27,	0),
>  	GATE_CFG(GATE_IS2M,		RCC_IS2MCFGR,		1,	0),
>  	GATE_CFG(GATE_IWDG1,		RCC_IWDG1CFGR,		1,	0),
>  	GATE_CFG(GATE_IWDG2,		RCC_IWDG2CFGR,		1,	0),
>  	GATE_CFG(GATE_IWDG3,		RCC_IWDG3CFGR,		1,	0),
>  	GATE_CFG(GATE_IWDG4,		RCC_IWDG4CFGR,		1,	0),
>  	GATE_CFG(GATE_IWDG5,		RCC_IWDG5CFGR,		1,	0),
> +	GATE_CFG(GATE_LPDMAC3,		RCC_C3CFGR,		25,	0),
>  	GATE_CFG(GATE_LPTIM1,		RCC_LPTIM1CFGR,		1,	0),
>  	GATE_CFG(GATE_LPTIM2,		RCC_LPTIM2CFGR,		1,	0),
>  	GATE_CFG(GATE_LPTIM3,		RCC_LPTIM3CFGR,		1,	0),
> +	GATE_CFG(GATE_LPTIM3AM,		RCC_LPTIM3CFGR,		3,	0),
> +	GATE_CFG(GATE_LPTIM3C3,		RCC_C3CFGR,		16,	0),
>  	GATE_CFG(GATE_LPTIM4,		RCC_LPTIM4CFGR,		1,	0),
> +	GATE_CFG(GATE_LPTIM4AM,		RCC_LPTIM4CFGR,		3,	0),
> +	GATE_CFG(GATE_LPTIM4C3,		RCC_C3CFGR,		17,	0),
>  	GATE_CFG(GATE_LPTIM5,		RCC_LPTIM5CFGR,		1,	0),
> +	GATE_CFG(GATE_LPTIM5AM,		RCC_LPTIM5CFGR,		3,	0),
> +	GATE_CFG(GATE_LPTIM5C3,		RCC_C3CFGR,		18,	0),
>  	GATE_CFG(GATE_LPUART1,		RCC_LPUART1CFGR,	1,	0),
> +	GATE_CFG(GATE_LPUART1AM,	RCC_LPUART1CFGR,	3,	0),
> +	GATE_CFG(GATE_LPUART1C3,	RCC_C3CFGR,		20,	0),
>  	GATE_CFG(GATE_LTDC,		RCC_LTDCCFGR,		1,	0),
>  	GATE_CFG(GATE_LVDS,		RCC_LVDSCFGR,		1,	0),
>  	GATE_CFG(GATE_MCO1,		RCC_MCO1CFGR,		8,	0),
> @@ -413,6 +456,7 @@ static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
>  	GATE_CFG(GATE_OSPIIOM,		RCC_OSPIIOMCFGR,	1,	0),
>  	GATE_CFG(GATE_PCIE,		RCC_PCIECFGR,		1,	0),
>  	GATE_CFG(GATE_PKA,		RCC_PKACFGR,		1,	0),
> +	GATE_CFG(GATE_RTCC3,		RCC_C3CFGR,		26,	0),

In enum_gate_cfg, GATE_RTCC3 comes after GATE_RNG, but here it is
placed before GATE_RNG. Keep the same order.

>  	GATE_CFG(GATE_RNG,		RCC_RNGCFGR,		1,	0),
>  	GATE_CFG(GATE_SAES,		RCC_SAESCFGR,		1,	0),
>  	GATE_CFG(GATE_SAI1,		RCC_SAI1CFGR,		1,	0),
> @@ -432,6 +476,8 @@ static const struct stm32_gate_cfg stm32mp25_gates[GATE_NB] = {
>  	GATE_CFG(GATE_SPI6,		RCC_SPI6CFGR,		1,	0),
>  	GATE_CFG(GATE_SPI7,		RCC_SPI7CFGR,		1,	0),
>  	GATE_CFG(GATE_SPI8,		RCC_SPI8CFGR,		1,	0),
> +	GATE_CFG(GATE_SPI8AM,		RCC_SPI8CFGR,		3,	0),
> +	GATE_CFG(GATE_SPI8C3,		RCC_C3CFGR,		19,	0),
>  	GATE_CFG(GATE_TIM1,		RCC_TIM1CFGR,		1,	0),
>  	GATE_CFG(GATE_TIM10,		RCC_TIM10CFGR,		1,	0),
>  	GATE_CFG(GATE_TIM11,		RCC_TIM11CFGR,		1,	0),
> @@ -518,6 +564,77 @@ static struct clk_stm32_gate ck_ker_adf1 = {
>  	.hw.init = CLK_HW_INIT_INDEX("ck_ker_adf1", FLEXGEN_42, &clk_stm32_gate_ops, 0),
>  };
>  
> +static struct clk_stm32_gate ck_ker_adf1_am = {
> +	.gate_id = GATE_ADF1AM,
> +	.hw.init = CLK_HW_INIT_HW("ck_ker_adf1_am", &ck_ker_adf1.hw, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* C3 */
> +static struct clk_stm32_gate ck_cpu3 = {
> +	.gate_id = GATE_C3,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_cpu3", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_cpu3_am = {
> +	.gate_id = GATE_C3AM,
> +	.hw.init = CLK_HW_INIT_HW("ck_cpu3_am", &ck_cpu3.hw, &clk_stm32_gate_ops, 0),

Should these two clocks have CLK_IGNORE_UNUSED? set?

Brian

-- 
Brian Masney <masneyb@kernel.org>

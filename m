Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF57F19ABAB
	for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 15:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743090698; cv=none; b=RUuwi00LvB2M62ORsiu7T63JkNPYEUNWzSGlY33LjtHURwdwugpdPNtFQLTzjucpuX6Hf+JOzxXHtpMTnCX1rC1ccbWMfsz/y/pdgZVlQ3HMorDioxL45n5Ay+IeY2qM0lVEVM/+yTmtog3KsjYirorf5t4dnoyqS+QkzxnxfKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743090698; c=relaxed/simple;
	bh=vAe2BAzY2N92NxfakxIQcqxIPERdP0ngW1a3+ysyFHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvbRFSmiZm3MyEoNniskQKDGuvFTxD3nQBvtb2Q0cPMuV8Hps+vXhhDz1Edtqe5RUyl499BlCIZqmIJELA7k1SXc5nP/ecbrYKvkXlaOOMEgJ3Ar1mz8ltNoncAPcvNi8Dw6Qi1s+XbZP56MMUz6IjtDbrw3M1SphKBV0Xvl2+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XMJqGF0X; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XMJqGF0X"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39bf44be22fso400909f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 27 Mar 2025 08:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743090695; x=1743695495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kvLQrI2Qd2ZzqbCiSE0lDUusdYHeIhg6Scc6MGNUp1U=;
        b=XMJqGF0X9ra/xTBrzOGtSLuJm+2hemfK5eZr+B8fyPlGyrzEwONnwP4LJ/fJnTFgJY
         8/pGEutXpZtf2PUVlzSPeUj1wBh3p1eFYnoLeUwp+Zg8lfnUdjevztx6G2Lf3Sd8wvRo
         INRq0n1UOeYMfTd3BxA+6C2uQfIyCbhKNGjZ+/XNvjnYe6KQOZrPsBdHpzhD7cmblQjW
         8Eo1GIowjsgluks5XtB2ox+GAqsWMVl8FH3vQkmqmQ8ZdSWaauFPM7GCzLdADR4X9dFa
         J4okn7qkDMjpWb4D19wye058vyC97j5GWZ1mlg4mkhCNvws6APHl2VPDwWx0g72wpT4R
         o2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743090695; x=1743695495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kvLQrI2Qd2ZzqbCiSE0lDUusdYHeIhg6Scc6MGNUp1U=;
        b=GZPMcfBXUNiQRjaJz2SYFXr+ZhLvRORuOZfam7iUxxlDN6m2qZ0PCAJr62yu8gvxEz
         z3xDkBRWDBUSorIjq5CcmpBcDfjlzjaWantNeAA08oJ7i7igOoVbFJPoKVDtJk6xAZYb
         F1ndun8bhz0/gCeQWPXsq35OJ4J2J0P3U9h/ECxqwZlBBOADn++Y7MW57JSYr8gmaW+R
         3LFNfIzj7ice6f6rMAJzTd7pv4gpS5kREk4w8zB+LjHPXZecywwEAkCnnYGpBvF6A0tJ
         f4d5RavIMd9yJv7TQydvZ38sIY5Ty+g6Czw0lUK2kJXxl8T6gCS+KRxr+4bcjWi9/2mi
         I+OA==
X-Forwarded-Encrypted: i=1; AJvYcCVHWMbdP+3iE09oOdEq+z+4N0ixhrQgDag4ptaK8HDYc7c7quXzXGUmdihrxAYg/Eq2z9TXNgOTtM8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwNv04ocl6nTI1kgjKwmJBfCct0pVBaNCN119Y8CZr7cvqjvEY
	9A+GwNX+yJN6dYC4EhGbG+Vgad5rskaLG2dvJBZ8/wwTZjAk/0PBLqcvVGhJ/aQ=
X-Gm-Gg: ASbGnctu5+2C0RixjbVCNRHL+HHZNZ7EC+gW+1j3XMDgp7ZARA3V+8QVHTBKT3CKMYm
	WWKnmKp9X3GDSYuAE/TLqVFeqANWPahJvO6HmCyotMniPMVLQIWwroy8ACBCjn4X55exS8Kgi37
	wcRMlNaQt7gGAMDddBM/OpR9Nkx3ypSK526/CQ3tZ5eFX/laPmvjPySrCQfibDAcGe5zpgNFqQp
	Nx0ah2Y1A2xK1HgvIJpGU6cybfDFfBdsYGDT0R1zQR+Qt2j6l0sO51wUefmgiyhmU0cRJh9WQbU
	xsypMl60i8LlKuRKqLH28PEzt7ZYX3dRfO1BgMUGXSZONm1Gb0Ym20fEICF81PBXDb05NnnG3d+
	O9h2S/ABmHQ==
X-Google-Smtp-Source: AGHT+IGEOPuBwOnlQZwn7egIILmy4OvFd8oBZAN1W6IrnJklr7xjZZaKwIAxHQnmoX4bC4rGyQDzNQ==
X-Received: by 2002:a05:6000:2a7:b0:391:bed:ec9e with SMTP id ffacd0b85a97d-39ad1718621mr3637240f8f.0.1743090695191;
        Thu, 27 Mar 2025 08:51:35 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39ad0c6bae8sm4191678f8f.68.2025.03.27.08.51.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 08:51:34 -0700 (PDT)
Message-ID: <ddcaa5e5-b5c5-4d78-b44a-4cea75ec6a77@linaro.org>
Date: Thu, 27 Mar 2025 15:51:33 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/18] clk: qcom: clk-alpha-pll: Add support for common
 PLL configuration function
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250327-videocc-pll-multi-pd-voting-v3-0-895fafd62627@quicinc.com>
 <20250327-videocc-pll-multi-pd-voting-v3-4-895fafd62627@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250327-videocc-pll-multi-pd-voting-v3-4-895fafd62627@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/03/2025 09:52, Jagadeesh Kona wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> To properly configure the PLLs on recent chipsets, it often requires more
> than one power domain to be kept ON. The support to enable multiple power
> domains is being added in qcom_cc_really_probe() and PLLs should be
> configured post all the required power domains are enabled.
> 
> Hence integrate PLL configuration into clk_alpha_pll structure and add
> support for qcom_clk_alpha_pll_configure() function which can be called
> from qcom_cc_really_probe() to configure the clock controller PLLs after
> all required power domains are enabled.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>   drivers/clk/qcom/clk-alpha-pll.c | 63 ++++++++++++++++++++++++++++++++++++++++
>   drivers/clk/qcom/clk-alpha-pll.h |  3 ++
>   2 files changed, 66 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index cec0afea8e446010f0d4140d4ef63121706dde47..8ee842254e6690e24469053cdbd99a9953987e40 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -63,6 +63,8 @@
>   #define PLL_OPMODE(p)		((p)->offset + (p)->regs[PLL_OFF_OPMODE])
>   #define PLL_FRAC(p)		((p)->offset + (p)->regs[PLL_OFF_FRAC])
>   
> +#define GET_PLL_TYPE(pll)	(((pll)->regs - clk_alpha_pll_regs[0]) / PLL_OFF_MAX_REGS)
> +
>   const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
>   	[CLK_ALPHA_PLL_TYPE_DEFAULT] =  {
>   		[PLL_OFF_L_VAL] = 0x04,
> @@ -2960,3 +2962,64 @@ const struct clk_ops clk_alpha_pll_regera_ops = {
>   	.set_rate = clk_zonda_pll_set_rate,
>   };
>   EXPORT_SYMBOL_GPL(clk_alpha_pll_regera_ops);
> +
> +void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap)
> +{
> +	const struct clk_init_data *init = pll->clkr.hw.init;
> +	const char *name = init->name;
> +
> +	if (!pll->config || !pll->regs) {
> +		pr_err("%s: missing pll config or regs\n", name);
> +		return;
> +	}

Seems like a strange check - you are calling this function in a loop 
which looks like

for (i = 0; i < desc->num_alpha_plls; i++)
	qcom_clk_alpha_pll_configure(desc->alpha_plls[i], regmap);

Can num_alpha_plls be true but alpha_plls be NULL and why is regmap 
considered valid ?

I think you can drop this check.

> +
> +	switch (GET_PLL_TYPE(pll)) {
> +	case CLK_ALPHA_PLL_TYPE_LUCID_OLE:
> +		clk_lucid_ole_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_LUCID_EVO:
> +		clk_lucid_evo_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_TAYCAN_ELU:
> +		clk_taycan_elu_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_RIVIAN_EVO:
> +		clk_rivian_evo_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_TRION:
> +		clk_trion_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_HUAYRA_2290:
> +		clk_huayra_2290_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_FABIA:
> +		clk_fabia_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_AGERA:
> +		clk_agera_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_PONGO_ELU:
> +		clk_pongo_elu_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_ZONDA:
> +	case CLK_ALPHA_PLL_TYPE_ZONDA_OLE:
> +		clk_zonda_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_STROMER:
> +	case CLK_ALPHA_PLL_TYPE_STROMER_PLUS:
> +		clk_stromer_pll_configure(pll, regmap, pll->config);
> +		break;
> +	case CLK_ALPHA_PLL_TYPE_DEFAULT:
> +	case CLK_ALPHA_PLL_TYPE_DEFAULT_EVO:
> +	case CLK_ALPHA_PLL_TYPE_HUAYRA:
> +	case CLK_ALPHA_PLL_TYPE_HUAYRA_APSS:
> +	case CLK_ALPHA_PLL_TYPE_BRAMMO:
> +	case CLK_ALPHA_PLL_TYPE_BRAMMO_EVO:
> +		clk_alpha_pll_configure(pll, regmap, pll->config);
> +		break;
> +	default:
> +		WARN(1, "%s: invalid pll type\n", name);
> +		break;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(qcom_clk_alpha_pll_configure);
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index 79aca8525262211ae5295245427d4540abf1e09a..7f35aaa7a35d88411beb11fd2be5d5dd5bfbe066 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -81,6 +81,7 @@ struct pll_vco {
>    * struct clk_alpha_pll - phase locked loop (PLL)
>    * @offset: base address of registers
>    * @regs: alpha pll register map (see @clk_alpha_pll_regs)
> + * @config: array of pll settings
>    * @vco_table: array of VCO settings
>    * @num_vco: number of VCO settings in @vco_table
>    * @flags: bitmask to indicate features supported by the hardware
> @@ -90,6 +91,7 @@ struct clk_alpha_pll {
>   	u32 offset;
>   	const u8 *regs;
>   
> +	const struct alpha_pll_config *config;
>   	const struct pll_vco *vco_table;
>   	size_t num_vco;
>   #define SUPPORTS_OFFLINE_REQ		BIT(0)
> @@ -237,5 +239,6 @@ void clk_stromer_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>   			       const struct alpha_pll_config *config);
>   void clk_regera_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>   			     const struct alpha_pll_config *config);
> +void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap);
>   
>   #endif
> 

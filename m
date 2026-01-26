Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C54307AF0
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 08:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769417599; cv=none; b=mqFX2UdhekCcjV0scII6fQ1czRNW8PEoJ1g2Sh4iL111aO8oZb8nQ5J4pU0xDrEwNAWGsCoZYlwBQZfQSgj8Uq9unuQF4dE0sc5kQnVXcb8pWKr0IFkm0wK++pbj6Cg1Fn8WCYPrG54qtyTozc7vfOFZggV1RzAYxBntDCtjvYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769417599; c=relaxed/simple;
	bh=5GaxyRid/6UN76AwEN9W/dXZHZXAFKBL6iggrikDE3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rqVq+4RpuTlTi67OWWNg7LNbfJYfwJsF6C6OEiNtFs4Z2+eOwOTgS2zUyb2rvHfD7+uMmtRA23vv6XzSaEyAEHpOLgvjfLrLxWMkih447cYZexpk7ctrTbY3kND00+8Ex1V5yTr/DBK2EeTUdaJPm/pe9/x/ww8vUAZKI/aT3ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=lUZWGI8f; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="lUZWGI8f"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47ee807a4c5so44547265e9.2
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 00:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769417595; x=1770022395; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EvYQf7JJrtOhol9ZYgmnQUIWUs56jpdOGUSqYs3GLGU=;
        b=lUZWGI8fe+5amW/ow9fibkG5+ry36CT3OC1sfi5FsWPEBi2YUchjtdwBlGlXhuMAhr
         fj0dCXVEaQ1pacCCEOOFFOX2X3CSUmTF9MklA8tUlSryUUIuT+QLZYjhCLs3EwhC9XUa
         oeRFHhdQGdpXyt81XLLVSa6X1U5Cr382vL8H+2ZJfJT2AsGqliPNAdcW86oI0/nqeqD+
         Ax6dU1X2U5SUhcpbqNcJRbOFp0cJT/9xfOY0wEq4PNgAVCFprnzfMTb23L+kn+uKZTm8
         ZzhLtEqYLXXZsax3Cesv0pGc884czQH/rk5gtJl7GZr52sB//GjO6/IovVZtl3pNCO8/
         CxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769417595; x=1770022395;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EvYQf7JJrtOhol9ZYgmnQUIWUs56jpdOGUSqYs3GLGU=;
        b=Ch6PsZ3WY6tJ/DHeIDNsHBm5TnUCmVegohBFrab83bjpmApUS1J5VhqKSU+5IaxwXG
         7imo3DRBw6TxNjVQUp8/5SYsrv1BwIwzwnTf6WZOGIU6NxbBGjBEsPGXpK1f8I7dIEHU
         bHdJ7sul71HdkVdN4LeiR1lRtK+7YAbcgS8ssqBrtmbL21JnsKHZnVqhsMNK/Zl8y+ly
         dM0aFBqrNl21/+DYGuGMQ2V8beRKrjOm8yPnLOLl7BKidU2UEcgD2s4CktgwH4LEUck/
         vKGjYBuED61mPj21iXATOUi1XPCpnX0f5kF1yosT+tDJGC2Ut4NgN1TTgiqwXssGXRTm
         WL6g==
X-Forwarded-Encrypted: i=1; AJvYcCUq5ya6z0bYqEnIFuL3rj20qjLTSic7rryGseosGSL+Do6VvXFx2Y8O6K8DPF4+vLdIlpfuoDoyJ+I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6SglcnVjt3/Fi8AkpzSj3NV6E6Ps7gHL7kFnWX2rTvcvwc1zV
	I1uwEy6tQY2WvcN+JzFBNtoWWD6lOP7tLM5xOqVJHAJNWJyY0Zk7UCxkDchuFptoqZw=
X-Gm-Gg: AZuq6aJs2E+tS5CEh7c1bP69TorXilJEZJFfptmFHj9tMzxkVUnq+58Y+pRsrgnwPen
	7ifZ/mxKmHaKZrxXu7pjK/HMgan07UfnBD4Sx/dxMJOF4oZ4PRg1rMgGccOL52nSDKIuKuG3trY
	5TRIWTLOkuIXDcGCULAG+CBRlSsm+R3MW4luyOC+vWEKB63UUsBOesW9XJpKB8VGw9rVkafxhs1
	ttmqM+YR+O2Rwhx6YxVBCiDAvYqqzbgNfWk0s2EwKpxNs/OXlPKcdgd0wSYtkD2NFAA6gKSgG0s
	GVHiO5EBV3Lt3uIQ35Y0Ordwu7xTGpHvhaR5Gl0fK68tfBkMFjAquO+iXgh7LXCQx+Oih17oqrd
	t7CNWOWXqEqU9bGDV63b9XwU6GtzRQciI1Djnx+QE32pr6nxQBx9oDkUFWeUW7+yvXYvJzf+46e
	7APN22Aa/ZPoWJd4f0AA==
X-Received: by 2002:a05:600c:4ed2:b0:480:462e:d640 with SMTP id 5b1f17b1804b1-4805d06c8ddmr60345005e9.36.1769417595430;
        Mon, 26 Jan 2026 00:53:15 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f7c269sm28608403f8f.43.2026.01.26.00.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 00:53:15 -0800 (PST)
Message-ID: <4cd2b42d-f49d-4f21-8677-928cb3d75fd7@tuxon.dev>
Date: Mon, 26 Jan 2026 10:53:13 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/31] clk: at91: clk-sam9x60-pll: use clk_parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <ca2a4b7196e1c8a479577ca4673f2125ff41292e.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <ca2a4b7196e1c8a479577ca4673f2125ff41292e.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/26 22:06, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of struct parent_hw as this leads
> to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
> conversion of existing SoC specific clock drivers from parent_names to
> modern clk_parent_data structures. As clk-sam9x60-pll need to know
> parent's rate at initialization we pass it now from SoC specific drivers.
> This will lead in the end at removing __clk_get_hw() in SoC specific
> drivers (that will be solved by subsequent commits).
> 
> Get the main_xtal name via of_clk_get_parent_name() to consistently get
> the correct name for the main_xtal.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Add SAMA7D65 and SAM9X75 SoCs to the change set.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---

[ ... ]

> @@ -1137,10 +1141,8 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   
>   	bypass = of_property_read_bool(np, "atmel,osc-bypass");
>   
> -	parent_data.name = main_xtal_name;
> -	parent_data.fw_name = main_xtal_name;
>   	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
> -						 &parent_data, bypass);
> +						 &AT91_CLK_PD_NAME(main_xtal_name), bypass);
>   	if (IS_ERR(main_osc_hw))
>   		goto err_free;
>   
> @@ -1154,7 +1156,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   
>   	for (i = 0; i < PLL_ID_MAX; i++) {
>   		for (j = 0; j < PLL_COMPID_MAX; j++) {
> -			struct clk_hw *parent_hw;
> +			unsigned long parent_rate;
>   
>   			if (!sama7d65_plls[i][j].n)
>   				continue;
> @@ -1163,20 +1165,24 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   			case PLL_TYPE_FRAC:
>   				switch (sama7d65_plls[i][j].p) {
>   				case SAMA7D65_PLL_PARENT_MAINCK:
> -					parent_hw = sama7d65_pmc->chws[PMC_MAIN];
> +					parent_data = AT91_CLK_PD_NAME("mainck");
> +					hw = sama7d65_pmc->chws[PMC_MAIN];
>   					break;
>   				case SAMA7D65_PLL_PARENT_MAIN_XTAL:
> -					parent_hw = main_xtal_hw;
> +					parent_data = AT91_CLK_PD_NAME(main_xtal_name);
> +					hw = main_xtal_hw;

main_xtal_hw is not initialized. You should be able to do something similar to 
what was done in patch 7/31 for sama7g5.

>   					break;
>   				default:
>   					/* Should not happen. */
> -					parent_hw = NULL;
>   					break;
>   				}
> +				parent_rate = clk_hw_get_rate(hw);
> +				if (!parent_rate)
> +					return;
>   
>   				hw = sam9x60_clk_register_frac_pll(regmap,
>   					&pmc_pll_lock, sama7d65_plls[i][j].n,
> -					NULL, parent_hw, i,
> +					&parent_data, parent_rate, i,
>   					sama7d65_plls[i][j].c,
>   					sama7d65_plls[i][j].l,
>   					sama7d65_plls[i][j].f);
> diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
> index 713f5dfe7be2..c6550044cba1 100644
> --- a/drivers/clk/at91/sama7g5.c
> +++ b/drivers/clk/at91/sama7g5.c
> @@ -971,7 +971,7 @@ static const struct clk_pcr_layout sama7g5_pcr_layout = {
>   
>   static void __init sama7g5_pmc_setup(struct device_node *np)
>   {
> -	const char *main_xtal_name = "main_xtal";
> +	const char *main_xtal_name;
>   	struct pmc_data *sama7g5_pmc;
>   	void **alloc_mem = NULL;
>   	int alloc_mem_size = 0;
> @@ -983,11 +983,15 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   	bool bypass;
>   	int i, j;
>   
> +	i = of_property_match_string(np, "clock-names", "main_xtal");
> +	if (i < 0)
> +		return;
> +	main_xtal_name = of_clk_get_parent_name(np, i);
> +
>   	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
>   	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
> -	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
>   
> -	if (!td_slck_hw || !md_slck_hw || !main_xtal_hw)
> +	if (!td_slck_hw || !md_slck_hw)
>   		return;
>   
>   	regmap = device_node_to_regmap(np);
> @@ -1014,10 +1018,8 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   
>   	bypass = of_property_read_bool(np, "atmel,osc-bypass");
>   
> -	parent_data.name = main_xtal_name;
> -	parent_data.fw_name = main_xtal_name;
>   	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
> -						 &parent_data, bypass);
> +						 &AT91_CLK_PD_NAME(main_xtal_name), bypass);
>   	if (IS_ERR(main_osc_hw))
>   		goto err_free;
>   
> @@ -1031,7 +1033,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   
>   	for (i = 0; i < PLL_ID_MAX; i++) {
>   		for (j = 0; j < PLL_COMPID_MAX; j++) {
> -			struct clk_hw *parent_hw;
> +			unsigned long parent_rate;
>   
>   			if (!sama7g5_plls[i][j].n)
>   				continue;
> @@ -1040,20 +1042,25 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   			case PLL_TYPE_FRAC:
>   				switch (sama7g5_plls[i][j].p) {
>   				case SAMA7G5_PLL_PARENT_MAINCK:
> -					parent_hw = sama7g5_pmc->chws[PMC_MAIN];
> +					parent_data = AT91_CLK_PD_NAME("mainck");
> +					hw = sama7g5_pmc->chws[PMC_MAIN];
>   					break;
>   				case SAMA7G5_PLL_PARENT_MAIN_XTAL:
> -					parent_hw = main_xtal_hw;
> +					parent_data = AT91_CLK_PD_NAME(main_xtal_name);
> +					hw = main_xtal_hw;

main_xtal_hw is not initialized. You should be able to do something similar to 
what was done in patch 7/31 for sama7g5.

The rest LGTM.

Thank you,
Claudiu

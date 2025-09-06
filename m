Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3108A194A59
	for <linux-clk@vger.kernel.org>; Sat,  6 Sep 2025 18:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757183771; cv=none; b=nKWakvBlmz4LrPaoBkFgw25a2/rvY34HyGd8zUz/aFDwAZgwHEcsr31id3LHMfa/9J4iOU3i2GRcAOdkA3qwDQrYXqeaEF5jUKJAhFF2v1P5AwYofmZryFEWGnri8RBsZEWlO5xAP4hPwn0f6VJDxtyYYoQaghk7qkc0K/3B0EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757183771; c=relaxed/simple;
	bh=96gqIqh9V4N3XkJ9hpbKqJvSZLlS4YBEb1ceIfJsY1Q=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iEchPFSTfj55BQvj9iDyp7AIzxCfHpmlh3akBW88Xzi4ZniZvBK35bp1Ls4pk9t74JsLW/ZsUj/wcqQGetb9OIY9dDiGXqkznmJn/i+Gv2/RLjd1cj1COoiUvsscI5ic9YbR5XsCazFm9wBhH6FG9Wknc0YSFmSWoWM2Ft85Xo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fMN+7xrG; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fMN+7xrG"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so2139694f8f.3
        for <linux-clk@vger.kernel.org>; Sat, 06 Sep 2025 11:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757183767; x=1757788567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kZGRIEWukxN3mIFY84X98vKWbLkYVpFz2wxdmQq/pdw=;
        b=fMN+7xrGLx4WrDesdJd2HwofwRjK48uxtWJ7NPH4y2NClIbhqz9TScJLVThQtqolPp
         Kv3pxmbb2TbpXNnib2gmcJLOKqUIUR09f+iwI8OWvcXuDTz0XRiOIu1n0K5+uiW6Csza
         JinimXAvYKcDOdp9E1Bjf+rWHdazxYhhuaG19hFN1YSvglAsSO1AQAfqja6+7o47+Fgp
         +FEGihneh4hVjvzJzusDjoCSl0ew0jeZ5iXpSAgu3IaOZF1aL2CuGAjxozdyAu9KiXUZ
         M8YaQi/tDbRs09r2U0hQawhTMRI87oh/M59rYXh7kG6i+t4nY13x2ytr4pmjDDXXQC5N
         o2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757183767; x=1757788567;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kZGRIEWukxN3mIFY84X98vKWbLkYVpFz2wxdmQq/pdw=;
        b=n0TBVfCPboTNkEQdci/KYRPMmUqR5qZioWOGGLaMSGEDB+jxUXwia+wBt7OEWnXcse
         MSc2sdxlN9fqCTxGHtB+Olw/ljfPdc7zcUz4SqNPOzZsJIxZzspZIfsUhgAqUY097vmx
         /1qLN16RiGCcfhSjs8vJ0pJg3A6LJWhYHws9aBXLb5F38Rz3poLxzcRbNMkCkyt3JQNr
         ChlMukEHFcRRDxAzfPlSgpqR2c3bl+iHhDSIEe3cOHWddI3FvymCKZ5fTgCxWQpC+QXF
         HWAKOkGW4CLkXpM3Wtl2oMbajmiAPyNyq66/hzP1rdYCM563qVp0/dwJHKZn185+gXwM
         EJAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6mE+FWu4/ZQnb9SQKxvKaM88Q5ERLrBROJ3QeysALrTLnP1Ej5evH1vgiGH+GoZ8qDo3vjpf3eQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YygZrvX5H5XHzcurve/rNBQbEwamxLMRUfkyke3NBmfGf6ZfXdm
	LW81QGCrO9ZmSbA7e6V7KniQPDMnyO3B3DNXCaCK3dvw6oqgfR4HM/n4QyqPe7d/JKQ=
X-Gm-Gg: ASbGnct5cJk8bk+8YLBej4ZAORHobQqHeEEgPqoanfKTHyvhLEHTWEIemmcKmagR0R/
	QtJ41GPOyojpLfE895osbDH6ycX0ZvywoqT9kuinmgPajyD+ko4YAaF8B5bluGBE6uDbTLRue9B
	eYKR9XtcQPCZYKDttdCszN/K5Jud2CQgpm0kxv4yDjStzVDvJUUofrm/DuY9xVd3RvdFit5UmJK
	LXl0D8+G/Wdi/MQjsQoNGIj7b5RcPvzVrqCKyw13uxnlGTTgjaiFPoScoR3xvUimymVCQTaI8wu
	pIpuHSqkxFQJs2X2b9epcBecEbT7+gsi8UAgg1a7HW1FhJFB+mvH6cEAV3e9W0s751Jg69Jmh6+
	3YlTUIjxcnNtWn/y7ImSb0sivitSZCms=
X-Google-Smtp-Source: AGHT+IFCQ7j3fzaxDu8HRsqJKFlZ2gT3gMukskC95rd6UuJbW5oD2AuxWfVxGPZTnpYTtbY01pa3Bw==
X-Received: by 2002:a05:6000:200f:b0:3e4:7f66:8ae1 with SMTP id ffacd0b85a97d-3e64317ef51mr1878382f8f.30.1757183767538;
        Sat, 06 Sep 2025 11:36:07 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e18537589dsm9919016f8f.54.2025.09.06.11.36.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:36:06 -0700 (PDT)
Message-ID: <d35401da-7db8-4bfe-90cd-042da909c940@tuxon.dev>
Date: Sat, 6 Sep 2025 21:36:04 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 07/32] clk: at91: clk-utmi: use clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <04739269232f6c7ffbe9308a2b993e6b6eb883c8.1752176711.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <04739269232f6c7ffbe9308a2b993e6b6eb883c8.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 7/10/25 23:07, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of struct parent_hw as this leads
> to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
> conversion of existing SoC specific clock drivers from parent_names to
> modern clk_parent_data structures.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/clk-utmi.c | 16 ++++++++--------
>   drivers/clk/at91/pmc.h      |  4 ++--
>   drivers/clk/at91/sama7g5.c  | 25 +++++++++++++++----------
>   3 files changed, 25 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-utmi.c b/drivers/clk/at91/clk-utmi.c
> index b991180beea1..38ffe4d712a5 100644
> --- a/drivers/clk/at91/clk-utmi.c
> +++ b/drivers/clk/at91/clk-utmi.c
> @@ -144,7 +144,7 @@ static struct clk_hw * __init
>   at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
>   				struct regmap *regmap_sfr,
>   				const char *name, const char *parent_name,
> -				struct clk_hw *parent_hw,
> +				struct clk_parent_data *parent_data,
>   				const struct clk_ops *ops, unsigned long flags)
>   {
>   	struct clk_utmi *utmi;
> @@ -152,7 +152,7 @@ at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
>   	struct clk_init_data init = {};
>   	int ret;
>   
> -	if (!(parent_name || parent_hw))
> +	if (!(parent_name || parent_data))
>   		return ERR_PTR(-EINVAL);
>   
>   	utmi = kzalloc(sizeof(*utmi), GFP_KERNEL);
> @@ -161,8 +161,8 @@ at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
>   
>   	init.name = name;
>   	init.ops = ops;
> -	if (parent_hw)
> -		init.parent_hws = (const struct clk_hw **)&parent_hw;
> +	if (parent_data)
> +		init.parent_data = (const struct clk_parent_data *)parent_data;
>   	else
>   		init.parent_names = &parent_name;
>   	init.num_parents = 1;
> @@ -185,10 +185,10 @@ at91_clk_register_utmi_internal(struct regmap *regmap_pmc,
>   struct clk_hw * __init
>   at91_clk_register_utmi(struct regmap *regmap_pmc, struct regmap *regmap_sfr,
>   		       const char *name, const char *parent_name,
> -		       struct clk_hw *parent_hw)
> +		       struct clk_parent_data *parent_data)
>   {
>   	return at91_clk_register_utmi_internal(regmap_pmc, regmap_sfr, name,
> -			parent_name, parent_hw, &utmi_ops, CLK_SET_RATE_GATE);
> +			parent_name, parent_data, &utmi_ops, CLK_SET_RATE_GATE);
>   }
>   
>   static int clk_utmi_sama7g5_prepare(struct clk_hw *hw)
> @@ -287,8 +287,8 @@ static const struct clk_ops sama7g5_utmi_ops = {
>   
>   struct clk_hw * __init
>   at91_clk_sama7g5_register_utmi(struct regmap *regmap_pmc, const char *name,
> -			       const char *parent_name, struct clk_hw *parent_hw)
> +			       const char *parent_name, struct clk_parent_data *parent_data)
>   {
>   	return at91_clk_register_utmi_internal(regmap_pmc, NULL, name,
> -			parent_name, parent_hw, &sama7g5_utmi_ops, 0);
> +			parent_name, parent_data, &sama7g5_utmi_ops, 0);
>   }
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index e32a5e85d08f..d9a04fddb0b1 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -299,10 +299,10 @@ at91rm9200_clk_register_usb(struct regmap *regmap, const char *name,
>   struct clk_hw * __init
>   at91_clk_register_utmi(struct regmap *regmap_pmc, struct regmap *regmap_sfr,
>   		       const char *name, const char *parent_name,
> -		       struct clk_hw *parent_hw);
> +		       struct clk_parent_data *parent_data);
>   
>   struct clk_hw * __init
>   at91_clk_sama7g5_register_utmi(struct regmap *regmap, const char *name,
> -			       const char *parent_name, struct clk_hw *parent_hw);
> +			       const char *parent_name, struct clk_parent_data *parent_data);
>   
>   #endif /* __PMC_H_ */
> diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
> index f816a5551277..c4723b875a1d 100644
> --- a/drivers/clk/at91/sama7g5.c
> +++ b/drivers/clk/at91/sama7g5.c
> @@ -975,30 +975,33 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   	void **alloc_mem = NULL;
>   	int alloc_mem_size = 0;
>   	struct regmap *regmap;
> -	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
> +	struct clk_hw *hw, *main_rc_hw, *main_osc_hw;
>   	struct clk_hw *td_slck_hw, *md_slck_hw;
>   	struct clk_parent_data parent_data[2];
>   	struct clk_hw *parent_hws[10];
> +	struct clk *main_xtal;
>   	bool bypass;
>   	int i, j;
>   
>   	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
>   	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
> -	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
> +	if (!td_slck_hw || !md_slck_hw)
> +		return;
>   
> -	if (!td_slck_hw || !md_slck_hw || !main_xtal_hw)
> +	main_xtal = of_clk_get(np, main_xtal_index);

Maybe:

i = of_property_match_string(np, "clock-names", "main_xtal");
main_xtal_name = of_clk_get_parent_name(np, i);

And move the:

main_xtal = of_clk_get()

above in the switch/case where the main_xtal clock is needed to get its rate.

> +	if (IS_ERR(main_xtal))
>   		return;
>   
>   	regmap = device_node_to_regmap(np);
>   	if (IS_ERR(regmap))
> -		return;
> +		goto put_main_xtal;
>   
>   	sama7g5_pmc = pmc_data_allocate(PMC_MCK1 + 1,
>   					nck(sama7g5_systemck),
>   					nck(sama7g5_periphck),
>   					nck(sama7g5_gck), 8);
>   	if (!sama7g5_pmc)
> -		return;
> +		goto put_main_xtal;
>   
>   	alloc_mem = kmalloc(sizeof(void *) *
>   			    (ARRAY_SIZE(sama7g5_mckx) + ARRAY_SIZE(sama7g5_gck)),
> @@ -1039,19 +1042,18 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   				switch (sama7g5_plls[i][j].p) {
>   				case SAMA7G5_PLL_PARENT_MAINCK:
>   					parent_data[0] = AT91_CLK_PD_NAME("mainck", -1);
> -					hw = sama7g5_pmc->chws[PMC_MAIN];
> +					parent_rate = clk_hw_get_rate(sama7g5_pmc->chws[PMC_MAIN]);
>   					break;
>   				case SAMA7G5_PLL_PARENT_MAIN_XTAL:
>   					parent_data[0] = AT91_CLK_PD_NAME(main_xtal_name,
>   									  main_xtal_index);
> -					hw = main_xtal_hw;

here:

                                        main_xtal = of_clk_get_by_index(np, i);

> +					parent_rate = clk_get_rate(main_xtal);

                                        clk_put(main_xtal);
>   					break;
>   				default:
>   					/* Should not happen. */
>   					break;
>   				}
>   
> -				parent_rate = clk_hw_get_rate(hw);
>   				if (!parent_rate)
>   					return;
>   
> @@ -1135,7 +1137,8 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   			sama7g5_pmc->chws[sama7g5_mckx[i].eid] = hw;
>   	}
>   
> -	hw = at91_clk_sama7g5_register_utmi(regmap, "utmick", NULL, main_xtal_hw);
> +	hw = at91_clk_sama7g5_register_utmi(regmap, "utmick", NULL,
> +					    &AT91_CLK_PD_NAME(main_xtal_name, main_xtal_index));
>   	if (IS_ERR(hw))
>   		goto err_free;
>   
> @@ -1233,7 +1236,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   
>   	of_clk_add_hw_provider(np, of_clk_hw_pmc_get, sama7g5_pmc);
>   
> -	return;
> +	goto put_main_xtal;
>   
>   err_free:
>   	if (alloc_mem) {
> @@ -1243,6 +1246,8 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   	}
>   
>   	kfree(sama7g5_pmc);
> +put_main_xtal:
> +	clk_put(main_xtal);
>   }
>   
>   /* Some clks are used for a clocksource */


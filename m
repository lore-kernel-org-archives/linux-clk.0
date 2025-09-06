Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93610255F39
	for <linux-clk@vger.kernel.org>; Sat,  6 Sep 2025 18:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757183666; cv=none; b=Dd/Mf+48wV/cg3UYDbfr3G7pxnunP+r66iGSFJsGMDFUUOtCr14uLbl/A373mzyGZtZorMY10Y4tUuG7sfzf/p0o5eTQp41ahIGVs98qWdEoCKQIz4O2bLouyrURnZMDFpQSqUaeaVJ/0eMzJk3UsmqoX7Nc7fpagZplR4rkGpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757183666; c=relaxed/simple;
	bh=6jAf1ftFnxAlibZRPBebW76gTUwEmDrU9Kx6+RVSznc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=M9io31MVRbIAJ+CxzaGr91ZjAIsk0xjPiJxmJ4P2wG9Ki7fjnnCxZDv+RBLXlOFP9an9HeZjdj+7XvNzFRWYjTwPMQ86b2vrD6y4HbWa7Wmr/xZh86Z8FjIUFRGLLB+Vv4n+WTYx3ZytdnperH6dO3f6cDR+JNDGf1m1b9fQqQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=IUvxEU9r; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="IUvxEU9r"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45de221da9cso871025e9.0
        for <linux-clk@vger.kernel.org>; Sat, 06 Sep 2025 11:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757183663; x=1757788463; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=buoc/vdaWZrT+rT15h0myZbMJ9Oax8n0JeLAsKw2hOE=;
        b=IUvxEU9r3Fwth/9i9aXCpZUE4endpMdZDt9ZbEuGrTCGKvhusaEf0BEAJtwnQrnuT3
         SMgGyK5NHyZKLN2V/sqizeaEUW7N9/8v1geZquvjeObddpksGHiBtNHt3MDxpjrLzt6+
         wPQtNYxVqkmjTf2tKWH6JGczoHI2tJ7sF5h9cw6+2Hyj85egwj3dAiKPYnB4h7rEfWJj
         ImfRNKY5BNdP3QRX7mXhHwE1wX7sR3g9M3GfmE5dsQcE2TfbsXEaYnsnvpkfUtJu3oGn
         lr7bZoCFl24G5WFB6bqj4BBnnumDgiHK7ttfgYUil85E7VW48QDGJzvjPRor18NUGVvY
         BOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757183663; x=1757788463;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=buoc/vdaWZrT+rT15h0myZbMJ9Oax8n0JeLAsKw2hOE=;
        b=PTmw0H8A3mSYX/OyG82KsxL7qnvjsXO8/SRLPxD6EtvMSVcT2FRvjfyJqWl/m8bAa7
         pe1/YR9eX5T1EI08NLqGPr+Rq689PgPb4QjpEk/N555e9s6RLaBhhpH29JJbadxLjhLR
         mkAGZDHsz5J89/100hZ7NJ+MA1fVwX7qFpK5e7tPIppNFdAUq1yVSayrihT4vFmYF+4F
         MJX1ZYJzuYpXAYAf8NyM20HY/e7TJ32p1/E088LyXTyJPTW2iClrptZ7XfkHzML4XM+Z
         +uAlqy/qymuQG+RbwfFncJt/N1TM2hYU6T8QjRapXWOE+U6zp/bfQdmpGntXZD0AZWJ6
         Ky5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2Xd/QfhrRQodicKNgQR1rlUE8oQeYBOUA+amfZV2e3Hs+XRhI0TaAcDdyIsjwp8ectYyt8UCDtos=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMKCcgySZhaSLQTQtsnFf9f7K9gOP0x31H89c9eUYp5YgyA9OW
	koKWvSQP7xkdD5pVEkR2/mH9kmggcC63HNHBIwyYRDNLSuOOqSeDvsNmcvVr02alA6Y=
X-Gm-Gg: ASbGnctKKPaJrD0RTuUch0SSJH0LGWAjtHknWj/lMBG+j8H6JyYP3ALS26NmY/7anD/
	7lUZ8Pt3zde9cga3hCk/vmd1WhePQLTr89vpfSJXK57BClNxcSEdM40WPbCBzKGqJKNxl+9jf4V
	hMWMSQaACD7uiURWHtKwHDUGhYkQQVefKgzkVl/Mbjzuh5Oim+M+jjTfQABYUpu5sPX6H+i69Ty
	J6vMnq0KIDNZhHC9JUxMVgISbQAcyTZcYLXJT32/p6VsSp0eodTKlNlyd5ZLjeNqXR5sKi3RQtW
	mHya7jMwSvh3egSAj1eHwJBtZYeF0waTBADem5T78sSY/XIMGm1KENibJ+IOMWrhV5lGViX1Ex4
	t1j29oXCBQIvcTOmrMc+/EYh69qgT0EEc1MouTJlMZBhATMivn4Ni
X-Google-Smtp-Source: AGHT+IH/u05DieqBh2vOhG6vUGVc6Da7cbpzGc0XIEqyjVwk+v7uSz+2ZOna7S0oGMd9KF1SW1sSYQ==
X-Received: by 2002:a05:600c:4694:b0:45c:b601:660a with SMTP id 5b1f17b1804b1-45dddec84cfmr20521055e9.23.1757183662869;
        Sat, 06 Sep 2025 11:34:22 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45ddbc70fffsm26613185e9.3.2025.09.06.11.34.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:34:22 -0700 (PDT)
Message-ID: <0f776b28-a623-4984-8cae-2faa716ddb0d@tuxon.dev>
Date: Sat, 6 Sep 2025 21:34:21 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 04/32] clk: at91: clk-sam9x60-pll: use clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <2e7902b73fa6bb5bc8698b3ca0fa7cef583b76f5.1752176711.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <2e7902b73fa6bb5bc8698b3ca0fa7cef583b76f5.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 7/10/25 23:06, Ryan.Wanner@microchip.com wrote:
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
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Add SAMA7D65 and SAM9X75 SoCs to the change set.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/clk-sam9x60-pll.c | 14 +++++---------
>   drivers/clk/at91/pmc.h             |  5 +++--
>   drivers/clk/at91/sam9x60.c         |  8 +++++---
>   drivers/clk/at91/sam9x7.c          | 17 ++++++++++++-----
>   drivers/clk/at91/sama7d65.c        | 16 +++++++++++-----
>   drivers/clk/at91/sama7g5.c         | 17 ++++++++++++-----
>   6 files changed, 48 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-sam9x60-pll.c b/drivers/clk/at91/clk-sam9x60-pll.c
> index cefd9948e103..03a7d00dcc6d 100644
> --- a/drivers/clk/at91/clk-sam9x60-pll.c
> +++ b/drivers/clk/at91/clk-sam9x60-pll.c
> @@ -630,19 +630,19 @@ static const struct clk_ops sam9x60_fixed_div_pll_ops = {
>   
>   struct clk_hw * __init
>   sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
> -			      const char *name, const char *parent_name,
> -			      struct clk_hw *parent_hw, u8 id,
> +			      const char *name, const struct clk_parent_data *parent_data,
> +			      unsigned long parent_rate, u8 id,
>   			      const struct clk_pll_characteristics *characteristics,
>   			      const struct clk_pll_layout *layout, u32 flags)
>   {
>   	struct sam9x60_frac *frac;
>   	struct clk_hw *hw;
>   	struct clk_init_data init = {};
> -	unsigned long parent_rate, irqflags;
> +	unsigned long irqflags;
>   	unsigned int val;
>   	int ret;
>   
> -	if (id > PLL_MAX_ID || !lock || !parent_hw)
> +	if (id > PLL_MAX_ID || !lock || !parent_data)
>   		return ERR_PTR(-EINVAL);
>   
>   	frac = kzalloc(sizeof(*frac), GFP_KERNEL);
> @@ -650,10 +650,7 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
>   		return ERR_PTR(-ENOMEM);
>   
>   	init.name = name;
> -	if (parent_name)
> -		init.parent_names = &parent_name;
> -	else
> -		init.parent_hws = (const struct clk_hw **)&parent_hw;
> +	init.parent_data = (const struct clk_parent_data *)parent_data;
>   	init.num_parents = 1;
>   	if (flags & CLK_SET_RATE_GATE)
>   		init.ops = &sam9x60_frac_pll_ops;
> @@ -684,7 +681,6 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
>   		 * its rate leading to enabling this PLL with unsupported
>   		 * rate. This will lead to PLL not being locked at all.
>   		 */
> -		parent_rate = clk_hw_get_rate(parent_hw);
>   		if (!parent_rate) {
>   			hw = ERR_PTR(-EINVAL);
>   			goto free;
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index 63d4c425bed5..b43f6652417f 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -255,8 +255,9 @@ sam9x60_clk_register_div_pll(struct regmap *regmap, spinlock_t *lock,
>   
>   struct clk_hw * __init
>   sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
> -			      const char *name, const char *parent_name,
> -			      struct clk_hw *parent_hw, u8 id,
> +			      const char *name,
> +			      const struct clk_parent_data *parent_data,
> +			      unsigned long parent_rate, u8 id,
>   			      const struct clk_pll_characteristics *characteristics,
>   			      const struct clk_pll_layout *layout, u32 flags);
>   
> diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
> index db6db9e2073e..fd53e54abf88 100644
> --- a/drivers/clk/at91/sam9x60.c
> +++ b/drivers/clk/at91/sam9x60.c
> @@ -240,7 +240,8 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
>   	sam9x60_pmc->chws[PMC_MAIN] = hw;
>   
>   	hw = sam9x60_clk_register_frac_pll(regmap, &pmc_pll_lock, "pllack_fracck",
> -					   "mainck", sam9x60_pmc->chws[PMC_MAIN],
> +					   &AT91_CLK_PD_HW(sam9x60_pmc->chws[PMC_MAIN]),
> +					   clk_hw_get_rate(sam9x60_pmc->chws[PMC_MAIN]),
>   					   0, &plla_characteristics,
>   					   &pll_frac_layout,
>   					   /*
> @@ -266,8 +267,9 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
>   	sam9x60_pmc->chws[PMC_PLLACK] = hw;
>   
>   	hw = sam9x60_clk_register_frac_pll(regmap, &pmc_pll_lock, "upllck_fracck",
> -					   "main_osc", main_osc_hw, 1,
> -					   &upll_characteristics,
> +					   &AT91_CLK_PD_HW(main_osc_hw),
> +					   clk_hw_get_rate(main_osc_hw),
> +					   1, &upll_characteristics,
>   					   &pll_frac_layout, CLK_SET_RATE_GATE);
>   	if (IS_ERR(hw))
>   		goto err_free;
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index 31184e11165a..edd5fd3a1fa5 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -739,6 +739,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   {
>   	struct clk_range range = CLK_RANGE(0, 0);
>   	const char *main_xtal_name = "main_xtal";
> +	u8 main_xtal_index = 2;
>   	struct pmc_data *sam9x7_pmc;
>   	const char *parent_names[9];
>   	void **clk_mux_buffer = NULL;
> @@ -795,7 +796,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   
>   	for (i = 0; i < PLL_ID_MAX; i++) {
>   		for (j = 0; j < PLL_COMPID_MAX; j++) {
> -			struct clk_hw *parent_hw;
> +			unsigned long parent_rate = 0;

The initialization could be dropped. Same for the other similar places in
this patch.

>   
>   			if (!sam9x7_plls[i][j].n)
>   				continue;
> @@ -804,21 +805,27 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   			case PLL_TYPE_FRAC:
>   				switch (sam9x7_plls[i][j].p) {
>   				case SAM9X7_PLL_PARENT_MAINCK:
> -					parent_hw = sam9x7_pmc->chws[PMC_MAIN];
> +					parent_data = AT91_CLK_PD_NAME("mainck", -1);
> +					hw = sam9x7_pmc->chws[PMC_MAIN];
>   					break;
>   				case SAM9X7_PLL_PARENT_MAIN_XTAL:
> -					parent_hw = main_xtal_hw;
> +					parent_data = AT91_CLK_PD_NAME(main_xtal_name,
> +								       main_xtal_index);

Here AT91_CLK_PD_NAME(main_xtal_name) should be used (with a single
argument) but the main_xtal_name should be retrieved with
of_clk_get_parent_name().


Same for the other similar places in this patch.

> +					hw = main_xtal_hw;
>   					break;
>   				default:
>   					/* Should not happen. */
> -					parent_hw = NULL;
>   					break;
>   				}
>   
> +				parent_rate = clk_hw_get_rate(hw);
> +				if (!parent_rate)
> +					return;
> +
>   				hw = sam9x60_clk_register_frac_pll(regmap,
>   								   &pmc_pll_lock,
>   								   sam9x7_plls[i][j].n,
> -								   NULL, parent_hw, i,
> +								   &parent_data, parent_rate, i,
>   								   sam9x7_plls[i][j].c,
>   								   sam9x7_plls[i][j].l,
>   								   sam9x7_plls[i][j].f);
> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index b74813a288a8..17725c175d3b 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -1090,6 +1090,7 @@ static const struct clk_pcr_layout sama7d65_pcr_layout = {
>   static void __init sama7d65_pmc_setup(struct device_node *np)
>   {
>   	const char *main_xtal_name = "main_xtal";
> +	u8 main_xtal_index = 2;
>   	struct pmc_data *sama7d65_pmc;
>   	const char *parent_names[11];
>   	void **alloc_mem = NULL;
> @@ -1150,7 +1151,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   
>   	for (i = 0; i < PLL_ID_MAX; i++) {
>   		for (j = 0; j < PLL_COMPID_MAX; j++) {
> -			struct clk_hw *parent_hw;
> +			unsigned long parent_rate = 0;>
>   			if (!sama7d65_plls[i][j].n)
>   				continue;
> @@ -1159,20 +1160,25 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   			case PLL_TYPE_FRAC:
>   				switch (sama7d65_plls[i][j].p) {
>   				case SAMA7D65_PLL_PARENT_MAINCK:
> -					parent_hw = sama7d65_pmc->chws[PMC_MAIN];
> +					parent_data = AT91_CLK_PD_NAME("mainck", -1);
> +					hw = sama7d65_pmc->chws[PMC_MAIN];
>   					break;
>   				case SAMA7D65_PLL_PARENT_MAIN_XTAL:
> -					parent_hw = main_xtal_hw;
> +					parent_data = AT91_CLK_PD_NAME(main_xtal_name,
> +								       main_xtal_index);
> +					hw = main_xtal_hw;
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
> index bf6092fea217..733e4fc6a515 100644
> --- a/drivers/clk/at91/sama7g5.c
> +++ b/drivers/clk/at91/sama7g5.c
> @@ -970,6 +970,7 @@ static const struct clk_pcr_layout sama7g5_pcr_layout = {
>   static void __init sama7g5_pmc_setup(struct device_node *np)
>   {
>   	const char *main_xtal_name = "main_xtal";
> +	u8 main_xtal_index = 2;
>   	struct pmc_data *sama7g5_pmc;
>   	void **alloc_mem = NULL;
>   	int alloc_mem_size = 0;
> @@ -1029,7 +1030,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   
>   	for (i = 0; i < PLL_ID_MAX; i++) {
>   		for (j = 0; j < PLL_COMPID_MAX; j++) {
> -			struct clk_hw *parent_hw;
> +			unsigned long parent_rate = 0;>
>   			if (!sama7g5_plls[i][j].n)
>   				continue;
> @@ -1038,20 +1039,26 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   			case PLL_TYPE_FRAC:
>   				switch (sama7g5_plls[i][j].p) {
>   				case SAMA7G5_PLL_PARENT_MAINCK:
> -					parent_hw = sama7g5_pmc->chws[PMC_MAIN];
> +					parent_data = AT91_CLK_PD_NAME("mainck", -1);
> +					hw = sama7g5_pmc->chws[PMC_MAIN];
>   					break;
>   				case SAMA7G5_PLL_PARENT_MAIN_XTAL:
> -					parent_hw = main_xtal_hw;
> +					parent_data = AT91_CLK_PD_NAME(main_xtal_name,
> +								       main_xtal_index);
> +					hw = main_xtal_hw;
>   					break;
>   				default:
>   					/* Should not happen. */
> -					parent_hw = NULL;
>   					break;
>   				}
>   
> +				parent_rate = clk_hw_get_rate(hw);
> +				if (!parent_rate)
> +					return;
> +
>   				hw = sam9x60_clk_register_frac_pll(regmap,
>   					&pmc_pll_lock, sama7g5_plls[i][j].n,
> -					NULL, parent_hw, i,
> +					&parent_data, parent_rate, i,
>   					sama7g5_plls[i][j].c,
>   					sama7g5_plls[i][j].l,
>   					sama7g5_plls[i][j].f);


Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07352C029D
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 19:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760988941; cv=none; b=CsmXKUjYbbTB+84ZBNH8j0iQ8uIWV5HEtfDlFmBr8oMAD546KJjHAGVe48Fdw7gXwY1xLnPgAIeoSNw7aJtKCIxEMyv17xGnbSRuLuNx819cBoRmfDzRT5rT02jGaTFH35OQcKpDWDM0oA3JGUpq+Qs60lYoDe1NbKUINVZ5Aq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760988941; c=relaxed/simple;
	bh=oNEYCAZoe2K5VSK04zcW9dzheEfMP2pAPSvel73xE/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HaKwZcfV99Fhwd5OI3GJRTDLB6n4j7Reel2clcNs1M2Q0NG1QXi5fMUuHIdbbPdtijMjaisi+TZmQHgnDL/FcXwGGGLHLa5cUJ8SOwpzJx3dLGHwriH4Wdbd49Q5fjGmaWrurDQlfYV28ZLYavckbQtlslh96Pkc9j8cn35Ef/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=RgK1I4Pq; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="RgK1I4Pq"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b6bbfc57b75so168968066b.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 12:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760988937; x=1761593737; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJzjjaEDD0imOWDSSABZOwuIGHAJF+eM/svL2iJ1tjE=;
        b=RgK1I4PqTAoQsXu1V+7UWtrl/PB7Kh/MDcZfzBleq5J1r4nn7PO/Qwqvw1CqsQbuHd
         vGn3mW4v97PIsVYyO/nSsvtJHYCO9vvIdYSSVy4ht6DlmmAclf5xYYLMNo0Q9nqRQnP1
         5yHPpoD5+X41faepiYO044YiSS8uQ/p8W3/NkbLurqYRf1Kzv9n9b+DfkY3aYQYxfgCv
         CeoxTaiNuyjDoOQXCNr8NGEQqSqyThHS8iXB6Us+T1iaowJDKKF3M2Z/xbJ+pqLaMgeE
         QqwktUzAvI4vgKA7faXCbnP0W1oLnlY+Q3H/VnVQsqqc7bnrVaYht5Rg+bDZnX7rZgGE
         QvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760988937; x=1761593737;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJzjjaEDD0imOWDSSABZOwuIGHAJF+eM/svL2iJ1tjE=;
        b=VFj5BiCElVVYMnZD66be+cvu2oti/ZUUTHusHVii8ypvBLruat+fIky+iJj5GcspqS
         6h/Nkqq2RO1Mz5JBHHIY9WFGXzjHXhBz2NzauvcTZK6j58dIvmtepsD/+5WGtN15WIwN
         A647TG75cQC76VEaun5X7QjSSQoT80RC3KTyN6tHeAAlMAyfLIGzzeF9nLdaD9dq23TS
         7zr/iS77dbvqTpD73D8xG+QcjT4VwIt1lKeJi3zUbkfCpfX/PD5KM6/PSHMh4x/AIwmh
         lnNEc9AZAqufazRV43WOJ9U6BAYmdYpQJeKIXpVbeHzB+jhuKA+lR/r5Fm1DE+uJ/tZG
         a22g==
X-Gm-Message-State: AOJu0YyoQA/IkG9TlMOB0JAXUQ+3+u9AaxXLCoJQlU0vaKgnyffdpe+M
	6rEXQ8Ggi1/hHya6aT3NTANPcxOf/ND3Do12WKas/SQBXgF8pPkIJLTx+4/ye9rycBM=
X-Gm-Gg: ASbGnctfAUEUJBLCv9Q7WO3bxPjHx92loDIYDVFMnFCIaLM2BXI4fGXm0W2IG0ewHtC
	CX2/jNUv36KXm+tbty/TjMbcKz96ecSR69dQGHle3mTgdjlwFDjoqYztmGaJC9LLn+AaMEnKCrg
	+dnro2XyKNk0Dzh7D7Nih0mLAynfs6xFakkIyMNFLy07VCTBkuKFKFVDlYcRAbIG/Jy88lOzz3z
	mbsVa9Blv7WAc7Rf/vb+zSFr+hBBj8ljlCou5E7HSQlhwsLokpjHPjyDu2Eel5fNL6kfhBy+Gfc
	MITz+Rx6JdfUN3Imdg7uR+SCmhMnysCvSj6Gq1cwfZlCd8uBL68LiEicnSp/5IOuem330FWfsmA
	R4ikJQnSgDYrGxUsY63Hj6nSAo+3InI9X/2+Iqb2e5sxC6ht+Q5+8QXjvY8XVE5wuWwdCGNFNNT
	kZd8AMq4EVGgXb8aQN6yqUe1ESsoM92g==
X-Google-Smtp-Source: AGHT+IEiYwpBReda0RVlKDOQV0LSpWf2aD9VoyYoOpi2xDJAeQwN4pP2e2fQdG41lg3CAj5uR9jk8Q==
X-Received: by 2002:a17:907:7a86:b0:b57:2c75:cc8d with SMTP id a640c23a62f3a-b605249e429mr2106696966b.14.1760988936588;
        Mon, 20 Oct 2025 12:35:36 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb0362fbsm879008666b.39.2025.10.20.12.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:35:36 -0700 (PDT)
Message-ID: <e20e05e7-6deb-4180-bb70-59045fdcdbfb@tuxon.dev>
Date: Mon, 20 Oct 2025 22:35:34 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 28/31] clk: at91: at91sam9260: switch to parent_hw and
 parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <a85eafe6b462d385c399f8e56773dbedaa1f3260.1758226719.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <a85eafe6b462d385c399f8e56773dbedaa1f3260.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 9/19/25 00:16, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Switch AT91SAM92600 clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration
> speed and re-parenting.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/at91sam9260.c | 120 ++++++++++++++++++---------------
>  1 file changed, 67 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/clk/at91/at91sam9260.c b/drivers/clk/at91/at91sam9260.c
> index 55350331b07e..2ac2a340da2f 100644
> --- a/drivers/clk/at91/at91sam9260.c
> +++ b/drivers/clk/at91/at91sam9260.c
> @@ -9,7 +9,7 @@
>  
>  struct sck {
>  	char *n;
> -	char *p;
> +	struct clk_hw *parent_hw;
>  	u8 id;
>  };
>  
> @@ -24,7 +24,7 @@ struct at91sam926x_data {
>  	const struct clk_pll_layout *pllb_layout;
>  	const struct clk_pll_characteristics *pllb_characteristics;
>  	const struct clk_master_characteristics *mck_characteristics;
> -	const struct sck *sck;
> +	struct sck *sck;
>  	const struct pck *pck;
>  	u8 num_sck;
>  	u8 num_pck;
> @@ -72,11 +72,11 @@ static const struct clk_pll_characteristics sam9260_pllb_characteristics = {
>  	.out = sam9260_pllb_out,
>  };
>  
> -static const struct sck at91sam9260_systemck[] = {
> -	{ .n = "uhpck", .p = "usbck",    .id = 6 },
> -	{ .n = "udpck", .p = "usbck",    .id = 7 },
> -	{ .n = "pck0",  .p = "prog0",    .id = 8 },
> -	{ .n = "pck1",  .p = "prog1",    .id = 9 },
> +static struct sck at91sam9260_systemck[] = {
> +	{ .n = "uhpck", .id = 6 },
> +	{ .n = "udpck", .id = 7 },
> +	{ .n = "pck0",  .id = 8 },
> +	{ .n = "pck1",  .id = 9 },
>  };
>  
>  static const struct pck at91sam9260_periphck[] = {
> @@ -213,15 +213,15 @@ static const struct clk_pll_characteristics sam9261_pllb_characteristics = {
>  	.out = sam9261_pllb_out,
>  };
>  
> -static const struct sck at91sam9261_systemck[] = {
> -	{ .n = "uhpck", .p = "usbck",    .id = 6 },
> -	{ .n = "udpck", .p = "usbck",    .id = 7 },
> -	{ .n = "pck0",  .p = "prog0",    .id = 8 },
> -	{ .n = "pck1",  .p = "prog1",    .id = 9 },
> -	{ .n = "pck2",  .p = "prog2",    .id = 10 },
> -	{ .n = "pck3",  .p = "prog3",    .id = 11 },
> -	{ .n = "hclk0", .p = "masterck_div", .id = 16 },
> -	{ .n = "hclk1", .p = "masterck_div", .id = 17 },
> +static struct sck at91sam9261_systemck[] = {
> +	{ .n = "uhpck", .id = 6 },
> +	{ .n = "udpck", .id = 7 },
> +	{ .n = "pck0",  .id = 8 },
> +	{ .n = "pck1",  .id = 9 },
> +	{ .n = "pck2",  .id = 10 },
> +	{ .n = "pck3",  .id = 11 },
> +	{ .n = "hclk0", .id = 16 },
> +	{ .n = "hclk1", .id = 17 },
>  };
>  
>  static const struct pck at91sam9261_periphck[] = {
> @@ -277,13 +277,13 @@ static const struct clk_pll_characteristics sam9263_pll_characteristics = {
>  	.out = sam9260_plla_out,
>  };
>  
> -static const struct sck at91sam9263_systemck[] = {
> -	{ .n = "uhpck", .p = "usbck",    .id = 6 },
> -	{ .n = "udpck", .p = "usbck",    .id = 7 },
> -	{ .n = "pck0",  .p = "prog0",    .id = 8 },
> -	{ .n = "pck1",  .p = "prog1",    .id = 9 },
> -	{ .n = "pck2",  .p = "prog2",    .id = 10 },
> -	{ .n = "pck3",  .p = "prog3",    .id = 11 },
> +static struct sck at91sam9263_systemck[] = {
> +	{ .n = "uhpck", .id = 6 },
> +	{ .n = "udpck", .id = 7 },
> +	{ .n = "pck0",  .id = 8 },
> +	{ .n = "pck1",  .id = 9 },
> +	{ .n = "pck2",  .id = 10 },
> +	{ .n = "pck3",  .id = 11 },
>  };
>  
>  static const struct pck at91sam9263_periphck[] = {
> @@ -330,12 +330,11 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
>  					 struct at91sam926x_data *data)
>  {
>  	const char *slowxtal_name, *mainxtal_name;
> +	struct clk_parent_data parent_data[4];
>  	struct pmc_data *at91sam9260_pmc;
>  	u32 usb_div[] = { 1, 2, 4, 0 };
> -	const char *parent_names[6];
> -	const char *slck_name;
> +	struct clk_hw *usbck_hw, *hw;
>  	struct regmap *regmap;
> -	struct clk_hw *hw;
>  	int i;
>  	bool bypass;
>  
> @@ -363,12 +362,13 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
>  
>  	bypass = of_property_read_bool(np, "atmel,osc-bypass");
>  
> -	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL,
> +	hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
> +					&AT91_CLK_PD_NAME(mainxtal_name),
>  					bypass);
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
> -	hw = at91_clk_register_rm9200_main(regmap, "mainck", "main_osc", NULL);
> +	hw = at91_clk_register_rm9200_main(regmap, "mainck", NULL, &AT91_CLK_PD_HW(hw));
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
> @@ -382,20 +382,17 @@ static void __init at91sam926x_pmc_setup(struct device_node *np,
>  		if (IS_ERR(hw))
>  			goto err_free;
>  
> -		parent_names[0] = "slow_rc_osc";
> -		parent_names[1] = "slow_xtal";
> -		hw = at91_clk_register_sam9260_slow(regmap, "slck",
> -						    parent_names, NULL, 2);
> +		parent_data[0] = AT91_CLK_PD_HW(hw);
> +		parent_data[1] = AT91_CLK_PD_NAME(slowxtal_name);
> +		hw = at91_clk_register_sam9260_slow(regmap, "slck", NULL, parent_data, 2);
>  		if (IS_ERR(hw))
>  			goto err_free;
>  
>  		at91sam9260_pmc->chws[PMC_SLOW] = hw;
> -		slck_name = "slck";
> -	} else {
> -		slck_name = slowxtal_name;

This section here should be kept.

Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5309927BF85
	for <linux-clk@vger.kernel.org>; Sat,  6 Sep 2025 18:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757183806; cv=none; b=VgKjS65Bo0riSghe6od3yiFjM4o5ZusXKEldazbheZZS3FAMPjZeNo8t4/v7Q1e6Khbpd98wQfSGWN4o28Iuax4IsQQ+qZ4OfL0JCpN4WRJfwX0THa2D3e0nhTHaEikUhnsv0/eVqub1zIjvgA1xJWtbYEtsdTvqyz+G2uRpQEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757183806; c=relaxed/simple;
	bh=YO55bqOPflOkRwVnWnwk97PL8rmmDj5TiEsNI/x4hUw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AZOwdOYfpD62hFYz/sFwIshHI8jg8TzeuyTNmYikn7rd4GhhQAfR0NusD0ordkJS0W3gYy8g6hqr6b79BJsYBlBnc0xCd4BMcCdwPbaGazoGjF6uymHM2yUevMekHXSm5IXUdWv2WyaROquNsbvBdkSDbEV6gAUsw2mihY6Nxfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VRV1xQUk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VRV1xQUk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso16099235e9.2
        for <linux-clk@vger.kernel.org>; Sat, 06 Sep 2025 11:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757183803; x=1757788603; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+7c9v7WS7SgWPvY1/iQev0Y/b4zhJciSfPhNQ1aVFAg=;
        b=VRV1xQUku0R8CHHV2g6DmjLtkZjzpEM+tGffWoaRCJFHthO3/0oBjCHhMwSCTXc9mN
         lLFhMmV0Cb2ZGGVMXJmNHHnpE9KV6ZGsuiw75dORKg9i9VDj+SYgm6HhO61zENI6Yqbh
         ohYUyM+PJx8K06HbasSKm4GdcNvwWBrggW7RxnN2ixAMW1O2SP9VsXud3lnjfExm8vnq
         knHJ3sxWyNujZ7Dmj+GKB2B83aa7jvulXgUCoO4jXgcldomy80OodYw+xuD4LQVp6zw3
         hpPCp1vQup2U5xqryYNbqDB8W28E7CLpl3+gohE8RVqVNG7w+v6IDgBloqgl3vskSgoa
         Jp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757183803; x=1757788603;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+7c9v7WS7SgWPvY1/iQev0Y/b4zhJciSfPhNQ1aVFAg=;
        b=H4a6WQMaDGfy3GYjFPyF6TQdWGTSVo1wU8TVQlQbaSWBFrEwR0m9qh1sG1Ztvkh0l0
         qX3ZdZWrQ9toWdF6so+n0elD3/C5N965j5nGwmvhkrkzQYs37nHs6o77NfZAdWpGFET0
         1lA9q8kEzS8ba0FRqz9FGMlCewqcsLAOa4rjzCdF10QeNhG994CUNTA8M3eq6osIW60V
         R0tZRUmdq1Zd426JuniG5w4w4G6hRyll5L3NQAI4NiQqDipIwUL5K2GdATFTVjyRY7ev
         qc7iDhVheG4pcRdY+KujHaRv2MdUT/TkvqPP8YO9lRBTHRhcqeePkGnfPYNp194TtddL
         tFhA==
X-Forwarded-Encrypted: i=1; AJvYcCXZJUBH0GxsAkiHP+WAkzez6HACyaUnAMCi3N1FRarjnB4T0YjumNT6+gjf8rdc99A/kGrbapdsqps=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws28eKBq33a8oRnUj4Vfl/lZ9pQFN7+TCjEfhgEEVzxViFNAz0
	9sqfYQtn9PQoteV4HJjbujS+yvVp6KTk4cg4G3vrmyNN9dmTln/FqMYH6NSLcgFqHdg=
X-Gm-Gg: ASbGncvlXsVImfhnt2T7gwqEO0UbM5G3+bM90DiIqq/Xiysb4tMix1fmw9z9iUMwkF/
	FPJOHYGXkJVdLBMepegNT84hT2ge4B2+4EfZp204fBfmES0gW8TWB1PLUVKnmzZvM1fKXwi5xwl
	IREc3qebSgFAbRuZuy/s3uvuN38YRxlzNylo6ANsjGn1XSsr0QJmJ//Ng942JaX4NreBB+XOOCE
	avj+VnPJtKV8fBot1wpQH9XS8fyFq0qxXf/Q1YKCdB6I/hWh+AZyHf9SIU7ofq8hlPEXLwreyiy
	EVWGgcZbYxhw3T1Xz2l2vVPLUfUnvxarwR+jUJlFoHwQoeLsxgfN0fpCz8XPwPLZxiAvxzOKZjC
	97nJaKKiyQef8wTEVLkP7MygqW0q8+Os=
X-Google-Smtp-Source: AGHT+IEn2KyTrQwMN8+aAJseCCgB1jUIJoNjfsgRExWZNCB1C5IQQmu9eW0YceImHVyoB6Oun7Fw7g==
X-Received: by 2002:a05:600c:3b1d:b0:45d:dc85:c009 with SMTP id 5b1f17b1804b1-45ddde92816mr25903165e9.10.1757183802614;
        Sat, 06 Sep 2025 11:36:42 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b940bbc0dsm222805945e9.2.2025.09.06.11.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:36:42 -0700 (PDT)
Message-ID: <282ca7c4-7213-4e5d-9936-63687b5f4928@tuxon.dev>
Date: Sat, 6 Sep 2025 21:36:41 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 09/32] clk: at91: clk-programmable: use clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <aa1bae53bf124b8e46ff413b12528071262febb3.1752176711.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <aa1bae53bf124b8e46ff413b12528071262febb3.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/10/25 23:07, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of struct parent_hw as this leads
> to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
> conversion of existing SoC specific clock drivers from parent_names to
> modern clk_parent_data structures.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Add the clk-programmable changes to the
> SAMA7D65 and SAM9X75 SoCs. Add td_slck_name variable and index for the
> SAM9X75.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/clk-programmable.c |  8 ++++----
>   drivers/clk/at91/pmc.h              |  2 +-
>   drivers/clk/at91/sam9x7.c           | 21 +++++++++++----------
>   drivers/clk/at91/sama7d65.c         | 20 ++++++++++----------
>   drivers/clk/at91/sama7g5.c          | 20 ++++++++++----------
>   5 files changed, 36 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-programmable.c b/drivers/clk/at91/clk-programmable.c
> index 1195fb405503..275ca701f294 100644
> --- a/drivers/clk/at91/clk-programmable.c
> +++ b/drivers/clk/at91/clk-programmable.c
> @@ -215,7 +215,7 @@ static const struct clk_ops programmable_ops = {
>   struct clk_hw * __init
>   at91_clk_register_programmable(struct regmap *regmap,
>   			       const char *name, const char **parent_names,
> -			       struct clk_hw **parent_hws, u8 num_parents, u8 id,
> +			       struct clk_parent_data *parent_data, u8 num_parents, u8 id,
>   			       const struct clk_programmable_layout *layout,
>   			       u32 *mux_table)
>   {
> @@ -224,7 +224,7 @@ at91_clk_register_programmable(struct regmap *regmap,
>   	struct clk_init_data init = {};
>   	int ret;
>   
> -	if (id > PROG_ID_MAX || !(parent_names || parent_hws))
> +	if (id > PROG_ID_MAX || !(parent_names || parent_data))
>   		return ERR_PTR(-EINVAL);
>   
>   	prog = kzalloc(sizeof(*prog), GFP_KERNEL);
> @@ -233,8 +233,8 @@ at91_clk_register_programmable(struct regmap *regmap,
>   
>   	init.name = name;
>   	init.ops = &programmable_ops;
> -	if (parent_hws)
> -		init.parent_hws = (const struct clk_hw **)parent_hws;
> +	if (parent_data)
> +		init.parent_data = (const struct clk_parent_data *)parent_data;
>   	else
>   		init.parent_names = parent_names;
>   	init.num_parents = num_parents;
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index 54d472276fc9..34036f2d0578 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -263,7 +263,7 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
>   
>   struct clk_hw * __init
>   at91_clk_register_programmable(struct regmap *regmap, const char *name,
> -			       const char **parent_names, struct clk_hw **parent_hws,
> +			       const char **parent_names, struct clk_parent_data *parent_data,
>   			       u8 num_parents, u8 id,
>   			       const struct clk_programmable_layout *layout,
>   			       u32 *mux_table);
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index 945983f72140..86d624cd92b2 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -737,10 +737,11 @@ static const struct {
>   
>   static void __init sam9x7_pmc_setup(struct device_node *np)
>   {
> +	u8 td_slck_index = 0, md_slck_index = 1, main_xtal_index = 2;
>   	struct clk_range range = CLK_RANGE(0, 0);
>   	const char *main_xtal_name = "main_xtal";
> +	const char * const td_slck_name = "td_slck";
>   	const char *const md_slck_name = "md_slck";
> -	u8 md_slck_index = 1, main_xtal_index = 2;
>   	struct pmc_data *sam9x7_pmc;
>   	const char *parent_names[9];
>   	void **clk_mux_buffer = NULL;
> @@ -752,7 +753,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   	struct clk_hw *parent_hws[9];
>   	int i, j;
>   
> -	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
> +	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, td_slck_name));

Please use a pattern like:

i = of_property_match_string(np, "clock-names", "td_slck");
if (i < 0)
    return;

td_slck_name = of_clk_get_parent_name(np, i);

Same sama7d65, sama7g5.


>   	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, md_slck_name));
>   	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
>   
> @@ -880,20 +881,20 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   	if (IS_ERR(usbck_hw))
>   		goto err_free;
>   
> -	parent_hws[0] = md_slck_hw;
> -	parent_hws[1] = td_slck_hw;
> -	parent_hws[2] = sam9x7_pmc->chws[PMC_MAIN];
> -	parent_hws[3] = sam9x7_pmc->chws[PMC_MCK];
> -	parent_hws[4] = sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw;
> -	parent_hws[5] = sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw;
> -	parent_hws[6] = sam9x7_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw;
> +	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);

AT91_CLK_PD_NAME(md_slck_name);

> +	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name, td_slck_index);

AT91_CLK_PD_NAME(td_slck_name);

Same sama7d65, sama7g5.

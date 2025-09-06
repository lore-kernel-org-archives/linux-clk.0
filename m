Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C9627467F
	for <linux-clk@vger.kernel.org>; Sat,  6 Sep 2025 18:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757183788; cv=none; b=Y+rDOHXMb1FpYMIU2OxBpxzobBLdGiWqaAjQ0S1R7dtxOpR61i1tV/0U00wHu6ymEXF2V4+PFvtoVrOzTwf6AlEwTHnXxU6UG8h9aoyTkNJIl4Ot3sA4HZ2C7IS27GT3YVfIIoyouvDHWFi99p/RzEOwjTVIEhbgg06odE35ZH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757183788; c=relaxed/simple;
	bh=VKVL40eq8AIFhMhXtrVrqkkhF8cIFFkayIOfgvJ0MMo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UGe0NEPel1FWQWI9hxeVlCCfSb9ewpW2URzyEaknHuP6anKgfYDIHeODaiQHQlJ2DkDwtnAVjoFA5FlkFr5Qq4Q7F6JW/KXVDhGRhMbAtjuby9aZUG2+bJc0OW9tX6QWrnajW0dwAUhLGooaurVRI1dBWxFspKIaMyU1JZOZ+zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cfxcPBq3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cfxcPBq3"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45de1e6d76fso2335165e9.2
        for <linux-clk@vger.kernel.org>; Sat, 06 Sep 2025 11:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757183784; x=1757788584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=54ncVaPIl6vgU1gf8JptlaFEnSFvlH9WtRTSq/ZrGMM=;
        b=cfxcPBq3XXS3GZraQIOLbo8mG45CfLA35lkpCntZO6PlNkUdtZjnmDzdDEZdj8KQjW
         aFR2GGBhDmf7jhiptnVZ4sEwPFasPKNN8aK3FULNgmgUQ97GYKH7eHzOJe16NM83qB8R
         cPZl5En8IoO6o5/GGxIxb9Z0/aXbUHrpg4lWG3jK1+8/kEDIMy14YYX2FASjKSjnsabT
         Nup31A0qiacTwo6A/zVNYugVH9iP5ySQOAtahpCKQWTlkGD2qhALabiRnd+rAd8QGS48
         WAqicd57Af5RIVcPs+a0CsitmnQNhigq4VY0SnrP3/9gGK7zy3DGGstxK5mSjybV5BRR
         xORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757183784; x=1757788584;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=54ncVaPIl6vgU1gf8JptlaFEnSFvlH9WtRTSq/ZrGMM=;
        b=p/dPV1vwNCKepGjSQPmJJeEXOCuPyLVmy/hiAEfOWfTGHdqUQRt9adw4RKvbvR9Vjw
         XS0+cdLd+v3p1WgxaCDUUNH1dKFjm0CmJOKC+WI/XC977DW49Ln8W/E4lwt+dpU6t13B
         4sR10CjSgrmm6bxzA8H0MHN1HurXbRO5M+c2W5WxjlGptyKWwb8akJw9VknFDwajLm1S
         iElotYpMkSaTpKM5400zaQXIhecnXvElLdLi/NgwNBOQoY80gnhQ1j1+pPpXYanKThA+
         0Ql5V2MDMleccGWmpm//BDLiCi/mKZfBTpF1N93qekYNmzjF0P1lscg7hI1qyN21Do4k
         0Mgw==
X-Forwarded-Encrypted: i=1; AJvYcCUYdmUKI6+AlpX3SszPsH0r0yROeGfIchp3+KePV9ely/t0lqVV/E0tY1kmKQKDVaOm1/di4LfpTfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdkCzX8wKUXGIkLyMannEM/8SHbNUiqZw22YCuqY6XrWonA+NS
	dLe/vLGBfUYTyjqFdFejkINTZVJVhpULFyUQVvzuQcaRncC5/sj+fxTpTpeFFH+dJUw=
X-Gm-Gg: ASbGncsdfuymt0hiW00h3Z2GsZuUZcKBtC6tiXd0/QbPaXbWpVpBb1PxIax/8jJSXis
	RWMS8OuXmilFpnyiksBCN2OrJ8AVfvIH9ZUfnm7wYjuWnRwh/OXAFOHu/pA/objVFODsv25scrY
	JKPPXnr0NGDdDbh1XBFkCw9HOouvCd66MVaI9dPoiBGFnVO/9ZByWVCKPkts06yqgNVlvi6gor2
	CJrktDhwCPePxQ4pLMvfrq7k496iAU/j8hUV0pNdSXhjFk1WXlUp+hlvK891cuEd6iX2EprBWVA
	226T3khlv4rdO5uI5t5p6DDcLK5eX9UPg3fREwR1q5cGDHxeTYSK+/oI6V4rOFt8IG4KNEEAjTk
	gFlECZeYbOJ7vHhgwo8oxf0g4G2z5xtUt0bB3ystbew==
X-Google-Smtp-Source: AGHT+IHgGwWC3QcD58nUjxRKUaGgpa6imWI7sfXUg1oiAyn2VoRF7Hl9zOTaDpkuJIwGLGlYEOuU5g==
X-Received: by 2002:a05:600c:1993:b0:45b:7a93:f108 with SMTP id 5b1f17b1804b1-45dddeb74a0mr23287305e9.3.1757183784329;
        Sat, 06 Sep 2025 11:36:24 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45ddfe0b654sm29303605e9.3.2025.09.06.11.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:36:23 -0700 (PDT)
Message-ID: <95e19f49-d0df-4d3f-bd7d-8b58b60f1f7a@tuxon.dev>
Date: Sat, 6 Sep 2025 21:36:22 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 08/32] clk: at91: clk-master: use clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <4b404eaaab4062464a4142e95aaa76d5cba866f0.1752176711.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <4b404eaaab4062464a4142e95aaa76d5cba866f0.1752176711.git.Ryan.Wanner@microchip.com>
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
> The md_slck name and index are added for the SAM9X75 SoC so the
> clk-master can properly use parent_data.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Add clk-master changes to SAM9X75 and
> SAMA7D65 SoCs. As well as add md_slck commit message.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/clk-master.c | 24 ++++++++++++------------
>   drivers/clk/at91/pmc.h        |  6 +++---
>   drivers/clk/at91/sam9x7.c     | 19 ++++++++++---------
>   drivers/clk/at91/sama7d65.c   | 23 ++++++++++-------------
>   drivers/clk/at91/sama7g5.c    | 29 +++++++++++++----------------
>   5 files changed, 48 insertions(+), 53 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-master.c b/drivers/clk/at91/clk-master.c
> index 7a544e429d34..cc4f3beb51e5 100644
> --- a/drivers/clk/at91/clk-master.c
> +++ b/drivers/clk/at91/clk-master.c
> @@ -473,7 +473,7 @@ static struct clk_hw * __init
>   at91_clk_register_master_internal(struct regmap *regmap,
>   		const char *name, int num_parents,
>   		const char **parent_names,
> -		struct clk_hw **parent_hws,
> +		struct clk_parent_data *parent_data,
>   		const struct clk_master_layout *layout,
>   		const struct clk_master_characteristics *characteristics,
>   		const struct clk_ops *ops, spinlock_t *lock, u32 flags)
> @@ -485,7 +485,7 @@ at91_clk_register_master_internal(struct regmap *regmap,
>   	unsigned long irqflags;
>   	int ret;
>   
> -	if (!name || !num_parents || !(parent_names || parent_hws) || !lock)
> +	if (!name || !num_parents || !(parent_names || parent_data) || !lock)
>   		return ERR_PTR(-EINVAL);
>   
>   	master = kzalloc(sizeof(*master), GFP_KERNEL);
> @@ -494,8 +494,8 @@ at91_clk_register_master_internal(struct regmap *regmap,
>   
>   	init.name = name;
>   	init.ops = ops;
> -	if (parent_hws)
> -		init.parent_hws = (const struct clk_hw **)parent_hws;
> +	if (parent_data)
> +		init.parent_data = (const struct clk_parent_data *)parent_data;
>   	else
>   		init.parent_names = parent_names;
>   	init.num_parents = num_parents;
> @@ -531,13 +531,13 @@ struct clk_hw * __init
>   at91_clk_register_master_pres(struct regmap *regmap,
>   		const char *name, int num_parents,
>   		const char **parent_names,
> -		struct clk_hw **parent_hws,
> +		struct clk_parent_data *parent_data,
>   		const struct clk_master_layout *layout,
>   		const struct clk_master_characteristics *characteristics,
>   		spinlock_t *lock)
>   {
>   	return at91_clk_register_master_internal(regmap, name, num_parents,
> -						 parent_names, parent_hws, layout,
> +						 parent_names, parent_data, layout,
>   						 characteristics,
>   						 &master_pres_ops,
>   						 lock, CLK_SET_RATE_GATE);
> @@ -546,7 +546,7 @@ at91_clk_register_master_pres(struct regmap *regmap,
>   struct clk_hw * __init
>   at91_clk_register_master_div(struct regmap *regmap,
>   		const char *name, const char *parent_name,
> -		struct clk_hw *parent_hw, const struct clk_master_layout *layout,
> +		struct clk_parent_data *parent_data, const struct clk_master_layout *layout,
>   		const struct clk_master_characteristics *characteristics,
>   		spinlock_t *lock, u32 flags, u32 safe_div)
>   {
> @@ -560,7 +560,7 @@ at91_clk_register_master_div(struct regmap *regmap,
>   
>   	hw = at91_clk_register_master_internal(regmap, name, 1,
>   					       parent_name ? &parent_name : NULL,
> -					       parent_hw ? &parent_hw : NULL, layout,
> +					       parent_data, layout,
>   					       characteristics, ops,
>   					       lock, flags);
>   
> @@ -812,7 +812,7 @@ struct clk_hw * __init
>   at91_clk_sama7g5_register_master(struct regmap *regmap,
>   				 const char *name, int num_parents,
>   				 const char **parent_names,
> -				 struct clk_hw **parent_hws,
> +				 struct clk_parent_data *parent_data,
>   				 u32 *mux_table,
>   				 spinlock_t *lock, u8 id,
>   				 bool critical, int chg_pid)
> @@ -824,7 +824,7 @@ at91_clk_sama7g5_register_master(struct regmap *regmap,
>   	unsigned int val;
>   	int ret;
>   
> -	if (!name || !num_parents || !(parent_names || parent_hws) || !mux_table ||
> +	if (!name || !num_parents || !(parent_names || parent_data) || !mux_table ||
>   	    !lock || id > MASTER_MAX_ID)
>   		return ERR_PTR(-EINVAL);
>   
> @@ -834,8 +834,8 @@ at91_clk_sama7g5_register_master(struct regmap *regmap,
>   
>   	init.name = name;
>   	init.ops = &sama7g5_master_ops;
> -	if (parent_hws)
> -		init.parent_hws = (const struct clk_hw **)parent_hws;
> +	if (parent_data)
> +		init.parent_data = (const struct clk_parent_data *)parent_data;
>   	else
>   		init.parent_names = parent_names;
>   	init.num_parents = num_parents;
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index d9a04fddb0b1..54d472276fc9 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -204,14 +204,14 @@ at91_clk_register_sam9x5_main(struct regmap *regmap, const char *name,
>   struct clk_hw * __init
>   at91_clk_register_master_pres(struct regmap *regmap, const char *name,
>   			      int num_parents, const char **parent_names,
> -			      struct clk_hw **parent_hws,
> +			      struct clk_parent_data *parent_data,
>   			      const struct clk_master_layout *layout,
>   			      const struct clk_master_characteristics *characteristics,
>   			      spinlock_t *lock);
>   
>   struct clk_hw * __init
>   at91_clk_register_master_div(struct regmap *regmap, const char *name,
> -			     const char *parent_names, struct clk_hw *parent_hw,
> +			     const char *parent_names, struct clk_parent_data *parent_data,
>   			     const struct clk_master_layout *layout,
>   			     const struct clk_master_characteristics *characteristics,
>   			     spinlock_t *lock, u32 flags, u32 safe_div);
> @@ -220,7 +220,7 @@ struct clk_hw * __init
>   at91_clk_sama7g5_register_master(struct regmap *regmap,
>   				 const char *name, int num_parents,
>   				 const char **parent_names,
> -				 struct clk_hw **parent_hws, u32 *mux_table,
> +				 struct clk_parent_data *parent_data, u32 *mux_table,
>   				 spinlock_t *lock, u8 id, bool critical,
>   				 int chg_pid);
>   
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index eaae05ba21ad..945983f72140 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -739,7 +739,8 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   {
>   	struct clk_range range = CLK_RANGE(0, 0);
>   	const char *main_xtal_name = "main_xtal";
> -	u8 main_xtal_index = 2;
> +	const char *const md_slck_name = "md_slck";
> +	u8 md_slck_index = 1, main_xtal_index = 2;
>   	struct pmc_data *sam9x7_pmc;
>   	const char *parent_names[9];
>   	void **clk_mux_buffer = NULL;
> @@ -747,12 +748,12 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   	struct regmap *regmap;
>   	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
>   	struct clk_hw *td_slck_hw, *md_slck_hw, *usbck_hw;
> -	struct clk_parent_data parent_data[2];
> +	struct clk_parent_data parent_data[9];
>   	struct clk_hw *parent_hws[9];
>   	int i, j;
>   
>   	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
> -	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
> +	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, md_slck_name));

Please use:

i = of_property_match_string(np, "clock-names", "md_slck");
if (i < 0)
    return;

md_slck_name = of_clk_get_parent_name(np, i);

Same sama7d65, sama7g5.

>   	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
>   
>   	if (!td_slck_hw || !md_slck_hw || !main_xtal_hw)
> @@ -853,18 +854,18 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   		}
>   	}
>   
> -	parent_hws[0] = md_slck_hw;
> -	parent_hws[1] = sam9x7_pmc->chws[PMC_MAIN];
> -	parent_hws[2] = sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw;
> -	parent_hws[3] = sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw;
> +	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name, md_slck_index);

AT91_CLK_PD_NAME(md_slck_name);

Same sama7d65, sama7g5.


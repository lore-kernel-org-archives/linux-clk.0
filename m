Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF5ED515
	for <linux-clk@vger.kernel.org>; Fri, 30 Jan 2026 06:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769756205; cv=none; b=f+O0luUYbyxP6QybB/dskV2nImaQ0o5gH4cnAZax3GQ5fnSH8yR4UqZXvOVRTYz/AA3fiW9PlwKwhiLym43t/j/RhR1yacr3nmIFRgwcrQ+5me/bmCD4HcaTcaxtl4Fj1KLPuCTQ9aP4GRPS8vQNvLs6w4v3alP+b5/nBDnWO3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769756205; c=relaxed/simple;
	bh=ydnADrdt3dF9S+IKVMg4evGTJf8HU8DfhtFjABtZExA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FNbx9LHss0ZaeqqhZhDnYA9Apn2/ceBrdF6flD5vJAOmkFLb8aiELlNsIxgDWXoDV54QX2d18T06De4Vjj8NUbVHx6o6lpY1iFvla1aqWczeZ784VTJFGvK6m6jCDxNrHWxZIcx1hFdXd6B9IAAsm5XivSkWVyjq4MwpbM9ZmOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=D5lNNrEY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="D5lNNrEY"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-481188b7760so11184425e9.0
        for <linux-clk@vger.kernel.org>; Thu, 29 Jan 2026 22:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769756200; x=1770361000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HUIw0RJaE1aXOBsFkdxWp8jD82cs6plN0HTFY2F6+4M=;
        b=D5lNNrEY5ZU/y2YQXeGgnxKamQ907Ec9Dg8JqH+YCNX+r4FZqQHpZ80ZOLfHKlPvb/
         l3e+d2X8QeF/cjaboI5hsqgaGS4pUOt76nQ8q+zv08w5w5nXAjK79ca3/7syMw6OTy3L
         4uvhhUKRTH4n5QqOZqNC2zjJAZUBEj0+jMAscfRaShUyWWuBKyjSk447UxbSfp2bhjT3
         DSlOVqN4EPIjsYDaKUuQ4r3fklWpW5WyFGuKfBBxjrghUmiVaxJ+OXwU1d0fOVmffQYY
         qnpaymL/OcMRid7UtfIKvVZcJ9SQEH8XUHoRnyEKbMvyJu53vxeXOv7jdPVcz0TJ7Nza
         h/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769756200; x=1770361000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HUIw0RJaE1aXOBsFkdxWp8jD82cs6plN0HTFY2F6+4M=;
        b=RTyovtuQ3lrCyYCKCPUeL6BoI+pBXuEnMRA7Nr9jwKldyOspXLpCbMHC/cIoHEbPqa
         M0e16P3/Mnr2WfggBwOrap2HTzrJyn9Z3qqfQIFJFYYRsExFG9goLL9vQTqAEHHVAYEr
         cMLLMfU/wkWlxGSLk7h9mtOE5UqKFwzuMl7qtGRnVL2X9vCqBwkYjGmTUDDR78E/Uhj7
         lfRZL9QE7YUT9WuQhY/Okom3Iq2xIVs5scCk1qayut+cd9rMFc22hoK0bvuaJKiIYRrT
         cCeewZLv1rm2ORd2al+/hJHU96znlNPoNa2hd8CgzWKov+ZUL9GoaY+NAWTRspHdjGXI
         s4Kg==
X-Forwarded-Encrypted: i=1; AJvYcCXaYoTmd+5mQA1Fx9/IEqG5bI0Xs42Owvej01zBt5DIhO7d+JsZR/TBzEoi5jYNlYUfNVdLlb88u+A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3njTTfgsj7KDlmLSePQRIeFQCjUvYLWsJHYOU417hjSd3xjaV
	o/yjEMbqfDMAVxRE+njSvETU8CjjjEYH+HtTW4Zn4ewPvSgvIW9nttlXEOu7ywMOujU=
X-Gm-Gg: AZuq6aKyeIeVk9J5N934UBHHtj9j+Af5Y62q4ui1o2/qxsaAeogRFxluWwEqjcwTqJj
	xvjBqYPfz9dbbXcgju4Amg/xd/iBm0YImBvY2UI69apHY/BkdnMApZ952d2LhVhAXnR8d/DJF2s
	p653ifMaldDetfaY/EMYNC79PRIzvnpMo2t6bat6LBOlFTW9KMxujvGfxsRlGjtxUvgFXuQvdRJ
	f/kOMZT6ffE+PK5t/iQzV3pm650U9TEmZL7cLDrA4h6q42H9CQeGrTZXTxHLLXGx9UjBdGVWCTT
	8gHL6WMo6ehAY21n39bszaf4TgVvNDZDQlji1IX3tnVIPvaUWopdDTDTl6pVSyS6eZ6tYLx88OX
	9a9XOEmRtd3Oytc2V7R0iXgI87xqhhxsu1q+fA0ap3q9m96x2KSP7yHSpeG6RMs4iFNfAkE3vST
	aKWzvcDHqWJw9IzILUKA==
X-Received: by 2002:a05:600c:4ecd:b0:480:3230:6c89 with SMTP id 5b1f17b1804b1-482db4616damr16802455e9.12.1769756199522;
        Thu, 29 Jan 2026 22:56:39 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dffd47c2sm7593775e9.0.2026.01.29.22.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 22:56:38 -0800 (PST)
Message-ID: <fbf00a15-9faf-4455-ad4b-c351ffae6598@tuxon.dev>
Date: Fri, 30 Jan 2026 08:56:37 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/31] clk: at91: clk-generated: use clk_parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <564e91919099ad05f11d22ff20a6dc674f1d0ba4.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <564e91919099ad05f11d22ff20a6dc674f1d0ba4.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of struct parent_hw as this leads
> to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
> conversion of existing SoC specific clock drivers from parent_names to
> modern clk_parent_data structures.
> 
> Remove the last of the usage of __clk_get_hw().
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Added SAMA7D65 and SAM9X75 SoCs to the
> clk-generated changes. Adjust clk name variable order.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/clk-generated.c |  8 +++----
>   drivers/clk/at91/pmc.h           |  2 +-
>   drivers/clk/at91/sam9x7.c        | 37 ++++++++++++++++----------------
>   drivers/clk/at91/sama7d65.c      | 37 ++++++++++++++++----------------
>   drivers/clk/at91/sama7g5.c       | 35 +++++++++++++++---------------
>   5 files changed, 58 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-generated.c b/drivers/clk/at91/clk-generated.c
> index 4b4edeecc889..d9e00167dbc8 100644
> --- a/drivers/clk/at91/clk-generated.c
> +++ b/drivers/clk/at91/clk-generated.c
> @@ -319,7 +319,7 @@ struct clk_hw * __init
>   at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
>   			    const struct clk_pcr_layout *layout,
>   			    const char *name, const char **parent_names,
> -			    struct clk_hw **parent_hws,
> +			    struct clk_parent_data *parent_data,
>   			    u32 *mux_table, u8 num_parents, u8 id,
>   			    const struct clk_range *range,
>   			    int chg_pid)
> @@ -329,7 +329,7 @@ at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
>   	struct clk_hw *hw;
>   	int ret;
>   
> -	if (!(parent_names || parent_hws))
> +	if (!(parent_names || parent_data))
>   		return ERR_PTR(-ENOMEM);
>   
>   	gck = kzalloc(sizeof(*gck), GFP_KERNEL);
> @@ -338,8 +338,8 @@ at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
>   
>   	init.name = name;
>   	init.ops = &generated_ops;
> -	if (parent_hws)
> -		init.parent_hws = (const struct clk_hw **)parent_hws;
> +	if (parent_data)
> +		init.parent_data = (const struct clk_parent_data *)parent_data;
>   	else
>   		init.parent_names = parent_names;
>   	init.num_parents = num_parents;
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index 3d06b1c41f13..d8d491096c0d 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -174,7 +174,7 @@ struct clk_hw * __init
>   at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
>   			    const struct clk_pcr_layout *layout,
>   			    const char *name, const char **parent_names,
> -			    struct clk_hw **parent_hws, u32 *mux_table,
> +			    struct clk_parent_data *parent_data, u32 *mux_table,
>   			    u8 num_parents, u8 id,
>   			    const struct clk_range *range, int chg_pid);
>   
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index f98aecdd6f88..d549bdd988e8 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -744,16 +744,15 @@ static const struct {
>   static void __init sam9x7_pmc_setup(struct device_node *np)
>   {
>   	struct clk_range range = CLK_RANGE(0, 0);
> -	const char *main_xtal_name;
> +	const char *main_xtal_name, *td_slck_name, *md_slck_name;
>   	struct pmc_data *sam9x7_pmc;
>   	const char *parent_names[9];
>   	void **clk_mux_buffer = NULL;
>   	int clk_mux_buffer_size = 0;
>   	struct regmap *regmap;
>   	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
> -	struct clk_hw *td_slck_hw, *md_slck_hw, *usbck_hw;
> +	struct clk_hw *usbck_hw;
>   	struct clk_parent_data parent_data[9];
> -	struct clk_hw *parent_hws[9];
>   	int i, j;
>   
>   	i = of_property_match_string(np, "clock-names", "main_xtal");
> @@ -762,11 +761,15 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   		return;
>   	main_xtal_name = of_clk_get_parent_name(np, i);
>   
> -	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
> -	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
> +	i =  of_property_match_string(np, "clock-names", "td_slck");
> +	if (i < 0)
> +		return;
> +	td_slck_name = of_clk_get_parent_name(np, i);
>   
> -	if (!td_slck_hw || !md_slck_hw)
> +	i =  of_property_match_string(np, "clock-names", "md_slck");
> +	if (i < 0)
>   		return;
> +	md_slck_name = of_clk_get_parent_name(np, i);
>   
>   	regmap = device_node_to_regmap(np);
>   	if (IS_ERR(regmap))
> @@ -862,7 +865,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   		}
>   	}
>   
> -	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
> +	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
>   	parent_data[1] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MAIN]);
>   	parent_data[2] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw);
>   	parent_data[3] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw);
> @@ -888,8 +891,8 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   	if (IS_ERR(usbck_hw))
>   		goto err_free;
>   
> -	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
> -	parent_data[1] = AT91_CLK_PD_NAME("td_slck");
> +	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
> +	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name);
>   	parent_data[2] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MAIN]);
>   	parent_data[3] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MCK]);
>   	parent_data[4] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw);
> @@ -940,13 +943,12 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   		sam9x7_pmc->phws[sam9x7_periphck[i].id] = hw;
>   	}
>   
> -	parent_hws[0] = md_slck_hw;
> -	parent_hws[1] = td_slck_hw;
> -	parent_hws[2] = sam9x7_pmc->chws[PMC_MAIN];
> -	parent_hws[3] = sam9x7_pmc->chws[PMC_MCK];
> +	parent_data[0] = AT91_CLK_PD_NAME(md_slck_name);
> +	parent_data[1] = AT91_CLK_PD_NAME(td_slck_name);
> +	parent_data[2] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MAIN]);
> +	parent_data[3] = AT91_CLK_PD_HW(sam9x7_pmc->chws[PMC_MCK]);
>   	for (i = 0; i < ARRAY_SIZE(sam9x7_gck); i++) {
>   		u8 num_parents = 4 + sam9x7_gck[i].pp_count;
> -		struct clk_hw *tmp_parent_hws[6];
>   		u32 *mux_table;
>   
>   		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
> @@ -962,16 +964,13 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   			u8 pll_id = sam9x7_gck[i].pp[j].pll_id;
>   			u8 pll_compid = sam9x7_gck[i].pp[j].pll_compid;
>   
> -			tmp_parent_hws[j] = sam9x7_plls[pll_id][pll_compid].hw;
> +			parent_data[4 + j] = AT91_CLK_PD_HW(sam9x7_plls[pll_id][pll_compid].hw);
>   		}
>   
> -		PMC_FILL_TABLE(&parent_hws[4], tmp_parent_hws,
> -			       sam9x7_gck[i].pp_count);
> -

Ideally, these kind of changes should have been done through a different patch.
Could you please create a different patch for all changes like in this series?

With that addressed:

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

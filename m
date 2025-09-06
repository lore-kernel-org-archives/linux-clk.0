Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B6D268C63
	for <linux-clk@vger.kernel.org>; Sat,  6 Sep 2025 18:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757183740; cv=none; b=XojKGMZqlyZ0+g1cK4tMfqgGFOmxSqAdA4fNuDOsxihJzdLNJFgznq/wD6ESs3IEmXCvtBaEQjVQCZvyGRfoJ3gbrPsVaGYVLGux50ZBWAoduUYb8qNQE8zhG8YWg2qY0Buf97jXbi18gHQh+DmEz+w2K2ZwBJ/Q0rDq+cz3Z7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757183740; c=relaxed/simple;
	bh=INVKtWZhSgrbYf16941J0EzGl8mycJx6Wzm/74OTaSk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=suUbCsEBXyU6GyQNXHvwx2TVXQcje5K649EanzdCjW7yZ4D5Z8gNTYII7o5BpjgNP2mlp/2DkCq02WVRksVQPySnvqmozXD8eMe+hGHlZkhmajRFIxPbzY7N0kF8gch7bWxNrYX9WasQSJq4qTkYtLKkNHpXn7jpItbU/UUnTQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TzyWFPF0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TzyWFPF0"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b7722ea37so16428805e9.1
        for <linux-clk@vger.kernel.org>; Sat, 06 Sep 2025 11:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757183737; x=1757788537; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dowxdedaabw9pmvRWcOU8YmdjNMCxfM0EeEvHC1enGo=;
        b=TzyWFPF0Fi0xCXhILED0XVx+rE6K8yDeTFoNHayugxu0pX2ILfRK0jBBxDhdNxuqBQ
         RCa7Q+VzBdbgfdYIsqLP2DzPxiYVEmF1Uf97Fs4cwBo9JwdYzJ0da/0JWWEtozsQfY1W
         nl1jD2xtCLkIgu5hhXZ2ARHBc/drYRDmdYopAa+vBSMKEZAlLfgG3KgjDJ9fkDVKUKDr
         Ub0Zh7URXNaGNl6lgOf/WhB082miYDjLo0C0qFbaNG7cENtseyBOe/NHGGhTjkKQIJjM
         mCZUkix3QyiZdixEBIfpCTIrZIdOp0ZwtBwcMeX9jcS9Jaj//EUhnLooHKDZUIGdxnfY
         WAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757183737; x=1757788537;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dowxdedaabw9pmvRWcOU8YmdjNMCxfM0EeEvHC1enGo=;
        b=nrNyVOmxZG3QiyVO9kUaGqnazJgTXPVDh60lDh4Y3w6bwcOb+30X+i3PHAx3rQw/HU
         v6XwTw6T39CgKwMZlUNtpSivH7ax/TnlsfBXhzH6A/lTqnHIOo7MxjpzgsuRtKkjbkFe
         bxaEHy2rCRzDMOJbOAjz0EnRtcRckYIEeP7Z3ArLDtY5ulubPusudLucJ4CNPSNanZvB
         5U8uUm+b15b7mdCcLR0J9ARTz2CcTKdv+6vw7dlyfRX5HfN3Uk4MNNppBYkIkS7T/F99
         BoWZR7nbSoDx8UZWnl2jhAqllHPKubvLmLwSJnNhbx1yKFfYhfzLisOjzNEd21ZJuJqc
         5dTg==
X-Forwarded-Encrypted: i=1; AJvYcCXUMLxnlueMK0fau4yJVFZpO6fmWfsbJNJeyyoDPgOy7vTXgKjnGyr39KezzIx+mJr5yb+gy5D9mno=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAywyxbNpf8HZMnd6+FWwxq4iZnpRY4vHNQRjoRuMuiQa6OMRZ
	CK0uQsfQDEE/ClD09ipvB4UjjkS3W/Be7D61y25sA8FZqZeeGFaH/TJKR5jKhzR3ruuI3rOZY0S
	LFwNO
X-Gm-Gg: ASbGncsbS11j+lTczaLrbUvFa25JUUy0Y+OsJlbcrXvrQuztTWKR1vK/4NECJ2/fesB
	onVpULxF4a5isjKc2fn4Fh0pKJ6+TRSOOq1VHzzUcYEyWrt7isfLyEp6mUWkWyevCT3rNL86GC+
	S2GOUtipheTdEHC5CdPtYfdOchfhkOmVS/C8+ur+3+yYisO4MfcCF6o+qcgkLTWy/pV7EopOSkh
	dLhhVRmoDbhUC0Zv2k8zD3PaiqXSpZkYlHBV//KClb/kKyUOAV5oKycJHHUDsng2DlSSZ7p/6X5
	d0wQ7vwQMB+ML7zqlXHic/JGUv2kAvO3B8QV5DcTxitaLk96/J71hUaqA0KYWexkqwLCx+hJXek
	JlhjRS83bgZhSO8f2v8sLGpIRLb+jrwvnz3mzEPc7YQ==
X-Google-Smtp-Source: AGHT+IFqHQftxhyWop0NQsuDuKJieWCJS/ELGIRCmyIaJV/f88uiSxO0l/KEtdpJymZlggSX1ktNCg==
X-Received: by 2002:a05:600c:3b97:b0:456:942:b162 with SMTP id 5b1f17b1804b1-45dde200426mr27655935e9.11.1757183736423;
        Sat, 06 Sep 2025 11:35:36 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd3aadbcesm103081405e9.17.2025.09.06.11.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:35:35 -0700 (PDT)
Message-ID: <e2d8757b-9554-49b0-a067-f5aa657f3003@tuxon.dev>
Date: Sat, 6 Sep 2025 21:35:34 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 06/32] clk: at91: clk-main: switch to clk parent data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <33cec8a2f82e1bc747aa4315e47d535b7cec5a63.1752176711.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <33cec8a2f82e1bc747aa4315e47d535b7cec5a63.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 7/10/25 23:06, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of parent_hw for the main clock.

Same here as in patch 05/32. Please check the other patches as well.


> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip: Add SAMA7D65 and SAM9X75 SoCs to use parent_data.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/clk-main.c | 16 ++++++++--------
>   drivers/clk/at91/pmc.h      |  4 ++--
>   drivers/clk/at91/sam9x7.c   | 21 ++++++++++-----------
>   drivers/clk/at91/sama7d65.c | 21 ++++++++++-----------
>   drivers/clk/at91/sama7g5.c  | 21 ++++++++++-----------
>   5 files changed, 40 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-main.c b/drivers/clk/at91/clk-main.c
> index 9b462becc693..514c5690253f 100644
> --- a/drivers/clk/at91/clk-main.c
> +++ b/drivers/clk/at91/clk-main.c
> @@ -402,7 +402,7 @@ struct clk_hw * __init
>   at91_clk_register_rm9200_main(struct regmap *regmap,
>   			      const char *name,
>   			      const char *parent_name,
> -			      struct clk_hw *parent_hw)
> +			      struct clk_parent_data *parent_data)
>   {
>   	struct clk_rm9200_main *clkmain;
>   	struct clk_init_data init = {};
> @@ -412,7 +412,7 @@ at91_clk_register_rm9200_main(struct regmap *regmap,
>   	if (!name)
>   		return ERR_PTR(-EINVAL);
>   
> -	if (!(parent_name || parent_hw))
> +	if (!(parent_name || parent_data))
>   		return ERR_PTR(-EINVAL);
>   
>   	clkmain = kzalloc(sizeof(*clkmain), GFP_KERNEL);
> @@ -421,8 +421,8 @@ at91_clk_register_rm9200_main(struct regmap *regmap,
>   
>   	init.name = name;
>   	init.ops = &rm9200_main_ops;
> -	if (parent_hw)
> -		init.parent_hws = (const struct clk_hw **)&parent_hw;
> +	if (parent_data)
> +		init.parent_data = (const struct clk_parent_data *)parent_data;
>   	else
>   		init.parent_names = &parent_name;
>   	init.num_parents = 1;
> @@ -552,7 +552,7 @@ struct clk_hw * __init
>   at91_clk_register_sam9x5_main(struct regmap *regmap,
>   			      const char *name,
>   			      const char **parent_names,
> -			      struct clk_hw **parent_hws,
> +			      struct clk_parent_data *parent_data,
>   			      int num_parents)
>   {
>   	struct clk_sam9x5_main *clkmain;
> @@ -564,7 +564,7 @@ at91_clk_register_sam9x5_main(struct regmap *regmap,
>   	if (!name)
>   		return ERR_PTR(-EINVAL);
>   
> -	if (!(parent_hws || parent_names) || !num_parents)
> +	if (!(parent_data || parent_names) || !num_parents)
>   		return ERR_PTR(-EINVAL);
>   
>   	clkmain = kzalloc(sizeof(*clkmain), GFP_KERNEL);
> @@ -573,8 +573,8 @@ at91_clk_register_sam9x5_main(struct regmap *regmap,
>   
>   	init.name = name;
>   	init.ops = &sam9x5_main_ops;
> -	if (parent_hws)
> -		init.parent_hws = (const struct clk_hw **)parent_hws;
> +	if (parent_data)
> +		init.parent_data = (const struct clk_parent_data *)parent_data;
>   	else
>   		init.parent_names = parent_names;
>   	init.num_parents = num_parents;
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index b6f2aca1e1fd..e32a5e85d08f 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -195,11 +195,11 @@ struct clk_hw * __init
>   at91_clk_register_rm9200_main(struct regmap *regmap,
>   			      const char *name,
>   			      const char *parent_name,
> -			      struct clk_hw *parent_hw);
> +			      struct clk_parent_data *parent_data);
>   struct clk_hw * __init
>   at91_clk_register_sam9x5_main(struct regmap *regmap, const char *name,
>   			      const char **parent_names,
> -			      struct clk_hw **parent_hws, int num_parents);
> +			      struct clk_parent_data *parent_data, int num_parents);
>   
>   struct clk_hw * __init
>   at91_clk_register_master_pres(struct regmap *regmap, const char *name,
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index d7dc5f381ebe..eaae05ba21ad 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -747,7 +747,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   	struct regmap *regmap;
>   	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
>   	struct clk_hw *td_slck_hw, *md_slck_hw, *usbck_hw;
> -	static struct clk_parent_data parent_data;
> +	struct clk_parent_data parent_data[2];
>   	struct clk_hw *parent_hws[9];
>   	int i, j;
>   
> @@ -780,15 +780,14 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   	if (IS_ERR(main_rc_hw))
>   		goto err_free;
>   
> -	parent_data.name = main_xtal_name;
> -	parent_data.fw_name = main_xtal_name;
> -	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL, &parent_data, 0);
> +	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
> +						 &AT91_CLK_PD_NAME(main_xtal_name, main_xtal_index), 0);

here &AT91_CLK_PD_NAME(main_xtal_name)

where main_xtal_name is retrieved with of_clk_get_parent_name(). Same for
the other SoCs touched in this patch. Same approach would have to be taken
into account for patches in this series using main_xtal, md_slck, td_slck
as parents through AT91_CLK_PD_NAME().

>   	if (IS_ERR(main_osc_hw))
>   		goto err_free;
>   
> -	parent_hws[0] = main_rc_hw;
> -	parent_hws[1] = main_osc_hw;
> -	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_hws, 2);
> +	parent_data[0] = AT91_CLK_PD_HW(main_rc_hw);
> +	parent_data[1] = AT91_CLK_PD_HW(main_osc_hw);
> +	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_data, 2);
>   	if (IS_ERR(hw))
>   		goto err_free;
>   
> @@ -805,12 +804,12 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   			case PLL_TYPE_FRAC:
>   				switch (sam9x7_plls[i][j].p) {
>   				case SAM9X7_PLL_PARENT_MAINCK:
> -					parent_data = AT91_CLK_PD_NAME("mainck", -1);
> +					parent_data[0] = AT91_CLK_PD_NAME("mainck", -1);
>   					hw = sam9x7_pmc->chws[PMC_MAIN];
>   					break;
>   				case SAM9X7_PLL_PARENT_MAIN_XTAL:
> -					parent_data = AT91_CLK_PD_NAME(main_xtal_name,
> -								       main_xtal_index);
> +					parent_data[0] = AT91_CLK_PD_NAME(main_xtal_name,
> +									  main_xtal_index);
>   					hw = main_xtal_hw;
>   					break;
>   				default:
> @@ -825,7 +824,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   				hw = sam9x60_clk_register_frac_pll(regmap,
>   								   &pmc_pll_lock,
>   								   sam9x7_plls[i][j].n,
> -								   &parent_data, parent_rate, i,
> +								   parent_data, parent_rate, i,
>   								   sam9x7_plls[i][j].c,
>   								   sam9x7_plls[i][j].l,
>   								   sam9x7_plls[i][j].f);
> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index 372e530f4107..1d461db0438f 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -1098,7 +1098,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   	struct regmap *regmap;
>   	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
>   	struct clk_hw *td_slck_hw, *md_slck_hw;
> -	static struct clk_parent_data parent_data;
> +	struct clk_parent_data parent_data[2];
>   	struct clk_hw *parent_hws[10];
>   	bool bypass;
>   	int i, j;
> @@ -1134,16 +1134,15 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   
>   	bypass = of_property_read_bool(np, "atmel,osc-bypass");
>   
> -	parent_data.name = main_xtal_name;
> -	parent_data.fw_name = main_xtal_name;
>   	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
> -						 &parent_data, bypass);
> +						 &AT91_CLK_PD_NAME(main_xtal_name, main_xtal_index),
> +						 bypass);
>   	if (IS_ERR(main_osc_hw))
>   		goto err_free;
>   
> -	parent_hws[0] = main_rc_hw;
> -	parent_hws[1] = main_osc_hw;
> -	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_hws, 2);
> +	parent_data[0] = AT91_CLK_PD_HW(main_rc_hw);
> +	parent_data[1] = AT91_CLK_PD_HW(main_osc_hw);
> +	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_data, 2);
>   	if (IS_ERR(hw))
>   		goto err_free;
>   
> @@ -1160,12 +1159,12 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   			case PLL_TYPE_FRAC:
>   				switch (sama7d65_plls[i][j].p) {
>   				case SAMA7D65_PLL_PARENT_MAINCK:
> -					parent_data = AT91_CLK_PD_NAME("mainck", -1);
> +					parent_data[0] = AT91_CLK_PD_NAME("mainck", -1);
>   					hw = sama7d65_pmc->chws[PMC_MAIN];
>   					break;
>   				case SAMA7D65_PLL_PARENT_MAIN_XTAL:
> -					parent_data = AT91_CLK_PD_NAME(main_xtal_name,
> -								       main_xtal_index);
> +					parent_data[0] = AT91_CLK_PD_NAME(main_xtal_name,
> +									  main_xtal_index);
>   					hw = main_xtal_hw;
>   					break;
>   				default:
> @@ -1178,7 +1177,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   
>   				hw = sam9x60_clk_register_frac_pll(regmap,
>   					&pmc_pll_lock, sama7d65_plls[i][j].n,
> -					&parent_data, parent_rate, i,
> +					parent_data, parent_rate, i,
>   					sama7d65_plls[i][j].c,
>   					sama7d65_plls[i][j].l,
>   					sama7d65_plls[i][j].f);
> diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
> index f28fe419ae5e..f816a5551277 100644
> --- a/drivers/clk/at91/sama7g5.c
> +++ b/drivers/clk/at91/sama7g5.c
> @@ -977,7 +977,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   	struct regmap *regmap;
>   	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
>   	struct clk_hw *td_slck_hw, *md_slck_hw;
> -	static struct clk_parent_data parent_data;
> +	struct clk_parent_data parent_data[2];
>   	struct clk_hw *parent_hws[10];
>   	bool bypass;
>   	int i, j;
> @@ -1013,16 +1013,15 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   
>   	bypass = of_property_read_bool(np, "atmel,osc-bypass");
>   
> -	parent_data.name = main_xtal_name;
> -	parent_data.fw_name = main_xtal_name;
>   	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
> -						 &parent_data, bypass);
> +						 &AT91_CLK_PD_NAME(main_xtal_name, main_xtal_index),
> +						 bypass);
>   	if (IS_ERR(main_osc_hw))
>   		goto err_free;
>   
> -	parent_hws[0] = main_rc_hw;
> -	parent_hws[1] = main_osc_hw;
> -	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_hws, 2);
> +	parent_data[0] = AT91_CLK_PD_HW(main_rc_hw);
> +	parent_data[1] = AT91_CLK_PD_HW(main_osc_hw);
> +	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_data, 2);
>   	if (IS_ERR(hw))
>   		goto err_free;
>   
> @@ -1039,12 +1038,12 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   			case PLL_TYPE_FRAC:
>   				switch (sama7g5_plls[i][j].p) {
>   				case SAMA7G5_PLL_PARENT_MAINCK:
> -					parent_data = AT91_CLK_PD_NAME("mainck", -1);
> +					parent_data[0] = AT91_CLK_PD_NAME("mainck", -1);
>   					hw = sama7g5_pmc->chws[PMC_MAIN];
>   					break;
>   				case SAMA7G5_PLL_PARENT_MAIN_XTAL:
> -					parent_data = AT91_CLK_PD_NAME(main_xtal_name,
> -								       main_xtal_index);
> +					parent_data[0] = AT91_CLK_PD_NAME(main_xtal_name,
> +									  main_xtal_index);
>   					hw = main_xtal_hw;
>   					break;
>   				default:
> @@ -1058,7 +1057,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   
>   				hw = sam9x60_clk_register_frac_pll(regmap,
>   					&pmc_pll_lock, sama7g5_plls[i][j].n,
> -					&parent_data, parent_rate, i,
> +					parent_data, parent_rate, i,
>   					sama7g5_plls[i][j].c,
>   					sama7g5_plls[i][j].l,
>   					sama7g5_plls[i][j].f);


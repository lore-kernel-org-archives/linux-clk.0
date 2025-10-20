Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEFF1C3C11
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 19:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760987735; cv=none; b=FVZxgzb6ZzqVJEY5dLckik+SPE0OEtiVuMc/JJ6QunsSiKx1YdZRNzGzfhJx5k7RALOswN8mK7pocKJLCyP3RW8nSsA01iOtg63tum6MY1oi3GhI6ByAvaOMdld+lNZHZeueBoRofmcOiKdhSPtyOb1N6jWzgVpXbf38KgSCyxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760987735; c=relaxed/simple;
	bh=mKPX3uYMEmFiyt/UoSi/FiXpr/q76Ab1zHLh+vEaIsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZRcjb+pyDwHd1KooDMCY0rWGpVnYWwmv9hs/7lukmJ6pSLNbnx2wYFQLJYTjqMMiCAERE7LRU4aQ1KU/bwwQwr+NzT1fM3n0eitIzw7tiwHJRLf7JwAetu1NifhBGxFFCuQryKRYlUs0meZNnN6bp9VMFQh+XWKC7MRVFirdgKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Jcw4if6/; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Jcw4if6/"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47100eae3e5so2830595e9.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 12:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760987732; x=1761592532; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XAU73KA5bRRjDexmLv9S0p4A3jfHSvmFsVyQH8dOED0=;
        b=Jcw4if6/JxSnfh8OcK2g8zbcCMHcrd46zwPhQpqJ/awNW5WRcGvZGgWKuPjXn9a8BZ
         mFerZFqH8TDxMMU6/SN9V0m0P6x9eDQ2pZsg2fstMqgekmxgIlfmdMn7LDzmLwvnzxsb
         QhJHsRbivisoPek1CaxUvXwfgSFOoYmIfDW12QKYHZooggEPT3kwM5Vt5LwPqh35BWK7
         VvMnsVfPoMdTbxVR5Ozp33f72HDUKlz9WYQCCJuwIIQprLkOCMLtbMYYkmnG8mHs4ry+
         HwKf4ZU2oKgABamfxzQBShn2lzYrih5QIlyUPFVdhik7HfO3kzXt7tG1lMbw6w6aAsNQ
         RN3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987732; x=1761592532;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XAU73KA5bRRjDexmLv9S0p4A3jfHSvmFsVyQH8dOED0=;
        b=bZVZn9W/ga02WoXxyN1GEbFJ/31pouxThaXcziaDpMlR6ni804eIvyoWL/7PqydGr1
         mRo147YVgVIn9EHyg9a1kDt8w37cgUQn0HHUNN03x70f5AKcxJMGDQM7RjaE80zB9bTd
         qOhT7PCNewpLXghH+WdqXuWIrQE5ta7Nj6O8LJIohE8lLPk7ieIbc2nLqRCdWATKuoF2
         Xnt/lmGqGSko0pRKlrkzL8XumDAJICdHmZaxSEW0+fp3NDZl0w8LqH5/AkWHqQ3+G/Ai
         Q7cCZBDmeAMqrtyZ77ZuzlSpReXhfbPsunGbg/cGQgDEjIjGxMYVeehCeTIukSkVBxjH
         RHfQ==
X-Gm-Message-State: AOJu0Yx0QHcfuNXmHIc+N0RjGmXJFnhYPp3y0Ob0ztSoTPDGJHTcQEEY
	XVNdqRnGZvM0ZxYpZw2hFZfAO2egWim9NlnnnS6d+FFkleFDVcGcQMCO3biu23LoH9k=
X-Gm-Gg: ASbGncsmu5rfDN59VEtsooRMX9EBZXC4KbzWkruCiJUHoiIKn6kGgEVwjtsDRD+CiIf
	3HeriipNPFhwYAysTLVzZB2deFUKDIBoVfiGzfFXb9Qb+0Z4HKH5OkYJrb94tOxBE6CEMdevSUd
	EaFd6RtjZSp9skNLkR5EgfKbKvqc+ZnlBc5o4r65jhCoiEQanYPZdXSxChE3wPhpVs+uTdTpl+G
	/eXkkBpMtolRJOpa6XH+KkyI+S+Rl+Xm1aEQnacHgAY6REdoZwN378cD+p1nSlG8uB6xtOPQA6D
	jQTdRfzjjHZ/BXjxclCqyJjP06x+Mn69ETdmoUPPG1EFUzHj9zmEH3vIeYhbmx+3K3r55E5/zGh
	S9FjGN2Ja9NLr2TWeXpHolf2/iZzqbZh/gDYFYwflWesrLfmj6hmftJmJjcJmBNf9BQqvg9/wZR
	dQ6dWVqHPkJ6FZlfcz2gDNycxdu4/wjQ==
X-Google-Smtp-Source: AGHT+IHeXH+q1HCer8n1RPKQyzx1aKdI5mUetAs7LD84l09TghB+9mCwTSBlYrvcYqrjSZVmIiyAXA==
X-Received: by 2002:a05:600c:3b24:b0:46e:1abc:1811 with SMTP id 5b1f17b1804b1-47117912b6amr94831265e9.27.1760987731695;
        Mon, 20 Oct 2025 12:15:31 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a797sm16672032f8f.27.2025.10.20.12.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:15:31 -0700 (PDT)
Message-ID: <eed15c43-dde3-410b-b2a3-655f4acf8d97@tuxon.dev>
Date: Mon, 20 Oct 2025 22:15:30 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/31] clk: at91: dt-compat: switch to parent_hw and
 parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <628859234f4b2523f43b3ac05d5e29ceb05a7f61.1758226719.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <628859234f4b2523f43b3ac05d5e29ceb05a7f61.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 9/19/25 00:16, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Switch old dt-compat clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration
> speed and re-parenting.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/dt-compat.c | 80 +++++++++++++++++++++++++-----------
>  1 file changed, 56 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
> index fa8658d3be7b..9ca871b817e0 100644
> --- a/drivers/clk/at91/dt-compat.c
> +++ b/drivers/clk/at91/dt-compat.c
> @@ -43,7 +43,8 @@ static void __init of_sama5d2_clk_audio_pll_frac_setup(struct device_node *np)
>  
>  	parent_name = of_clk_get_parent_name(np, 0);
>  
> -	hw = at91_clk_register_audio_pll_frac(regmap, name, parent_name, NULL);
> +	hw = at91_clk_register_audio_pll_frac(regmap, name, NULL,
> +					      &AT91_CLK_PD_NAME(parent_name));
>  	if (IS_ERR(hw))
>  		return;
>  
> @@ -69,7 +70,8 @@ static void __init of_sama5d2_clk_audio_pll_pad_setup(struct device_node *np)
>  
>  	parent_name = of_clk_get_parent_name(np, 0);
>  
> -	hw = at91_clk_register_audio_pll_pad(regmap, name, parent_name, NULL);
> +	hw = at91_clk_register_audio_pll_pad(regmap, name, NULL,
> +					     &AT91_CLK_PD_NAME(parent_name));
>  	if (IS_ERR(hw))
>  		return;
>  
> @@ -95,7 +97,7 @@ static void __init of_sama5d2_clk_audio_pll_pmc_setup(struct device_node *np)
>  
>  	parent_name = of_clk_get_parent_name(np, 0);
>  
> -	hw = at91_clk_register_audio_pll_pmc(regmap, name, parent_name, NULL);
> +	hw = at91_clk_register_audio_pll_pmc(regmap, name, NULL, &AT91_CLK_PD_NAME(parent_name));
>  	if (IS_ERR(hw))
>  		return;
>  
> @@ -129,6 +131,7 @@ static void __init of_sama5d2_clk_generated_setup(struct device_node *np)
>  	struct clk_hw *hw;
>  	unsigned int num_parents;
>  	const char *parent_names[GENERATED_SOURCE_MAX];
> +	struct clk_parent_data parent_data[GENERATED_SOURCE_MAX];
>  	struct device_node *gcknp, *parent_np;
>  	struct clk_range range = CLK_RANGE(0, 0);
>  	struct regmap *regmap;
> @@ -149,6 +152,8 @@ static void __init of_sama5d2_clk_generated_setup(struct device_node *np)
>  	if (IS_ERR(regmap))
>  		return;
>  
> +	for (unsigned int i = 0; i < num_parents; i++)
> +		parent_data[i] = AT91_CLK_PD_NAME(parent_names[i]);
>  	for_each_child_of_node(np, gcknp) {
>  		int chg_pid = INT_MIN;
>  
> @@ -171,7 +176,7 @@ static void __init of_sama5d2_clk_generated_setup(struct device_node *np)
>  
>  		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
>  						 &dt_pcr_layout, name,
> -						 parent_names, NULL, NULL,
> +						 NULL, parent_data, NULL,
>  						 num_parents, id, &range,
>  						 chg_pid);
>  		if (IS_ERR(hw))
> @@ -201,7 +206,7 @@ static void __init of_sama5d4_clk_h32mx_setup(struct device_node *np)
>  
>  	parent_name = of_clk_get_parent_name(np, 0);
>  
> -	hw = at91_clk_register_h32mx(regmap, name, parent_name, NULL);
> +	hw = at91_clk_register_h32mx(regmap, name, NULL, &AT91_CLK_PD_NAME(parent_name));
>  	if (IS_ERR(hw))
>  		return;
>  
> @@ -228,6 +233,8 @@ static void __init of_sama5d2_clk_i2s_mux_setup(struct device_node *np)
>  		return;
>  
>  	for_each_child_of_node(np, i2s_mux_np) {
> +		struct clk_parent_data parent_data[2];
> +
>  		if (of_property_read_u8(i2s_mux_np, "reg", &bus_id))
>  			continue;
>  
> @@ -238,8 +245,10 @@ static void __init of_sama5d2_clk_i2s_mux_setup(struct device_node *np)
>  		if (ret != 2)
>  			continue;
>  
> +		parent_data[0] = AT91_CLK_PD_NAME(parent_names[0]);
> +		parent_data[1] = AT91_CLK_PD_NAME(parent_names[1]);
>  		hw = at91_clk_i2s_mux_register(regmap_sfr, i2s_mux_np->name,
> -					       parent_names, NULL, 2, bus_id);
> +					       NULL, parent_data, 2, bus_id);
>  		if (IS_ERR(hw))
>  			continue;
>  
> @@ -269,7 +278,8 @@ static void __init of_at91rm9200_clk_main_osc_setup(struct device_node *np)
>  	if (IS_ERR(regmap))
>  		return;
>  
> -	hw = at91_clk_register_main_osc(regmap, name, parent_name, NULL, bypass);
> +	hw = at91_clk_register_main_osc(regmap, name, NULL,
> +					&AT91_CLK_PD_NAME(parent_name), bypass);
>  	if (IS_ERR(hw))
>  		return;
>  
> @@ -323,7 +333,7 @@ static void __init of_at91rm9200_clk_main_setup(struct device_node *np)
>  	if (IS_ERR(regmap))
>  		return;
>  
> -	hw = at91_clk_register_rm9200_main(regmap, name, parent_name, NULL);
> +	hw = at91_clk_register_rm9200_main(regmap, name, NULL, &AT91_CLK_PD_NAME(parent_name));
>  	if (IS_ERR(hw))
>  		return;
>  
> @@ -336,6 +346,7 @@ static void __init of_at91sam9x5_clk_main_setup(struct device_node *np)
>  {
>  	struct clk_hw *hw;
>  	const char *parent_names[2];
> +	struct clk_parent_data parent_data[2];
>  	unsigned int num_parents;
>  	const char *name = np->name;
>  	struct regmap *regmap;
> @@ -354,7 +365,9 @@ static void __init of_at91sam9x5_clk_main_setup(struct device_node *np)
>  
>  	of_property_read_string(np, "clock-output-names", &name);
>  
> -	hw = at91_clk_register_sam9x5_main(regmap, name, parent_names, NULL,
> +	parent_data[0] = AT91_CLK_PD_NAME(parent_names[0]);
> +	parent_data[1] = AT91_CLK_PD_NAME(parent_names[1]);
> +	hw = at91_clk_register_sam9x5_main(regmap, name, NULL, parent_data,
>  					   num_parents);
>  	if (IS_ERR(hw))
>  		return;
> @@ -396,6 +409,7 @@ of_at91_clk_master_setup(struct device_node *np,
>  	struct clk_hw *hw;
>  	unsigned int num_parents;
>  	const char *parent_names[MASTER_SOURCE_MAX];
> +	struct clk_parent_data parent_data[MASTER_SOURCE_MAX];
>  	const char *name = np->name;
>  	struct clk_master_characteristics *characteristics;
>  	struct regmap *regmap;
> @@ -419,13 +433,15 @@ of_at91_clk_master_setup(struct device_node *np,
>  	if (IS_ERR(regmap))
>  		return;
>  
> +	for (unsigned int i = 0; i < MASTER_SOURCE_MAX; i++)
> +		parent_data[i] = AT91_CLK_PD_NAME(parent_names[i]);
>  	hw = at91_clk_register_master_pres(regmap, "masterck_pres", num_parents,
> -					   parent_names, NULL, layout,
> +					   NULL, parent_data, layout,
>  					   characteristics, &mck_lock);
>  	if (IS_ERR(hw))
>  		goto out_free_characteristics;
>  
> -	hw = at91_clk_register_master_div(regmap, name, "masterck_pres", NULL,
> +	hw = at91_clk_register_master_div(regmap, name, NULL, &AT91_CLK_PD_HW(hw),
>  					  layout, characteristics,
>  					  &mck_lock, CLK_SET_RATE_GATE, 0);

Looks like at91_clk_register_master_div() could be kept to use parent_hws
instead of parent_data.

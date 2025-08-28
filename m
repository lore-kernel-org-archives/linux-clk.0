Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A83F1624D5
	for <linux-clk@vger.kernel.org>; Thu, 28 Aug 2025 17:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756400695; cv=none; b=VvE0+BYu6eJDzgpPQoupH4YaToWH+CDuF5b9TQZEl2pv8iXJVT9DmEkqZflTczDI9bpXg7bEnVpw+VpbK4PsItsxTHJYpTl0GfLH4Fp/sPYXVfCju8hEphy+3gkuRITcs8n2LY9YdIC2W4RrFtBQj2IHtZSJkAR6RzdSqXW6p6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756400695; c=relaxed/simple;
	bh=KjdMnmax17wj/hHZCqG4IeQlHBv3R7AnyEbZo7q4ZxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAbDbL/MlmDJ+/EzeGC6dtPTv5wK7OIt4iRCmsyDOnTzUfqgsS1q1+LFsr2qXIzGhAYyHeZfK0+6++dKY9H5bekfkGJuGm/DGj/0HPzlFizCMzl0L0aUjm/M6ZeByGpa1BWVW/g6N+HYagQaWqGu+8VXKJXO+o1PR0MsPNyLbDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ASKZqSnf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ASKZqSnf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756400692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yQWSx8bT6V+HM/W9ets+QXcD0v/UrJQL7ZZAexBVPTE=;
	b=ASKZqSnfPkpYDBjnfdsx2n+9Oq7L7nHGGc6gDJwiB8aZaLCOPpmsHE9fC16WGikrKKjAob
	Zg6bC5vGptomCzV6Pa2yCUJCxFsMiDgERT1Ayy5BbMDpPewvng/CcwY+nDn9fsQmKXpHpm
	fYyKRcTq4RMh3av9A6fGXNkKM1dfwLU=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-BwiKttjEOKG2vXGY65A_mA-1; Thu, 28 Aug 2025 13:04:50 -0400
X-MC-Unique: BwiKttjEOKG2vXGY65A_mA-1
X-Mimecast-MFC-AGG-ID: BwiKttjEOKG2vXGY65A_mA_1756400690
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5228ed1eff1so172833137.3
        for <linux-clk@vger.kernel.org>; Thu, 28 Aug 2025 10:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756400690; x=1757005490;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQWSx8bT6V+HM/W9ets+QXcD0v/UrJQL7ZZAexBVPTE=;
        b=ojxfB2xV+JWuVD7PRKg1hgB2SyhSHqBE1/1q9N5NhxvOeXS3ufT+EKzOps2HTTBAPM
         iegyjbPpxi2YO2NeES1BuXnu4TOmClwYQb/YU5BK+e5SyNVSB9W1yVy4OKtJ0rziXpCF
         nHcd/HkLTi7NpcmBfi87vhcWl3LdXR55+pORFhi8hbKSCmBV7QS2oyYXoWN+Tzpv+syz
         vNge86MOOvE42oaPvakDbA/RwvGyG9gq7HtQxy/Zd04jjrPyKpZHQWUZHE5RdAtLtOr3
         a89TdwcEFDy4ql2jhH2TB+EoDvTEg//qxdXL9/km2CbIQ8VmUHOcJgvYWo/oA9oSYgHb
         fHtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCHmKtoPjRmbg6acZNkpZbthqcuyyB+Depq1Dvy1llAJjqdCYrHBMRkfOniqrdGeDVey/YGocz89I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6bSTMzLmcD6nS+XFsy15Y884QsqiIWiaK0//qAUqTE4G0lzgb
	+kcrdhEof5uzZvXzCIyVI5Kbkpwu3G92LNcL/dzVZjwZK3mtNaW7t2quD2Um69YAZJHpJqBVj05
	5mvBd4CcA7SE2R5URMrGOlqnFqHn5txTiETP64tF5V/LP5Iy0PftXJKniaYRWkg==
X-Gm-Gg: ASbGncvSl4Jrbq7vIO3pLegHtxFqrFaKXr3N5P3ChV9ey8AlowaLyU9/ITfP1E4i/SF
	6J68pf2JUyn241wzz1KIBLIo4i/NRIWS7Cl+pc4Gu9W34sA7o6Q+8cMybhZsE7QeZBzYVCVw8oG
	8mk9SLVMMlvHVqF0HIuOZ+vdiQON2HRdKxLez/XB34NXUjOEFzdb4IL4LuyRjZqkP5yPU9VBY9B
	WqFd4g5rRAbf816R+3XSzEVkHiYN47BIwggtoDnK0edswtjro492JENOmPKggknIbJpTMalYpWw
	+1QXojFC5JWbDv4mqej9yukYwpvJXXWjxeDSH3CHsF+tPWcWILcO1RtaIGVMp4xV4FH4n+aI0qT
	a5Mdefp5zsrPAzKaAbak=
X-Received: by 2002:a05:6102:945:b0:521:b9f2:a5ca with SMTP id ada2fe7eead31-521b9f2aa92mr5454482137.13.1756400689781;
        Thu, 28 Aug 2025 10:04:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFK33mKzOVRkyg/syyoWlGXnfN23Xh+fbGd+pr1oPcAGqsYr4OfVhyh6dTOdU8MTFy+2f9q6Q==
X-Received: by 2002:a05:6102:945:b0:521:b9f2:a5ca with SMTP id ada2fe7eead31-521b9f2aa92mr5454448137.13.1756400689195;
        Thu, 28 Aug 2025 10:04:49 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc15c83bbasm12882885a.60.2025.08.28.10.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 10:04:48 -0700 (PDT)
Date: Thu, 28 Aug 2025 13:04:46 -0400
From: Brian Masney <bmasney@redhat.com>
To: Ryan.Wanner@microchip.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 04/32] clk: at91: clk-sam9x60-pll: use clk_parent_data
Message-ID: <aLCMLs6FLp5TZAA8@x1>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <2e7902b73fa6bb5bc8698b3ca0fa7cef583b76f5.1752176711.git.Ryan.Wanner@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e7902b73fa6bb5bc8698b3ca0fa7cef583b76f5.1752176711.git.Ryan.Wanner@microchip.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Jul 10, 2025 at 01:06:57PM -0700, Ryan.Wanner@microchip.com wrote:
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
>  drivers/clk/at91/clk-sam9x60-pll.c | 14 +++++---------
>  drivers/clk/at91/pmc.h             |  5 +++--
>  drivers/clk/at91/sam9x60.c         |  8 +++++---
>  drivers/clk/at91/sam9x7.c          | 17 ++++++++++++-----
>  drivers/clk/at91/sama7d65.c        | 16 +++++++++++-----
>  drivers/clk/at91/sama7g5.c         | 17 ++++++++++++-----
>  6 files changed, 48 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-sam9x60-pll.c b/drivers/clk/at91/clk-sam9x60-pll.c
> index cefd9948e103..03a7d00dcc6d 100644
> --- a/drivers/clk/at91/clk-sam9x60-pll.c
> +++ b/drivers/clk/at91/clk-sam9x60-pll.c
> @@ -630,19 +630,19 @@ static const struct clk_ops sam9x60_fixed_div_pll_ops = {
>  
>  struct clk_hw * __init
>  sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
> -			      const char *name, const char *parent_name,
> -			      struct clk_hw *parent_hw, u8 id,
> +			      const char *name, const struct clk_parent_data *parent_data,
> +			      unsigned long parent_rate, u8 id,
>  			      const struct clk_pll_characteristics *characteristics,
>  			      const struct clk_pll_layout *layout, u32 flags)
>  {
>  	struct sam9x60_frac *frac;
>  	struct clk_hw *hw;
>  	struct clk_init_data init = {};
> -	unsigned long parent_rate, irqflags;
> +	unsigned long irqflags;
>  	unsigned int val;
>  	int ret;
>  
> -	if (id > PLL_MAX_ID || !lock || !parent_hw)
> +	if (id > PLL_MAX_ID || !lock || !parent_data)
>  		return ERR_PTR(-EINVAL);
>  
>  	frac = kzalloc(sizeof(*frac), GFP_KERNEL);
> @@ -650,10 +650,7 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
>  		return ERR_PTR(-ENOMEM);
>  
>  	init.name = name;
> -	if (parent_name)
> -		init.parent_names = &parent_name;
> -	else
> -		init.parent_hws = (const struct clk_hw **)&parent_hw;
> +	init.parent_data = (const struct clk_parent_data *)parent_data;
>  	init.num_parents = 1;
>  	if (flags & CLK_SET_RATE_GATE)
>  		init.ops = &sam9x60_frac_pll_ops;
> @@ -684,7 +681,6 @@ sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
>  		 * its rate leading to enabling this PLL with unsupported
>  		 * rate. This will lead to PLL not being locked at all.
>  		 */
> -		parent_rate = clk_hw_get_rate(parent_hw);
>  		if (!parent_rate) {
>  			hw = ERR_PTR(-EINVAL);
>  			goto free;
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index 63d4c425bed5..b43f6652417f 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -255,8 +255,9 @@ sam9x60_clk_register_div_pll(struct regmap *regmap, spinlock_t *lock,
>  
>  struct clk_hw * __init
>  sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
> -			      const char *name, const char *parent_name,
> -			      struct clk_hw *parent_hw, u8 id,
> +			      const char *name,
> +			      const struct clk_parent_data *parent_data,
> +			      unsigned long parent_rate, u8 id,
>  			      const struct clk_pll_characteristics *characteristics,
>  			      const struct clk_pll_layout *layout, u32 flags);
>  
> diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
> index db6db9e2073e..fd53e54abf88 100644
> --- a/drivers/clk/at91/sam9x60.c
> +++ b/drivers/clk/at91/sam9x60.c
> @@ -240,7 +240,8 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
>  	sam9x60_pmc->chws[PMC_MAIN] = hw;
>  
>  	hw = sam9x60_clk_register_frac_pll(regmap, &pmc_pll_lock, "pllack_fracck",
> -					   "mainck", sam9x60_pmc->chws[PMC_MAIN],
> +					   &AT91_CLK_PD_HW(sam9x60_pmc->chws[PMC_MAIN]),
> +					   clk_hw_get_rate(sam9x60_pmc->chws[PMC_MAIN]),
>  					   0, &plla_characteristics,
>  					   &pll_frac_layout,
>  					   /*
> @@ -266,8 +267,9 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
>  	sam9x60_pmc->chws[PMC_PLLACK] = hw;
>  
>  	hw = sam9x60_clk_register_frac_pll(regmap, &pmc_pll_lock, "upllck_fracck",
> -					   "main_osc", main_osc_hw, 1,
> -					   &upll_characteristics,
> +					   &AT91_CLK_PD_HW(main_osc_hw),
> +					   clk_hw_get_rate(main_osc_hw),
> +					   1, &upll_characteristics,
>  					   &pll_frac_layout, CLK_SET_RATE_GATE);
>  	if (IS_ERR(hw))
>  		goto err_free;
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index 31184e11165a..edd5fd3a1fa5 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -739,6 +739,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>  {
>  	struct clk_range range = CLK_RANGE(0, 0);
>  	const char *main_xtal_name = "main_xtal";
> +	u8 main_xtal_index = 2;

Is there a #define somewhere that can be used instead of 2? Or a comment
at least? This applies to the other file as well.

Brian


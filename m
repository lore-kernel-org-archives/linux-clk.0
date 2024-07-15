Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5464713C675
	for <linux-clk@vger.kernel.org>; Mon, 15 Jul 2024 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721030805; cv=none; b=HsFkiwzx4pzFZcMXb+ylJRC4Cbr2/A8enYlBz8BOVXYRkWJso1QpZ3NnGnLeuXMWes8BWPRJUu22wmHRbUCzENPCR20RhlLROYbJaML6SeLd+YNawxDnzVu9Z20t2So3cZ7bA7kAXpzu6ZBR55ekIt3X7eoWAiSfMwbSyWPF61I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721030805; c=relaxed/simple;
	bh=16bBhiqIhGVVdwo8yfoUKxnj03L+a4RhSQqjiGpjRjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XGxDFVeDJixFCUX8/CYlRW3p02/NSZP+DhT/ua6aoB3Tl7dSl74zwIIH8EhQYNyscre7gLlUwh5ScV5iES5m+wBSQfyuIsnY73Dmss1HM4hyxAmyDpaQdRQS8QAJ2uXvG/W5TwrXwG1t4cp/nJw2iCcTixAp1bOxyMY6LkOgL0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=kqqxF3pW; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="kqqxF3pW"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-367963ea053so3326953f8f.2
        for <linux-clk@vger.kernel.org>; Mon, 15 Jul 2024 01:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1721030801; x=1721635601; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ZZF6SHcFUEyiyR+Vm+15zWotXyhNbxhylYVl4y9i0Q=;
        b=kqqxF3pWVvNmihRetXx70j2lIEY/dJu0DqcThwYNLb2JgXuxRnrdT3STOUYDfWDSle
         tZmlWLeQnt/KnHh1X6Fdaqk/1iVwP0Olt//WGSeNqaXF3LWlrnEmAWEXh1XfASi5DfxO
         MM3fT4dNoHS2vzbyRHaW8qEnvVDunYQ14Scbo0XqIMtQNvdVi6Y2q5IyUY3OfI1NZ8Od
         PDF5uxASXK9MDVIK4LQ8L+pGftRYcF/Sk38e29TPnoLPQtDHxOuIJ8QMJrGveiKqkhc1
         TzBSy3lquFmPz9NwgmVDTS/B61ZHboD18eXgsvsK5xQlZ8vrqkWlBxVsdkn4PknNGIHl
         CitA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721030801; x=1721635601;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZZF6SHcFUEyiyR+Vm+15zWotXyhNbxhylYVl4y9i0Q=;
        b=BMygnD1T0bwaQbowQ2qjViixKlKr5MaqQl1+9Xj7GexqgiLw71FLCGp0DLSbIoLWF9
         ++g6gdkFPsI3mhVslyhYnSDJsX6n+K4UDpGe5ZVD/ER+ocMfLvVVXGtXxcgq4fpfnTOv
         rPBoxV2OCaepfxuVXNbi6BqyjryFORLvFCfmjls226QgAvdOwZjSkwF5zgiO1/oOeggG
         7kSgH/WFmpNU6h5hFY5afNapEZXjXqBRI6SSedYH2tYOK7nQgdPmWZuq2CS2DM12Rr6b
         8x4b6pPEIzZewjAw+ZkS9nRossL3zTABzvV8ISKBHFybnskwVbvX0cJyEh4ELFvXYwOV
         jJxw==
X-Forwarded-Encrypted: i=1; AJvYcCVLa5Pv3OdeLUov9SO0sdl64S5/86kBt0CpYHx1yg2LLY/88R06HmNItbHa7+Rla91rf4uJUqCbd+Krsxu3lydX2hSxXEOIWpIw
X-Gm-Message-State: AOJu0Yx/YSaNdepKtTpV7aOcpnmH+rqIMWNTbFxHL59f09id+Xamf26z
	xOtBusr2fiuBg20uwpZu/wLpDvfvXJnmyj/nc1YI6VsJCHP6jiBq+52XvHVAtYU=
X-Google-Smtp-Source: AGHT+IGQxkCi+Sc9wBZNomHEVlA4JrxK+a6uMp912PveNzQBaXW9hcRRP6sKp7S+aVLFF5/drBpXyA==
X-Received: by 2002:adf:e5c4:0:b0:366:ecc4:aa70 with SMTP id ffacd0b85a97d-367cea46912mr13511131f8f.5.1721030801484;
        Mon, 15 Jul 2024 01:06:41 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db047c4sm5607243f8f.108.2024.07.15.01.06.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 01:06:41 -0700 (PDT)
Message-ID: <c39a3967-1089-4113-917e-78fc14e788bf@tuxon.dev>
Date: Mon, 15 Jul 2024 11:06:39 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/27] clk: at91: sam9x7: add support for HW PLL freq
 dividers
Content-Language: en-US
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240703102011.193343-1-varshini.rajendran@microchip.com>
 <20240703102736.195810-1-varshini.rajendran@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240703102736.195810-1-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 03.07.2024 13:27, Varshini Rajendran wrote:
> Add support for hardware dividers for PLL IDs in sam9x7 SoC. The system
> PLL - PLLA and the system PLL divided by 2 - PLLADIV2 with PLL ID 0 and
> 4 respectively, both have a hardware divider /2. This has to be taken into
> account in the software to obtain the right frequencies. Support for the
> same is added in the PLL driver.
> 
> fcorepllack -----> HW Div = 2 -+--> fpllack
>                                |
>                                +--> HW Div = 2 ---> fplladiv2ck
> 
> In this case the corepll freq is 1600 MHz. So, the plla freq is 800 MHz
> after the hardware divider and the plladiv2 freq is 400 MHz after the
> hardware divider (given that the DIVPMC is 0).
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
> Changes in v5:
> - Corrected typos in commit message.
> - Rewrote the conditional statement.
> ---
>  drivers/clk/at91/clk-sam9x60-pll.c | 30 ++++++++++++++++++++++++++++--
>  drivers/clk/at91/pmc.h             |  1 +
>  2 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-sam9x60-pll.c b/drivers/clk/at91/clk-sam9x60-pll.c
> index b0314dfd7393..fda041102224 100644
> --- a/drivers/clk/at91/clk-sam9x60-pll.c
> +++ b/drivers/clk/at91/clk-sam9x60-pll.c
> @@ -73,9 +73,15 @@ static unsigned long sam9x60_frac_pll_recalc_rate(struct clk_hw *hw,
>  {
>  	struct sam9x60_pll_core *core = to_sam9x60_pll_core(hw);
>  	struct sam9x60_frac *frac = to_sam9x60_frac(core);
> +	unsigned long freq;
>  
> -	return parent_rate * (frac->mul + 1) +
> +	freq = parent_rate * (frac->mul + 1) +
>  		DIV_ROUND_CLOSEST_ULL((u64)parent_rate * frac->frac, (1 << 22));
> +
> +	if (core->layout->div2)
> +		freq >>= 1;
> +
> +	return freq;
>  }
>  
>  static int sam9x60_frac_pll_set(struct sam9x60_pll_core *core)
> @@ -432,6 +438,12 @@ static unsigned long sam9x60_div_pll_recalc_rate(struct clk_hw *hw,
>  	return DIV_ROUND_CLOSEST_ULL(parent_rate, (div->div + 1));
>  }
>  
> +static unsigned long sam9x60_fixed_div_pll_recalc_rate(struct clk_hw *hw,
> +						       unsigned long parent_rate)
> +{
> +	return parent_rate >> 1;
> +}
> +
>  static long sam9x60_div_pll_compute_div(struct sam9x60_pll_core *core,
>  					unsigned long *parent_rate,
>  					unsigned long rate)
> @@ -606,6 +618,16 @@ static const struct clk_ops sam9x60_div_pll_ops_chg = {
>  	.restore_context = sam9x60_div_pll_restore_context,
>  };
>  
> +static const struct clk_ops sam9x60_fixed_div_pll_ops = {
> +	.prepare = sam9x60_div_pll_prepare,
> +	.unprepare = sam9x60_div_pll_unprepare,
> +	.is_prepared = sam9x60_div_pll_is_prepared,
> +	.recalc_rate = sam9x60_fixed_div_pll_recalc_rate,
> +	.round_rate = sam9x60_div_pll_round_rate,
> +	.save_context = sam9x60_div_pll_save_context,
> +	.restore_context = sam9x60_div_pll_restore_context,
> +};
> +
>  struct clk_hw * __init
>  sam9x60_clk_register_frac_pll(struct regmap *regmap, spinlock_t *lock,
>  			      const char *name, const char *parent_name,
> @@ -725,10 +747,14 @@ sam9x60_clk_register_div_pll(struct regmap *regmap, spinlock_t *lock,
>  	else
>  		init.parent_names = &parent_name;
>  	init.num_parents = 1;
> -	if (flags & CLK_SET_RATE_GATE)
> +
> +	if (layout->div2)
> +		init.ops = &sam9x60_fixed_div_pll_ops;
> +	else if (flags & CLK_SET_RATE_GATE)
>  		init.ops = &sam9x60_div_pll_ops;
>  	else
>  		init.ops = &sam9x60_div_pll_ops_chg;
> +
>  	init.flags = flags;
>  
>  	div->core.id = id;
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index bb9da35198d9..91d1c6305d95 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -64,6 +64,7 @@ struct clk_pll_layout {
>  	u8 frac_shift;
>  	u8 div_shift;
>  	u8 endiv_shift;
> +	u8 div2;
>  };
>  
>  extern const struct clk_pll_layout at91rm9200_pll_layout;

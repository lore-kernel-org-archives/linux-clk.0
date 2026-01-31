Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D911357A4A
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 14:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769869757; cv=none; b=uzbakmQCHZmpjemH50SObxqB80EGg6PgmltmQ1nJocfVYaz6jRlMgO5nBfOSqTJFKWD6zttCO3sgExCZtsL2Fix+QOX/Ylq/OIr4qkCmZdVaMFLPJ5PLw9B9YuSHEJzNeqqi3kyXNnaYcYBY99sGixXs0MtLkFva/4pbm80EjBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769869757; c=relaxed/simple;
	bh=A/474hY4hFTLTxp5En5W4S7hKInIxqfu2uuu9GAVWMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cH1GVvSyQam/g8Et8KikfWGEbRYSqQv3NlLoRZy3nrnmipfC+Fw0dZ/y58wHmgm0Xd0YXxU6H8qrZtC23lr3Z4zqyyeeFYtzJJGKK2WWW2bLUGGR024c6Rs2h2aR6MYump3acoXMisYQl0t37PU4tS4v92g4al5AoHYSDDGL9f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=AZAeIm3w; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="AZAeIm3w"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso31972815e9.2
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 06:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769869754; x=1770474554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R6+NmxluvooS176kHE909Dr5qqh8j7I0Oq4Sd/VqYgI=;
        b=AZAeIm3wohlspo+irUXHq8RyT5VCptA+K0XKnjcU3KkAdRaJpGvAimSj8RTwyOh7Wa
         6j0b53afFQmwU5R1sHNmQ1GDJm8yJI49htxT1tRNWTM4Sl+GFo0gkjxsGIdXbdlagX/3
         8y38uMCMLJl3NFwQL5XtZD8K2clA7zU455xN3wgqDdOqKNJVaj0djXFlfghriZoca5XX
         NBzT53xhmPgHED/Cv/KvmQZtHSQjhpF/b46iYGBYou2K3ILbFdBuaX7PbHDVnGgiwqFq
         wrsDgW8U5bNuKD348XcuGmTD3XzSz/L30BC9eY+AOkqKrN3XgQC3x0eG65IvH3MJK5AY
         urgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769869754; x=1770474554;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6+NmxluvooS176kHE909Dr5qqh8j7I0Oq4Sd/VqYgI=;
        b=jqFzjlYkAKLC2WlnQwpePOPxV6v77MkyKERzr+EWImP7XHb81pBtV6nxNpUj1gLlJY
         Df/3dOD09DkHpbgMN+saBinKo96GDjShYvzM6QSpFdHHeUslqH9gjRYBGA73NneMfL+3
         VFokUwbLk/CHTBnOeberefileXGmGnyLHHyLMYMkE6EFT+bObew60+aGh3OvzV2fdDmS
         p1jZmz/2CXpuMiSHOuzIr4vwogZC6HawLgLTG84jtS0L5BuzIGaqyRfi+d9WgOOGKVE9
         C1fKiEA3+TtfyoqX+u+pH2M+702csQm0M0XdxXY5rnXbed3Ko5Q7Y3YGEE7cCiGpMiEg
         s+xw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ1Jq95dOK+xaYhIZusKuiaYJoZpg8rUIFfgkxTZmSgjykJqozALZ9iW44EpELfYO6VrublTLR2Jo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJDYc3gDdGhSweEHgzse0RDNE5POZmNpruSANLHso5MtSesFsc
	oYQQIlsgcYpPZ7BQzgcmLtIr0WOwUO9+afGi2nvewNtSguaveajbyc3Ka4wPEH0bdP0=
X-Gm-Gg: AZuq6aItpt27IPmWi/a25A+SR5H37z6WI9OHJy8CxcI0wTNakpyMPhRmu/mfhiRJhIb
	uZsySwXHlbBFEXioTLstLttNq7a6FN6vOU+8DKTe+9nuKmQSsK7kqOcXCxNYSaJLfUr4y4K0tBx
	DVry0B9us+CtYbMBDqJad1Rpqwxov8J1xZziehD+vv2xM+5As1yplFU5rkrftcufFQ7lN9yf5o1
	FDol/D52e2GknlbgjGKEiDmgkXtD0XEJ3KqIfp5Q4ABBcELnHrlr/z9y6ZpkALsKzDBeywWgX1G
	XrK6JeyhJg0ZOgxSWBS91MmWLy8mQUyb7dUmbD5lYM5C2Sd3WbaFIGvqF/PGKGHF9+w7gh7Lbx5
	TTI7XX4AfSrfOi9AW/PuIlZc34gSV8kFQzK9A31rjBHXWJvq2ofjDdbNbMah+jb3SJtZYrCxNYl
	1tCTioZd3XldSVFGCz5w==
X-Received: by 2002:a05:600c:a087:b0:47d:3ffb:16c9 with SMTP id 5b1f17b1804b1-482db491e3fmr76323225e9.23.1769869754514;
        Sat, 31 Jan 2026 06:29:14 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be7404sm377434895e9.1.2026.01.31.06.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 06:29:13 -0800 (PST)
Message-ID: <6067cefb-e016-42b4-8a6d-54e03319b2e4@tuxon.dev>
Date: Sat, 31 Jan 2026 16:29:12 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/31] clk: at91: clk-master: use clk_parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <548c567b5144e3556aee5e39a9c11ed13167a14a.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <548c567b5144e3556aee5e39a9c11ed13167a14a.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of struct parent_hw as this leads
> to less usage of __clk_get_hw() in SoC specific clock drivers and simpler
> conversion of existing SoC specific clock drivers from parent_names to
> modern clk_parent_data structures.
> 
> __clk_get_hw will be removed in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Add clk-master changes to SAM9X75 and
> SAMA7D65 SoCs. As well as add md_slck commit message.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---

[ ... ]

> @@ -1212,7 +1212,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   	}
>   
>   	hw = at91_clk_register_master_div(regmap, "mck0", NULL,
> -					  sama7d65_plls[PLL_ID_CPU][1].hw,
> +					  &AT91_CLK_PD_HW(sama7d65_plls[PLL_ID_CPU][1].hw),
>   					  &mck0_layout, &mck0_characteristics,
>   					  &pmc_mck0_lock, CLK_GET_RATE_NOCACHE, 5);
>   	if (IS_ERR(hw))
> @@ -1221,12 +1221,11 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   	sama7d65_pmc->chws[PMC_MCK] = hw;
>   	sama7d65_mckx[PCK_PARENT_HW_MCK0].hw = hw;
>   
> -	parent_hws[0] = md_slck_hw;
> -	parent_hws[1] = td_slck_hw;
> -	parent_hws[2] = sama7d65_pmc->chws[PMC_MAIN];
> +	parent_data[0] = AT91_CLK_PD_NAME("md_slck");
> +	parent_data[1] = AT91_CLK_PD_NAME("td_slck");
> +	parent_data[2] = AT91_CLK_PD_HW(sama7d65_pmc->chws[PMC_MAIN]);
>   	for (i = PCK_PARENT_HW_MCK1; i < ARRAY_SIZE(sama7d65_mckx); i++) {
>   		u8 num_parents = 3 + sama7d65_mckx[i].ep_count;
> -		struct clk_hw *tmp_parent_hws[8];
>   		u32 *mux_table;
>   
>   		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
> @@ -1243,13 +1242,11 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   			u8 pll_id = sama7d65_mckx[i].ep[j].pll_id;
>   			u8 pll_compid = sama7d65_mckx[i].ep[j].pll_compid;
>   
> -			tmp_parent_hws[j] = sama7d65_plls[pll_id][pll_compid].hw;
> +			parent_data[3 + j] = AT91_CLK_PD_HW(sama7d65_plls[pll_id][pll_compid].hw);
>   		}
> -		PMC_FILL_TABLE(&parent_hws[3], tmp_parent_hws,
> -			       sama7d65_mckx[i].ep_count);

Could you please move this to a different patch? Same for sama7g5.c file.

The rest LGTM.

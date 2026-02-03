Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B954C3033E2
	for <linux-clk@vger.kernel.org>; Tue,  3 Feb 2026 07:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770104892; cv=none; b=RLd73njMr3Vur+SuOmDCXYMZTW5CCMb3NtmBJ98A6AlIPupMYJgknyB3y9V2OreZ9xuO95tzdzFgESLx815Mcvlow2XCnbDz9wyCCXMplb7dLUjx28bT25x5kCWowWc8wy3pd3Dg7tUqFzrE8rNgEnWnUf1EgFVmdnpcoDBwUAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770104892; c=relaxed/simple;
	bh=8wO4AviWFwOQrHLSpRFIAf5K1RDSwXcHOnK5qjo/P5M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UjHgNyG7XoBM+hOv3KRCR/8REG/PVJkGXqBKeCZt/3oWxt9KHf4Q2+rJsyyNyfTmn517J2oiZ90+XRfmyEUjCQILbV8bCReA2toSDNQy2BTxjIWBcjrIR+Rvhz4XovxSk7yntPuWfZByTatj4xLPCnLCpYErCKAZeOVk/LevLTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=STuUHT7H; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="STuUHT7H"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47ee0291921so50224535e9.3
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 23:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1770104889; x=1770709689; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w4Fa42+s21p5WnV6bQFuaoXKffvstj50qKY5S721GgI=;
        b=STuUHT7HFfoTTmXbSb2gFKQJfL/TSArrmPfAL0VIwFIvJGfnURrNYbkfraG3EqjG7n
         Ggcu1qYaRY3V+itFmccGK8vdRjFfhrwdxQom5B7bxsJJAqM9VsE3S1K20UNthQGOxvrQ
         ykPo9H9jUyp+jmeCLLn3rInXUawrKOopTBEUZ8YZ2syDQkmw8QoiYRUdZwwL/cGKBtFZ
         4Ep4tI8g7zX7Zvzf75ZZ8wx/kWjE1Cd3ayPQFADytvSOt5b5e22GOoGLKLzuH81HXPRG
         n4dTa1ovdAIP/dzG19gYDZzRvjKJvNp6TXjN4Eq1LWZ70kJwdMZbIxXw6Muma2ifERVt
         gbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770104889; x=1770709689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w4Fa42+s21p5WnV6bQFuaoXKffvstj50qKY5S721GgI=;
        b=da5YMdk3xyW4kVUFY3quZ4JEV36W5amjIdhZUP9X5UR7/VZG+kUhxj3ohWZfeflro9
         U9NyNQ8i2KAWJ4HA/yQ2IFCi+AoffNGia2UJQqLdF22Y6gARo6ptUXLrB8n/P/fyngJL
         koI/zqdxaXVHBvl0P6HlaiAGEZV6STXkrMrTq8SQNyieIKCugzw1/x+ID9U5poFOdJxg
         9KOpujQm3OvQC+Q55xeZhVyopP22ae3D7+1PjqIaG3UdOYaOovGBI/be8SQ9YBcx28SX
         O9q5A1soJ3sHtcQNrKU8WhADJdn8eUu4HfMU3gtanAU3+wpPv7DGXQwKXxul9n/d76+K
         Rqzg==
X-Forwarded-Encrypted: i=1; AJvYcCVBshaAZ8WzR+bKexGYMxQyl0wnBH2AtVKDtuLU3HIHASMS/hn8siX9e72k5OPTD6jpyjtu0L0vzp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAAhhr8Tubfp02qVsHO4XUCbGVw+WQdbnmXiARmZWOHRwBLQjQ
	eOZmkAB9qod8GObT9CSR08gLiBnPNHymvSwIfan66EjoH/EGyBxHCV1tD9QS85npk78=
X-Gm-Gg: AZuq6aLsk3ux9gdORsXBmnOq0FLHtCgqNIcLL3wDGghRsmTP2/il5gifi2mGWECnYTF
	68uzNX1+iw9oplacxvvMCIO3JyueTJ0i43UZo1zxoOz2tx5Yl4x9x09yCKsBoCF7VwKL1ReqRSI
	0jXMh+K2qr+CybMvfDFi4k1uwefzSpwmpDrF0AoGLpHDw3cjdqwnXHKm6KVsY8mj4/QASBNmEAX
	G8TPpDUnwRe8Afaj7ucJj0OcEM4wSfQQ28azBya0jsSFIPkmBC4D9LAwMJeL1wZ1cvCWXZs0BOY
	2ep2HmHXbG2BduOuLjcJFwFpCX28PCSIbXDMqevKTH0DI8mZrSkeFUGRI9SZZCRICTL2ewPvQhS
	/mb4a2Fx+aGgEKACiAsdPOTYagH3dKXrylPMlMowCu9XKgq3Vf0OZPzm/1NGg3pQ/kl82E+5OCe
	ZxBQalpvkpqn8Qjs6xfmliieH7/0oV7w==
X-Received: by 2002:a05:600c:6814:b0:480:69ae:f0e9 with SMTP id 5b1f17b1804b1-482db4ac0b0mr189032265e9.16.1770104888753;
        Mon, 02 Feb 2026 23:48:08 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483051379c4sm44097195e9.15.2026.02.02.23.48.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 23:48:07 -0800 (PST)
Message-ID: <c05654dd-c9a1-4f42-b561-69414a234bec@tuxon.dev>
Date: Tue, 3 Feb 2026 09:48:06 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] clk: renesas: rzg2l: Drop a check in
 rzg3s_cpg_pll_clk_recalc_rate()
To: Biju <biju.das.au@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260130115850.253555-1-biju.das.jz@bp.renesas.com>
 <20260130115850.253555-2-biju.das.jz@bp.renesas.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260130115850.253555-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/30/26 13:58, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Drop the unwanted check in rzg3s_cpg_pll_clk_recalc_rate() as the function
> is SoC specific.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> ---
> v1->v2:
>   * No change
> ---
>   drivers/clk/renesas/rzg2l-cpg.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
> index 16771a0101bd..ee92d07c6ff7 100644
> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -1113,9 +1113,6 @@ static unsigned long rzg3s_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
>   	u32 nir, nfr, mr, pr, val, setting;
>   	u64 rate;
>   
> -	if (pll_clk->type != CLK_TYPE_G3S_PLL)
> -		return parent_rate;
> -
>   	setting = GET_REG_SAMPLL_SETTING(pll_clk->conf);
>   	if (setting) {
>   		val = readl(priv->base + setting);


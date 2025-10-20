Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BFD25A65B
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 19:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760987546; cv=none; b=PXb003EVbmibtKAtR/6nPi+ZorrW6syhNtgCc1rAGeZcIrmh7JwyMwc33xHCNkdrfD98qSwlCvSD8qMooMSYsP8CvVbW1x+UZOvrUPXAENO6JZNPtVICc/BJce/yr9allwFCmwSjG9tEwaH9VTcTVZVJJ3gY4i4N7dMFfMYxdLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760987546; c=relaxed/simple;
	bh=VQ4SzNY0lBUV9PtfB7g6DB3KhRUhItrtjourvDfil6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q79d0azWzNT1HDfByUoq2sbu11DIDwq6ktxECVj5JFGogp75Du6wNcGsVHt7+tgXW/PupspX0iB7qhGwN+1Lzc1znf8b6epTrsan2QOVZDUcNtX9A/9zpHBr44mHgDKHz+5pAwpy6XlCNbO93+JvJU+P0Oh+V89MZVFKxl1TKJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=O27kC9Yn; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="O27kC9Yn"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-63c2d72581fso5610661a12.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 12:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760987541; x=1761592341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KkLNLWcUc4VcQy1RdKOzXNlhz8HxfGsE6Q1JJE3irRY=;
        b=O27kC9Yn4AQXyrVOo0+b10JWgWsfFhuAazcbKErKmuE/F7ayYJc4k32f1o+8i9t2WD
         vA/vp8AHbx+Je2eSb+gExGTHtgr1/Xg78jU6URMj0L+q/+cujnsyCX9yk8G9QfiHtlWm
         3rfctpjSMa7v+sk0/sQRuSv0REMJ2fta7fftTbqKFxJq1v/e3jIkH1MyuYp5I1NfIgVP
         QtNphl2jHOfI6qo995spU3qERz8sOv72Qs6gQ3cRstOu2sNefPYisl8Av4CBmhPpKCyC
         7LpQej9CB2U0ze+O2vSoPVhiRryO1ThIjNcE0CFSkeQ63NZiopVSy55WZ5zY0vC3wpwE
         f59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987541; x=1761592341;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KkLNLWcUc4VcQy1RdKOzXNlhz8HxfGsE6Q1JJE3irRY=;
        b=M0hwRCw2O3TTANYu3Q3NxkgMGcV5UafPVGUYIEwdSaNb5DF/jFFBSmnOiU67QGqb/q
         EApkUW0hHeDicrBK+8Pj8P6Nn4oXGa1NP/wu/dSLhfH2YjF5r+lwlNvu7e16Qk3aAroJ
         dQz0O9W/5uX0AUwE5Q3BKc9qmYcSnVYAe1IIVOKPiBhFH8PBk14QqpuTZKe9Y4uIdruZ
         zzAi3aM2AiIMK9cdBDUO9M9uDLJG8Qcw9+ODlIKhYApFpnsBoPM9JTOsmdw3elPTTvJC
         t5G+2rPOHghMYohZPmJYvPJLMT5bzb+/+1dTS9skBUfVAUHKrtbEdHpte3xRQ1EnYQq5
         A9OQ==
X-Gm-Message-State: AOJu0YxuVUl7AX0MUeNhzlJ+lWOXFFeoK4bLAaJ5p84fNurBh8KnDX02
	/dcO9PtwnKaQxZqpmErfrm73E/ywCxmm2xCeFC3cp9bLa8OfN+zrId0kkZ86q4XbImU=
X-Gm-Gg: ASbGncu+ibYEfTi5vRnQYJIpvLHUxubUQc0TdewsTdknKYI8ttWy6jXnhzRCwM6YAJl
	lPMSRVoyRHwpg8bH9aNGxxtTFba1rxllaIuiG/RNu+XO2LRSpLU5m9GuudabnY9MQIJ9qyal7Ax
	p0onR9T8GWdVG1BiMjoidpbD2z0I3HH9k+HSZ58vXYeOWlrURok5J8kjo5voZBaIpA+3ee6SfXp
	nM0EtpRwh/DZZLPL7viAjjnDyPMZyyBWj1qud+NVoYOz9eVaaRpi25sPuCvOVPSO7aDid6NR0kL
	EjEZaquRrmf0zMxZj8iXmco8CuiOfwyXltobG274mnnU5T+baIieMQ8d9kev/F+EHB21MNTKlcH
	Gup4nbve5r4hNKBXKs3aVKQ+4JqjG6Bob2FylLs4q1lEvioNofm5sxXz/RBox2Uydeec7OE3LSI
	GMEfkQcIM/eBC4GwvKepA=
X-Google-Smtp-Source: AGHT+IG81276e7uaBZBiP1Z3ZjOuhvsbjXNfOAQY81Ajp6ESbGOgBPYu59ysj+jcPMn9WrMI2xyoow==
X-Received: by 2002:a05:6402:40c5:b0:637:e4d1:af00 with SMTP id 4fb4d7f45d1cf-63c1f677665mr13504584a12.10.1760987540877;
        Mon, 20 Oct 2025 12:12:20 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c48acf60dsm7304270a12.18.2025.10.20.12.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:12:20 -0700 (PDT)
Message-ID: <81e23b35-5a31-4f4c-a65a-ccf069c000a5@tuxon.dev>
Date: Mon, 20 Oct 2025 22:12:19 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 17/31] clk: at91: clk-h32mx: add support for parent_hw
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <9d37104c581548a995e20a86f3501bee10b6acce.1758226719.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <9d37104c581548a995e20a86f3501bee10b6acce.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 9/19/25 00:15, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Add support for parent_hw in h32mx clock driver.

s/parent_hw/parent_data. Same for the patch title. And the above paragraph
should be updated accordingly.

The rest LGTM.

> With this parent-child relation is described with pointers rather
> than strings making registration a bit faster.
> 
> All the SoC based drivers that rely on clk-h32mx were adapted
> to the new API change. The switch itself for SoCs will be done
> in subsequent patches.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/clk-h32mx.c | 11 +++++++----
>  drivers/clk/at91/dt-compat.c |  2 +-
>  drivers/clk/at91/pmc.h       |  2 +-
>  drivers/clk/at91/sama5d2.c   |  2 +-
>  drivers/clk/at91/sama5d4.c   |  2 +-
>  5 files changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/at91/clk-h32mx.c b/drivers/clk/at91/clk-h32mx.c
> index 1e6c12eeda10..4b709f9bd831 100644
> --- a/drivers/clk/at91/clk-h32mx.c
> +++ b/drivers/clk/at91/clk-h32mx.c
> @@ -83,10 +83,10 @@ static const struct clk_ops h32mx_ops = {
>  
>  struct clk_hw * __init
>  at91_clk_register_h32mx(struct regmap *regmap, const char *name,
> -			const char *parent_name)
> +			const char *parent_name, struct clk_parent_data *parent_data)
>  {
>  	struct clk_sama5d4_h32mx *h32mxclk;
> -	struct clk_init_data init;
> +	struct clk_init_data init = {};
>  	int ret;
>  
>  	h32mxclk = kzalloc(sizeof(*h32mxclk), GFP_KERNEL);
> @@ -95,8 +95,11 @@ at91_clk_register_h32mx(struct regmap *regmap, const char *name,
>  
>  	init.name = name;
>  	init.ops = &h32mx_ops;
> -	init.parent_names = parent_name ? &parent_name : NULL;
> -	init.num_parents = parent_name ? 1 : 0;
> +	if (parent_data)
> +		init.parent_data = (const struct clk_parent_data *)parent_data;
> +	else
> +		init.parent_names = &parent_name;
> +	init.num_parents = 1;
>  	init.flags = CLK_SET_RATE_GATE;
>  
>  	h32mxclk->hw.init = &init;
> diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
> index 3285e3110b58..ccdeba3a1130 100644
> --- a/drivers/clk/at91/dt-compat.c
> +++ b/drivers/clk/at91/dt-compat.c
> @@ -201,7 +201,7 @@ static void __init of_sama5d4_clk_h32mx_setup(struct device_node *np)
>  
>  	parent_name = of_clk_get_parent_name(np, 0);
>  
> -	hw = at91_clk_register_h32mx(regmap, name, parent_name);
> +	hw = at91_clk_register_h32mx(regmap, name, parent_name, NULL);
>  	if (IS_ERR(hw))
>  		return;
>  
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index db067177e6ef..64faaa8123c9 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -180,7 +180,7 @@ at91_clk_register_generated(struct regmap *regmap, spinlock_t *lock,
>  
>  struct clk_hw * __init
>  at91_clk_register_h32mx(struct regmap *regmap, const char *name,
> -			const char *parent_name);
> +			const char *parent_name, struct clk_parent_data *parent_data);
>  
>  struct clk_hw * __init
>  at91_clk_i2s_mux_register(struct regmap *regmap, const char *name,
> diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
> index 7904f2122ed7..8c7ff0108b41 100644
> --- a/drivers/clk/at91/sama5d2.c
> +++ b/drivers/clk/at91/sama5d2.c
> @@ -276,7 +276,7 @@ static void __init sama5d2_pmc_setup(struct device_node *np)
>  
>  	sama5d2_pmc->chws[PMC_MCK] = hw;
>  
> -	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck_div");
> +	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck_div", NULL);
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
> diff --git a/drivers/clk/at91/sama5d4.c b/drivers/clk/at91/sama5d4.c
> index 7cda8032653e..04c848cd7001 100644
> --- a/drivers/clk/at91/sama5d4.c
> +++ b/drivers/clk/at91/sama5d4.c
> @@ -214,7 +214,7 @@ static void __init sama5d4_pmc_setup(struct device_node *np)
>  
>  	sama5d4_pmc->chws[PMC_MCK] = hw;
>  
> -	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck_div");
> +	hw = at91_clk_register_h32mx(regmap, "h32mxck", "masterck_div", NULL);
>  	if (IS_ERR(hw))
>  		goto err_free;
>  


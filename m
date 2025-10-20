Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D9A6BFCE
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 19:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760989530; cv=none; b=bXAIFsVQ5fUETJmyMDkz9fzbgwwvQldG+KZmnULrasmZlMbMEwkoPkfYU7IfO9t3dF/cTOrRPP8Rcm/ItAPy65XwpxeKwDztBtlCAAAA3jdmDNHrIxOsOWmNJQEK5uDW8y1g22NkdbHXju0n2CS9obBiAI6f6H3BCvxs0I1ms3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760989530; c=relaxed/simple;
	bh=p2sWbK/i6wPHhukAdzgNJbGHi8CFyvayEux3Moga6Ko=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iITe4UhcWBnAsqezx6iebnLkrqEOS3k1oF2MWuE1JMeeNLSRAUOHRoB1sMdTLL0Nk7BbgdfLWmNwP/3af1djr1UzOqRR+xCBs77PKFaAdM428H9jDfPtyHNlCzPP3baFsJ9I4GrH7x6zvstrbh7BrOnVQxIvgti63LBIJSA/9bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FdNHWhoF; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FdNHWhoF"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b463f986f80so928118266b.2
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 12:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760989527; x=1761594327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qz5TY9x2mwFP+v6DHBmNs5rDoED1VITmKzDSzUIYHws=;
        b=FdNHWhoFU/7zcce7misiCY9YQE9FDJ56k7r5OAXc9qNZSmAMu4iwNKF7OTEThW8NVj
         jC8pbkiYy3eZMs6ADoZnKME5Q76io19a/JpeqGvC7xRNp+6pJvjIrHM68+mgDbY4sqiv
         dXj6pnXsnI47Ve3VcXWW3a//6LiPOpU05crPmkujSxJyv+ry45s3TEdwdTzNjJFVnPHZ
         87JMxe0Ts53XC6KpiGHHJcStiulkh4AjZJ0SzTYrshzKQV8ZhHozFSkN++/64u2hlS1r
         v38QGvKbP1ZNcrCLBA2vX+209F0pJdflgUiDOn2Te1VjrtGUU9RBkoY0yDLRyTfiWSyK
         omjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760989527; x=1761594327;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qz5TY9x2mwFP+v6DHBmNs5rDoED1VITmKzDSzUIYHws=;
        b=U6pt2nAJ/42SBH6Jl7dneVQSzR6CWJQ2QfKAOzmmvZglMuHR1xccaFtvp0k91GbUVx
         OD+aT4EQ0Mnbkx7lLb83XOtEL7bPA8ifSuhIYo80R+pYwRZy7cEb6oitWesDOFjCjv7+
         xzbT7xM6LU+eLmxCAXapDKQyFXfWTH/USGqi9B4RO3qtrsxEev3nAnoUHleFwDDLR+fz
         1uuN/jAlVYvdlP+2k6/w/GRb1Nix8689pCKN6uNVlaglvI5eOJn4wy/WLvrK08vgRSyn
         kQpVViqU3ijQn4hQ0PHpsc7tGG3thB36xhAyxbBqci1XvK3QCKbgSS7A4DHuGuK5JF6M
         JdDQ==
X-Gm-Message-State: AOJu0YxbqV6bZ6K9HxGJd6vu6b2gdM5ZIR3Jqbi83AVlF6lpErvEAcu7
	se8xtQcunh4K7bQODW+0aQKtrx6aD5IzzIloHQXtrd4Fdjgd6qCHCIR6QQ0Xe7nbgCw=
X-Gm-Gg: ASbGncsaCX15SfCFB2wvcUHJ9AWSeJi77hhQcjVsX0cGaKnrzVEq/NHKTmlQLML5MMp
	gXDn8O7xGIdML14BxFX96joKO21oZna0sYMX5SBiP0IQ7tTG6Y1L3Uko0nU5rQQ3iXJpnZvoQVJ
	GXO/LF2eDvMkgUkgEUi3G1AVDYNfKc8Z2DiIko0nrpgeauBqyLbG2tWfM18upk7dSiJCR9D3OwK
	TGnRKrhD7QFrRs1wsG3DW+oJd0+aq24PtltlnsaBM0+De0JNHsMLHkKeXkIQ8rfv6jFdPhcvgv/
	7amxJHLj25VscXx+z5tOXzpNMVoUcaJS8WW5ppgkkH9c4bQZ/25/DkP7AE92Cy5WHActKqjAlAd
	k29uu9i2J6ZRablNgvNG3n+owJNtZnLKb+Zd2UKmOXR3vw1i8z17nasPCL+jS6u/OlBmmA13J8S
	sdgwevqnF2SZG55j0sZIQ=
X-Google-Smtp-Source: AGHT+IGCob6piujm3PcDzGeduTMgTD25Owlac554+NOU9vrtDAhPuhqkFthuXzRSWnHKOtAXcaqOWQ==
X-Received: by 2002:a17:907:9482:b0:b2e:9926:3919 with SMTP id a640c23a62f3a-b647314166dmr1286907066b.22.1760989526706;
        Mon, 20 Oct 2025 12:45:26 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb725d80sm874107566b.67.2025.10.20.12.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:45:26 -0700 (PDT)
Message-ID: <b9f50783-6313-4c40-bbf2-c8474ddc2f59@tuxon.dev>
Date: Mon, 20 Oct 2025 22:45:23 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v4 10/31] clk: at91: clk-generated: use clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <645beaecf4b81c7e08f8adf3b9c74fa4b0176993.1758226719.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <645beaecf4b81c7e08f8adf3b9c74fa4b0176993.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 9/19/25 00:15, Ryan.Wanner@microchip.com wrote:
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

[...]

>  static void __init sama7g5_pmc_setup(struct device_node *np)
>  {
> -	const char *main_xtal_name;
> +	const char *main_xtal_name, *md_slck_name, *td_slck_name;
>  	struct pmc_data *sama7g5_pmc;
>  	void **alloc_mem = NULL;
>  	int alloc_mem_size = 0;
>  	struct regmap *regmap;
>  	struct clk_hw *hw, *main_rc_hw, *main_osc_hw;
> -	struct clk_hw *td_slck_hw, *md_slck_hw;
>  	struct clk_parent_data parent_data[10];
> -	struct clk_hw *parent_hws[10];
>  	struct clk *main_xtal;
>  	bool bypass;
>  	int i, j;
>  
> -	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
> -	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
> +	i = of_property_match_string(np, "clock-names", "td_slck");
> +	if (i < 0)
> +		return;
> +	td_slck_name = of_clk_get_parent_name(np, i);
> +
> +	i = of_property_match_string(np, "clock-names", "md_slck");
> +	if (i < 0)
> +		return;
> +	md_slck_name = of_clk_get_parent_name(np, i);
> +
>  	i = of_property_match_string(np, "clock-names", "main_xtal");
>  
Please drop the resulting empty line here.

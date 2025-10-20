Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95543148BB
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 19:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760989369; cv=none; b=Ax+TuBCaKiuge/0EIdgF2j6iKEtlwp2vG/8WwwGHLAEGx6G/5naXTfX62ytjc0JSjGuKf6teLNyC7HzVB4SAy0B5Ef7gqgcg4wm7Da8npx+YIG2gbSBRNT3psOQ087BhJafWoJ5eVtfpK17jUdPhHDKn1/HKharC4weVV2CKhrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760989369; c=relaxed/simple;
	bh=Bcib7GgDvbxG8dNMZol8O5N62eoUHF7edKC5bkNsAo0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=C6wHlLMM0zSX9WgllKXjZlXmJu/R4ez4kbIAHcJQBhj9ug5mTnxhVkoU0IbO+IXQldf9I2oLVq9cFsZtePYokLe8kSVy9gZY4zxktUbcRMKwiQA/dXkoNUOyyzmipC87VG2te6eZW2Hr90FqFnnuyJaFe+C/34l+2g7Y1mMUHuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Zd5uConY; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Zd5uConY"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b3e9d633b78so194619666b.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 12:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760989365; x=1761594165; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7Uq5LFMJuGM/xM9Jid2EcKy6jYFa1OSnWMslrM9L2Xw=;
        b=Zd5uConYHo7E15j/bDQDH9oVidNkRsA9nm1D9JrzQkL73VvOtIjMxF13BLpSU9Ct0n
         qofP5imqbk59fxdrCw8bLP1UPapsc8a29RhbNcmoL/LuRReoOZ9bK2vw2UHFtXV390LY
         MiuXNGkEsgV7556VldpE2LBMEnhA8M2IuRyPwwofJ7UjSPwS3bUFy1Vl0bmOkzSs8imj
         kAKphKlnPkygHXr5PlTFBXCy3pGAW7VVhyNMgKht9AUK2YWULVjqaOI/VGxwITwgpuZk
         NI04Jb9jPmrQJVBs+8KthXTOxUViUV8pENXbjovh8SqhgX3qz5Iah2o4kRpisdXdiAmo
         3z1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760989365; x=1761594165;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Uq5LFMJuGM/xM9Jid2EcKy6jYFa1OSnWMslrM9L2Xw=;
        b=RCWY1msjRreMROeiGqyjGizTeMWHpxZoVY7ZCcaU+XeZOJS/PdKbWlfS13q46qw0L4
         3Sghi38nmv3VbLRaN+xXVFlwtDS0kmef663oZKEIMOYfLWKV6UcGGox70AFSB3MojDJF
         be2UjTnNoE2eDfC/BEjNMpO30avNUY7geuHxS0hHNDXBTKThG9UEyK8dPA9K5Q/s2jmM
         plMMLavo88hmNCcn8eMM9um58TvFQok1h/qNy3Y+9MViH9gIM1FF5j361KDn5qhn/duQ
         WNwiL4hPXLBAzuakuBhtY/xUOr+cS4gXJcS+NlQZibk3/lN6WPUhatWIrC/NWv9AZPN7
         Yvug==
X-Gm-Message-State: AOJu0YwbR8iF6d3wR4P+H7bESDWoLihS1CqCW6y8KW/1C6MtN7jfNEa5
	fPelWHYyLNmQYGvFMcC5Mh44GaBMDQkwL8gSWx+UayEtiFgv2KuVNks1Wq6VRxsY5KU=
X-Gm-Gg: ASbGncsOowY/D/duEydsUaYYQKYfNpQKfju0NmbzYImEzN9AwxDuBgvbkf3JQb6cnKa
	pcGxzKCBaaL5CyqyImKDKbAVuh/r3J/mKpSp1ZUNdhNqmWvEbaUsuNSX5Gwnsyl83TIW5aDfQ2G
	J9usINQw3ghBzZCaBAxtKorNNmdBl2ypdR9D/azhOfz4+8IdglGkl74tkEcqZOOk80m4BLFh+h3
	YDZwz7eZmYWrD8MKfAHsariVTBpAlEU16xF4/XH1/NjC4g6KtEm03FDq3pQiY3okRf0iY/Rwi/f
	htywTCB9ncN0dKTWeqIMKbmcFeho12ilJ3T+c/T0la8UXEeL6j8rBkfMPtBGRqEMxGbPyee3Ud4
	f2LRyO/j5sonw1Vz/298YMciAUGNVkBizbz1OkMUiUPoQ27dvtsrBhd8Bxrnrt6gqpxLqoLXJbM
	GYqSe6+IakC6rVm+aPc4c=
X-Google-Smtp-Source: AGHT+IGHu2znjunMS42qnTeHNhloC2OADaigESnIDF75k5aPWsi00OCyrhzBuu/+FUhbaAk7uDtcAQ==
X-Received: by 2002:a17:907:890b:b0:b07:e348:8278 with SMTP id a640c23a62f3a-b6054cdd6d3mr1791255066b.25.1760989364997;
        Mon, 20 Oct 2025 12:42:44 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c4945f003sm7581371a12.27.2025.10.20.12.42.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:42:44 -0700 (PDT)
Message-ID: <e5f4a505-86ff-4d89-86d6-5433cf7c5665@tuxon.dev>
Date: Mon, 20 Oct 2025 22:42:43 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v4 06/31] clk: at91: clk-main: switch to clk parent data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <0f8054488ac3cd658d7a6fc0d5cd4f684ce8355a.1758226719.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <0f8054488ac3cd658d7a6fc0d5cd4f684ce8355a.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 9/19/25 00:15, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Use struct clk_parent_data instead of parent_hw for the main clock
> to less usage of __clk_get_hw() in SoC specific clock drivers and simpler

Probably missing "This" in front of "to less" or something similar?

> conversion of existing SoC specific clock drivers from parent_names to
> modern clk_parent_data structures. This will lead in the end at removing
> __clk_get_hw() in SoC specific drivers
> (that will be solved by subsequent commits).
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip: Add SAMA7D65 and SAM9X75 SoCs to use parent_data.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---


[...]

> @@ -1020,9 +1020,9 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>  	if (IS_ERR(main_osc_hw))
>  		goto err_free;
>  
> -	parent_hws[0] = main_rc_hw;
> -	parent_hws[1] = main_osc_hw;
> -	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_hws, 2);
> +	parent_data[0] = AT91_CLK_PD_HW(main_rc_hw);
> +	parent_data[1] = AT91_CLK_PD_HW(main_osc_hw);

You missed to convert parent data to an array and adjust use it accordingly
in this file.

> +	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_data, 2);
>  	if (IS_ERR(hw))
>  		goto err_free;
>  
> @@ -1057,7 +1057,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>  
>  				hw = sam9x60_clk_register_frac_pll(regmap,
>  					&pmc_pll_lock, sama7g5_plls[i][j].n,
> -					&parent_data, parent_rate, i,
> +					parent_data, parent_rate, i,
>  					sama7g5_plls[i][j].c,
>  					sama7g5_plls[i][j].l,
>  					sama7g5_plls[i][j].f);


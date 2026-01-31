Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32283346A9
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 15:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769874329; cv=none; b=MAOEfOt2+iPgCa1QxdEuerXkTHtJM57vawijEisHGPpxdiF0YitDidWzs5T027PiPyw6o+3zw12vQ67JqucO19QtbekIkG5B9vku2UNFLUHx7p4ylpwcTYeTzsK2VHsUPbJREyespBVg0g3ait9DtD55zI/uX0SOK4wuOG98VFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769874329; c=relaxed/simple;
	bh=04hTPEQQkJXkqA50U3d2dXhNlvCJYHawrRh8Ooi+zMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uvUSVWtFV0PcPl38g8FCEOmHPlhMdnDjZ6YRlH6zXirgbX/Y+FR9F6HWejkKVBG/Bc7m9D4SGQka2xRPd7WgJIXqNzZAwTGcXiEw6ALOZEENzDPGf387ldtLwWlYcKzM5dQAdAWvRaGYZKbVh2sKbbyppdwD1uPpo2dGOQVhrkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=VnbHEV2a; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="VnbHEV2a"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so33893535e9.2
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 07:45:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769874325; x=1770479125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xAy/xjG0jQvcp2oMgNIXt1SmQl8mW6MQn9zpPH2hTM4=;
        b=VnbHEV2abjJEq1ff6Ua13CD3TNLCvqY8jlSNOXDCl7sXIwjBt9trFsUBltJ8azgcYR
         C38CiICp347W1wg549UJEvjNFM4ju8bvuuSwiD4/sqn2KartWExqDfJojkafJ08KIlU8
         /ug2mPGMlUfYIg07NOltqw7uU+29rCfYyvkwfKDoKshuYdxVLiHrX6I298oLYx9jlzv9
         Egg3Rm6F4FglIbbgj7KjHf+492QUywo6xqkQrELSHHEXbXyd5h9+KWUsxO/9JQuzWLKG
         TOGDf/qi1HmvcM1wAP7Gx27oYP89cR49la2Z2No9fdoUpon2dwmZKDrp426I/RF2kO4i
         t8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769874325; x=1770479125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xAy/xjG0jQvcp2oMgNIXt1SmQl8mW6MQn9zpPH2hTM4=;
        b=eme+R0No1Pv5TDmnm3zTwpZDawy6LuF+NK8kW9OPM2G3CnGLSUCPsSK5aW5CUOkkEm
         u4IdasHn+BFbM7HvmgwCQ1S0lQwJVPQfr7+rhegujK+JLH2srPpON1gvOPIJHo/KqjJG
         yXSWfLq0lz9Vtvr3nRxQeb+N5Yq1UY2dogdSjKrBSCA77gONREoVZlBrpKGDJS6uZt/l
         QYYFFrR+rdyS8ByStZbEtg+rjGXzeGAhr/OmgZRNPo3zHq5Z8h0Z6/mnk1jHepzQexpo
         wggBWs699iwQdfcWpoG5T/Mlf5Jlzl+jG8O0QXvwpIqpvEqFlebx2ZjcdpR8DbtcwKY5
         BXMA==
X-Forwarded-Encrypted: i=1; AJvYcCUlFxi9dsnK+CfKb+QiToevEZhnZc5uBK+GcuBQwX8IeZkL7OML4a1+CJzsw9k+bD8LpckKIZ0H8QU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMKHM0g8NI2x3DIjM8ss3WaxNv6db1q7Tb19KJGNvpu1Sti8g7
	1398QQKD9QiOpEPEGJAlZYVHIjVQHb+GP7aK3al34mdo+vFKE+afaA7h7m7ry8Hf+FM=
X-Gm-Gg: AZuq6aK/cYZLvKtSLzG1Zzz3VQQaxHzXOVYSIhzLEEu5tiXEdfYpKn4rzlgbULPdxTZ
	yEteNF0gzeTsNKuC9oQEmHZav9fhYhSaRm4VB+Du5A8SVwNboyxlbWd/v14ESabbXQ9UBAN0wqH
	8W1ulgibb6smfDeSnCzbBre6iHzSfcTHePysXYCagiwny0ZJTg6G2kwNKxtGA7GOLzLzH5Mn80t
	999UKm5fUmgnfd33oqJjjrZvSsleAEz4iZ8Mh3WpZPoLi3R9inuJpHQIHeG2nUR0x6hoT56I97W
	jJXk+t0fbMRSgueRoqGiUrzg2SwsaGa3N+Xn11ahvCIlzdngYqaRwUI6RZPDTlp7B3xBzxur+AG
	a53Xnux8amwY37qxrk66gxaWplxCuiBjVeg5jjQUviHg1cSfjXga2rcIx64iVTb9dgUVfa4aLQ2
	XVP8RClWewjlicT7W+SsA931jHAnOJ
X-Received: by 2002:a05:600c:19c8:b0:480:7162:fa48 with SMTP id 5b1f17b1804b1-482db45fd8dmr79378285e9.13.1769874325013;
        Sat, 31 Jan 2026 07:45:25 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bfb59asm316944865e9.7.2026.01.31.07.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 07:45:24 -0800 (PST)
Message-ID: <ac4891ec-79a7-47b8-afd6-106b9ab7cba3@tuxon.dev>
Date: Sat, 31 Jan 2026 17:45:23 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/19] clk: at91: Add peripheral id for OTPC
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Cristian Birsan <cristian.birsan@microchip.com>,
 Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>,
 Varshini Rajendran <varshini.rajendran@microchip.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120143759.904013-8-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260120143759.904013-8-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

In patch title:

s/Add peripheral id for OTPC/Add peripheral clock id for OTPC


On 1/20/26 16:37, Alexander Dahl wrote:
> That peripheral clock is required for proper OTPC function.

This would have to follow the submitting patches rule (check the document shared 
in another patch). I would re-write this as:

Add the peripheral clock IDs for OTPC. This clock is required for proper OTPC 
operation.

> 
> Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u

Why is this mentioned here?

> Signed-off-by: Alexander Dahl <ada@thorsis.com>

The rest LGTM.

> ---
> 
> Notes:
>      v3:
>      - no changes
>      
>      v2:
>      - new patch in series, was not present in v1
> 
>   drivers/clk/at91/sam9x60.c  | 1 +
>   drivers/clk/at91/sam9x7.c   | 1 +
>   drivers/clk/at91/sama7d65.c | 1 +
>   drivers/clk/at91/sama7g5.c  | 1 +
>   4 files changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
> index a9f293a8e3b26..11f16126ff9e9 100644
> --- a/drivers/clk/at91/sam9x60.c
> +++ b/drivers/clk/at91/sam9x60.c
> @@ -146,6 +146,7 @@ static const struct {
>   	{ .n = "isi_clk",    .id = 43, },
>   	{ .n = "pioD_clk",   .id = 44, },
>   	{ .n = "tcb1_clk",   .id = 45, },
> +	{ .n = "otpc_clk",   .id = 46, },
>   	{ .n = "dbgu_clk",   .id = 47, },
>   	/*
>   	 * mpddr_clk feeds DDR controller and is enabled by bootloader thus we
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index 9a5afd258cb86..c4d2b022d9d07 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -407,6 +407,7 @@ static const struct {
>   	{ .n = "isi_clk",	.id = 43, },
>   	{ .n = "pioD_clk",	.id = 44, },
>   	{ .n = "tcb1_clk",	.id = 45, },
> +	{ .n = "otpc_clk",	.id = 46, },
>   	{ .n = "dbgu_clk",	.id = 47, },
>   	{ .n = "pmecc_clk",	.id = 48, },
>   	/*
> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index 5d8973aa50a53..52467d629258f 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -641,6 +641,7 @@ static struct {
>   	{ .n = "mcan2_clk",	.p = PCK_PARENT_HW_MCK5, .id = 60, .r = { .max = 200000000, }, },
>   	{ .n = "mcan3_clk",	.p = PCK_PARENT_HW_MCK5, .id = 61, .r = { .max = 200000000, }, },
>   	{ .n = "mcan4_clk",	.p = PCK_PARENT_HW_MCK5, .id = 62, .r = { .max = 200000000, }, },
> +	{ .n = "otpc_clk",	.p = PCK_PARENT_HW_MCK0, .id = 63, },
>   	{ .n = "pdmc0_clk",	.p = PCK_PARENT_HW_MCK9, .id = 64, .r = { .max = 200000000, }, },
>   	{ .n = "pdmc1_clk",	.p = PCK_PARENT_HW_MCK9, .id = 65, .r = { .max = 200000000, }, },
>   	{ .n = "pit64b0_clk",	.p = PCK_PARENT_HW_MCK7, .id = 66, },
> diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
> index 9a6f0f30b2b7e..3e0cfd2613851 100644
> --- a/drivers/clk/at91/sama7g5.c
> +++ b/drivers/clk/at91/sama7g5.c
> @@ -504,6 +504,7 @@ static struct {
>   	{ .n = "mcan3_clk",	.p = PCK_PARENT_HW_MCK1, .id = 64, .r = { .max = 200000000, }, },
>   	{ .n = "mcan4_clk",	.p = PCK_PARENT_HW_MCK1, .id = 65, .r = { .max = 200000000, }, },
>   	{ .n = "mcan5_clk",	.p = PCK_PARENT_HW_MCK1, .id = 66, .r = { .max = 200000000, }, },
> +	{ .n = "otpc_clk",	.p = PCK_PARENT_HW_MCK0, .id = 67, },
>   	{ .n = "pdmc0_clk",	.p = PCK_PARENT_HW_MCK1, .id = 68, .r = { .max = 200000000, }, },
>   	{ .n = "pdmc1_clk",	.p = PCK_PARENT_HW_MCK1, .id = 69, .r = { .max = 200000000, }, },
>   	{ .n = "pit64b0_clk",	.p = PCK_PARENT_HW_MCK1, .id = 70, },


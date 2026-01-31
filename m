Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3EE33438D
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 15:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769874343; cv=none; b=J1wvW1L8tnxFc8srvSCF1VEgPrj19Y5G5p0vO4uWGhrDSqPn2vl+TnudKdwYkgJBhZlHrV8fubuSsb9b2LAmpxU9m7NtFPvdRo++z9cQZaMu4hzyQ9pJDvAD9LTqg84GzQUex6ypoM65IGzD8UuA+fdYvldabL3EMRhxZ1qg2Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769874343; c=relaxed/simple;
	bh=gNDH3TGy1WU2Q2njaN/ui0AGAitPD4a69aRBMgYBnmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A5bkvKOVDa0mpGX53tGo4+EwTV07WU7WFbOS2/5oZdxDtzgLq/bxqxFMO8mtUyHg8OjUb0QIcU0oh0wurSAhlNwQEw/OCAf7PPPJK7CkW2/j4lfRVcFQ9btxzutQvEQbYIdmblySHnYwOZLQXD9D912mBDpIBjV1DntBQ9r+LGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ir+r1RLa; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ir+r1RLa"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-655af782859so5605047a12.2
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 07:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769874340; x=1770479140; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uXzdqZpn69X29wR/M9YsEFGq4gfj5xwE404NDbdUoVU=;
        b=Ir+r1RLaFBANV5xp+KehGBu7X1isJgVGu67R2wF3aH4FlT1Lu1nd/y5OCFQ5M9yiis
         UAPwMtzBUxrRfCKZduJi4tFNqaK+dqdhdqXD/cUacFmwEGw7tzw6+4sY6ixj2ZbNonLi
         HjUBG4qtdxJtIGJ4xPIIGIrqWjaxxMlGXMZ0M7vSU0rNdGS7BgSv8A8ApFH7MqX3WTMt
         +UVWuqNR8LQ+8GeXzYrnYbDL9KloRfYKgrM7Iut3z857FDs8KfssmYXwwUAU6LlzUNVO
         A2sg4/3K9ux+Tv0y4DOHj/NzC5CAwkK6vLzC2xjT47r16i805+X3K+lGXrTffDMNB8Er
         XQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769874340; x=1770479140;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uXzdqZpn69X29wR/M9YsEFGq4gfj5xwE404NDbdUoVU=;
        b=OU6wlDsDOmDJ8RX4nHTezRZZn0dYqbbx5Hslm8+i3WdMm1AJO7vGxkvb1Upfoh6TDd
         9V/LpW5QdFE1vxB0XK00mQ68oIcdN49qvLT7+KniAzaKx+LXQCtehVgdfkPX17/a34D8
         9T/eEnSm9HtZrVsMMLhuxhpf3dTUk8x7w8chwhODWVoYA5kkhLFyccL7KEAfdBC/qkN2
         ZzeQd8T6InE7FWfzkKKyQZPDs11NXOnuuT3KrvptgcO04iuP3sebh42YvH+L/aApNz3i
         9ogCOt+V3v3U9Q0FFiiPjvi+3mIeUV84esYcY5IqpXCN6orDsqZQhPoRQL0Q7ZiAnedC
         fK6g==
X-Forwarded-Encrypted: i=1; AJvYcCVvJy6qgNCMbtjHVExetCeCvAAzXq/u7UnHRy3DmoOLsLIrr2HNvyK+tC2yaCDpLlj5yIPwhiIzPrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuLSFft+J72jcccb6SDSdU4apJAqBojoQrVmqGMXtPzsVAy7Ut
	ueKA9TEZCCDug6uvS7HRKuxKK3tT3W72QgItrPalshbbJkXNklA3Sfu+kaAn0uCetzo=
X-Gm-Gg: AZuq6aKDLbVDnXs5XOr0gaxpcPJohb75DqKZoRruG9PY/SgLDjXCjr1VMRFvzEUweOt
	HoXrPsdNhHH1drcsbpmAHUHti9o9K5bVrRhIKf39WboRhM7jbzTMhJ6KjxAB3bC/nS6na9pmOt9
	44WI9XzKS2DJIaegszyYUI4uH65WyfMzUvHkJcWV8K9vP4i8r+uPfTXX4h/nxaV92BpJxTNPfRp
	ZEtHaZa+pAwZIhcqd0Ipdfs6UdSWwvj4x75NwxFHdxV28YKoRVifFwV6IFmGeHiI0RjgbfJGAb3
	BClBFesec4ixCycDVJq0qxnsfRwNWTFs0VNjydp3qbVhFznM15InfgQVxwHMxJfZj5hKUP3eT7c
	D4K8u+u6go3b+SkfoJSjfCrStozAkbYGkeuiK3bSBXfuXHoeSF7FeBWP/a1Af5rj9BvNPGQ6emS
	95FQ89PCXIT65TmY0JDw==
X-Received: by 2002:a05:6402:3643:b0:658:bf8d:c946 with SMTP id 4fb4d7f45d1cf-658de5aa8e4mr3016168a12.29.1769874340352;
        Sat, 31 Jan 2026 07:45:40 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b46ae22fsm5455327a12.35.2026.01.31.07.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 07:45:39 -0800 (PST)
Message-ID: <6d68a46b-f43b-4248-8031-58192da26c2b@tuxon.dev>
Date: Sat, 31 Jan 2026 17:45:37 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/19] clk: at91: Allow enabling main_rc_osc through DT
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Cristian Birsan <cristian.birsan@microchip.com>,
 Varshini Rajendran <varshini.rajendran@microchip.com>,
 Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120143759.904013-7-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260120143759.904013-7-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/20/26 16:37, Alexander Dahl wrote:
> SAM9X60 Datasheet (DS60001579G) Section "23.4 Product Dependencies"
> says:

s/says/states

> 
>      "The OTPC is clocked through the Power Management Controller (PMC).
>      The user must power on the main RC oscillator and enable the
>      peripheral clock of the OTPC prior to reading or writing the OTP
>      memory."
> 
> The code for enabling/disabling that clock is already present

s/that clock/the main RC oscillator clock

 > it was
> just not possible to hook into DT anymore, after at91 clk devicetree
> binding rework back in 2018 for kernel v4.19.

I would re-write this as:

however, after the at91 clock device tree binding rework in 2018
(kernel v4.19), it was no longer possible to hook it up via DT.

> 
> Do it for all controllers with an OTPC controller, where the main rc
> oscillator is required for proper operation.

I would re-write it as:

Export the main RC oscillator for all SoCs featuring an OTPC controller where 
the main RC oscillator is required for proper operation.


> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>

The code LGTM.

> ---
> 
> Notes:
>      v3:
>      - no changes
>      
>      v2:
>      - split out dt-bindings changes into separate patch
>      - extend to drivers for other SoCs providing the OTPC
> 
>   drivers/clk/at91/sam9x60.c  | 1 +
>   drivers/clk/at91/sam9x7.c   | 1 +
>   drivers/clk/at91/sama7d65.c | 1 +
>   drivers/clk/at91/sama7g5.c  | 1 +
>   4 files changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
> index dbcdb1d2161a9..a9f293a8e3b26 100644
> --- a/drivers/clk/at91/sam9x60.c
> +++ b/drivers/clk/at91/sam9x60.c
> @@ -227,6 +227,7 @@ static void __init sam9x60_pmc_setup(struct device_node *np)
>   					   50000000);
>   	if (IS_ERR(hw))
>   		goto err_free;
> +	sam9x60_pmc->chws[SAM9X60_PMC_MAIN_RC] = hw;
>   
>   	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL, 0);
>   	if (IS_ERR(hw))
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index 07eadb712a1e4..9a5afd258cb86 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -764,6 +764,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   					   50000000);
>   	if (IS_ERR(hw))
>   		goto err_free;
> +	sam9x7_pmc->chws[SAM9X7_PMC_MAIN_RC] = hw;
>   
>   	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL, 0);
>   	if (IS_ERR(hw))
> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index 4ccffa8db43a5..5d8973aa50a53 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -1135,6 +1135,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   						   50000000);
>   	if (IS_ERR(main_rc_hw))
>   		goto err_free;
> +	sama7d65_pmc->chws[SAMA7D65_PMC_MAIN_RC] = hw;
>   
>   	bypass = of_property_read_bool(np, "atmel,osc-bypass");
>   
> diff --git a/drivers/clk/at91/sama7g5.c b/drivers/clk/at91/sama7g5.c
> index 99b4c1d9bdcca..9a6f0f30b2b7e 100644
> --- a/drivers/clk/at91/sama7g5.c
> +++ b/drivers/clk/at91/sama7g5.c
> @@ -1014,6 +1014,7 @@ static void __init sama7g5_pmc_setup(struct device_node *np)
>   						   50000000);
>   	if (IS_ERR(main_rc_hw))
>   		goto err_free;
> +	sama7g5_pmc->chws[SAMA7G5_PMC_MAIN_RC] = hw;
>   
>   	bypass = of_property_read_bool(np, "atmel,osc-bypass");
>   


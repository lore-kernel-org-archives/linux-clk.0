Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07303382C5
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 15:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769874311; cv=none; b=bbpyVUJm4QX1Wb6CbQOxQtQ1bGVodlGr9d9PvgMaSYcV7cLsMfHkyH44UISeK/cid5g0oBRSgDIpVe/EEIRsq7Z6VfsJ3r340JVgNC3tTD6hTr8wCNqiFVlAfboj37T9j61eUWiqBm3+oZTsdcFt8bq42rUCddAEuTTl+dqWKjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769874311; c=relaxed/simple;
	bh=fuN2UPFgEYfBCj2BHbyySS4One1nq+XfwUsFOcEr3jE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lm0VMCUJ1PXqu4H0RmRYekPVrdn/vx4HZWLbPsun0al2bn00bFaKXMZdLMU9Yjy0Wd8O63qbSacaYLfOHlURCV2sx6etBzuGzT1FY1yJLEI63VpR0l2rBhgEjoro28156++bYja9GO6M8HRtoRy7KDMCvoU9SCtpvnqJnem8tO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=U1hUd7+X; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="U1hUd7+X"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48068127f00so26050675e9.3
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 07:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769874308; x=1770479108; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RjaIDtYDiYI4mwiOZdIpe1GZPlECoS2pA6IgFfjxvCU=;
        b=U1hUd7+XjOzNAMs5fZuJXpaDD5ZsqncZ6X85MxW0+uh+/6XBtOnnyKbdI6+eiTup7V
         jMvStsntcfCvOVXpKD3iF7lQN3AbWpL3/ETQtXcHAZEEVfvj9b+/YiBgtH+oZ2wYEiUS
         1/rP9zrf2bOz8PGM1Vt4HKNvb6A9i5nq8CJ8AIniD3QNbVfqcvYoZCEZklR5gilS0C/l
         x2IjjVgAuHOf7oaQOaNLnpnU5gh/WbeVgXGQwLtaxdZF6SwtjwOMQGxdbK5IDa91iQhU
         /yBgVk3zGu2Jk7QmLkVX8vS6ToOtyYbtO4rNdttzxYI28ULtQt+8ssoepRMPoNLpLn4l
         1/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769874308; x=1770479108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RjaIDtYDiYI4mwiOZdIpe1GZPlECoS2pA6IgFfjxvCU=;
        b=eKNSlcsCtwntOdRvMEQgDhlbyfVYmKug97KDRBjIHSv1ov+COD5ymz0zjltxkDHs+o
         Hh3CjdwTXxmlePrl7TZGFxU7sDmOgJ7KwkkTWvZK6WlUg3PyfzXDIpdCvb3h62EZ5Orx
         6NMEqiDwLB/hHz+xrHcoRveFEtR4aPc7F4vWQlk5AgaR59xMqs1YcBf7KbXyg9X0pp9M
         Ft9HCH44Z09pHDmAm8z6lJtdx/NvdgG8V1eaDL80MPILOasncrvsSz9P/vBMfQkjzFqx
         3c6UrKxceRhc9jzO6slIudpB9H8Z5olMe25yZSR3jhl27dqR1IDcArLZx0bLpkyeMuam
         99EA==
X-Forwarded-Encrypted: i=1; AJvYcCWIWxv9Ii1QOSyxghJXk9RrPDxeup5naMAhggMXrBBgPAzNkQXm40kgnqJ73+n9AKIrOe0UbVbpls8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7YMlbp54dXMrAlAFHUP8wiKGGqy82DpBW1z2nHKGTX0n5g70D
	e5bhqEaHpXHVek4ZHCB9EhQgn9byCNvGZ8iOOxaULF4Z32cdo00CGffAX0q1+qX/LOM=
X-Gm-Gg: AZuq6aJE6+3pTX8H8XV0yBQfxpRx6IJjum6Sin1AmED/F5waKNIQ6XUEQTRXRGkrqUB
	l1K6BtgrAVD7MfoygRwlHZ6sNEhA3ctxED2QzgtmniLFlXa2q+dQ9eD9UD7m2WKZjE6mDgvWU43
	WTOGgXzr+AtAAQqmAC2yAfmtZbxtmeeQad53aGEKNaHAnGKY5EDIp3iDKlyXuiPMSEJdJBM3hH4
	s2J+HD2usrd3xVk6OoiWxrVsR+06G7cB8YWSoCOCRuVGZoWHlsaF9kAv172Rdddjwj0IO/96ocE
	i8vJZ3lMvQSH0n/ZZsjqpEb1fatnyL1FZrn7vho3eVvK1+W38gpt5jkn0kmSysdlyGJQ52AqI4Y
	lpY/IL7qEAZPGGwXPrFmSAGZmjwM837ueHmgRIZTkITKjl3rrYqM+CkNDC/oeIwUsTyQWe3y5gC
	LcdHi9FzgMV2Bnsqh76kqokxx0PAAE
X-Received: by 2002:a05:600c:3d96:b0:480:3bba:1ca9 with SMTP id 5b1f17b1804b1-482db4568femr84868555e9.4.1769874307935;
        Sat, 31 Jan 2026 07:45:07 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37420sm357329975e9.9.2026.01.31.07.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 07:45:07 -0800 (PST)
Message-ID: <fac4b0b0-3aa1-4a7a-b578-2406bee5b4a9@tuxon.dev>
Date: Sat, 31 Jan 2026 17:45:05 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/19] clk: at91: sama7d65: Use highest PMC definition
 as max index
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Cristian Birsan <cristian.birsan@microchip.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120143759.904013-6-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260120143759.904013-6-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/20/26 16:37, Alexander Dahl wrote:
> Consistent with all the other at91 clock drivers now, which also use the
> highest PMC definition as max value, and no extra number.
> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>      v3:
>      - new patch, not present in v2
> 
>   drivers/clk/at91/sama7d65.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index f6f86261ceefd..4ccffa8db43a5 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -19,8 +19,6 @@ static DEFINE_SPINLOCK(pmc_pll_lock);
>   static DEFINE_SPINLOCK(pmc_mck0_lock);
>   static DEFINE_SPINLOCK(pmc_mckX_lock);
>   
> -#define PMC_INDEX_MAX	25

That's not the right approach.

You should identify all the core clocks as described in the HW manual and 
allocate the ncore section of sama7d65_pmc[] to have all those fit in there. 
This driver would have to work with old and new device trees and thus, if you 
shrink it now you wouldn't satisfy this rule in the future.

> -
>   /*
>    * PLL clocks identifiers
>    * @PLL_ID_CPU:		CPU PLL identifier
> @@ -1120,7 +1118,7 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>   	if (IS_ERR(regmap))
>   		return;
>   
> -	sama7d65_pmc = pmc_data_allocate(PMC_INDEX_MAX,
> +	sama7d65_pmc = pmc_data_allocate(SAMA7D65_PMC_MCK5 + 1,
>   					 nck(sama7d65_systemck),
>   					 nck(sama7d65_periphck),
>   					 nck(sama7d65_gck), 8);


Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3881A42C4
	for <linux-clk@vger.kernel.org>; Tue, 24 Jun 2025 07:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750748689; cv=none; b=S8B8zd309vKqYgApfutTOQGWVPK4ZjzcuV4qxQvxTgkgAlQIb2zoN7+KiT6yyj24XOIpVv90qyv7KCJTO2hhDpYQisqWVtfWeEWGtzldgx1xswy1P0K8+BABpssCLe0Qb3o6yCaglDDaukhUHpQ+Yq28HgOaQnFXBBiB1EZflIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750748689; c=relaxed/simple;
	bh=XNIc3kjYQjwXXUBYl3GyECf4oKKi0byLqTBYhJEe+0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZZAdiyX39o49zHIKIE9FOwG+MI5ExzTuP8oPHptEr0bNEOETgCXtWP/PN/zEEVjKUU/ybpkCn1h74qO9gwUYktyklqegjp1FMpxBLQJI+9/3OBt2QqRxap/vPCHgBWGgx1+bNn0Hwl6nzAEG9PVtira5Wb0I7KKpn0PaTpm+HN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qyeOMxAV; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qyeOMxAV"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-addda47ebeaso19908166b.1
        for <linux-clk@vger.kernel.org>; Tue, 24 Jun 2025 00:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1750748684; x=1751353484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HLbitD9Yz365jr3BdIqraX9XTg2iaE+GPbMQNtnpays=;
        b=qyeOMxAVfGluDNmUE2YUVwQ5UogysrKhUtf0vcZtebOiPukoLQj8nPbzzrNYFgYF4z
         fS6aWdrpNHCWgZywfpBZeWB13JIvRlvYTsM7110xWRr4kZLexKfIinD6WRxzrwJRcgkx
         pFAa0AjI0UfUaYYtiqrvEHURaIfgu1YdDmFsM8+0LDFWnpCQq1DGJ3i7yuqQXxI50y0S
         ehtWKFpZv7V7BWWibGXVl97mUwmbGTm0vyyIG31e3YHqhTxp9pmbODJJ11wmSCEeP96J
         dioFwdF6xm1fiqD1//P0o/2Bh4ogPQ7XAKvBbW1ysLqx5jD4Rejx/liTsdTT2g7ElX6q
         g5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750748684; x=1751353484;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HLbitD9Yz365jr3BdIqraX9XTg2iaE+GPbMQNtnpays=;
        b=IdMUWP+mKbj/yMm4ktujdEJsrD9ENh9txHnxnM0Os4XiyVv2a+jdTuvA50CzH5ycNA
         R4bt6uPsP4S6hVDeQOq09IC2JNGoIv2bUBkLJhovuGSN5BB/58TuU2QtzrriBvvscDK9
         U13OrOKtINEtIfecEk1+v1hfNavdgNa9fftpMahxOO+/vyJqJEHs0pHiqAu5h327Cbfn
         OF4r9pvbuoAxIHvk1Sk6fRWa7gL1w6BDEZJQV56wPbUYzZDVfXuUxlgc0bLXMrjcrXdd
         5duLSQbYnnKejA0e7FAS0tQYghAHwpcPyFJDw2D/WJfN56EoX1f5j/lZcdxh4m/qK7kZ
         pdyw==
X-Forwarded-Encrypted: i=1; AJvYcCW4w6z6tYJS6/8nEZYfcqWJxQcYSX/s9/L7rGtV7XshlGL+Cx1NC+DsQhCGiywmPMJgW7OXPpoTI8s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQX4m+3f25tIlABSetZMGyKt2GM8uGfEgwyNc3lyyyfPSZ4A9V
	mMqO/v1e9yge/5D96gy4XQuoBxzplWRVUI+X0V56ySLjfY2PmmTE7/vlnZlYrGUgNic=
X-Gm-Gg: ASbGncvC8YztRg3pA3a9gKpJLEBG1XpgguT0TLtEJsRfxoayQmfxm+u2R6ygYGR0sLA
	J0gR68s8nkOWqEuFAH0XQxuDGxSwKzKJn3Ys1R7HOkGXDFLErYc6iUGZ1iG/6+hsGrICgMSAW4Q
	mvVMBeTmkMcC4zWDQZp5jUSD+lOFvFIoceqYn4RdGLTDrONAWblJxiOtn6FbXFotxTf+52YLrVl
	MgIQYbejepO2BH1QNm4w//9HVofCgLQuGC6BqV7mV9dgYzvxqThn/nAq56q7e/0b9y4L0pFgs4n
	ONBig0+cqgNCXYp6lC2bodPItAv7pu5cAKpiZdgRYgDdXuKNLHSNn9g7zJ3T+s9bpgdSNNNRsP0
	D+It/YA==
X-Google-Smtp-Source: AGHT+IH9JmPa7BbH+tgIB0uoiJ2JP68fJ2WltDdUQv4ZUEycK4uvEtfSZLwyJj/VT7FzXEaxap3DCQ==
X-Received: by 2002:a17:906:6a05:b0:ace:cc7f:8abe with SMTP id a640c23a62f3a-ae057b39bdfmr1676502066b.31.1750748683722;
        Tue, 24 Jun 2025 00:04:43 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ecbf72sm817956566b.47.2025.06.24.00.04.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 00:04:42 -0700 (PDT)
Message-ID: <c51b2b64-24a7-4e14-bdd8-c4a356423100@tuxon.dev>
Date: Tue, 24 Jun 2025 10:04:40 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: at91: sam9x7: update pll clk ranges
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Patrice Vilchez <Patrice.Vilchez@microchip.com>
References: <20250610084503.69749-1-varshini.rajendran@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250610084503.69749-1-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Varshini,

On 10.06.2025 11:45, Varshini Rajendran wrote:
> Update the min, max ranges of the PLL clocks according to the latest
> datasheet to be coherent in the driver. This patch apparently solves
> issues in obtaining the right sdio frequency.
> 
> Fixes: 33013b43e271 ("clk: at91: sam9x7: add sam9x7 pmc driver")
> Suggested-by: Patrice Vilchez <Patrice.Vilchez@microchip.com>
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  drivers/clk/at91/sam9x7.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index cbb8b220f16b..ffab32b047a0 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -61,44 +61,44 @@ static const struct clk_master_layout sam9x7_master_layout = {
>  
>  /* Fractional PLL core output range. */
>  static const struct clk_range plla_core_outputs[] = {
> -	{ .min = 375000000, .max = 1600000000 },
> +	{ .min = 800000000, .max = 1600000000 },
>  };
>  
>  static const struct clk_range upll_core_outputs[] = {
> -	{ .min = 600000000, .max = 1200000000 },
> +	{ .min = 600000000, .max = 960000000 },
>  };
>  
>  static const struct clk_range lvdspll_core_outputs[] = {
> -	{ .min = 400000000, .max = 800000000 },
> +	{ .min = 600000000, .max = 1200000000 },
>  };
>  
>  static const struct clk_range audiopll_core_outputs[] = {
> -	{ .min = 400000000, .max = 800000000 },
> +	{ .min = 600000000, .max = 1200000000 },
>  };
>  
>  static const struct clk_range plladiv2_core_outputs[] = {
> -	{ .min = 375000000, .max = 1600000000 },
> +	{ .min = 800000000, .max = 1600000000 },
>  };
>  
>  /* Fractional PLL output range. */
>  static const struct clk_range plla_outputs[] = {
> -	{ .min = 732421, .max = 800000000 },
> +	{ .min = 400000000, .max = 800000000 },
>  };
>  
>  static const struct clk_range upll_outputs[] = {
> -	{ .min = 300000000, .max = 600000000 },
> +	{ .min = 300000000, .max = 480000000 },
>  };
>  
>  static const struct clk_range lvdspll_outputs[] = {
> -	{ .min = 10000000, .max = 800000000 },
> +	{ .min = 175000000, .max = 550000000 },
>  };
>  
>  static const struct clk_range audiopll_outputs[] = {
> -	{ .min = 10000000, .max = 800000000 },
> +	{ .min = 0, .max = 300000000 },

Is this min value something valid?

Thank you,
Claudiu

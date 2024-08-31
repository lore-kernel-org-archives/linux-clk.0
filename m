Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 886E91173F
	for <linux-clk@vger.kernel.org>; Sat, 31 Aug 2024 13:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725110843; cv=none; b=SZ+PeopLyICE3NLcDH3g9qdRETwG5a5LcsoySjhqkwjuQ1COFT9cL8IUcUMCE/POaK7i/AzXcnn2wnb28TFYX9XMivxQ2OTa0pzAAwMcuuOBKK8qQtxhkFrFTNuEoq9+aq7mSad4Czy8JgKI7O/Yu6SZJnjQODVxyvw7923IS/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725110843; c=relaxed/simple;
	bh=//BV+F8ZlsiD7gZC7oc6zOdHJc1oqJlUdQE6N99yvMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tavqcKdL2+OnOGqHS/183NYm0OTBZMAEaRGM0I8RSVM6Po3xMeAs6YL/2a/XfPGzT5XoiwvUDfoKnhTlws8IECvzFbE96aBI8TnrPcwtE4Gtt5qIWr9YrxnbwSoNIJ3kYmpR7+HQHVCAK1Gmz0Gh16Z1kING1/TVXfB3e4PryfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bScEv1Z9; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bScEv1Z9"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-374b25263a3so800112f8f.0
        for <linux-clk@vger.kernel.org>; Sat, 31 Aug 2024 06:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725110840; x=1725715640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BvV0KVR0UxO5Wu4tMTUcYDfJrFohbYrJ25TSy4uv7Xs=;
        b=bScEv1Z9jnDI04dqd4j2Bx8x1aDVFOuAVN70bAnFN0LECtqR76zJeCwYVvCxaD5UBM
         86kHX8UP31ToWaD1U0nhK8lBXb4qgmDARKsXwEuth3RTYPWnkr3SIX63MSbdRW23AHUV
         nqNyypr4e/tVX53HfxFaU+fzbo7oKF25hG7OzJKMyZISUwxlXoQPHJPctXTTBrLmMLVC
         LOGkslfss2K2ekA2TyXMJpu4dawcnbvqiHbquXeFbwuD1uhf/lpQkgM081qBDrTvY/eS
         nSduJI56UqDaYeY5Z32ftQC+yVo3PUGWrJ+QMWznBzV0umxbvz3QocD6BQ6wg5xBafnQ
         gtuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725110840; x=1725715640;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BvV0KVR0UxO5Wu4tMTUcYDfJrFohbYrJ25TSy4uv7Xs=;
        b=NI3c1fvBMhAoxE3bvB9MNJEH33TbIWWG0qmO4t7Ml6nE/KrwlxwKvtdbJa97r7PAyx
         knBYw4znwEQ5kg0xQ+yzijCIMJJ+7w5onwYpvCNJKSTqvyr8d2kxEU1acv6b6wQxmbE8
         PlUlbpbRbLD4XhQPbPraQHi1Tb1gGQeEQKkyfmUl8A+Yf0l4JnhALXN+K+UYYFZTALyh
         N/FfruPOWG8AMQ/iRKdXDGaXLynRDdjQ7i9zQlEDQz/C17gY/0S+sGlPVzuLyrdutNlp
         MY5JOGCAbA1yu22f5GxS0mluG+OfOW+B7mwdCOeKUoLGnDFDOAp54KOrVKAVqYueUfNK
         tpCA==
X-Gm-Message-State: AOJu0Yyjt7ni1VB1M1fHsfrd6hNrlkQnyIePZMdb5nuNGu4AEdCLqdYS
	gPqhEm5fW0kK4JYiS14mkDwJwRZx89oTNkivOZoleeAnuMSzUR1MnmOMcDnWFSCTYTlo/q8uDzI
	c
X-Google-Smtp-Source: AGHT+IEP0L9DyielmXbPKUJcWm6S7AdX0SFV0hQrhLlhI0ew1c3esR3mL0McFjIKY6zBnH29fVXuZA==
X-Received: by 2002:adf:e70f:0:b0:374:c35a:7335 with SMTP id ffacd0b85a97d-374c35a73b3mr292852f8f.18.1725110839957;
        Sat, 31 Aug 2024 06:27:19 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374ba30d5b8sm2893316f8f.15.2024.08.31.06.27.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Aug 2024 06:27:19 -0700 (PDT)
Message-ID: <5853cf17-91a3-4118-ab65-ed8bf2fcf498@tuxon.dev>
Date: Sat, 31 Aug 2024 16:27:18 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: at91: clk-sam9x60-pll: increase maximum amount
 of plls
Content-Language: en-US
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1724948760.git.Ryan.Wanner@microchip.com>
 <cd134c8d9e68c79b798e91f8cce427169b9e6184.1724948760.git.Ryan.Wanner@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <cd134c8d9e68c79b798e91f8cce427169b9e6184.1724948760.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 29.08.2024 19:42, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Increase maximum amount of PLLs to 9 to support SAMA7D65 SoC PLL
> requirements.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/clk-sam9x60-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/at91/clk-sam9x60-pll.c b/drivers/clk/at91/clk-sam9x60-pll.c
> index fda041102224..cefd9948e103 100644
> --- a/drivers/clk/at91/clk-sam9x60-pll.c
> +++ b/drivers/clk/at91/clk-sam9x60-pll.c
> @@ -23,7 +23,7 @@
>  #define UPLL_DIV		2
>  #define PLL_MUL_MAX		(FIELD_GET(PMC_PLL_CTRL1_MUL_MSK, UINT_MAX) + 1)
>  
> -#define PLL_MAX_ID		7
> +#define PLL_MAX_ID		9

This patch need to go before SAMA7D65 clock driver.

>  
>  struct sam9x60_pll_core {
>  	struct regmap *regmap;

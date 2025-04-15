Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECA328F52A
	for <linux-clk@vger.kernel.org>; Tue, 15 Apr 2025 12:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744718516; cv=none; b=Xs6Zuz35UF0Ti27goK/KwxnVRVsdUNF8oqH7+5/E+JXpWqTLeIH0AB19nB1GpVZkNximfg8C3AMjiK2Akc2RB6wDJicDkjjoFCQYbur8EgXC53WX6FQDvsyXNvqLsSnxn8eEE/fXf9EbA9FG+9V/n2Gc5WTn5yvlRyV/TxxM8I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744718516; c=relaxed/simple;
	bh=VjC0k27ho3MYgE1jSKQLnBF1fNTa+IvnpBnHM8yWMzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HMcATN2/Kwa9BVb4yibYO2apPoD2l128sqq3NDWsCyJdDpBykkvqLGB+96F3hpirBGy2l0SfDnmwt+uT/WZPkpuxgpkzP8z2jhTh0iTeK5kHgI4O4xplebUbFXzQMsx4xGnJh87r+688OEqHkvCOWy1cniyDNN4wMGskkLjtPxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=HCxlzANL; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="HCxlzANL"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-60400013960so1351233eaf.0
        for <linux-clk@vger.kernel.org>; Tue, 15 Apr 2025 05:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744718514; x=1745323314; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Foy/daChVYf1n+Fzm8y6dMT9iJHRN7V1fgVt9+hTfw=;
        b=HCxlzANL7yPhAXYfCc4kUwW9X49SaPTE8Pg38laWuT9CFZyQj3S+gjtg1+o43qA6W7
         DezozXaTGSv8BTWPrfYuLPTJGx0YH3+4ZzZrHMKRmP0bKpqJmpq9J8ZqdgKpq88K2QBY
         71G6L3QI/3obhdR3B1es+t5mnWUBI/o8mRFuF2HOlRdIO7waIx7w8Cp0FFwT0BTfLuKg
         4zx7AH7V8BiiK3Sedjcv1yI+kVqRfC9IFL/xVVyvdYqgtXF551nNgvKPzMuJtZThAU59
         XPsU/E8lBBuZyvWR7gx6a1685sJHY9xB/50vQLa1onmCtzteiT5+1WSWdyKzHNg1G73y
         KhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744718514; x=1745323314;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Foy/daChVYf1n+Fzm8y6dMT9iJHRN7V1fgVt9+hTfw=;
        b=JFR/UVFnp9su/wBqE6W0Y6CQWCxa3HUfbmMdsKAL5Jxms75Gs5ym1Pq/qrEsigkU+V
         lmrqJ1TSneXWqE5YUNTS1q6b3nWx7sHT0wlYrZZlUVbPFz2QQ1sOZjbNwBMwhZoQrMN9
         ZWypDP81fdRQmV5lFF2fs8jFxhJw0aam18uSd3uCB+oPm/4HyNT3vKh54BsN644vCGyY
         /0Unz4mzr+owCw8GrEGeoLHt1cKly/UtTX2BrC8cqZtJU4PiplyQIxkESWMxO+7L3RRm
         5m86SAbM+Ol2rywSmoq04c3AaMWFL/KaECh9701xw7s/rml9sGskpOycoJ05B4wrKtfH
         y/dA==
X-Forwarded-Encrypted: i=1; AJvYcCW841wRjx57f4tWv2bdyey7F2kBb7bEbzuDSrzNa1vuf2mnz0Fwt35tojvvyr1zom84/DVJJTJRa7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIOLXSEV4upRttZTsgnVRaPK+3vhdoDntspM5YGWmU52CWIvvo
	II4yU6QkI2kqbT22exM21KVyhcAjDKaPD3FU0sL//jwKKT+8bLO6oKWszrcxQA4=
X-Gm-Gg: ASbGnctRAFyN1L5d5nAOvMQvskEEawcOSYzwgLVFvVJIcx3qbOzwSD4vE1nn88bTplx
	KPel+45ec2O0AHMHdEvlFdZ29xc1cs4GS4O3WwSIF3uyet49RwSboj/EvcH6c6TAp+7STXd2R3g
	PZBEHNr8zQ5/qF1DVnPl3ZxcyHLDD9KQYmq/cLW1hOxpHXWtgVTWHQ4e/VK+pM3vnb1hrSlir4n
	QicIXkYgk3MroAiBBuHLr1anJDE0ZuB+vBeMeQuqg7/0Exi4/xs1SN7c8+hKH3pnTTZ49aKVc23
	4jkr2hX3s6PABZOsULs2uSosMUVHYGVhdYdDVggJYNT9OPVc+L2pIQn5rCWS3vnPZwsu3Rmh0Lo
	FnyZJP6OuiPhx/xw=
X-Google-Smtp-Source: AGHT+IG1ZefJtDz6AYlU+I6NKPPOmbM1gYq5/4K9M9+cYhFx0WPocorybtDxzIDHpDEm4xA8K20OCQ==
X-Received: by 2002:a05:6820:1392:b0:5fe:9edb:eafe with SMTP id 006d021491bc7-6046f59b8a9mr8979670eaf.5.1744718513333;
        Tue, 15 Apr 2025 05:01:53 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6045f522cfdsm2299991eaf.9.2025.04.15.05.01.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 05:01:52 -0700 (PDT)
Message-ID: <f856f692-03c6-4064-bc7c-ad565fed6d2f@riscstar.com>
Date: Tue, 15 Apr 2025 07:01:50 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] clk: spacemit: define new syscons with only resets
To: Philipp Zabel <p.zabel@pengutronix.de>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dlan@gentoo.org, heylenay@4d2.org, guodong@riscstar.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250414191715.2264758-1-elder@riscstar.com>
 <20250414191715.2264758-7-elder@riscstar.com>
 <eee41968ecb0c16da214819b9a43e9dd881fcf13.camel@pengutronix.de>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <eee41968ecb0c16da214819b9a43e9dd881fcf13.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/25 3:22 AM, Philipp Zabel wrote:
>> +static const struct ccu_reset_data apbc2_reset_data[] = {
>> +	[RESET_APBC2_UART1]	= RESET_DATA(APBC2_UART1_CLK_RST, BIT(2), (0)),
>> +	[RESET_APBC2_SSP2]	= RESET_DATA(APBC2_SSP2_CLK_RST, BIT(2), (0)),
>> +	[RESET_APBC2_TWSI3]	= RESET_DATA(APBC2_TWSI3_CLK_RST, BIT(2), (0)),
>> +	[RESET_APBC2_RTC]	= RESET_DATA(APBC2_RTC_CLK_RST,	BIT(2), (0)),
>> +	[RESET_APBC2_TIMERS0]	= RESET_DATA(APBC2_TIMERS0_CLK_RST, BIT(2), (0)),
>> +	[RESET_APBC2_KPC]	= RESET_DATA(APBC2_KPC_CLK_RST,	BIT(2), (0)),
>> +	[RESET_APBC2_GPIO]	= RESET_DATA(APBC2_GPIO_CLK_RST, BIT(2), (0)),
> Superfluous parentheses.

Wow, this is something I don't normally do.  I had to check to see if
I managed to drop "BIT" or something (I did not).  Anyway, I'll fix
this in the next revision.  Thanks.

					-Alex

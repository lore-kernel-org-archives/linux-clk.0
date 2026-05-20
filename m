Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5B322A4E9
	for <linux-clk@vger.kernel.org>; Wed, 20 May 2026 02:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779243286; cv=none; b=OaXJ2PI5KmRjI9j+/LFLmEBGn92MzXk8q1J7Oq0ddb0EsoSQwZkZWYBxWmgUZBVURY0fuAK5UKshjfOjDs9Ht+b16DadY0lbUe8VLYEO/ijz9PKwNFLR68FiQoHnh8wM7JJVqFKbecTpPd+VTy1KRRUsQORYRSTaOdwO8rihH5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779243286; c=relaxed/simple;
	bh=LeCd7eN9HG6E+3BXM4Y9D+fbj7hAG02oX7UkV1/QE9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oVmoMe1YjLmGrw6tTCIoWapFsAJ7A/4ga13Ron998OCO/NUZQtFWk0P+AIXHNmEFOkEzXVuoQLwnRyRPVkTX6SMWy9+yJw+tKoIYWxTTXOXCvRR7yYzA3y5wvmgM/ae9vnFBAMB9w72dk+/9qX17QQFlajy+lLVh9xIojto/B/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhBcHfTh; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhBcHfTh"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3680540a6efso2237489a91.2
        for <linux-clk@vger.kernel.org>; Tue, 19 May 2026 19:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779243284; x=1779848084; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rDqYEEUd2xJtmq5d3RcJIE6f0InLIvSKDj5hsY/X7po=;
        b=bhBcHfTh9BSSuuzE4pC57J9y6iRio8MOZ9m5N/XWOfq5PZ2gqFgGHCK7I7CIWWd/5J
         7KUkStYklKbTwov+OBmxdqp9DTcGtFmdTSWJ6IQoE56Os7WO9htx0y73Zftu+dhJ4PaJ
         dcUN5yV1Lqp+jsHRyo3nwBK5tqFKbUpYuXMWMSVzL6o/2ONY5UKnWOcoQvo2XKr7mLup
         wTj0kmwHWCxgyZuhnOXi0sDI4e58ueTkzrkUea1vBSe5nOp9NH5H28lZxvc5Hi9xvQN2
         7C+J7mdMXz3W0XBJojodd/XKTtm74/qGUNa6Rzhydg822hUnutYMWCvw1H9H8CFd1yLe
         g8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779243284; x=1779848084;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDqYEEUd2xJtmq5d3RcJIE6f0InLIvSKDj5hsY/X7po=;
        b=OIC8avibAGt/lHeWJ0/5ghRq32aLDY3iT+D36tzuAV9esTx3PXKAjSYKbb6TGWAA6G
         VPZF1iJBaTQcPMuP0pJtiDfF+zpiVn/Xn+jDBOe6WFkCz22OrC99bAcEQhEWJRtIRrLL
         8Zo2AbUDIgipl6FNJA5x53C6vZfyR6tTR/nzapQgT/kSJUjcqhvhOBWnnlzj8shwz2i3
         7WI39+oG6BMdEoLDtxT+ZzAA+Vo2q+5mubrJ18gau2u9lU9FGLwfAViRLO3sVaQBsuKm
         UB/ZQdq6LVHGYPbjdQicfartFrQrXoRHn3NAG512e66MZIrrvfr6FvQN6RIjEwyKQeyw
         B9Ew==
X-Forwarded-Encrypted: i=1; AFNElJ/7QHoRlDEDfZGDXgg87pKLA//i8HVjQsASugDvyNABGw4q4Gd+88jAaDljYeNlOkJYRODqftxd2rI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3dptFj4J9HB/HE6eRI01T1vf1NkYMvFkcCcuJak7wsCf0SwYC
	cuzd3I8MzE4sqrh17qypCmMvx8UW3WkqhPJoK++9VCs/HEjOkJiCALN6
X-Gm-Gg: Acq92OG21lCK19oduMqCkH/4+4wDaTfo+OLK2WFuqkp73BV4PEy9rscSr1TWYpGGsa1
	xchn7wHsY2PzcE3Faxg+9lzxPIl8wVZ5fVIPMOrBsjA/su/RJApOuZzgqgG80zoAIBfgBkORheN
	i1XSzGE2+wWhRdox67vQJJz1UY5bfsHXZVSbwHOvhj0PJceztw97sGGnR8hORsFCBIEMhPLGp/I
	8p9z1qgp151H5f0bP+1AA1u4pxx0/QOqBHpGWyZBdUE9W/44qHZYqokdRFufp2fsKWSCK4qjNZJ
	sbtLKtOAyFukvEozqIEHxrGs+beK1PfKj2ebB0BEwsoyq5r3XijdEHuLXbum+huShRSZGCAm60o
	NDXVtY99xpdkidsdH/c0FDThd5xavATP3ssJYNEJ5yiIpNSAEmnc5PJLPn/5Xk9bKRgfGJIFczJ
	64Rbs56Hz8uQnLnIiaUZ27Pu3CDNIBfgNdSMBT5CWpBH7sRfmo0W4vwfl5lJfrEvsYyUC70Hmqi
	0UW
X-Received: by 2002:a17:90b:4a03:b0:369:7003:4e30 with SMTP id 98e67ed59e1d1-36970035860mr16664323a91.15.1779243284521;
        Tue, 19 May 2026 19:14:44 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369c4bb4d4dsm4170018a91.1.2026.05.19.19.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 19:14:44 -0700 (PDT)
Message-ID: <2a49734a-c4e7-4818-a024-6c944af93020@gmail.com>
Date: Wed, 20 May 2026 10:14:38 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit field
 width and fractional calc
To: Brian Masney <bmasney@redhat.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260513055626.1070533-1-a0987203069@gmail.com>
 <20260513055626.1070533-3-a0987203069@gmail.com>
 <agx5gTfaByMNjkX4@redhat.com>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <agx5gTfaByMNjkX4@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/19/2026 10:53 PM, Brian Masney wrote:
> Hi Joey,
>
> On Wed, May 13, 2026 at 01:56:25PM +0800, Joey Lu wrote:
>> PLL_CTL1_FRAC was defined as GENMASK(31, 24), covering only 8 bits.
>> The hardware fractional field occupies bits [31:8] (24 bits), so the
>> mask must be GENMASK(31, 8).
>>
>> The previous fractional-mode calculation used FIELD_MAX(PLL_CTL1_FRAC)
>> as the denominator to obtain 2 decimal places.  With the corrected 24-bit
>> mask the old divisor is wrong; replace the arithmetic with a proper
>> 24-bit fixed-point rounding to 3 decimal places:
>>
>>    n_frac = n * 1000 + (x * 1000 + 500) >> 24
>>
>> The +500 term provides round-to-nearest before the right shift.
>>
>> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   drivers/clk/nuvoton/clk-ma35d1-pll.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
>> index bfedd45bd04b..7e6b30d20c01 100644
>> --- a/drivers/clk/nuvoton/clk-ma35d1-pll.c
>> +++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
>> @@ -48,7 +48,7 @@
>>   #define PLL_CTL1_PD		BIT(0)
>>   #define PLL_CTL1_BP		BIT(1)
>>   #define PLL_CTL1_OUTDIV		GENMASK(6, 4)
>> -#define PLL_CTL1_FRAC		GENMASK(31, 24)
>> +#define PLL_CTL1_FRAC		GENMASK(31, 8)
>>   #define PLL_CTL2_SLOPE		GENMASK(23, 0)
>>   
>>   #define INDIV_MIN		1
>> @@ -113,9 +113,9 @@ static unsigned long ma35d1_calc_pll_freq(u8 mode, u32 *reg_ctl, unsigned long p
>>   		pll_freq = div_u64(pll_freq, m * p);
>>   	} else {
>>   		x = FIELD_GET(PLL_CTL1_FRAC, reg_ctl[1]);
>> -		/* 2 decimal places floating to integer (ex. 1.23 to 123) */
>> -		n = n * 100 + ((x * 100) / FIELD_MAX(PLL_CTL1_FRAC));
>> -		pll_freq = div_u64(parent_rate * n, 100 * m * p);
>> +		/* x is 24-bit fractional part, convert to 3 decimal digits */
>> +		n = n * 1000 + (u32)(((u64)x * 1000 + 500) >> 24);
>                                             ^^^^^^^^^^^^^^^^^^^^^
> You should be able to use DIV_ROUND_CLOSEST_ULL() here.
>
> Brian

Thanks for the suggestion! I'll update this to use DIV_ROUND_CLOSEST_ULL 
in the next version.

BR, Joey

>
>> +		pll_freq = div_u64((u64)parent_rate * n, 1000 * m * p);
>>   	}
>>   	return pll_freq;
>>   }
>> -- 
>> 2.43.0
>>

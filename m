Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F5825FA29
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 03:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778557775; cv=none; b=Icr58HaCAllD6fmKRAK5HnI8HMERS3+YbFTP9up9S7/5/Y6TCXyNPBY+JPjOl7/EAr6KCJe03gQx2CfZ5IjOJ0iIpJd3lDUWwTHhmtte0MBZ7SuG6vipDouvkS6iQ4pXQuhZMNzWCSma9ZvJu0Pw3+2Z8+93+4fxeaco50+MZwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778557775; c=relaxed/simple;
	bh=t10Vxl8iRtuwRDoCa1y2ZxSBM2+oRY+4XLKTZGfwvBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NYb/VKMumQK6Zlhgx/jFHOYgpFx0HOZ3vIivpdB/Pn1SgM4/eOTWPmzfgKO57unjyMPqqUCZlU3Tjx3XxHyByPtHmqP01b3aVT0rpMTY0oTXY97A7QKvvSBVYpBv6bn49G6G371EcD7XuRe3OHMkm3337It/W4GRi8rHXJI6aek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oNjZRQZ/; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oNjZRQZ/"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36622412e97so3185572a91.2
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 20:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778557774; x=1779162574; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x/iG5bC/BJdPkF3jn2lGTYxhj70jgu4WHqDM6ahZHL0=;
        b=oNjZRQZ/353iUoGCUcugK1xfw7iAYVJwryITDMwGFJiY3f/OApqeDjC/eriNDm6Yzk
         9xqbK1jhsrfBWXgnA/2AJOpECxZEJBqWFjbGa7BCprq1HRS1H92HsjZFj2zwbwhR7cFn
         VJIwkSkVrqR4VZ+H1YUyK39Ms7sycsBkT0zRskOOE9VM73LRbcqDwPnbW1HMQtlpMsZd
         gcB71vkdyRsfbw3rvusZkKn9g201v8wfIAXOTU0YA3aCbAqxFE1cPMGFo5mNyXbg1dlQ
         DgeykUBrP26f5tBX1VYkkTljH+Gc6TquAx1qDrZZ42WIftpivbeuoHWdpWVyJxW3e67J
         yFOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778557774; x=1779162574;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x/iG5bC/BJdPkF3jn2lGTYxhj70jgu4WHqDM6ahZHL0=;
        b=J2QPULjjfQ+wxLSB5ED7DyCfAg0lwNBb0StEKwt8MrIK7FLHvaE/0Hqdb61+FrEQx2
         Trib5P0iPVWnsW6Ub+AT4mjc3K4i0ZVBvuqArp4XpcOpiT3Lw/3sYidaQENv+JqIzoh3
         6cW0Yfz4wePtuAzo44albxj+9pzvkZhMIYP5D1tQMtiL3EYZy4f4f4wxW2OKhvgX6Hmz
         hnkwxnt1xy1W0mPySm746TwxU0PvGzfn2Wdg/VfimrHvhPSDjAe41aYMp9M57VlhC+3T
         tKiDajARmE009hi0TeBdY2D3UhnC7YuLvQvli6CXmslAMRi4sJArw2/r1+m0+09hh5Yz
         Yzqg==
X-Forwarded-Encrypted: i=1; AFNElJ/EIvmcm12eg3cUFCFJqbz0YDzOHtJUubpPcjVPb5JiZ55GYF3TX0mYqj2v9V8+MgmP1EDkxh3V5Cc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwyBmQmXgyPO0cTyTsbTpVZ0muQNphpIz1xKOj7nJYRS1m6a+A
	q5I+9ZQfoFw5e5Fj3+RuAmAsNMZ5dTtao+D9i6DCAwBIjrqYTggecg+XzFXXgw==
X-Gm-Gg: Acq92OFNpHejoRHystHNxoS68Zc4KCITkuJjPcU7tKYN0iFqdZclrGYulPlHCC5+a/Z
	FElyoG8/J3f70xGWa6Susz6q+3A9ImW2Zd6nH20S2LePEE9ZAx3z2iJds7Scop9sVeAHDLvZuaM
	bDspkPNqb1hw3V5z23l7N/Cob5pDSuNIqtjFTRUPxZ3zJbbgh79GYxD4GWKG61vp0gqDIczOy++
	wCns070nZ0b6JCowqrG9T7r6ZDnXRqc+jBWA8Ai0wtedbhfAYvH3ocDbhth2cP2he8skK7FA/hn
	UgFwGg2yoGyMmuNI6dctANPJegANO+iKBMvVLKruLtXyUTv92fd39C0VwdmU9F8fH7a6c3sXY8r
	jac9E63QSrULNRSPPU2XODWCQeoXhR+gwUCiddFXGFZQvJ5k/CS+hFpc0+M+lhBrp3vFw3Ld5R8
	Lc1aoXDcbAh21GMMuObC/sfQs7HQFp6O4hwsUYS+iyd5+QzQuGW8LmF3I/SyqMgnGqDqV9Nha/V
	f3P
X-Received: by 2002:a17:90b:1808:b0:366:33a6:9921 with SMTP id 98e67ed59e1d1-367d468c7f1mr12615310a91.4.1778557773606;
        Mon, 11 May 2026 20:49:33 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d687c565sm11705782a91.17.2026.05.11.20.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 20:49:32 -0700 (PDT)
Message-ID: <2c061342-850a-48c5-a75e-2a755bcfac4b@gmail.com>
Date: Tue, 12 May 2026 11:49:27 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] clk: nuvoton: ma35d1: fix PLL frequency calculation
To: Brian Masney <bmasney@redhat.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, ychuang3@nuvoton.com,
 schung@nuvoton.com, yclu4@nuvoton.com, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260511031600.31929-1-a0987203069@gmail.com>
 <20260511031600.31929-2-a0987203069@gmail.com> <agH7qJypv48vkZOr@redhat.com>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <agH7qJypv48vkZOr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/11/2026 11:54 PM, Brian Masney wrote:
> Hi Joey,
>
> On Mon, May 11, 2026 at 11:15:59AM +0800, Joey Lu wrote:
>> Fix four bugs in the MA35D1 PLL driver:
>>
>> 1. PLL_CTL1_FRAC was defined as GENMASK(31, 24) (8 bits), but the
>>     hardware fractional field spans bits [31:8] (24 bits). This caused
>>     wrong frequency calculation in fractional and spread-spectrum modes.
>>
>> 2. div_u64() does not modify its argument in-place; the quotient must
>>     be assigned from the return value. Both ma35d1_calc_smic_pll_freq()
>>     and ma35d1_calc_pll_freq() discarded the return value, leaving
>>     pll_freq undivided and orders of magnitude too high.
>>
>> 3. The fractional-mode calculation divided x by FIELD_MAX(PLL_CTL1_FRAC)
>>     to get 2 decimal digits. After correcting the mask to 24 bits, update
>>     the arithmetic to use 3 decimal digits with proper 24-bit fixed-point
>>     rounding.
>>
>> 4. ma35d1_clk_pll_determine_rate() called ma35d1_pll_find_closest()
>>     unconditionally before the switch, but then overwrote its result by
>>     reading the current hardware registers for every PLL type. Move the
>>     find_closest() call inside the configurable-PLL branch (APLL, EPLL,
>>     VPLL). CAPLL and DDRPLL do not support runtime rate changes and
>>     correctly return the current hardware rate.
>>
>> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> Thanks for the patch, however this should really be broken up into more
> patches. If possible, one patch for each of the fixes.
>
> Brian

Thanks for the feedback.🙂

I understand your point and will split the changes into several patches, 
with each patch addressing one fix.

>
>> ---
>>   drivers/clk/nuvoton/clk-ma35d1-pll.c | 34 +++++++++++++--------------
>>   1 file changed, 17 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/clk-ma35d1-pll.c
>> index 4620acfe47e8..314b81e7727c 100644
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
>> @@ -92,7 +92,7 @@ static unsigned long ma35d1_calc_smic_pll_freq(u32 pll0_ctl0,
>>   	p = FIELD_GET(SPLL0_CTL0_OUTDIV, pll0_ctl0);
>>   	outdiv = 1 << p;
>>   	pll_freq = (u64)parent_rate * n;
>> -	div_u64(pll_freq, m * outdiv);
>> +	pll_freq = div_u64(pll_freq, m * outdiv);
>>   	return pll_freq;
>>   }
>>   
>> @@ -110,12 +110,12 @@ static unsigned long ma35d1_calc_pll_freq(u8 mode, u32 *reg_ctl, unsigned long p
>>   
>>   	if (mode == PLL_MODE_INT) {
>>   		pll_freq = (u64)parent_rate * n;
>> -		div_u64(pll_freq, m * p);
>> +		pll_freq = div_u64(pll_freq, m * p);
>>   	} else {
>>   		x = FIELD_GET(PLL_CTL1_FRAC, reg_ctl[1]);
>> -		/* 2 decimal places floating to integer (ex. 1.23 to 123) */
>> -		n = n * 100 + ((x * 100) / FIELD_MAX(PLL_CTL1_FRAC));
>> -		pll_freq = div_u64(parent_rate * n, 100 * m * p);
>> +		/* x is 24-bit fractional part, convert to 3 decimal digits */
>> +		n = n * 1000 + (u32)(((u64)x * 1000 + 500) >> 24);
>> +		pll_freq = div_u64((u64)parent_rate * n, 1000 * m * p);
>>   	}
>>   	return pll_freq;
>>   }
>> @@ -255,32 +255,32 @@ static int ma35d1_clk_pll_determine_rate(struct clk_hw *hw,
>>   	if (req->best_parent_rate < PLL_FREF_MIN_FREQ || req->best_parent_rate > PLL_FREF_MAX_FREQ)
>>   		return -EINVAL;
>>   
>> -	ret = ma35d1_pll_find_closest(pll, req->rate, req->best_parent_rate,
>> -				      reg_ctl, &pll_freq);
>> -	if (ret < 0)
>> -		return ret;
>> -
>>   	switch (pll->id) {
>>   	case CAPLL:
>> +	case DDRPLL:
>> +		/* Read-only PLLs: return current rate */
>>   		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
>> -		pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
>> +		if (pll->id == CAPLL) {
>> +			pll_freq = ma35d1_calc_smic_pll_freq(reg_ctl[0], req->best_parent_rate);
>> +		} else {
>> +			reg_ctl[1] = readl_relaxed(pll->ctl1_base);
>> +			pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
>> +		}
>>   		req->rate = pll_freq;
>> -
>>   		return 0;
>> -	case DDRPLL:
>>   	case APLL:
>>   	case EPLL:
>>   	case VPLL:
>> -		reg_ctl[0] = readl_relaxed(pll->ctl0_base);
>> -		reg_ctl[1] = readl_relaxed(pll->ctl1_base);
>> -		pll_freq = ma35d1_calc_pll_freq(pll->mode, reg_ctl, req->best_parent_rate);
>> +		/* Configurable PLLs: find closest achievable rate */
>> +		ret = ma35d1_pll_find_closest(pll, req->rate, req->best_parent_rate,
>> +					      reg_ctl, &pll_freq);
>> +		if (ret < 0)
>> +			return ret;
>>   		req->rate = pll_freq;
>> -
>>   		return 0;
>>   	}
>>   
>>   	req->rate = 0;
>> -
>>   	return 0;
>>   }
>>   
>> -- 
>> 2.49.0

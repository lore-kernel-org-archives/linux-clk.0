Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD87544F54A
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 09:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797473; cv=none; b=MnisZ5Eo9OFgNWoeqz2cxw0f2qiEJsWQlUVymA+9dO8CSg4Gc3NnfBcj18shAPiViTxuKVDmli1XYedZDcmNWAgbMFNuMd5Z/AbBo0XylhY2ol4+CSi4qyiPPueLhpZx6Df5HTpCjmy0GLXAZojueRd7IeBHwgxaMI3tK1zz3Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797473; c=relaxed/simple;
	bh=bImVheUfldAOxgjHgkl8ayk/Pb+3X2YPifkfTYNLEVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XuN5S3p6ibAfbvRcQBCOj05Wi0UKJlLoiBlTvkjWX8WJe8vX+Gqs2InDnUi56QCRAnWw4R6Ceq1HGAhi+sDy4U/3TqQcRejy+9epRD8EdoW1gfKGk8G7gT2AcRicjunLnqjFpZxH8ZSqouFBwKFOtg12GFx5YGtiTVYdBjzj8Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VzTBst80; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzTBst80"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab98332238so728514a91.3
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 02:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791797471; x=1792402271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=45foXxlfKGzQLz8khrD+VRry4XpKalxOLzgZWIH1H8w=;
        b=VzTBst80YDmdFAS1uBnfclt+UU99XCDw282bvx5Oe3qBh6kBCAliCUT0f4TE5KZCA1
         89IH0KWliNaJp64YkXpJXCrnYj+apRyANBSikvMiDoqcgK3xVbKLpLJI7jKrxzmxtGg7
         fNbNL3vNkr2yuuZTbNZ8yjOzIuRhHdui6jx26RhSO67yrzvEDproArdRneYytG0A0nGe
         9l4mA0PiRQ8a1M8dLT9w6DTqIx326/qtEP2qvlXqknc1FjCQVyHfAB+Q+YDFc6WuAXiR
         TzzF9tFaztXl77OPUW5+RdXatVKlmSzDJer083vRDgiE4ifujqJ9HvJfyeoZs350OMOc
         9aXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797471; x=1792402271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45foXxlfKGzQLz8khrD+VRry4XpKalxOLzgZWIH1H8w=;
        b=tUXvxQ+gGoxzsgrzp68U8pOtqROAeYuOF90svG/E4H1d0mTxPd8nbz4WTOK6WrXJWr
         wJ8C9gg/RAkwHIuOSlb0mz/CF3B1dwWrS8bQLPshFSANDE1bB2QA+3O7OqZrHVJH6HFZ
         vvnZNeIiBfvnyTLdy6B0WZ4ytufSvwMwZeiAfRYt/2aURATNd5a+sLNAOXZpAyBwMd9r
         cCnLKokiDfwQxl1oP+XL6713jY0vTtXBniQ+HeUEYZCcfC7Vz/BZIScDWGJL70NXxy75
         DxVmpya1GsIPd+BPo0dl+XUnVPZHqzrYxzFfeEos0zOxhe7XXakBa8Bd6yqcvWPiWqQg
         sTLw==
X-Forwarded-Encrypted: i=1; AKwUvBw7sUUhISjTC9t8N7YEmsmPThct4Q4ClAmpAqYmREdcytYmQOrp3gpOifFOVGfmJSdlttlZRWqAM88=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHXjOl5S1tSHP5dB+QJO9QDTaa0KwqoNGJqMA26/4GLGn/lvbS
	h9gsnjeVfVec08vC8rDuoRLbJEGXSoyDv+ykFbbZQb0XfFOWMAjr09WY
X-Gm-Gg: AYBFou3cy7xCUKZ/xxlxs0TMOZKAEmLPJJy8YKKjsPrzm/jNWTr0R1s0bU/S5FeuAtJ
	gLD3eSQEWmuNjEnaK/mGcywOvlSex02sHOC25jlZYfAkRm6aY1nJHHROasbUd9qaVv//8jZ2Ujc
	bN2E5+rDGp6fafLHuh+XYFdCwzhVE1nZFtoXd0daXjKLMg+SvAi6adQOOlH3dW4H3ngOUkhoUZQ
	PXnmGyRP93PrZz7s/2Q3KWr4AfCzMQcBUZo0qNyNcb+lqxyV6cg/xLdR3NAPpGshgL8ixfOu4yS
	R+BZhRbCqHlAIB6DCdl35RdQkY8zy6NMkAGPtk1r+DSA2xR6znSOMHcSkKpGsrGrN+8eZOCViQw
	rVdvOktOJceROJiN1VuelppyOZPZ/KQYBqUI7T8pNAQEKS9goaP4aqwwemHIkwluxEACE71uTx0
	mhzYTNUFKJs3MEGl5OrMiGpY5dv1BDM7s2+pLfeBu5P3XNDfAfE5B1rCHYK6qACTqNUGhd5q4Y8
	hKqtJPPwzRSsbxwAXYQJyYzAMvEk1jRYTWquAZg2J6ydAgUjSCwpXw=
X-Received: by 2002:a17:90a:e70c:b0:39e:4c7f:7306 with SMTP id 98e67ed59e1d1-3ab3ac9dc30mr7226256a91.29.1791797470974;
        Mon, 12 Oct 2026 02:31:10 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm18455640a91.11.2026.10.12.02.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:31:10 -0700 (PDT)
Message-ID: <88c1f8fd-b972-4fd8-99e3-66eadb0f06fe@gmail.com>
Date: Mon, 12 Oct 2026 17:31:06 +0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] clk: nuvoton: ma35d1-divider: use direct formula
 instead of divider table
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: sboyd@kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com,
 yclu4@nuvoton.com, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261008064307.2757324-1-a0987203069@gmail.com>
 <20261008064307.2757324-2-a0987203069@gmail.com>
 <179156372588.266328.3848259565001346041.b4-review@b4>
 <2e5f4ca4-ccb7-4328-9bcb-32a2c4f73694@gmail.com>
 <179179301672.27179.2823663473263190790.b4-reply@b4>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <179179301672.27179.2823663473263190790.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/12/2026 4:16 PM, Jerome Brunet wrote:
> On 2026-10-12 13:36 +0800, Joey Lu wrote:
>> On 10/10/2026 12:35 AM, Jerome Brunet wrote:
>>>> The ADC clock divider register implements rate = parent_rate / (2 * (N + 1)),
>>> Are you open-coding CLK_DIVIDER_EVEN_INTEGERS ?
>>>
>>>    * CLK_DIVIDER_EVEN_INTEGERS - clock divisor is 2, 4, 6, 8, 10, etc.
>>>    *	Formula is 2 * (value read from hardware + 1)
>>>
>>> Am wondering if this driver is necessary at all ? Can you just use the
>>> regular divider here ?
>>>
>>>> which was previously modeled by building a clk_div_table with one entry per
>>>> possible divider value (up to 2^width entries) and feeding it through the
>>>> generic divider_recalc_rate()/divider_determine_rate()/divider_get_val()
>>>> helpers. That is unnecessary overhead (a large table allocation and a
>>>> linear scan on every rate lookup) for a relationship with a simple
>>>> closed-form expression, so compute the rate directly instead.
>>>>
>>>> Drop the mask_bit/mask mechanism as well. The previous code unconditionally
>>>> OR'd an arbitrary bit into the divider register on every set_rate() call,
>>>> and the one existing caller passed mask_bit as a bitmask value (0x1ffff)
>>>> rather than a bit index, so BIT() shifted by an out-of-range amount, which
>>>> is undefined behavior. The divider field write already clears and rewrites
>>>> only its own bits, so no extra forced bit is needed.
>>>>
>>>> Select the divider with a single helper shared by determine_rate() and
>>>> set_rate(), using closest rounding as before, so the rate promised by
>>>> determine_rate() is the rate that set_rate() programs. The helper clamps
>>>> the divider to the valid range and avoids overflowing 2 * rate for very
>>>> large requested rates, which would otherwise lead to a division by zero.
>>>> Reject a rate of 0 with -EINVAL.
>>>>
>>>> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
>>>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>>>>
>>>> diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
>>>> index e992e7c30341..12a946c989e9 100644
>>>> --- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
>>>> +++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
>>>> @@ -16,8 +16,6 @@ struct ma35d1_adc_clk_div {
>>>>    	void __iomem *reg;
>>>>    	u8 shift;
>>>>    	u8 width;
>>>> -	u32 mask;
>>>> -	const struct clk_div_table *table;
>>>>    	/* protects concurrent access to clock divider registers */
>>>>    	spinlock_t *lock;
>>>>    };
>>>> @@ -29,44 +27,66 @@ static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct clk_hw *_h
>>>>    
>>>>    static unsigned long ma35d1_clkdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>>>>    {
>>>> -	unsigned int val;
>>>>    	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
>>>> +	unsigned int val;
>>>>    
>>>>    	val = readl_relaxed(dclk->reg) >> dclk->shift;
>>>>    	val &= clk_div_mask(dclk->width);
>>>> -	val += 1;
>>>> -	return divider_recalc_rate(hw, parent_rate, val, dclk->table,
>>>> -				   CLK_DIVIDER_ROUND_CLOSEST, dclk->width);
>>>> +
>>>> +	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * (val + 1));
>>>> +}
>>>> +
>>>> +static unsigned int ma35d1_clkdiv_get_val(struct ma35d1_adc_clk_div *dclk,
>>>> +					  unsigned long parent_rate,
>>>> +					  unsigned long rate)
>>>> +{
>>>> +	unsigned long max = clk_div_mask(dclk->width) + 1;
>>>> +	unsigned long val;
>>>> +
>>>> +	if (rate > parent_rate / 2)
>>>> +		return 1;
>>>> +
>>>> +	val = DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * rate);
>>>> +
>>>> +	return clamp(val, 1UL, max);
>>>>    }
>>>>    
>>>>    static int ma35d1_clkdiv_determine_rate(struct clk_hw *hw,
>>>>    					struct clk_rate_request *req)
>>>>    {
>>>>    	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
>>>> +	unsigned int val;
>>>>    
>>>> -	return divider_determine_rate(hw, req, dclk->table, dclk->width,
>>>> -				      CLK_DIVIDER_ROUND_CLOSEST);
>>>> +	if (!req->rate)
>>>> +		return -EINVAL;
>>>> +
>>>> +	val = ma35d1_clkdiv_get_val(dclk, req->best_parent_rate, req->rate);
>>>> +	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2 * val);
>>> Rate propagation support is lost with this.
>> Thanks for the review.
>> On open-coding CLK_DIVIDER_EVEN_INTEGERS: you're right. The ADC divider
>> is exactly 2 * (val + 1), so the regular divider covers it. The
>> dedicated driver is not needed. You're also right that my
>> determine_rate() lost rate propagation, because it never forwarded the
>> request to the parent the way divider_determine_rate() does.
>> I tested the regular divider on hardware. That showed a separate problem
>> in the existing clock tree. The mux parents are declared with .fw_name
>> only, but the controller node has no clock-names, so the lookup fails.
>> sysclk1_mux and everything below it (pclk0, adc_div, and so on) end up
>> as orphans at 0 Hz. As a result clk_set_rate() on the ADC clock returns
>> early without writing the divider register. That hid the real behaviour
>> of the divider.
>> So I will drop this series and send a new series that:
>> 1. fixes the parent lookup in the clock tree, and
>> 2. switches the ADC divider to the regular divider and removes the
>> dedicated driver together with the unused mask_bit parameter.
> Have you looked at this series ?
>
> https://lore.kernel.org/all/20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com/
>
> It does address several problems the existing driver has when it comes to
> parents and incorrect usage of .fw.name
>
> Please sync with Miquel on this.
I tested v8 on an MA35D1 board
This fixes the same problem I found, so I am dropping my own patch. Once 
this series lands, I will send a follow-up that switches the ADC divider 
to the generic divider.
Thanks!
>

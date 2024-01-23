Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A70B3611E
	for <linux-clk@vger.kernel.org>; Tue, 23 Jan 2024 07:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705995859; cv=none; b=UXLIj6xLMW7zIe2gaCywMyvFO+/ty9q2j5j2CsU20uomJbvc780oEZfimQQ7vzJ7pDAj5b1gGbdLBZYSSYiSrt2kLqX3csoxl2GwcDQCYpMuDKFMQQMpTzL09vBkdMA1JZTXVlNYUlkp1DZunzN/wmsleWckhD6W9hHJrzPpCsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705995859; c=relaxed/simple;
	bh=dMDh8ycfE7LPUzqo/kuKFrbuyh/cSsXu1/F3ITTBaaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=reiMFFZUwUFeEeRcCy+Ayxk8VIepE8Y6kPsSsEf+P3tiUtf70Ffb/jhh3JlqNJfK7mS9DHIIBRduS7R/JlThgqK3gPPjgOpxdgFpJlnp5lOneeQxRVp05ERfI7rE1KAk9dtcL3GRUhey+5R+A4pBSFluGZ3+R1g08+bC5Wd4KVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LrQ5/Ckz; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LrQ5/Ckz"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40e490c2115so30202695e9.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Jan 2024 23:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705995855; x=1706600655; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZBTWlxp6e4Lb4iC20/lRrr6cKmKomR5gYQ5hhsStkTM=;
        b=LrQ5/CkzJpPgjMYVU8aB+/Y9IjUPAEoRUfkE137lDDlGC9KWon8S/JCKqcHwCD81/B
         Cxt1wS9UcUJOiiDCs1rxN7A5lBQdW/XHYXl45pOEwRbUNEJzLXm1bu2nvy3RYhDcRmFA
         6ZARtJLyAr8FIyMHHIBvJUxHQDTQ5Qtd2xJZXe8t655SFj+KYLRcRaHfnkI12BHhauHt
         cBiGgb2nCvQ7VTmIt538CRsdUrwmFn+bd5OsBLM6++L+tN7wP58Lgi57bvhw/URUTY8g
         /pQVizou387QbEWq7OiS5ZVHjcUOcVWQ6QgLD7xcd6roK3G1IZmSz7mpi3kWxXzMkj77
         jZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705995855; x=1706600655;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBTWlxp6e4Lb4iC20/lRrr6cKmKomR5gYQ5hhsStkTM=;
        b=RTvfDgKlbW7Nx+dRQkI7g1l+f2z8lCPIqd+isWoysjWBbl3RTn+Zw4EiAF9RPujpTa
         CWNdHxjpl5c1Usy8X1yt/ToeZR94b7svb8suL3h/xQLLFIdwbzDkDluBzIyHEu7rQSb/
         gk+z0HURAPqp+bHd1fTbWRfqYX0/kb3mjvzKsOWtn1W95LMouGKAj7gx34nxvuSYU3Qf
         MGYHfzEhjgxk6Kphp4ukZhwjvjfvFLSmvx56O4Y1PRLiZ1oDLqTtQICT2uSPEdn6wPyE
         +ecCAG0llBPv1ekNiY/p/SwjPL5KmViyFOrhD/oHvd7s/FMiq4sSzFuF4gGZ8Exq6mxn
         0kSg==
X-Gm-Message-State: AOJu0YxQWt0NYihKuSQjzFNBguG1h66NMZO2yOf+gl+zsrhz+bSBANP8
	dRHU7Baau/U1yuM4BgTob/7XC0LWlSgP/P5s9XJVJ0Gj5G/4Mey8+JdOLnT1QHZUsGaorFllTQe
	Y
X-Google-Smtp-Source: AGHT+IHP7uyl6QxlyXKx2arz0R932jWX7aAcRehRM5cqJEta+YrsbyBUFsSad0lY/fz5VLAq4sJVHA==
X-Received: by 2002:a05:600c:2d52:b0:40e:4c31:affa with SMTP id a18-20020a05600c2d5200b0040e4c31affamr220901wmg.138.1705995855388;
        Mon, 22 Jan 2024 23:44:15 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id iw7-20020a05600c54c700b0040d604dea3bsm40762622wmb.4.2024.01.22.23.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 23:44:14 -0800 (PST)
Message-ID: <cfef99f3-bd87-4c42-ad43-3030b6c9f047@linaro.org>
Date: Tue, 23 Jan 2024 08:44:12 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 6/8] dt-bindings: clock: npcm845: replace reg with
 syscon property
Content-Language: en-US
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, tali.perry1@gmail.com, joel@jms.id.au,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240108135421.684263-1-tmaimon77@gmail.com>
 <20240108135421.684263-7-tmaimon77@gmail.com>
 <171300da-3d49-4e1f-8969-9a454ecdd698@linaro.org>
 <CAP6Zq1hifi7CY=tYaDY_o82AXhbS5P9=MZBb-bqmvNCLZk3O2g@mail.gmail.com>
 <018fc173-edf3-4490-8f29-4059bd17268e@linaro.org>
 <CAP6Zq1jQ9T4Q+WvwyAH4sKLK1+Mp0utcA_STgm=_Z3ywKoLoCw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAP6Zq1jQ9T4Q+WvwyAH4sKLK1+Mp0utcA_STgm=_Z3ywKoLoCw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/01/2024 18:26, Tomer Maimon wrote:
> Hi Krzysztof,
> 
> Thanks for your comments.
> 
> On Tue, 16 Jan 2024 at 22:40, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 16/01/2024 20:37, Tomer Maimon wrote:
>>> Hi Krzysztof,
>>>
>>> As explained in my [PATCH v22 4/8] dt-bindings: soc: nuvoton: add
>>> binding for clock and reset registers mail.
>>>
>>> In the NPCM8XX SoC, the reset and the clock register modules are
>>> scrambled in the same memory register region.
>>> The NPCM8XX Clock driver is still in the upstream process (for a long
>>> time) but the NPCM8XX reset driver is already upstreamed.
>>
>> First of all, the drivers itself don't matter here, we talk about
>> bindings. I assume though they were going together, so that's why you
>> mentioned driver... but just to clarify: we talk here only about drivers.
>>
>> If reset bindings were accepted, then why they aren't referenced?
>>
>> If clock bindings were not accepted, then what is this patch and this
>> file about?
>>
>>>
>>> On Wed, 10 Jan 2024 at 22:59, Krzysztof Kozlowski
>>> <krzysztof.kozlowski@linaro.org> wrote:
>>>>
>>>> On 08/01/2024 14:54, Tomer Maimon wrote:
>>>>> Replace reg with syscon property since the clock registers handle the
>>>>> reset registers as well.
>>>>>
>>>>> Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>>>>> ---
>>>>>  .../bindings/clock/nuvoton,npcm845-clk.yaml   | 22 +++++++++----------
>>>>>  1 file changed, 10 insertions(+), 12 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
>>>>> index 0b642bfce292..c6bf05c163b4 100644
>>>>> --- a/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
>>>>> +++ b/Documentation/devicetree/bindings/clock/nuvoton,npcm845-clk.yaml
>>>>> @@ -18,8 +18,9 @@ properties:
>>>>>      enum:
>>>>>        - nuvoton,npcm845-clk
>>>>>
>>>>> -  reg:
>>>>> -    maxItems: 1
>>>>> +  nuvoton,sysclk:
>>>>> +    $ref: /schemas/types.yaml#/definitions/phandle
>>>>> +    description: phandle to access clock registers.
>>>>
>>>> NAK. Not explained, not justified, not reasonable, breaking ABI.
>>> Should I explain more in the commit message or/and the nuvoton,sysclk property?
>>
>> Let's try to explain here first. I really do not understand why do you
>> change this binding. Your device did not change, so your binding should
>> not. Now, if you say "but I changed drivers", then it does not matter.
>> Bindings do not change because you did something in the drivers, in
>> general. At least they should not.
> The confusion here is because the clock binding was upstreamed but the
> clock driver has not upstreamed yet.

So what does it mean? Being upstreamed independently does not mean
something is wrong, so I do not see any confusion. There is absolutely
no confusion in upstreaming binding before upstreaming driver.

> The clock driver will use regmap and ioremap so reg property is not
> needed, should I remove it? or leave it?

Just because you upstream drivers? You should not change bindings just
because you figured out that you will implement something that or other
way. Please describe the hardware in the binding, not the driver.


Best regards,
Krzysztof


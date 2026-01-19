Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDF030CD95
	for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 10:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819436; cv=none; b=i1RaX5sbYfmmlP17SzmuQuyybfX3FSIT7qsNYFM6lczPSpKHsv4Tru+d6Pfpd9j70ndn5ednJoFcbMkAwIsXpAxuGzouEWKkEpVZOfxy+ANEQpAg1YEBhKQTwya5iicl7k38HT40Al92dpN8xfZfgKIN2bIzlMDEylzMbjPCpU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819436; c=relaxed/simple;
	bh=JDp8XZrS8np8tDMV49tHpzOCjc6Fhjm7F8tLG7gTiYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u2k0fCrwkt9sJP2MwsEJphGGr1GG++p6i08ymOQNQYent9PHEf8+LZ5tzD+Is2j1n1cFLLUtGvRskZuKUKnXaxPARkQfjwQyEI4jYsYCNHMv4m6tcsX0XLOO8ELhUIQ3zhd/hGTKoqoRC1OVFs1idhdBARx45jlwiVOSC8XObss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ka0+5FwY; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ka0+5FwY"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8707005183so694330366b.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Jan 2026 02:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768819433; x=1769424233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rxI6gJrq2FL8Px7oECSMbsgNnQ9Jnllpf1H+z4cLrRY=;
        b=ka0+5FwYzVv8SqdaZzLFiQMPl0p6tqbExYk3AfKBTkIJ9K5aLmOaTkCE6xZi0kLCMy
         QaQULSZ0rulFUexPuUqVcKG3arBQMYjwP64z3KgO74bSd237cez0EYPkrexu6JGOXY1q
         58NRd3c+SAiTaUUMqGqsnyoBb671DXjVyXL7YsiGsP9qNHIyMNgwCI+7NF6mQ+ngePRm
         +eJTuARVUROn+g/P0+2kvoJ+hxZ8KBUOnvQJywPOR+Lfy0oTT72KNnZoalZvComKY2QZ
         4NdoO02yHv+/5gW8ldZEDI7u0R9IgI8RHdHMVp4aIvTav3qg8iIh12DquJZvxbWOyQax
         hUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819433; x=1769424233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rxI6gJrq2FL8Px7oECSMbsgNnQ9Jnllpf1H+z4cLrRY=;
        b=qC8DsSP3LLYnu3u9kBYOH5xU3ASmQTic7HWrQXVZwc67VZFbVjVJR99MYvgFCgNVrl
         GHMUbkpYqt7AbHr5Os4dtCjGCI0PNs3CCKymXoA1o/t6qWGSNT/aibufX1NoXNAuQJ8U
         PTwhlNvYY28uydyJmNHJvHdJDwLzmPp7O6yUho9nKOwqekNFK9jWsOGAlvv3/j0+i7fG
         gIVKgjlzAUHlrM/30qivdsBgOygyvJtEXxUsDfmlDeHcHHAEZvjDxNSkzpa3/RX9ZSs6
         qP3ilFEE1PA1vBDI7nNopoETfXhbKYgv1fZsItyiRFWDuyCCtwSmZ6taZtx8M09slr8A
         hs2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnmd+v93MO9kvS9+aNdQfLJqtJA5AiIlI4ccnIu9WQLAfwyLK5t2h6wmyUiBrnoYjceofAPKIN588=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX/JgOzZ5spV3TKKg15qz1vy1gxfi07IpeVyHUQZtcNRROsYmv
	vQ7qn4/vcf0mTVgLmyaRbR3Q44txiWqZrKvepc6qAb+lwgrBOi+Ji2bSTYxJcQ==
X-Gm-Gg: AY/fxX7ludp6enjr1BLS4HpDK1YtnxPcnRG42hcZZDQOKtb15tZGrQZADK9u3S7oR4I
	JycdsVkwxL6IYryH00za27CarAY9+ISDdR9sQB4QFH1axmZ1C98Tkj5t4+NseUUFN7gtu7IYFCe
	FYvb5YGfEAoVXWddqswkjEfYo9cwEA3rv+3OicEA9h8mSFvQ1cUk1yVjVzRrNBVoVAK0CuIqx8a
	paGRAda9Rr1wfSnF9E0g2ykVGB1XttyY0uDUgI+cHNYlCM7daG6XPdLHxdKC7WYTyJiCvwnBXdb
	1jgvWE/TBHWXt3WNdHb+DHQhXXmcxQ0kUnMKJIDY0eACJRqA1meWi1eDGVQtFPoYbNEeKuW4hah
	te2V9Sa9gEEOStLQ83lZZikl+Nu0jqlW8jLZdjI+K8Vqa1DJkVhxiGg2F6+ERNB4AtasR5zESzg
	iWPOZEWPkpttcekjfYCXE9rWy/H+GUeGPXeC++HeubT+osbYHYk7UzBoM8furIbVQUZVjgNEIBQ
	Qk56gyOB2YhWtZB0tmn1jmg4e+aGPupWuSnx8tHbL5P/cdOSA==
X-Received: by 2002:a17:907:930b:b0:b7d:3728:7d11 with SMTP id a640c23a62f3a-b879327f46fmr849354566b.50.1768819432497;
        Mon, 19 Jan 2026 02:43:52 -0800 (PST)
Received: from ?IPV6:2a01:5a8:51e:a2d5:41ab:52ed:e3e9:4896? ([2a01:5a8:51e:a2d5:41ab:52ed:e3e9:4896])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b879528dcc7sm1076503966b.29.2026.01.19.02.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 02:43:52 -0800 (PST)
Message-ID: <ce6d0f29-6ce0-4c31-af9a-522335b0979b@gmail.com>
Date: Mon, 19 Jan 2026 12:43:50 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: add exynos8890 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251017161334.1295955-1-ivo.ivanov.ivanov1@gmail.com>
 <20251017161334.1295955-2-ivo.ivanov.ivanov1@gmail.com>
 <20251022-affable-arrogant-coucal-3f7fbc@kuoka>
Content-Language: en-US
From: Ivaylo Ivanov Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <20251022-affable-arrogant-coucal-3f7fbc@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.10.25 10:44, Krzysztof Kozlowski wrote:
> On Fri, Oct 17, 2025 at 07:13:29PM +0300, Ivaylo Ivanov wrote:
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: samsung,exynos8890-cmu-aud
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: External reference clock (76.8 MHz)
>> +            - description: CMU_AUD PLL clock (from CMU_TOP)
>> +
>> +        clock-names:
>> +          items:
>> +            - const: oscclk
>> +            - const: pll
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: samsung,exynos8890-cmu-bus0
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: External reference clock (76.8 MHz)
>> +            - description: CMU_BUS0 ACLK 528MHz clock (from CMU_TOP)
>> +            - description: CMU_BUS0 ACLK 200MHz clock (from CMU_TOP)
>> +            - description: CMU_BUS0 PCLK 132MHz clock (from CMU_TOP)
>> +
>> +        clock-names:
>> +          items:
>> +            - const: oscclk
>> +            - const: "528"
>> +            - const: "200"
>> +            - const: "132"
> 
> We do not want the frequency here, for sure not frequency alone. There
> is no such code/syntax. Really.  Please do not invent your own style.
> That's just pclk. You describe here the logical name of this clock
> input.
> 
> ACLK is AXI bus clock, so if this block receives only one ACLK, then
> this is just "axi" or "bus". Recently we were calling this "bus".
> 
> Same in other places. If two AXI bus clocks come in, they could be named
> bus0 and bus1, or in this case - because these are sources for
> generating further ACLKs - bus_528 and bus_200, to indicate that one
> will be for AXI bus clocked 528 MHz and other for 200 MHz.
> 
> Please wait for some other opinions, because same rule I would like to
> apply to ExynosAuto, Artpec and Google GS.
> 
> @Raghav Sharma, @Alim Akhtar, @Sam Protsenko, @Peter Griffin, @André
> Draszik  - share your thoughs please?
> 
> And to clarify in simple terms for others or for the future:
> 1. HCLK would be the AHB bus, so also bus. Both ACLK and HCLK are for
> memory accesses.
> 2. PCLK is APB bus, for registers.
> 3. SCLK is for main operation of the block (called special clock, but no
> clue what is so special about it).
> 

So the consensus is to do something like this..

- const: oscclk
    - const: bus_528
    - const: bus_200
    - const: pclk

.., right?

Mentioned people haven't replied. I'm asking because I think it'd be more
straightforward to go with just aclk_528 pclk_132 sclk_... or axi_528 apb_132.

What do you think?

Best regards,
Ivaylo

>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: samsung,exynos8890-cmu-bus1
>> +

...

> Best regards,
> Krzysztof
> 


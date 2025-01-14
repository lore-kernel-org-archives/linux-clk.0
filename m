Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D50236EAA
	for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 12:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736856636; cv=none; b=o++H0Mzn0ewIHKIp93Lef5/lVx2GY2ozb3+UcD30iWXm13yEd/NtIJT0xPWZ8zRRBmZLW23c5tLXmJyAbG7lr3V45NTJO5WARPDQWlfikXJRex/8DQIltQ/gnwMeOr28xg0VSpTZO8ROiXS10zosCrB5N6ORDhy/Voqiht24VB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736856636; c=relaxed/simple;
	bh=aw+IE+TK30Kc5n+zyp5/ZsAebiJhM1w0EygSSnfnaI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LUfiv7v2wtfUdBcqyZM//SP5W9bd9XbZna1Lj6b8xVQD/e6KtF2A6AAVrqmBgyqzK5dm2c3K/uczWtmYMWWB4Z2WTjukSnbgaI499CtUP1Arlv86669xSDA+sWmOIeyNLc4lTggFx3ZHT5lrKuRiPz7eQvb4jWcUDMkog7GtGeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bpXv8XeG; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bpXv8XeG"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-385d7fe2732so343900f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 04:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736856633; x=1737461433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L7S3Bqm4SNa/5fzzRYJGEgkQpxjwQsp8IpalJXQqIYs=;
        b=bpXv8XeGst1IGZZlZ8mU/Uca4QRn8ct7zokB7JeUSjoBoSFLlQhebDe5OVovkJCVJe
         ZwBeaBrEGT8TETdALP0zAWbGPH7KOzIrWtrZeMeFzBKajxJpyC97/c2GUDzNORL7j3eK
         1QEGMLtp8Y8fWYqY0U2vhMIamRmhxxedK4k0cr9EA/LREsatBScIZQDe5WyiBI68bjtA
         omDroCS9WDuSoCYu1/PsmjXRdwPoVU1acorWWyLwxUsWF2EXXvYyEAH7niXzDh38yQfv
         IwCeY11mrRnM5iclxu43cvXV8ORDL3VVxzoFooU0DX9sKesOvXsSqE93LPMgo4bexAmx
         UBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736856633; x=1737461433;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L7S3Bqm4SNa/5fzzRYJGEgkQpxjwQsp8IpalJXQqIYs=;
        b=FgNYvi7K117Lpzww4EYHKyhz18Gnt3sz5k4lCjS6gkj5ld1i5PGiKF3tthMkqxWUPS
         gCTGpfO2kV/yLbYjneKMm4u5yAPGXZdacroi646XKKZYV+Fll+bApZhqMdi/r/LkZoME
         YhWNYbhLzr789SmrjTsfSvduqGYZQhMI4vyBNQpRDQUao10LoTXZITaboP4weIqxEhjz
         +zIJCmy/O7lqt55S1L7beBHZaMabOTA27849MPoJ1LAfn+Eakyk3g5v9TjOwDBb+ih+D
         U3kbE/HVmMHLNxMC+qAXHlKO84rK1e/9m0m04jSJynBY713NaycBuAC2m2VW14OhZ1Cb
         W5lA==
X-Forwarded-Encrypted: i=1; AJvYcCXJXnFCcKFueOz37aDiLUnLmr0IjGJ1jEa/+9ZjlYwVQvMTxR22xGthF4joOxC48sDI9GrNFPbnNy0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVy8XVJMhKUTxoQMWIWjXmTQ7CjiB7AlUtDsowJNRktrwrxlYx
	UOUP0NzQN1s7do3uxqwZgRyv+FHGv1uSVv8Ti4Goe1/eU0reTWA74hT8ZCzSQgs=
X-Gm-Gg: ASbGncvOHK5eKNY4b5bqsg+8dfBGt6bx69/Z5G2HIVxscn+mao8UAQh/qhvLLR6WgOe
	lG9kZsVRQNyNLpze3PV0Gl1jGS440hRgJtPJwOxJAcVQJ5UrLu380bhMTqcBRDzYRtw4WRmsZSj
	Zsp8Whh0nELu+z0jpW7ihsL6iYzFAx3SvWXjD1iKpqdangKiFFjLjWbdH4ZqOBNTtn61SWcg0LQ
	ow28L/qyJhdlLs1VvVM14ZdPwDkEX7NTKR/h5rDJGD3MWMf9/IOSKyeuoPReaOVzcEdWK3zRoqJ
X-Google-Smtp-Source: AGHT+IEyJ/lzH1HupLPZyyqFfgaVEsvS8mYjH3oZgQAV4JnCkZ/mE9gYnmXZGtd/cwlAg1EayO2C/Q==
X-Received: by 2002:a5d:648f:0:b0:385:f479:ef46 with SMTP id ffacd0b85a97d-38a87310d7bmr7823496f8f.13.1736856633432;
        Tue, 14 Jan 2025 04:10:33 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c6dbsm14958381f8f.55.2025.01.14.04.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 04:10:32 -0800 (PST)
Message-ID: <b2315f7f-4c8d-480a-8ed7-fa81ec7a7f23@linaro.org>
Date: Tue, 14 Jan 2025 13:10:30 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: convert stm32 rcc bindings to
 json-schema
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-amarula@amarulasolutions.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
 <20250114091128.528757-2-dario.binacchi@amarulasolutions.com>
 <79a90c01-9e21-4e3f-a334-6ba9e1df4150@kernel.org>
 <CABGWkvofUphcXTwBS5UBEoQ1GYpngP7gWi9Ax=WW28XKK0qoYA@mail.gmail.com>
 <54b63cfc-7a51-4b69-8b32-eb7591b2169b@kernel.org>
 <CABGWkvrYUU=HAh4uYNpZSpzeyanfp5a_xjK_178ftQyDKH=cTg@mail.gmail.com>
 <581275bf-11f3-4a8a-8e58-75b00c515c79@linaro.org>
 <CABGWkvpGGdjJVTHppOohGPq3yi_Y20t9b0WWkPOriFU9=CHQMg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CABGWkvpGGdjJVTHppOohGPq3yi_Y20t9b0WWkPOriFU9=CHQMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/01/2025 12:25, Dario Binacchi wrote:
> On Tue, Jan 14, 2025 at 11:13 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 14/01/2025 11:00, Dario Binacchi wrote:
>>> On Tue, Jan 14, 2025 at 10:48 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>
>>>> On 14/01/2025 10:36, Dario Binacchi wrote:
>>>>>> Nothing improved here.
>>>>>
>>>>> In my humble opinion, there is nothing to improve. Any modification
>>>>> made causes the tests to fail.
>>>>>
>>>>> $ git grep st,stm32f746-rcc arch/
>>>>> arch/arm/boot/dts/st/stm32f746.dtsi:                    compatible =
>>>>> "st,stm32f746-rcc", "st,stm32-rcc";
>>>>> arch/arm/boot/dts/st/stm32f769-disco.dts:       compatible =
>>>>> "st,stm32f769-rcc", "st,stm32f746-rcc", "st,stm32-rcc";
>>>>>
>>>>> Or am I missing something?
>>>>
>>>> How can I know what you are missing if you do not show the code?
>>>
>>> Sorry, but I still can't understand. I run multiple tests, trying to
>>
>> You don't understand that I cannot improve your code if I do not see the
>> code? So let me rephrase: In order to tell what is wrong with some sort
>> of code, I need to see it. I cannot tell what is wrong with code without
>> seeing it.
> 
> You told me that this code was not exactly correct for the parts
> marked with *********:

All places with same fallbacks should be unified. You have at least two
of such groups.

> 
> properties:
>   compatible:
>     oneOf:
>       - items:
>           - const: st,stm32f42xx-rcc
>           - const: st,stm32-rcc
>       - items:
>           - enum:
>               - st,stm32f469-rcc
>           - const: st,stm32f42xx-rcc
>           - const: st,stm32-rcc
>       - items:
>           - const: st,stm32f746-rcc ********
>           - const: st,stm32-rcc
>       - items:
>           - enum:
>               - st,stm32f769-rcc
>           - const: st,stm32f746-rcc
>           - const: st,stm32-rcc
>       - items:
>           - const: st,stm32h743-rcc *********
>           - const: st,stm32-rcc
> 
> I haven't found a way to make changes to those elements without causing the
> tests to fail. Could you kindly provide more explicit guidance on the kind of
> modification you're expecting?
> 

items:
  - enum:
      - foo
      - bar
   - const: baz

Like I said: all Qcom bindings. Probably all NXP as well.

Best regards,
Krzysztof

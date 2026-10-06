Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFEC4718F4;
	Tue,  6 Oct 2026 16:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791302606; cv=none; b=JwblG582iJEDkC9XBWJsblUciWOF7jIJo4tCDwOrCRShiG7HFoWnKqiovb8UoMWq6oUSAbgPjGJLDEYUrXTwv1WkE6e3pk2+Oe7Jfl0iDSJHWkpjtWFUOjv1/pgQjqznNa76UkdAStxOC+7Mntm+zeDJIPZ7dg6NBOnvzojmawQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791302606; c=relaxed/simple;
	bh=Km70Z2q6Wl3WNPJHaiSPI9AfYGdfVOw9gkHt2B6+Rfc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tXkl7QOFMjaNVVTJiO9OCf2TXlwgkWhBqGeW7DJIEvD8KIJy63729c4Mk/8nsrBmWnIhK4ujK05QY5InHQLF6r41hYZ8ckidQrEVXUtUY45q2j9xR/Mfm0cUEQkgyt/Y0Yh450g3DvmN6O06G1P+/eUE38CwEbIfYDfsPRZQj8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cI6f48k2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cI6f48k2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2281F0089E;
	Tue,  6 Oct 2026 16:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791302605;
	bh=pag7ec08sf7H4imvEPV/grARicGzKhyFVyc+ZIA/s7A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=cI6f48k21Pos7Jebeyj6Y1mcBgrcdPoLlVktj3nLKqxukD8+NpbAMUtC+OwcDRRyi
	 w+Ppq8nXgoGGAsx1KGLqf9O999FSB+xVcMG3IwsmQC0wKcWPzUVmWcdR1R7yteAG/K
	 EDnKmfvU2/ShyLxSXq1eE0bKQJ/ku0maSLqD+ptg6MzgVzSDtibHoF+Sxzcl5DC5O1
	 J/UrkGYw128fohHMODMKVqQRg7W6JhP2SMNcqUq7gfWwivY6bHQ4CQK58kXV6L487l
	 CiY2BLl+Wwc2M4Zk/tyWYlIhv80UuWGTVld4rDrS2uKEVolRftW1e0cQeYhaMGd6cg
	 5ppkHzEvnYgxA==
Message-ID: <f7d0ef63-3d8c-4e1b-b346-81500ee64046@kernel.org>
Date: Tue, 6 Oct 2026 18:03:17 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: sun55i-a523-ccu: Add A523 CPU
 CCU clock controller
To: Andre Przywara <andre.przywara@arm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20260925225112.14081-1-andre.przywara@arm.com>
 <20260925225112.14081-3-andre.przywara@arm.com>
 <20260929-aggressive-uptight-rattlesnake-35fdca@quoll>
 <20261005005036.7fd5e60e@ryzen.lan>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20261005005036.7fd5e60e@ryzen.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/10/2026 00:50, Andre Przywara wrote:
> On Tue, 29 Sep 2026 10:42:29 +0200
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
> Hi Krzysztof,
> 
> thanks for the review!
> 
>> On Sat, Sep 26, 2026 at 12:51:10AM +0200, Andre Przywara wrote:
>>> There are four clock controllers in the A523 SoC, but only three are
>>> described in the DT binding so far.
>>>
>>> Add a description for the CPU CCU, which provides separate clocks for
>>> the two CPU clusters and the DSU interconnect.
>>>
>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>> ---
>>>  .../clock/allwinner,sun55i-a523-ccu.yaml      | 38 ++++++++++++++++++-
>>>  .../dt-bindings/clock/sun55i-a523-cpu-ccu.h   | 13 +++++++
>>>  2 files changed, 50 insertions(+), 1 deletion(-)
>>>  create mode 100644 include/dt-bindings/clock/sun55i-a523-cpu-ccu.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
>>> index 58be701a720ea..8d5481fb63ae8 100644
>>> --- a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
>>> +++ b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
>>> @@ -19,6 +19,7 @@ properties:
>>>    compatible:
>>>      enum:
>>>        - allwinner,sun55i-a523-ccu
>>> +      - allwinner,sun55i-a523-cpu-ccu
>>>        - allwinner,sun55i-a523-mcu-ccu
>>>        - allwinner,sun55i-a523-r-ccu
>>>  
>>> @@ -35,12 +36,23 @@ properties:
>>>  
>>>  required:
>>>    - "#clock-cells"
>>> -  - "#reset-cells"
>>>    - compatible
>>>    - reg
>>>    - clocks
>>>    - clock-names
>>>  
>>> +if:
>>
>> This goes to the allOf block.
> 
> OK.
> 
>>> +  properties:
>>> +    compatible:
>>> +      contains:
>>> +        const: allwinner,sun55i-a523-cpu-ccu
>>> +then:
>>> +  properties:
>>> +    "#reset-cells": false
>>> +else:
>>> +  required:
>>> +    - "#reset-cells"
>>> +
>>>  allOf:
>>>    - if:
>>>        properties:
>>> @@ -64,6 +76,30 @@ allOf:
>>>              - const: iosc
>>>              - const: losc-fanout
>>>  
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          enum:
>>> +            - allwinner,sun55i-a523-cpu-ccu
>>> +
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          items:
>>> +            - description: High Frequency Oscillator (usually at 24MHz)
>>> +            - description: Low Frequency Oscillator (usually at 32kHz)
>>> +            - description: Internal Oscillator
>>> +            - description: Peripherals PLL 0 (1200 MHz output)
>>> +            - description: Peripherals PLL 0 (600 MHz output)
>>> +
>>> +        clock-names:
>>> +          items:
>>> +            - const: hosc
>>> +            - const: losc
>>> +            - const: iosc
>>> +            - const: pll-periph0-2x
>>> +            - const: pll-periph0-600m
>>> +
>>>    - if:
>>>        properties:
>>>          compatible:
>>> diff --git a/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h b/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h
>>> new file mode 100644
>>> index 0000000000000..042f2310f64de
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h
>>
>> Filename should match compatible.
> 
> Is that a new requirement? We never did this for the Allwinner clock or
> reset bindings, all headers are named like sun<x>i-<soc>-<name>-ccu.h.

I say EXACTLY the same thing for ~4 years, so yes. New requirement since
4 years. Allwinner for sure received same feedback already.

> And I think especially since we have sun55i-a523-mcu-ccu.h and
> sun55i-a523-r-ccu.h, I think we should stay consistent, at least for
> the existing SoCs.
> 
>>> @@ -0,0 +1,13 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>>> +/*
>>> + * Copyright 2025 Arm Ltd.
>>> + */
>>> +
>>> +#ifndef _DT_BINDINGS_CLK_SUN55I_A523_CPU_CCU_H_
>>> +#define _DT_BINDINGS_CLK_SUN55I_A523_CPU_CCU_H_
>>> +
>>> +#define CLK_CPU_L		7
>>
>> Indices start from 0 or 1
> 
> This is also something very common for Allwinner clocks: the CCU has
> clocks that are not exposed to the DT, because they are internal
> clocks we need to model the clock tree. We number them logically,

They are not ABI thus do not create impression they should be and you
prepare some placeholder for them.

These are not IDs of your clocks in the hardware. This is only the ABI.

Again, same feedback I repeat for 4 years.

Best regards,
Krzysztof

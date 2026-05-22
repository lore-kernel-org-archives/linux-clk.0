Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A70B3BADB7;
	Fri, 22 May 2026 09:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441411; cv=none; b=BBpsqjGrxvg4BJH2aeLP9PUlc7Zu2iiJBHiKH6T/5vX5h0Pq/W66rguXjWD2RLU4eFDL3KclWk98SRQZ9AgTO1BhhLfvX4pzCKGvT5VxXL9ykI42s0zOCJQudsKY7kb0ODUa9U738LgaTrKT6odgnSuEsoR6S9rvp/5Ege6TNYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441411; c=relaxed/simple;
	bh=n+spfNVVS+GI8264VRMvQxK9NQgTox7CsKfUOhYTb4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F1lziJZ7v9TsqKM0UbCCbEC5hME0LcMPjbpM9S2zOkt5X7B9Gf76IC3HFkfnXCR+3/ZqSAjNY68R+4lYqwbOD5m7y4HUu+EYyv/HhW5n39fkmrT9VpUrYvzk4+Jhx79Rc6AUrD5gFu/c//dReJNPRkDmDEy3qgnrJ7AmH3FH328=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/NJF9xZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/NJF9xZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49BCD1F000E9;
	Fri, 22 May 2026 09:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779441406;
	bh=WzBfufw4gsYrpdbP3F7fvJ8me51W/Y5BIcajdiRbGaA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=B/NJF9xZWYqY981BOl9XMhydNqyZ58WfjpUI7KVuJ2oFkq/D6D1d8b6jcfvQtVcEO
	 M7d48rvU7scHsCE23bvqZOTWII3DNH8EwAo1V4TFzLEcRmTM+lgZILr/vJh0hdsuXc
	 b/bNeCJlL0elNxZwc5z24JGRRcuf+fGnGTEzBLQLfpRV/AP2qyGB3osg1aELGpiw4F
	 DLYZiufH3bfm7JrarPG2nQS75EZW+QIFtDzCh41Gsn8+hJle97IXohHI/J2znmbtTa
	 DjOVxfxhdr0tXv50SXAm8yu0nkigbgzBN5FfyRg6bLDwjXH7T3Sz0RegKoQBt/3/hq
	 eJ0zQO7YV79yg==
Message-ID: <7c458070-a56a-4d49-89fc-efeb388beffc@kernel.org>
Date: Fri, 22 May 2026 11:16:41 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] dt-bindings: clock: Add Amlogic A9 PLL clock
 controller
To: Jian Hu <jian.hu@amlogic.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao
 <xianwei.zhao@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-2-41cb4071b7c9@amlogic.com>
 <20260515-subtle-sepia-tuatara-cfee3d@quoll>
 <40e83bed-e7a0-4c66-806c-c2988c5d0f33@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <40e83bed-e7a0-4c66-806c-c2988c5d0f33@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/05/2026 08:20, Jian Hu wrote:
> Hi Krzysztof,
> 
> Thanks for your review.
> 
> On 5/15/2026 4:09 PM, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On Mon, May 11, 2026 at 08:47:24PM +0800, Jian Hu wrote:
>>> Add the PLL clock controller dt-bindings for the Amlogic A9 SoC family.
>>>
>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>> ---
>>>   .../bindings/clock/amlogic,a9-pll-clkc.yaml        | 110 +++++++++++++++++++++
>>>   include/dt-bindings/clock/amlogic,a9-pll-clkc.h    |  55 +++++++++++
>>>   2 files changed, 165 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/amlogic,a9-pll-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,a9-pll-clkc.yaml
>>> new file mode 100644
>>> index 000000000000..4ee6013ba1a1
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/amlogic,a9-pll-clkc.yaml
>>> @@ -0,0 +1,110 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +# Copyright (C) 2026 Amlogic, Inc. All rights reserved
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/amlogic,a9-pll-clkc.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Amlogic A9 Series PLL Clock Controller
>>> +
>>> +maintainers:
>>> +  - Neil Armstrong <neil.armstrong@linaro.org>
>>> +  - Jerome Brunet <jbrunet@baylibre.com>
>>> +  - Jian Hu <jian.hu@amlogic.com>
>>> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - amlogic,a9-gp0-pll
>>> +      - amlogic,a9-hifi0-pll
>>> +      - amlogic,a9-hifi1-pll
>>> +      - amlogic,a9-mclk0-pll
>>> +      - amlogic,a9-mclk1-pll
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  '#clock-cells':
>>> +    const: 1
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: pll input oscillator gate
>>> +      - description: fixed input clock source for mclk_sel_0
>>> +      - description: u3p2pll input clock source for mclk_sel_0 (optional)
>> Second clock is also optional. Drop "(optional)" comment, just
>> confusing.
> 
> 
> GP0 has only one parent clock, while MCLK has three.
> 
> The second and third parent entries of GP0 are vacant,
> 
> so they need to be marked optional.
> 
> I will add the optional property for the second clock in the next revision.

How? Read the previous feedback...

Best regards,
Krzysztof

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1062206B3;
	Thu, 19 Dec 2024 09:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734601652; cv=none; b=GEO3mq2kmlJYbTivNZyqS3DgWPF6YdzGOr7WvRZ7NXbo9lRleMUVnqkIq/JTsrTBdmV99NF4hDUjAuNITUhFOqurfIwY9018EPUIdJrnN3gzNM6+gqChk8g8/3rlksm8uuCrmhQyfJHmSoNSRdk8hihk+hGxOlHL1Xin3AoRIaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734601652; c=relaxed/simple;
	bh=6FDbDOEydk5EJmywxXK6nak/rZToF0lt701hrHsepmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=srE4PUTg8ewUK19naFE+CYdU3ZNmDaqjBGK5vEpLiwz9dbGt1cdtSJ/PpMDNbyGH1b/DAJ7/+FFsyoK3zS6EloeBqBJMUhgOlwI6h1MNeQZkUnqNONi1KF45m6cjkdnB/tfUdCIOjtLuQikN8tky+yI8ZwbfqH2ef3lJfn4V65Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OAAWvyYZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OAAWvyYZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E14C4CECE;
	Thu, 19 Dec 2024 09:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734601650;
	bh=6FDbDOEydk5EJmywxXK6nak/rZToF0lt701hrHsepmE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OAAWvyYZUFgvTWONdj1mER08K3w5z1Iwizc+VAwbf049AzC3OiJVKbPXj7JEuBoKc
	 j6Xi7kNcJMQTICdQDiY6IZrPZ8+1giPwpXrLkRpF/G0JKHMtRIYTHiL+uEIQXEccjQ
	 YAtckqmTSAgQLl+q9oOSBYB49zdvhIobgaM3/LfdWYVXTo9ViP5/hNJVezMSCyViwx
	 qcenEyo70bhIqlqwZHH9DhruDrxMapPODF3R0WBCUB93TncaQFieCdYrJl+sUcE/p6
	 evRW6fnnHtHYhPnJVXOk08vModCUaywYyFp9UBx1hayC110aPVq2D/1VMPz+oGL7pL
	 SgKYJkJ4Q/9ng==
Message-ID: <27f5b3a4-8e79-4648-8603-13cce068bfe6@kernel.org>
Date: Thu, 19 Dec 2024 10:47:22 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/20] dt-bindings: clock: imx8m-clock: support spread
 spectrum clocking
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
 Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Peng Fan <peng.fan@nxp.com>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
 <20241205111939.1796244-16-dario.binacchi@amarulasolutions.com>
 <gbymcmoya7dfmedq4nkopqpswh63d2ujxl2elc2x7x325b75bu@anp36sdya43v>
 <CABGWkvoQzAhpVJ+QRfVZeps-Jn8REGF+21SPN=f24Tdf1d5DDQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CABGWkvoQzAhpVJ+QRfVZeps-Jn8REGF+21SPN=f24Tdf1d5DDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/12/2024 17:47, Dario Binacchi wrote:
>>>    '#clock-cells':
>>>      const: 1
>>> @@ -43,6 +43,34 @@ properties:
>>>        ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
>>>        for the full list of i.MX8M clock IDs.
>>>
>>> +  fsl,ssc-modfreq-hz:
>>> +    description:
>>> +      The values of modulation frequency (Hz unit) for each clock
>>> +      supporting spread spectrum.
>>> +    minItems: 7
>>> +    maxItems: 10
>>
>> Why all cloks receive now spread spectrum? I had impression - and all
>> your previous versions were doing this - that you have only three or
>> four clocks with SSC.
> 
> Exactly. Indeed, the first six values are not valid as SSC properties but are
> only used to reach the point where the first PLL with SSC (i.e., audio_pll1)
> can be indexed, which is in position 7 in the clocks list.
> This was the rationale I followed.
> And it is explicitly outlined in the example section.
> The "" for the fsl,ssc-method property is precisely aimed at specifying a
> "no SSC" method, which also fixes the warning:
> 
> fsl,ssc-method:0: '' is not one of ['down-spread', 'up-spread', 'center-spread']
> 
> raised by
> make dt_binding_check DT_SCHEMA_FILES=imx8m-clock.yaml
> 
> Or would it be acceptable to specify a list of SSC values that applies only to
> the last 4 PLLs in the clocks list?

Lists are strictly ordered, so their items are known. You take some
clocks, of which last clocks are "foo" and "bar". Then you have new
property for configuring SSC for clocks - again list - "foo" and "bar".

> 
> I feel like I might be missing something.
> 
> Could you kindly suggest what to do or provide a DTS example to show me
> what you expect?

Best regards,
Krzysztof

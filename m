Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800D83E4C81;
	Fri,  5 Jun 2026 09:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780650726; cv=none; b=rDbNo1nQuXfI3NuSLzKAMY2rObRJvRJUYFTmbnGninF7gtK0pgpyzi7pTB/+OzweoNoFibMl8I16MtaB7k5XIftDip4qLNUHyrwFSDYLxxqF37E0eJ8wS3AURv9x4U7OLeTNYDrU38j1L63naCjuaxq+1ehXVwxJqx5LRl3Ej9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780650726; c=relaxed/simple;
	bh=ICmwNN4eLL76tCGS2Kn+RRGQbYpXXRePeKL9PXeDkdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KiBU2Oo/3DAmI+s0Er7+ShdxrF5dgcZ6jHp1AQys5xDruT8KaU10y51K9C5Gs8J/4c7YeXgM+yme/biddTpoKaYYLXCPGlbbVShG6oXCy4z0eJ5vzJOtqgaJ2GcQNqPr+5tFXhhmrJ5DMlQ+EsFzPpJmYcVUxA0CvnFChMxKQIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b4jjUShM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b4jjUShM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29CA11F00893;
	Fri,  5 Jun 2026 09:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780650725;
	bh=d7e/64Lm4FJCHnz40nUrkUeXHtudnHaWROVmMiFI1MM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=b4jjUShMkrkAmKNxKHC+rOncDO9lTBGvhVgQKmVj7x8ATGjGdsoqadL19HOJzjcxR
	 abVTB3dLsl7EZQ2p2CPYahFdM4sgLY65GgoMHPZuL7sb7PSbwBdnznsIqcbMKnMOjt
	 XTHTs1ZE4p3L6MxoST7yq0c+wxGMdPmtJwK2TMfXoZIljRBthAQ2h7zEsml9KWCxdL
	 dAdzswtSkYkPB7Psqhpere9y5gLq0e8V2bg3fS7jUTi6jVBsAsuPxhlt5P48hVgeez
	 rbz/xNkuNK7+DyNURO2sbUzqDd9qW8Gmmk+yn9qr9o/aSVbwXaRdOnaOWse3qXTmgc
	 K3bZT7ZX4PBGg==
Message-ID: <8387afa5-f2d9-4006-a1c9-d2122ea6245d@kernel.org>
Date: Fri, 5 Jun 2026 11:11:55 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: connector: Add fsl,io-connector binding
To: Frank Li <Frank.li@nxp.com>
Cc: "Chancel Liu (OSS)" <chancel.liu@oss.nxp.com>,
 Chancel Liu <chancel.liu@nxp.com>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
References: <AM9PR04MB8353FE81D06852D45514E460E3032@AM9PR04MB8353.eurprd04.prod.outlook.com>
 <d2b13e51-1684-4acb-a5ed-294c8aa95906@kernel.org>
 <AM9PR04MB83538C4A07A6835FF8A74793E3002@AM9PR04MB8353.eurprd04.prod.outlook.com>
 <20260519-macho-degu-from-nibiru-960af2@quoll>
 <AM9PR04MB8353B563519EBC1AD6C5BFE1E3012@AM9PR04MB8353.eurprd04.prod.outlook.com>
 <e23a610f-e1ad-4536-80fb-8b5707e77f39@kernel.org>
 <ag3GMdmxw60B15Oe@lizhi-Precision-Tower-5810>
 <74eb56fb-546d-4b2c-9bbc-01a40937f5d3@kernel.org>
 <AM9PR04MB835333895276201A81251210E30A2@AM9PR04MB8353.eurprd04.prod.outlook.com>
 <8046287e-87a2-4d18-ad3d-248620a752a9@kernel.org>
 <ah9WzQmwPrP4yWTC@lizhi-Precision-Tower-5810>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <ah9WzQmwPrP4yWTC@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/06/2026 00:18, Frank Li wrote:
> On Mon, May 25, 2026 at 02:28:32PM +0200, Krzysztof Kozlowski wrote:
>> On 25/05/2026 08:26, Chancel Liu (OSS) wrote:
>>>>>>>>>>>>> +description:
>>>>>>>>>>>>> +  The NXP I/O connector represents a physically present I/O
>>>>>>>>>>>>> +connector on the
>>>>>>>>>>>>> +  base board. It acts as a nexus that exposes a constrained
>>>>>>>>>>>>> +set
>>>>>>>> of
>>>>>>>>>>>>> +I/O
>>>>>>>>>>>>> +  resources, such as GPIOs, clocks, PWMs and interrupts,
>>>>>>>>>>>>> +through fixed
>>>>>>>>>>>>> +  electrical wiring. All actual hardware providers reside on
>>>>>>>>>>>>> +the
>>>>>>>> base
>>>>>>>>>> board.
>>>>>>>>>>>>> +  The connector node only defines index-based mappings to
>>>>>>>>>>>>> + those
>>>>>>>>>>>> providers.
>>>>>>>>>>>>> +
>>>>>>>>>>>>> +properties:
>>>>>>>>>>>>> +  compatible:
>>>>>>>>>>>>> +    const: fsl,io-connector
>>>>>>>>>>>>
>>>>>>>>>>>> Everything is IO. Everything is connector, so your compatible
>>>>>>>>>>>> does not match requirements from writing bindings.
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Yes, this compatible is too generic. I will rename the
>>>>>>>>>>> compatible to fsl,aud-io-connector.
>>>>>>>>>>
>>>>>>>>>> aud is not much better. Which boards have it? What's the pinout?
>>>>>>>> What's
>>>>>>>>>> standard? Is it described anywhere? If so, provide reference to
>>>>>>>> spec/docs.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> This is not an industry standard electrical interface. This
>>>>>>>>> connector
>>>>>>>>
>>>>>>>> Then if you do not have standard, then you have board specific
>>>>>>>> layouts thus you need board-specific compatibles. You can use
>>>>>>>> fallbacks. Generic fallback could work, but both io-connector and
>>>>>>>> aud-io-connector are just too generic. Every connector is
>>>>>>>> "connector" and "io", thus absolutely anything can be
>>>>>>>> "io-connector". "aud" improves it only a bit, thus honestly I would
>>>> go with board specific fallback as well.
>>>>>>>>
>>>>>>>
>>>>>>> How about board specific + common fallback compatible like this:
>>>>>>>   compatible:
>>>>>>>     items:
>>>>>>>       - enum:
>>>>>>>           - fsl,imx95-19x19-evk-aud-io-connector
>>>>>>>           - fsl,imx952-evk-aud-io-connector
>>>>>>>       - const: fsl,imx-aud-io-connector Since the daughter board is
>>>>>>> named “IMX-AUD-IO” in publicly available
>>>>>>
>>>>>> I don't think it is named like that.
>>>>>>
>>>>>> git grep -i imx-aud-io
>>>>>>
>>>>>>> documentation, common compatible clearly indicates that this
>>>>>>> connector is intended for that.
>>>>>>>
>>>>>>> Also, I want to talk about the topic of generic connector. It's a
>>>>>>> common design that daughter board is connected to base board through
>>>>>>> a connector. This connector more often acts as a nexus that exposes
>>>>>>> a constrained subset of GPIO, clock, PWM and interrupt resources to
>>>>>>> the daughter board. Can we document this kind of connector as a
>>>>>>> generic binding?
>>>>>>
>>>>>> So this binding is the connector between carrier and some addon? Then
>>>>>> you don't get a compatible for that at all, because it is not
>>>>>> necessary, not useful and NEVER used. Do you see socket LGA "connector"
>>>> bindings? No.
>>>>>
>>>>> Not exactly. Any connector connects a carrier board with an add-on
>>>> board.
>>>>> The key point here is that this connector type is reused across
>>>>> different boards, even though it is not an industry-standard
>>>>> connector. Both the signal definitions and the mechanical layout are
>>>> defined.
>>>>>
>>>>> The same add-on boards can therefore be reused across different base
>>>>> boards that use this type of connector.
>>>>>
>>>>> There are also GPIO mappings involved. For example, pin 1 on the
>>>>> connector may represent reset-gpios, but it could be connected to
>>>>> GPIO0 on board A and GPIO1 on board B.
>>>>>
>>>>> Without a connector definition layer, this would create an N × M
>>>>> combination problem. The Nexus node discussion already covered this
>>>> topic:
>>>>> https://osseu2025.sched.com/event/25Vrw
>>>>>
>>>>> An LGA socket is a CPU socket, where the signals are completely
>>>>> transparent to software, so it is not a good comparison. A PCIe M.2
>>>>> Key-M/E connector would be a more appropriate comparison.
>>>>>
>>>>
>>>> So the terminology of daughter and carrier boards was confusing. If this
>>>> is a hat, mezzanine or other addon, it's fine.
>>>>
>>>
>>> The IMX-AUD-IO is an add-on board that attaches to the base board. To
>>> make it clearer, I will replace "daughter board" with "add-on board"
>>> throughout descriptions.
>>>
>>>> I still insist on board specific compatibles - fallback and specific.
>>>>
>>>
>>> The base board has a slot component that is mechanically compatible
>>> with a PCIe x8 connector. However, it carries no PCIe signals and the
>>> pins are repurposed to carry fixed board-level audio I/O related
>>> signals.
>>>
>>> I think we can name a compatible reflects a standard mechanical form
>>> factor.
>>> For the compatibles (specific + fallback) I propose:
>>> - enum:
>>>     - fsl,imx95-19x19-evk-aud-io-pcie-x8-slot
>>>     - fsl,imx952-evk-aud-io-pcie-x8-slot
>>> - const: fsl,aud-io-pcie-x8-slot
>>
>> Does not solve my request, so I won't ack it. Maybe you will get ack
>> from other DT maintainer then.
> 
> Krzysztof:
> 	Thank you for your support. This type header/slot is difficult to
> name it.
> 
> After read again previous comments
> 
> "Then if you do not have standard, then you have board specific layouts
> thus you need board-specific compatibles. You can use fallbacks. Generic
> fallback could work, but both io-connector and aud-io-connector are just
> too generic. Every connector is "connector" and "io", thus absolutely
> anything can be "io-connector". "aud" improves it only a bit, thus
> honestly I would go with board specific fallback as well."
> 
> Do you means
> oneOf
>   - items:
>       - enum:
>           - fsl,imx943-evk-aud-io-pcie-x8-slot
>           - fsl,imx952-evk-aud-io-pcie-x8-slot
>       - const: fsl,imx95-19x19-evk-aud-io-pcie-x8-slot
>  - const: fsl,imx95-19x19-evk-aud-io-pcie-x8-slot

Yes, could be a bit shorter like fsl,imx95-19x19-evk-aud-io-slot or even
without slot because prefixing it with board compatible makes it very
specific.

> 
> Frank
> 
>>
>> Best regards,
>> Krzysztof


Best regards,
Krzysztof

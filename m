Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750CA34DCC8;
	Wed, 20 May 2026 07:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779260929; cv=none; b=RixnZ3vnlHPBjhzbGxkHQ9jpg6y1r4VJoAaabpYO9su0k1aYu5+T2EWfP18KwqQQJ/OvKyySxmj+4V99UcesS/ATfRCuC3kxigMfpCW+h/zzpwocURWMeka9KVq8Nov/plEbvWUcSAwyMsJ9h5zZGc6Gf2iADm0/43qwqtuQ8Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779260929; c=relaxed/simple;
	bh=cHsla/zNIEn/HMJjSW7hwYgnB9sKgdnBigr/N0K3iDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=upSYCNqTWtvoCG5iIfEGizO+t4iKpHC0emRYl9zWakLFBfrCTWnB+JzgFUzDfo7g4rtBGfXphuktHLaiPVSJxoOgNGdx28SyVUPW3gpZnutzU6Kk9CyeN7CkysOEQmSzIpI7Bgn9G+Edd7PDjVtHCBrrFCK652WehIwJFI9x6UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9Bu3nZD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9Bu3nZD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F4391F000E9;
	Wed, 20 May 2026 07:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779260928;
	bh=5sJis8pObID1kGXbTsB3IgBpTH0zVnG6Ljg/eY2IOOw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=A9Bu3nZDhvaFcfELXf4UkmdvoHWG8zM8SVVoHH7y6l+aB2QgVl8ziyb6OuCzbkNyF
	 5UIZamzIkBLHtjR6dG+v9RE+0sfdwvGqQ4ZABQFXrHKtZ7e9Wsz8Nyv0Gh/9suiH58
	 9Z/uuZdPald2ZugknTF69bFdLoqzoPSwGRbNU4+UAIfTrF4o5UKmmzV62LLo7gx71B
	 uH+M69vBBd2wuT98G+aEoquU/Txyr825E2Lv9AJjia5z2fF3NQ60Gw01SIi7t6LVEe
	 gUuc5o7RNTlNTvxtKtS5r3MCQIqXIJmyI420QmmU62ZW1N2dGmpg0HrL+PoAfPnN34
	 Dc40T4gV6/cbg==
Message-ID: <e23a610f-e1ad-4536-80fb-8b5707e77f39@kernel.org>
Date: Wed, 20 May 2026 09:08:42 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: connector: Add fsl,io-connector binding
To: "Chancel Liu (OSS)" <chancel.liu@oss.nxp.com>,
 Chancel Liu <chancel.liu@nxp.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>,
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
References: <20260509024846.2094049-1-chancel.liu@nxp.com>
 <20260509024846.2094049-3-chancel.liu@nxp.com>
 <20260515-resourceful-singing-roadrunner-ce25ec@quoll>
 <AM9PR04MB8353FE81D06852D45514E460E3032@AM9PR04MB8353.eurprd04.prod.outlook.com>
 <d2b13e51-1684-4acb-a5ed-294c8aa95906@kernel.org>
 <AM9PR04MB83538C4A07A6835FF8A74793E3002@AM9PR04MB8353.eurprd04.prod.outlook.com>
 <20260519-macho-degu-from-nibiru-960af2@quoll>
 <AM9PR04MB8353B563519EBC1AD6C5BFE1E3012@AM9PR04MB8353.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <AM9PR04MB8353B563519EBC1AD6C5BFE1E3012@AM9PR04MB8353.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/05/2026 07:02, Chancel Liu (OSS) wrote:
>>>>>>> +description:
>>>>>>> +  The NXP I/O connector represents a physically present I/O
>>>>>>> +connector on the
>>>>>>> +  base board. It acts as a nexus that exposes a constrained set
>> of
>>>>>>> +I/O
>>>>>>> +  resources, such as GPIOs, clocks, PWMs and interrupts, through
>>>>>>> +fixed
>>>>>>> +  electrical wiring. All actual hardware providers reside on the
>> base
>>>> board.
>>>>>>> +  The connector node only defines index-based mappings to those
>>>>>> providers.
>>>>>>> +
>>>>>>> +properties:
>>>>>>> +  compatible:
>>>>>>> +    const: fsl,io-connector
>>>>>>
>>>>>> Everything is IO. Everything is connector, so your compatible does
>>>>>> not match requirements from writing bindings.
>>>>>>
>>>>>
>>>>> Yes, this compatible is too generic. I will rename the compatible to
>>>>> fsl,aud-io-connector.
>>>>
>>>> aud is not much better. Which boards have it? What's the pinout?
>> What's
>>>> standard? Is it described anywhere? If so, provide reference to
>> spec/docs.
>>>>
>>>
>>> This is not an industry standard electrical interface. This connector
>>
>> Then if you do not have standard, then you have board specific layouts
>> thus you need board-specific compatibles. You can use fallbacks. Generic
>> fallback could work, but both io-connector and aud-io-connector are just
>> too generic. Every connector is "connector" and "io", thus absolutely
>> anything can be "io-connector". "aud" improves it only a bit, thus
>> honestly I would go with board specific fallback as well.
>>
> 
> How about board specific + common fallback compatible like this:
>   compatible:
>     items:
>       - enum:
>           - fsl,imx95-19x19-evk-aud-io-connector
>           - fsl,imx952-evk-aud-io-connector
>       - const: fsl,imx-aud-io-connector
> Since the daughter board is named “IMX-AUD-IO” in publicly available

I don't think it is named like that.

git grep -i imx-aud-io

> documentation, common compatible clearly indicates that this connector
> is intended for that.
> 
> Also, I want to talk about the topic of generic connector. It's a common
> design that daughter board is connected to base board through a
> connector. This connector more often acts as a nexus that exposes a
> constrained subset of GPIO, clock, PWM and interrupt resources to the
> daughter board. Can we document this kind of connector as a generic
> binding?

So this binding is the connector between carrier and some addon? Then
you don't get a compatible for that at all, because it is not necessary,
not useful and NEVER used. Do you see socket LGA "connector" bindings? No.


Best regards,
Krzysztof

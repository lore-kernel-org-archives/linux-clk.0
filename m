Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB0D2E6116;
	Mon, 18 May 2026 07:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779088047; cv=none; b=aptIBBw6FwEcsmqdEuE+Qg7MVuZrk0TwuvDQanJaoagxcOyaEat1kty4AWI8qzgZT1S51BU+tLhqceo3d52KONvdjbmh7SDwRomkvp9uPy4+xKkYVUpPHxE3ZCVWFm/N2mMxy1eCKvNeT29AHX61qM1VOftsh4tGqD3b0Y8/rw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779088047; c=relaxed/simple;
	bh=MKXLogmGk/Z9aRPLYSGv52Z8vYljivWCzlY49r4KzWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NBPJt13okboEzsDC2cqTa18Wv3JILewNnc3pA0zLgivOOXhJIHtW5hCPrkw0ZeglfC+XfwabkeDGawQ6sIqDUmoB5Q7zZcgx160wAhPIWY2dHPC6fLGDBGJZq82t2gg+8vdH9dyilQWabnzoSN+MltrlvlL8tme02Cd+GRgSVLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yr1pcdAR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yr1pcdAR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA450C2BCB7;
	Mon, 18 May 2026 07:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779088046;
	bh=MKXLogmGk/Z9aRPLYSGv52Z8vYljivWCzlY49r4KzWA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yr1pcdARntEinFCi3Pgr8QrJfRwlIgARnLjU9Bqebhq5KT1/3hpKCyxL6VPLRPBSY
	 LncYEHPlcDmCoRR/SSHrZ4ul8lHROTdUsWkvbltZIbeOPGTgiawxTdd54hjiIXZVMA
	 b3+uWzfy+HPMKzcwNIjYlHOb0+QzQdcg3uV+oNSpFpaYgVx2dd4Hl5+aowGq5J/+b6
	 MFs3MDevHEtoGqIYV4z2UalIn1TDGSno562eKaxalkn8nLriagOXed6P14NVqdC6+c
	 qw36E0nsAz7eF7CkNxDz1trpoGc0HK6L5Zpt0p8srr51XGgPesZUUpi8Y+B8qnXKl8
	 t15ThCvxxvbDw==
Message-ID: <d2b13e51-1684-4acb-a5ed-294c8aa95906@kernel.org>
Date: Mon, 18 May 2026 09:07:21 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: connector: Add fsl,io-connector binding
To: Chancel Liu <chancel.liu@nxp.com>
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <AM9PR04MB8353FE81D06852D45514E460E3032@AM9PR04MB8353.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/05/2026 06:18, Chancel Liu wrote:
>>> +description:
>>> +  The NXP I/O connector represents a physically present I/O connector
>>> +on the
>>> +  base board. It acts as a nexus that exposes a constrained set of
>>> +I/O
>>> +  resources, such as GPIOs, clocks, PWMs and interrupts, through
>>> +fixed
>>> +  electrical wiring. All actual hardware providers reside on the base board.
>>> +  The connector node only defines index-based mappings to those
>> providers.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: fsl,io-connector
>>
>> Everything is IO. Everything is connector, so your compatible does not match
>> requirements from writing bindings.
>>
> 
> Yes, this compatible is too generic. I will rename the compatible to
> fsl,aud-io-connector.

aud is not much better. Which boards have it? What's the pinout? What's
standard? Is it described anywhere? If so, provide reference to spec/docs.

> 
>>> +
>>> +  gpio-controller: true
>>> +
>>> +  '#gpio-cells':
>>> +    const: 2
>>> +
>>> +  gpio-map:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
>>
>> You do not need to redefine the types. You need constraints, though.
>>
> 
> OK. I will add proper constraints.
> 
>>> +
>>> +  gpio-map-mask:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +
>>> +  gpio-map-pass-thru:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +
>>> +  '#clock-cells':
>>> +    const: 1
>>> +
>>> +  clock-map:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
>>> +
>>> +  clock-map-mask:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +
>>> +  clock-map-pass-thru:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>
>> I do not see these defined anywhere. I also checked cover letter for
>> references for pulls to dtschema.
>>
>  
> Nexus nodes are already in the device-tree specification：
> https://github.com/devicetree-org/devicetree-specification/blob/v0.4/source/chapter2-devicetree-basics.rst#nexus-nodes-and-specifier-mapping
> For reference, current kernel has supported it:
> * Nexus OF support:
> commit bd6f2fd5a1d5 ("of: Support parsing phandle argument lists through a nexus node")
> * GPIO adoption:
> commit c11e6f0f04db ("gpio: Support gpio nexus dt bindings")
> * PWM adoption:
> commit e71e46a6f19c ("pwm: Add support for pwm nexus dt bindings")
> Clock adoption is ongoing:
> https://lore.kernel.org/all/20260327-schneider-v7-0-rc1-crypto-v1-10-5e6ff7853994@bootlin.com/

DT spec only mentions nexuses, but it is only a spec. Each property from
the spec must be defined in dtschema or kernel bindings.

I do not see any dependency mentioned in the cover letter, so how do you
think we can figure out where is this definition of clock nexus?


Best regards,
Krzysztof

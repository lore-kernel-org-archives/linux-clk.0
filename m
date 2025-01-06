Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F5D13775E
	for <linux-clk@vger.kernel.org>; Mon,  6 Jan 2025 19:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736193323; cv=none; b=iXTn/onPS65uBl+qO5CQ8dxuDE6/I7n6BBZjlmvCU1ytOLvpT8obhNo2l8cZtSWKbvxwQOrFQk4maKVzjcYPuUFvyFk1bsH89MkoFQ8wCkwsiVASVkO47ILEJYFJlypVoUfQPwr2oaOyMMNgs092QXbhmCdf9XDxN3BY7ur3Yc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736193323; c=relaxed/simple;
	bh=SeUo7BaIcxWwemHIfO+p/enNO4psUpQ5xmhe155trQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tlTPLvqVCpSKtP38RI57Jag8Y22ZZdJURT8CxO7B7P8utgbF51MkbsAGmCjIGsEqQ5naDo3aNouMBaGtL+JbWiyn3u+b59puZIvviemkBUcO/GtJmAiolY3dFOmf1DMClP0Z9ZV4MRnAD42S170liyEZyt4g76NVqFfNAd90BHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUtBt-00069T-Pa; Mon, 06 Jan 2025 20:55:09 +0100
Message-ID: <6fddfd9a-8a8c-4dae-9f74-e8019b7ed404@pengutronix.de>
Date: Mon, 6 Jan 2025 20:55:08 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: imx8m: document
 nominal/overdrive properties
To: Frank Li <Frank.li@nxp.com>, Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abel.vesa@linaro.org>,
 Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20250106-imx8m-clk-v2-0-6aaeadac65fe@pengutronix.de>
 <20250106-imx8m-clk-v2-1-6aaeadac65fe@pengutronix.de>
 <Z3wHp6eLQuV9GGvh@lizhi-Precision-Tower-5810>
 <957ad153-17f3-4cb8-8878-73093a9a2724@pengutronix.de>
 <Z3wyG61QEzgCJFh+@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <Z3wyG61QEzgCJFh+@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

Hello Frank,

On 06.01.25 20:42, Frank Li wrote:
> On Mon, Jan 06, 2025 at 08:25:38PM +0100, Ahmad Fatoum wrote:
>> On 06.01.25 17:41, Frank Li wrote:
>>> On Mon, Jan 06, 2025 at 03:21:42PM +0100, Ahmad Fatoum wrote:
>>>> Allowing for absence of both properties is
>>>> needed, because there is no default suitable for all boards:
>>>>
>>>> For i.MX8M Mini and Nano, the kernel SoC DTSIs has assigned-clock-rates
>>>> that are all achievable in nominal mode. For i.MX8MP, there are some
>>>> rates only validated for overdrive mode.
>>>>
>>>> But even for the i.MX8M Mini/Nano boards, we don't know what rates they
>>>> may configure at runtime, so it has not been possible so far to infer from
>>>> just the device tree what the mode is.
>>
>> [snip]
>>
>>>> +  fsl,nominal-mode:
>>>> +    description: Set if SoC is operated in nominal mode
>>>> +    $ref: /schemas/types.yaml#/definitions/flag
>>>> +
>>>> +  fsl,overdrive-mode:
>>>> +    description: Set if SoC is operated in overdrive mode
>>>> +    $ref: /schemas/types.yaml#/definitions/flag
>>>> +
>>>
>>> why need two flags? suppose "not set fsl,overdrive-mode" is equal to
>>> fsl,nominal-mode
>>
>> Conor had the same question on v1[1] and I have addressed this in the commit
>> message of v2, see above.
>>
>> In short, there is unfortunately no universally applicable default.
>>
>> [1]: https://lore.kernel.org/all/4e2250b3-5170-4e88-aa0a-dd796b81e78b@pengutronix.de/
>>
> 
> But there are problem if use dts overlay because dts overlay can't support
> delete property.
> 
> If one dts file use "fsl,overdrive-mode", dts overlay file can't delete
> this property. "mutually exclusive optional properties" was not preferred.
> 
> mode = ["normal" | "overdrive"]

I don't see myself setting this via overlay, but if you say it's useful, we can
adjust the binding.

I am not sure what's the preference is though, should we have

  fsl,operating-mode = "normal" / "overdrive"

or 

  fsl,operating-mode = <IMX_OPMODE_NORMAL> / <IMX_OPMODE_OVERDRIVE>


Any idea? Conor?

Cheers,
Ahmad

> 
> Frank
> 
>> Thanks,
>> Ahmad
>>
>>
>>>
>>> Frank
>>>
>>>>  required:
>>>>    - compatible
>>>>    - reg
>>>> @@ -95,6 +103,12 @@ allOf:
>>>>              - const: clk_ext2
>>>>              - const: clk_ext3
>>>>              - const: clk_ext4
>>>> +  - if:
>>>> +      required:
>>>> +        - fsl,overdrive-mode
>>>> +    then:
>>>> +      properties:
>>>> +        fsl,nominal-mode: false
>>>>
>>>>  additionalProperties: false
>>>>
>>>>
>>>> --
>>>> 2.39.5
>>>>
>>>
>>
>>
>> --
>> Pengutronix e.K.                           |                             |
>> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
>> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
>> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

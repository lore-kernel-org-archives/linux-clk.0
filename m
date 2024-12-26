Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270022CCC0
	for <linux-clk@vger.kernel.org>; Thu, 26 Dec 2024 16:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735232081; cv=none; b=E6Fd2Xvab1y7GqUTb+A+E2MSFbgVIxR1KYq+6kufU8qk13hAMJ4hRurVwuTRAHaQZ9sS/KOEnJWIWVCsW8+dpO5XgF8bxW3uH0n3oxS1SLelECdYoDGQbWBUXd/KuKhXLUfKqb/4V/kZUoJBSIl2BmNb19PXXqhIgauTNGDa3rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735232081; c=relaxed/simple;
	bh=GEsCXOMZBcuny3Xrk6hJXn3nKZqH3D95VMiEH+4cU4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jT7TeWWXjfm2lKq9G8SijuuWNlMqPZU1FRyFfSBiy8ukMESHALprWF5cQxVXZuENV9cnXvmV+DQYBtF2R2QDvEAjrzbofA6o40ipTl2LwzuD2Z40swC2ioJEbpTFlpKDFEOgSG0+mZtTxW74D+kat4fBAh3M16gOoJzi0TS4Oh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tQr7u-0001Lw-2X; Thu, 26 Dec 2024 17:54:22 +0100
Message-ID: <8a8f315b-9e6b-4c18-985e-5df4ecbe34da@pengutronix.de>
Date: Thu, 26 Dec 2024 17:54:15 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] dt-bindings: clock: imx8m: document nominal/overdrive
 properties
To: Conor Dooley <conor@kernel.org>
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
 linux-kernel@vger.kernel.org
References: <20241219-imx8m-clk-v1-0-cfaffa087da6@pengutronix.de>
 <20241219-imx8m-clk-v1-1-cfaffa087da6@pengutronix.de>
 <20241219-lash-lather-31443ced0e0c@spud>
 <4e2250b3-5170-4e88-aa0a-dd796b81e78b@pengutronix.de>
 <20241225-untapped-flyover-47254d06d418@spud>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20241225-untapped-flyover-47254d06d418@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

Hi Conor,

On 25.12.24 15:20, Conor Dooley wrote:
> On Thu, Dec 19, 2024 at 09:14:10PM +0100, Ahmad Fatoum wrote:
>> On 19.12.24 20:49, Conor Dooley wrote:
>>> On Thu, Dec 19, 2024 at 08:27:32AM +0100, Ahmad Fatoum wrote:
>> Theoretically, we could infer mode at runtime from VDD_SOC voltage,
>> but we need to set up clocks to read out the PMIC and I want to
>> apply the constraints as early as possible as I don't want the SoC
>> to run outside of spec even for a short while.
> 
> Apologies for the delay responding to you, doing it today cos I feel
> guilty!

I am fully aware that I needn't expect prompt review feedback so late in
December. Thanks a lot for taking the time still.

> I think what you've explained here is fine, but could you add a
> bit more of that info to the commit message, explaining why one cannot
> be default? With that,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks. I will await further review feedback and adjust this commit's
message for v2 as requested.

Wishing you nice holidays,
Ahmad

> 
> Cheers,
> Conor.
> 
>>
>> Thanks,
>> Ahmad
>>
>>>
>>>>
>>>> While the overdrive mode allows for higher frequencies for many IPs,
>>>> the nominal mode needs a lower SoC voltage, thereby reducing
>>>> heat generation and power usage.
>>>>
>>>> In any case, software should respect the maximum clock rate limits
>>>> described in the datasheet for each of the two operating modes.
>>>>
>>>> To allow device tree consumers to enforce these limits, document two new
>>>> optional properties that can be used to sanity check the clock tree.
>>>>
>>>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>>>> ---
>>>>  Documentation/devicetree/bindings/clock/imx8m-clock.yaml | 14 ++++++++++++++
>>>>  1 file changed, 14 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
>>>> index c643d4a81478..a6ae5257ef53 100644
>>>> --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
>>>> +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
>>>> @@ -43,6 +43,14 @@ properties:
>>>>        ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
>>>>        for the full list of i.MX8M clock IDs.
>>>>  
>>>> +  fsl,nominal-mode:
>>>> +    description: Set if SoC is operated in nominal mode
>>>> +    $ref: /schemas/types.yaml#/definitions/flag
>>>> +
>>>> +  fsl,overdrive-mode:
>>>> +    description: Set if SoC is operated in overdrive mode
>>>> +    $ref: /schemas/types.yaml#/definitions/flag
>>>> +
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
>>
>>
>> -- 
>> Pengutronix e.K.                           |                             |
>> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
>> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
>> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

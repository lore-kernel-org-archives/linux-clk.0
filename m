Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA391B86DC
	for <linux-clk@vger.kernel.org>; Thu, 19 Dec 2024 20:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734639274; cv=none; b=TMy/l/nGRC7BSjs6QAGZO4+KnxvAvdGlJ14Ty0klaFAw1wqbvXmKcLsp8mNiUHU0tYoTN3ani05fWr+e9+trT/S8C0E3C3NBeYD1Kc6PkLoC0MAGy2Hmi0Snuew8iilZ3MSek3bh3wVyRQkMFCqd3q2v7rakYEyh77rPkUEiKVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734639274; c=relaxed/simple;
	bh=blkl4YVe4sfsiHha7qtMfOqZn0u/DBDQR38uDhwntwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kSxrlJn/waq2QE1gHDIdE+W06Fo8VYc9mCLmPrZWmGaVFM7LNzawrrupHcPiFGDWywVRfgbY8DHZRRohsOfASGJNcO8Bj8rv30RumEndpYbM0qO//G6KvkvXEtBc8Pjf1p6eo85tz3U5Ewgqzjn5gdplkg0Kqk2Vig65jwKWFXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOMuR-0004TF-Sj; Thu, 19 Dec 2024 21:14:11 +0100
Message-ID: <4e2250b3-5170-4e88-aa0a-dd796b81e78b@pengutronix.de>
Date: Thu, 19 Dec 2024 21:14:10 +0100
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
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20241219-lash-lather-31443ced0e0c@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

Hello Conor,

On 19.12.24 20:49, Conor Dooley wrote:
> On Thu, Dec 19, 2024 at 08:27:32AM +0100, Ahmad Fatoum wrote:
>> The imx8m-clock.yaml binding covers the clock controller inside all
>> of the i.MX8M Q/M/N/P SoCs. All of them have in common that they
>> support two operating modes: nominal and overdrive mode.
> 
> This implies that only the two modes you mention are possible, but you
> leave the option open to a dts author to use either. How come?
> 
> Makes it seem like we only need one of these, for whatever the
> non-default option is?

There is no real default. The mode is configured implicitly by the
bootloader setting VDD_SOC and then kernel needs to adhere to the
limits that imposes.

For i.MX8M Mini and Nano, the kernel SoC DTSIs has assigned-clock-rates
that are all achievable in nominal mode. For i.MX8MP, there are some
rates only validated for overdrive mode.

But even for the i.MX8M Mini/Nano boards, we don't know what rates they
may configure at runtime, so it's not possible to infer from just the
device tree what the mode is, which is why I need to allow for absence
of either property. I can make it a single property with two possible
values though if that's preferable.

Theoretically, we could infer mode at runtime from VDD_SOC voltage,
but we need to set up clocks to read out the PMIC and I want to
apply the constraints as early as possible as I don't want the SoC
to run outside of spec even for a short while.

Thanks,
Ahmad

> 
>>
>> While the overdrive mode allows for higher frequencies for many IPs,
>> the nominal mode needs a lower SoC voltage, thereby reducing
>> heat generation and power usage.
>>
>> In any case, software should respect the maximum clock rate limits
>> described in the datasheet for each of the two operating modes.
>>
>> To allow device tree consumers to enforce these limits, document two new
>> optional properties that can be used to sanity check the clock tree.
>>
>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> ---
>>  Documentation/devicetree/bindings/clock/imx8m-clock.yaml | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
>> index c643d4a81478..a6ae5257ef53 100644
>> --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
>> +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
>> @@ -43,6 +43,14 @@ properties:
>>        ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
>>        for the full list of i.MX8M clock IDs.
>>  
>> +  fsl,nominal-mode:
>> +    description: Set if SoC is operated in nominal mode
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +
>> +  fsl,overdrive-mode:
>> +    description: Set if SoC is operated in overdrive mode
>> +    $ref: /schemas/types.yaml#/definitions/flag
>> +
>>  required:
>>    - compatible
>>    - reg
>> @@ -95,6 +103,12 @@ allOf:
>>              - const: clk_ext2
>>              - const: clk_ext3
>>              - const: clk_ext4
>> +  - if:
>> +      required:
>> +        - fsl,overdrive-mode
>> +    then:
>> +      properties:
>> +        fsl,nominal-mode: false
>>  
>>  additionalProperties: false
>>  
>>
>> -- 
>> 2.39.5
>>


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

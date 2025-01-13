Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62122125B2
	for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 13:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736776387; cv=none; b=d0S+734AVZb+dfWrBpBnOKeSzlYd7DClDXe4ZW2pcSSs6bE6UcLrmWYZtnurNM8Ma+iDiPi4E5uaX6+oDWZ31cd8xaPF3Db9l1hzFGzxAZjkgg5WdJkMSYjwcnXqmRFGD2v8I7/iE6Cd4HcE07KZPqj+id1Va7vD2eNX1l4vBAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736776387; c=relaxed/simple;
	bh=SrvlXCFDRluE091hs9aNekJrTWA9i7WiKf4HjdZ3Zmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mtsEQCSFC1qK+wPpcSlfvEFbput8JLroPogu6z57nv714+oqu3a5lORRYDq4St2BeJoKIRa5OdFXno6qP2WbwUVflI3StSJVFLH/VuD3Ed4FCEMP3I18YRjOxxyQ5esDXRWZJFTJDdkjXO8GMtk0hBnHVp+GDweoQk/5y2bP+UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXKsA-0004SJ-SF; Mon, 13 Jan 2025 14:52:54 +0100
Message-ID: <0ef15155-c124-423f-bd00-ccde0fb1a741@pengutronix.de>
Date: Mon, 13 Jan 2025 14:52:53 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: imx8m: document
 nominal/overdrive properties
To: Frank Li <Frank.li@nxp.com>
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

Hi Frank,

On 06.01.25 20:42, Frank Li wrote:
> On Mon, Jan 06, 2025 at 08:25:38PM +0100, Ahmad Fatoum wrote:
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

I just sent out v3[1] with your suggestion incorporated, but missed adding
you to Cc.

[1]: https://lore.kernel.org/all/20250113-imx8m-clk-v3-0-0d6e9bdeaa4e@pengutronix.de/

Thanks,
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

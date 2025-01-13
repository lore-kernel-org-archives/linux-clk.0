Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD88920F060
	for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 16:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736784577; cv=none; b=ZsOe+/5WDuP3xN8YF/aRpQnI5aBCMDnSql9dKyhkaACCIQntKsm/OkzosSE5GDaZoUs1/M5KBIHjVIFecg1c6sfkm1OA768tej434tOXfK9sM75FQOmxxc0NT9spWdVNlS0BXgKXuNj7wJbpLyLvQ5b0wK7qnyUVjjEM6JcRf3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736784577; c=relaxed/simple;
	bh=Pm+KD02tcADamsCS0wc/Gp4EUipnsdSbq3MH4JwZ0Zk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QmBNJR0sNzbiAi/tK3x66xPMFoOFtnU3hl42ZZQOhuckdykJXUo6k1T2wlraYcUeK/sKEnqvmBn55O9l2uqfbFxmZXbvPVFHu5vlSgVCj5TaRhbhRbb5qmKvWMg35SSDQ4WrIFXYmQ3wN1eI/ly5O9y3xqPGTlsmWKwVuV+nlhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tXN0C-0007mJ-8O; Mon, 13 Jan 2025 17:09:20 +0100
Message-ID: <45bbdacc-6683-43df-b7ff-d3bd09842f65@pengutronix.de>
Date: Mon, 13 Jan 2025 17:09:19 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] dt-bindings: clock: imx8m: document
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
 linux-kernel@vger.kernel.org
References: <20250113-imx8m-clk-v3-0-0d6e9bdeaa4e@pengutronix.de>
 <20250113-imx8m-clk-v3-1-0d6e9bdeaa4e@pengutronix.de>
 <Z4U4OElqJMeuF1tw@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <Z4U4OElqJMeuF1tw@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

On 13.01.25 16:58, Frank Li wrote:
> On Mon, Jan 13, 2025 at 02:42:51PM +0100, Ahmad Fatoum wrote:
>> The imx8m-clock.yaml binding covers the clock controller inside all
>> of the i.MX8M Q/M/N/P SoCs. All of them have in common that they
>> support two operating modes: nominal and overdrive mode.
>>
>> While the overdrive mode allows for higher frequencies for many IPs,
>> the nominal mode needs a lower SoC voltage, thereby reducing
>> heat generation and power usage.
>>
>> As increasing clock rates beyond the maximum permitted by the supplied
>> SoC voltage can lead to difficult to debug issues, device tree consumers
>> would benefit from knowing what mode is active to enforce the clock rate
>> limits that come with it.
>>
>> To facilitate this, extend the clock controller bindings with an
>> optional fsl,operating-mode property. This intentionally allows the
>> absence of the property, because there is no default suitable for all
>> boards:
>>
>> For i.MX8M Mini and Nano, the kernel SoC DTSIs has assigned-clock-rates
>> that are all achievable in nominal mode. For i.MX8MP, there are some
>> rates only validated for overdrive mode.
>>
>> But even for the i.MX8M Mini/Nano boards, we don't know what rates they
>> may configure at runtime, so it has not been possible so far to infer from
>> just the device tree what the mode is.
>>
>> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
>> ---
>>  Documentation/devicetree/bindings/clock/imx8m-clock.yaml | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
>> index c643d4a814786a1fc7e559140fe58911990f71bb..b03672255cae9462013a8a4e7a2adaff440f1420 100644
>> --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
>> +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
>> @@ -43,6 +43,16 @@ properties:
>>        ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
>>        for the full list of i.MX8M clock IDs.
>>
>> +  fsl,operating-mode:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description:
>> +      The operating mode of the SoC. This affects the maximum clock rates that
>> +      can safely be configured by the clock controller.
>> +    oneOf:
>> +      - enum:
>> +          - nominal
>> +          - overdrive
> 
> I remember
> 
> fsl,operating-mode:
>   enum: [nominal, overdrive]
> 
> should work without oneOf

Yes, you're right. This is a left-over from the example I copy-pasted from.
Thanks, will fix for v4. Feel free to leave some Reviewed-by on the
other patches though in the mean-time. :-)

Cheers,
Ahmad

> 
> Frank
> 
> 
>> +
>>  required:
>>    - compatible
>>    - reg
>> @@ -109,6 +119,7 @@ examples:
>>                   <&clk_ext3>, <&clk_ext4>;
>>          clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
>>                        "clk_ext3", "clk_ext4";
>> +        fsl,operating-mode = "nominal";
>>      };
>>
>>    - |
>>
>> --
>> 2.39.5
>>
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246123;
	b=dm41TQNUNNMuKHYQvXspqf3JUrZBHpNaK4ryEIrYZWa6kek51kzZbm4FJIYmbl1SxpC6
	 DdSgO+RPK/CocgXBPvXqJug3W9QC4QrDsUrQzsaFerNrFs4SbTlDF9NX3BB/8ME5t+Fdn
	 JajQM/UHkfHP5CgELV4An7Zn9fF7To9ALLMLR2H3gfoSnH8q80e3CAPCsE1GZx9zBNUWh
	 cAXwjBLCNsSJMSVFe6+Juthv+e/ZhMaQwhKPib3qrtgRXEJYbaSxdPo927jOuP1Gjiq8E
	 Lb7fFuIOc68KvHUahychRuOSiXYTj/cj+VvZxikdILhWDCI2LI24D561atH/19BiV9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=wNQ1BQPQK5n/U+GIMYrm3ZkE/2RFULvhCOZhn+eZxfI=;
	b=fT5a/S2nsY95bfFgmCnV6EJj4y2gmZF6Wao70t5JaLEYKV1zDlJ/Op6Ib5PGRMJ8INUv
	 gmUOOIdNrCnF49UVf2+1VA6FhDYq3X2ZWxTMZOPecgHi6kSMsriv+BnqnB/DUu5w/nED/
	 y07hT/vQd+RU252HHc+l/Zv9Cawb6rcMYkXTPIk0pRI3jrydQJSnXH/agRTbvxZ+gccIf
	 Mf3iJ8aPS0DS8SHBaQm5Faf43Wr9afdiHK/erbeZdx6tq7OSkCgb44Z8GVgniMsjgarDL
	 tBp3wXkWcniBoC05C+wR0Cj4mWn3jXtj2zBbxoCu1K57qEVboepDqkREEqhsP2o5y6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=yuBMX1vR;
	arc=none smtp.remote-ip=74.125.231.135
Received: from mail-oo2-f7.google.com (mail-oo2-f7.google.com [74.125.231.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A52606A325
	for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2026 17:42:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89A52606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=yuBMX1vR
Received: by mail-oo2-f7.google.com with SMTP id 46e09a7af769-8210db80578so335598a34.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2026 09:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1794246121; x=1794850921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wNQ1BQPQK5n/U+GIMYrm3ZkE/2RFULvhCOZhn+eZxfI=;
        b=yuBMX1vRFXM5Ip52++lbq0FeCO/8O8aUZ/ZKdu7MKnTXQvli6mg4xNe04YdLSLCqq0
         Bgm37gn9A7NswjPhMBs4UWQK1xx0HSDtdCI4+7P2W8kXtlmVCBxXoSvEb7YalplNkDJ8
         HMR7AsLJ7qsEc8VGuMnf439yUrjllBjH+gSZMvhBK34NqHfKh3f0kWNslelvpr0GNiOF
         P/wmVXBdiy3UDVzucwQz1JeWj74JlazmFvJiWd+umOFE6w4b7GLrHeWDA0Ttm1COfzOS
         bITmAazKvGZvFgnaEpDEwHCiNJbo+tFFYEiWvSDi//+Ar9GATs40u1RQoSdCZveKjtoW
         HePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246121; x=1794850921;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNQ1BQPQK5n/U+GIMYrm3ZkE/2RFULvhCOZhn+eZxfI=;
        b=Z2Br6oFFsa4YO18KswSrZ2cFXHxdWhDnOPXXqpfa9yUtQdDrL99s52Gvm4pFb9Wf9o
         6z2pz9HpsugX/aSqKyLaRZK861FDUHR+hoKgnhTNWjXo6uGeHt1vm9qlS3rKvOARHf4Q
         Uv7qiQvkxbIDnnpbn7TjI9GxR16YqD5NHxKl7/iaB2xknxahoFpYL88wfs/vA7pP3POl
         W7J41HGHJVDloZ1EvDXevasbt/kZrlb3Vm+TZmTjACZc3MAgqZ3PVxbjFmKE2M/m5TVH
         CqinpSSLvFUsbH+Ae9TCbcZ4OMB3lPmzDsHyxyuldaHbFa610xT+uhJ1hTm9x8y/zAhA
         tI8Q==
X-Forwarded-Encrypted: i=1; AL+hErGIqcHfBxZMn7Lj+U22HT4qtVYm7BlzoyWN8pgqb2RqTG0YH/lSUIRyu5ReXq3v6aJ5ubVcm/YjZi8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XOr52q536QwCLkwBUqqjM8X0Rp1isRg0XSXnHb9YohXKFlVtj
	g18vZwWFNStzGRLLk1bcuGbU465qy/LhBpneMX5uKf5bcWNCfKS0Ht05ESVUrTz4DJQ=
X-Gm-Gg: AYBFou2UYPv219WqtccxVEUJ+BjJT6S72elWHefJ0vS20hwHUcI+SkY+YCBJSuPWZlJ
	F9jmul4WuiRZ6H7b7/Uz6kGrY2rYw8DvHeNmRvEibnidt8TFlJ9rr9ONVGmLWhGTgsDJJ4lNgr6
	r6Zy3HqyLOkvyJlg0Q2V2509HNHmYiomXz5KNsmXr+S904gFB0Gkm2gIZ9QoVFeWKxxBftkxeTU
	8yP0yiiNiv5gv+l0Evuqx5tfgUUWTx1R1OcdOQZygveP7Dx7AhGLSx5ppNPyOvAi/d2wtPGVRAJ
	rRMTrcOfoW4VKmmgs7quX6q96bty0/GOGtpNJ+xcl/1CiFA7DsF96kt7Swk9iepjMKGkg0w7g/7
	7RZOWcztOsUfGVmEHNACtaO+gLX53cZy+3S9bu324QSr8nJN8X0oMXggJdS/RMh44JTWKVt5ZX6
	szNBhF90KHKfB872K0ng8/y1L6mF+Da2MKr+FgbpePiG4LM8rVcTxc2mQjnFTk9iHuNnxY48OSI
	n5QHElv3Cxi57w40fmpPRlglcHy780L91Q5bEWnUsmamjdpC0H3gHO3kjmpwISbM9jLNlSVmleq
	EHFHJ6ijvhBbqPhPEFWzjeIudWERJw==
X-Received: by 2002:a05:6808:120c:b0:4b9:a829:f00e with SMTP id 5614622812f47-5683cc10684mr273208b6e.26.1794246121311;
        Mon, 09 Nov 2026 09:42:01 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813c71bd0sm4925229b6e.4.2026.11.09.09.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 09:42:00 -0800 (PST)
Message-ID: <b4c191bf-4d46-439e-b0fb-ead747413d48@riscstar.com>
Date: Mon, 9 Nov 2026 11:41:59 -0600
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: soc: introduce
 toshiba,tc9564-config-syscon.yaml
To: Krzysztof Kozlowski <krzk@kernel.org>, sboyd@kernel.org,
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, p.zabel@pengutronix.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: daniel@riscstar.com, mohd.anwar@oss.qualcomm.com,
 lorenzo.bianconi@oss.qualcomm.com, fabrice.gasnier@foss.st.com,
 alexandre.torgue@foss.st.com, marex@nabladev.com,
 changhuang.liang@starfivetech.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261104004332.2141282-1-elder@riscstar.com>
 <20261104004332.2141282-2-elder@riscstar.com>
 <53323b7e-5169-4a36-a051-ed1eb1718b7d@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <53323b7e-5169-4a36-a051-ed1eb1718b7d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/5/26 2:23 PM, Krzysztof Kozlowski wrote:
> On 04/11/2026 01:43, Alex Elder wrote:
>> Define the binding for the system controller that implements the clock
>> and reset controller functionality present in the Toshiba TC9564 SoC.
>>
>> Co-developed-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../toshiba/toshiba,tc9564-config-syscon.yaml | 68 +++++++++++++++++++
>>   MAINTAINERS                                   |  8 +++
>>   include/dt-bindings/soc/toshiba,tc9564.h      | 46 +++++++++++++
>>   3 files changed, 122 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml
>>   create mode 100644 include/dt-bindings/soc/toshiba,tc9564.h
>>
>> diff --git a/Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml b/Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml
>> new file mode 100644
>> index 0000000000000..5a241a9c915d1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/soc/toshiba/toshiba,tc9564-config-syscon.yaml
>> @@ -0,0 +1,68 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/soc/toshiba/toshiba,tc9564-config-syscon.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Toshiba TC9564 Multifunction System Controller
>> +
>> +maintainers:
>> +  - Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>> +  - Alex Elder <elder@riscstar.com>
>> +  - Daniel Thompson <daniel@riscstar.com>
>> +
>> +description:
>> +  The Toshiba TC9564 is an SoC accessed by a host system through the
>> +  upstream PCIe port on the PCIe switch it implements.  The switch
>> +  includes an embedded PCIe endpoint that provides access to various
>> +  SoC peripherals via its BARs.  These peripherals include a simple
>> +  controller to gate internal clocks, as well as a reset controller.
>> +
>> +  The clock controller uses registers within the same page as a reset
>> +  controller, so this system controller controls access to both.
>> +
>> +  A total of 21 simple gated clocks are implemented within the SoC.
>> +  At this time, support for enabling and disabling only a subset of
>> +  them is provided at this time.  Similarly, the SoC implements 13
>> +  resets, but currently not all of them can be controlled.
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: toshiba,tc9564-config-syscon
>> +      - const: syscon
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  "#clock-cells":
>> +    const: 1
>> +    description:
>> +      Clock ids are defined in <include/dt-bindings/soc/toshiba,tc9564.h>
>> +
>> +  "#reset-cells":
>> +    const: 1
>> +    description:
>> +      Reset ids are defined in <include/dt-bindings/soc/toshiba,tc9564.h>
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - "#clock-cells"
>> +  - "#reset-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    syscon@0 {
>> +        compatible = "toshiba,tc9564-config-syscon", "syscon";
> 
> I disagree this to be syscon.

Conor Ack'd this patch, and then followed up asking me to
mention the other feature it provides, which I agreed to do.
It is an important third use of the memory region.

   https://lore.kernel.org/lkml/20261105-irregular-awaken-b329b9c37e70@spud/

In addition to the registers that control these clocks and
resets, this address range contains two registers (one per
PCI function) that indicate when a DWMAC hardware
initialization step is complete.  The nodes representing
those Ethernet MACs refer to this syscon with a phandle
property (and offset).

Is that additional use enough to warrant defining this as
a syscon?  I.e., with that third use, does this no longer
represent a "pure internal-register-access thingy?

> This is internal to the PCI device. I read Daniel Thompson answer:
> https://lore.kernel.org/all/auOI8LbZNWbNGJuN@aspen.lan/
> And I accept arguments that you want to re-use a lot of existing
> bindings like DWMAC and so on. Syscon does not count there.
> 
> I remember you posted somewhere full DTS, but now I could not find it
> again and I do not see it in the cover letter here.

I should have included it, and will include this in future messages.
I squashed together the DTS commits into a single complete DTS that
we are testing with, here:

  
https://github.com/riscstar/linux/blob/tc9564-dts/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts

I'll also respond to your other message.

					-Alex

> So again, why does it have to be a syscon, which is pure
> internal-register-access thingy?


> Best regards,
> Krzysztof


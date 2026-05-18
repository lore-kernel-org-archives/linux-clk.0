Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316EB37268C;
	Mon, 18 May 2026 07:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779089288; cv=none; b=qhZ8eMHBMOi3JIqsZ/0eL/KYGUyFm5TUAHK5g+/93C2oZ6tEfrUrlkQkrr4EgK2oKfBptuxqSn2xjlxvLt8yUsnhBbDVdndAqHJjk6IMT3FX8rYJs09m9+vSGRvKoJE6HLkqbZJyobJWdOvdnVSaQVVBaYnK1kDvVLwZscEwfAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779089288; c=relaxed/simple;
	bh=mTL4AmldJLzLoADrNv/OW3KIjhSEDw/stTd1/0S4/Kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=KZOoI79AGbtdyIu9uPkVblDpD4buINdbL8+pDtj12KJl0Day452p6SxnpfDknvymL7l0NByfvmpFORhN0Bd4TzwS+esgKugCkiV5gdaxZM1LXe6wxQdP5hutBeNEIODmVHu2hI/O0QAji9FU7ZaSl1ZKt20ltehZxn1DABX849E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=xlOnUpHh; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="xlOnUpHh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779089287; x=1810625287;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mTL4AmldJLzLoADrNv/OW3KIjhSEDw/stTd1/0S4/Kk=;
  b=xlOnUpHh63/lTf+biY+PgV65rZOlHa6ChgQ3sKxM5tO/IQQIbQgHaXHJ
   VJY+qXrrIS95hEbS30+37c/FrZPG0bts600AWfS5b87qA24ibWiXFRG0Y
   A/Ojkls0qIWAMMXlFGj19iYllEi63onnPHEOGanBJIgK1yUnKCxMtVgIZ
   MkVe6BxNQ4HGtcoheDVpvI8SQmQ3wUPu/kFwcaMgAeww+RR178COa463Y
   WPLVxqwx76n+gFsTsM6AipKcHGjbE9uVMCBv+XqXX5n0iRdGcHuXM/f7r
   gSN+d83KEWx0xDYNLPfNbhDnEomadc0HbUDCfonkWZjlWvxANYMa5W08F
   A==;
X-CSE-ConnectionGUID: J2ZZy5+7R6SKTOgX18Itgw==
X-CSE-MsgGUID: 09Eij195QgmMOObYXG9Vhg==
X-IronPort-AV: E=Sophos;i="6.23,241,1770620400"; 
   d="scan'208";a="66398712"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 00:27:59 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Mon, 18 May 2026 00:27:59 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 18 May 2026 00:27:54 -0700
Message-ID: <0ae90352-2099-4d3d-a55c-40a6e090fde4@microchip.com>
Date: Mon, 18 May 2026 09:27:55 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] ARM: dts: microchip: add I3C controller
To: Manikandan M - I67131 <Manikandan.M@microchip.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>
CC: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"Frank.Li@nxp.com" <Frank.Li@nxp.com>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "tytso@mit.edu" <tytso@mit.edu>, Aubin Constans - M51280
	<Aubin.Constans@microchip.com>, Ryan Wanner - C70674
	<Ryan.Wanner@microchip.com>, Romain Sioen - M70749
	<Romain.Sioen@microchip.com>, "durai.manickamkr@microchip.com"
	<durai.manickamkr@microchip.com>, Cristian Birsan - M91496
	<Cristian.Birsan@microchip.com>, "adrian.hunter@intel.com"
	<adrian.hunter@intel.com>, "jarkko.nikula@linux.intel.com"
	<jarkko.nikula@linux.intel.com>, "npitre@baylibre.com" <npitre@baylibre.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
References: <20260507084805.481737-1-manikandan.m@microchip.com>
 <20260507084805.481737-5-manikandan.m@microchip.com>
 <da83523d-f3ac-42e3-83a2-fb7e7d64ebf9@tuxon.dev>
 <515e89f3-fca9-477c-be4d-be9ed9428d5f@microchip.com>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <515e89f3-fca9-477c-be4d-be9ed9428d5f@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 18/05/2026 at 08:10, Manikandan M - I67131 wrote:
> Hi Claudiu,
> 
> On 16/05/26 9:37 pm, Claudiu Beznea wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>> the content is safe
>>
>> Hi, Manikandan,
>>
>> On 5/7/26 11:48, Manikandan Muralidharan wrote:
>>> From: Durai Manickam KR <durai.manickamkr@microchip.com>
>>>
>>> Add I3C controller for sama7d65 SoC.
>>>
>>> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
>>> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
>>> ---
>>> Changes in v3:
>>> - Remove clock-names property as driver enables the clk in bulk
>>>
>>>    arch/arm/boot/dts/microchip/sama7d65.dtsi | 8 ++++++++
>>>    1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi
>>> b/arch/arm/boot/dts/microchip/sama7d65.dtsi
>>> index 67253bbc08df..ec200848c153 100644
>>> --- a/arch/arm/boot/dts/microchip/sama7d65.dtsi
>>> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
>>> @@ -1055,5 +1055,13 @@ gic: interrupt-controller@e8c11000 {
>>>                        #address-cells = <0>;
>>>                        interrupt-controller;
>>>                };
>>> +
>>> +             i3c: i3c@e9000000 {
>>> +                     compatible = "microchip,sama7d65-i3c-hci";
>>> +                     reg = <0xe9000000 0x300>;
>>
>>   From manual at [1] I see the size of I3CC region is 0x1000. Unless that is
>> wrong I think we should use 0x1000 to properly describe de HW. Please
>> let me
>> know and I can do it while applying.

The memory map simply describes what is the next memory boundary 
assigned (or void in this case), not the actual size of the IP user 
interface.
So we took the opportunity to avoid mapping unused memory.

> According to Table 78.6 (Register Summary), the I3CC register space
> extends up to offset 0x258, Ideally the mapping should have been 0x400

The underlying memory mapping certainly does what is best, so I would 
cling to being the closest to last register described. So your 0x300 
value looks very good to me.

Best regards,
   Nicolas

> (next power of 2 considering the memory region alignment), using 0x1000
> is also acceptable. Please advise which value is preferred.
> 
>> Thank you,
>> Claudiu
>>
>> [1]
>> https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAMA7D6-Series-Data-Sheet-DS60001851.pdf
>>
>>> +                     interrupts = <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
>>> +                     clocks = <&pmc PMC_TYPE_PERIPHERAL 105>, <&pmc
>>> PMC_TYPE_GCK 105>;
>>> +                     status = "disabled";
>>> +             };
>>>        };
>>>    };
>>
> 


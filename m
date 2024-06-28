Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA4613C674
	for <linux-clk@vger.kernel.org>; Fri, 28 Jun 2024 08:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719562372; cv=none; b=kRfhd054coETUARMFPeSdqoKdcCjU5u35FIs/bGV04sVkakFDLBH4exbhFNs/7VPkw3fqloJrZA0Xt5mOvoi41OqyMfu0HAFUpWb64KhupKNz0Z87M16OcoceLcd/wpVxnqHpzli4kdcDA0iB+kR4M06Zoj1mwyAkqflmnKEwDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719562372; c=relaxed/simple;
	bh=XCJs/o8E6YhqAeCcCckIjmlP6d1rKZmYUJQyiy3AG98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YFMcaPmf4+wDJPYZdgueh5ZDDTLedzrKR6N1N0U++Np0rD2NrUaftjzKLFZYiLvpFgQMnQJ234DopyZqZn/mblXxU2hjdyTbySfg4ts/eYArv/9nlZLIAMZBXGEUv4LHWrbidN8WP177aBl+TOxrO7BxgbBIRLRjqUKgDozY5Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TQTm1Nkv; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TQTm1Nkv"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52db11b1d31so451293e87.0
        for <linux-clk@vger.kernel.org>; Fri, 28 Jun 2024 01:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1719562368; x=1720167168; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qqH7a9rB5T7bMD+rUwcHxt4NZ8sludKciekY4XeeiH0=;
        b=TQTm1NkvrRjfbAZTL08SnGxmDZjUEmF4zvCZ1h+tfDi2l5b5C+c1fPDr+hhijqS3OY
         3ikPiEraFFcBjoFHatSV0QJo9joj7mIjco4yyS5bIcUjG9k4We0V5KSZsqLxMTATal+N
         Gj3Iqkhmc70XSliF+DS3eMAClshNUBpHLJjlbAk3db3tlTHF4cuwwP7yX54Esjjt2eQd
         jsNkV/vl233UyByt0a6ExvLtvbGeoLq6vep/aEvyu6FixvYG/PSOiM5BMoPVpP5tFwwE
         P6UDDdcAR8kVu2CpBagaNh15RvLWW84KCoAXJ+5EA5smfrBl1c0P8PghQfTneET6dkSI
         OhoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719562368; x=1720167168;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qqH7a9rB5T7bMD+rUwcHxt4NZ8sludKciekY4XeeiH0=;
        b=A9o3aUR0pXqbT+1RWqiGxqpwMxDGuRSH+OZqDcL+edw/vOTxoBAMsrwzMIP4rG5bOw
         QMy7/Z5GRLbrQMbsFYihBtQS/EEUo0TDDdJ7+vVLAwxnUmUdVH4+x0gs1a6YDc4Wh0iI
         Zr5WgV7cbLV1erGTXUuDmH7QgH1CwjUQyds8o/YrUe1dKFMOI/Y3NIlSxVdKfew76TuA
         8nqkOFr/nLOhcI2S4uC0A5/Fxv2KNAMZkqspnDcqmMtAdGTF1mX1AGeNzx4SdX8GfH4f
         vGvHPoJ0Gt7TX9MBH03wN8A5qBBQ444c9hBbsF06fp6jHQ9L2c3Ec8dQqGdHeXHpmZ5m
         Zx3w==
X-Forwarded-Encrypted: i=1; AJvYcCVVEkzEafpiAQm3gBIWXvxHf+aBLj7ahUVCpRAi4cTzR9fV7Jre2NuCOnYDueZtUYJihrSya8Hfq65Nr93nKqdskwIgShE2W3F9
X-Gm-Message-State: AOJu0Yy0JNMAlSZaRdWkNcmRlu20R1u++iOfEgTPk2eAH/L1fkX+UTGW
	RxoFVlB8l5rxl92+s7JILXE9Wc13Mpi5OB54i1vB5p264wCyW0MfrTTXoVm4HWw=
X-Google-Smtp-Source: AGHT+IG7q7oi4YXSsJv2pPn8DgaqByv+geulrEaq3/D4qWFq4GHO/t+UK7v1odxUlJcJAkqeN1/hBw==
X-Received: by 2002:a05:6512:3da3:b0:52c:e728:cca1 with SMTP id 2adb3069b0e04-52ce728cd5bmr11772828e87.39.1719562367184;
        Fri, 28 Jun 2024 01:12:47 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b0c17e6sm23433785e9.42.2024.06.28.01.12.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 01:12:46 -0700 (PDT)
Message-ID: <79c26030-4b92-4ef3-b8ce-d011f492161b@tuxon.dev>
Date: Fri, 28 Jun 2024 11:12:45 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe
 the register offsets
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Chris Brandt <Chris.Brandt@renesas.com>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240625121358.590547-1-claudiu.beznea.uj@bp.renesas.com>
 <20240625121358.590547-8-claudiu.beznea.uj@bp.renesas.com>
 <TY3PR01MB11346EF9A001F68162148B70F86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <6289f329-118f-4970-a525-75c3a48bd28b@tuxon.dev>
 <TY3PR01MB1134603F92C72D9B6C6C3733C86D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2f162986-33c5-4d80-958c-4f857adaad20@tuxon.dev>
 <TY3PR01MB11346CA73575CF61B2024F3B386D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TY3PR01MB11346CA73575CF61B2024F3B386D02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 28.06.2024 11:09, Biju Das wrote:
> 
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>> Sent: Friday, June 28, 2024 9:03 AM
>> Subject: Re: [PATCH v2 07/12] i2c: riic: Define individual arrays to describe the register offsets
>>
>>
>>
>> On 28.06.2024 10:55, Biju Das wrote:
>>> Hi Claudiu,
>>>
>>>> -----Original Message-----
>>>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>>>> Sent: Friday, June 28, 2024 8:32 AM
>>>> Subject: Re: [PATCH v2 07/12] i2c: riic: Define individual arrays to
>>>> describe the register offsets
>>>>
>>>> Hi, Biju,
>>>>
>>>> On 28.06.2024 08:59, Biju Das wrote:
>>>>> Hi Claudiu,
>>>>>
>>>>>> -----Original Message-----
>>>>>> From: Claudiu <claudiu.beznea@tuxon.dev>
>>>>>> Sent: Tuesday, June 25, 2024 1:14 PM
>>>>>> Subject: [PATCH v2 07/12] i2c: riic: Define individual arrays to
>>>>>> describe the register offsets
>>>>>>
>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>
>>>>>> Define individual arrays to describe the register offsets. In this
>>>>>> way we can describe different IP variants that share the same
>>>>>> register offsets but have differences in other characteristics.
>>>>>> Commit prepares for the addition
>>>> of fast mode plus.
>>>>>>
>>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>> ---
>>>>>>
>>>>>> Changes in v2:
>>>>>> - none
>>>>>>
>>>>>>  drivers/i2c/busses/i2c-riic.c | 58
>>>>>> +++++++++++++++++++----------------
>>>>>>  1 file changed, 31 insertions(+), 27 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/i2c/busses/i2c-riic.c
>>>>>> b/drivers/i2c/busses/i2c-riic.c index
>>>>>> 9fe007609076..8ffbead95492 100644
>>>>>> --- a/drivers/i2c/busses/i2c-riic.c
>>>>>> +++ b/drivers/i2c/busses/i2c-riic.c
>>>>>> @@ -91,7 +91,7 @@ enum riic_reg_list {  };
>>>>>>
>>>>>>  struct riic_of_data {
>>>>>> -	u8 regs[RIIC_REG_END];
>>>>>> +	const u8 *regs;
>>>>>
>>>>>
>>>>> Since you are touching this part, can we drop struct and Use u8* as
>>>>> device_data instead?
>>>>
>>>> Patch 09/12 "i2c: riic: Add support for fast mode plus" adds a new member to struct
>> riic_of_data.
>>>> That new member is needed to differentiate b/w hardware versions
>>>> supporting fast mode plus based on compatible.
>>>
>>> Are we sure RZ/A does not support fast mode plus?
>>
>> From commit description of patch 09/12:
>>
>> Fast mode plus is available on most of the IP variants that RIIC driver is working with. The
>> exception is (according to HW manuals of the SoCs where this IP is available) the Renesas RZ/A1H.
>> For this, patch introduces the struct riic_of_data::fast_mode_plus.
>>
>> I checked the manuals of all the SoCs where this driver is used.
>>
>> I haven't checked the H/W manual?
>>
>> On the manual I've downloaded from Renesas web site the FMPE bit of RIICnFER is not available on
>> RZ/A1H.
> 
> I just found RZ/A2M manual, it supports FMP and register layout looks similar to RZ/G2L.

I introduced struct riic_of_data::fast_mode_plus because of RZ/A1H.

> Wolfram tested it with r7s72100 genmai board acessing an eeprom. Not sure is it RZ/A1 or RZ/A2?
> 
> Cheers,
> Biju
> 

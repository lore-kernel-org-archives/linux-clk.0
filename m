Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54930B677
	for <linux-clk@vger.kernel.org>; Mon, 27 Jan 2025 09:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737969357; cv=none; b=UsSjC2r216nuhBl4v/CdhioOnqlnNd8LSYxgj2uhGi3fUOgronFtFSPBRh9MhXzibO3sKqJtuCXakGzmGlprVdZXAakgXjfi1GAkziLLMSTnJX+J0k5CkU4oxksjEIOLJHxICoYc9kM0FE3fWZFvaLGh6sd81Ahkg+OZN2HaT5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737969357; c=relaxed/simple;
	bh=TiphF4zr2Pj5KkcZbHO32+T00/RteL1cHzkWaqktWc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Th28MMH/VF7oodBJ24aa8Wu5wbF2fUPgl6l68cUk8hPiZTO2/vsT32OTino6FbwKO+3vYmdSwOk1zpAH7srhtX6MYZy9XBQz/xi9FnJQf/1lWSCuMnourjnJlSWXYSq3MhjkCLQNXcLSXj0/LaFGYYYkTe8hNhzl9K29Rx6mhAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Mk+a/G+6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Mk+a/G+6"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436281c8a38so28773085e9.3
        for <linux-clk@vger.kernel.org>; Mon, 27 Jan 2025 01:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1737969353; x=1738574153; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QBqjoTrsUdniKM56G4qXF9X4Og44OEoMJTzifBY6c9E=;
        b=Mk+a/G+6vr1BN8wXmR2AxAJZ+ulwGCdaYuf6PeOL32ke+WmK6W06D4IpC5Wb6uxEC+
         za/YSj7yo2mXvK3/nyo273k4LSRMdY8CApSCLEEIRQzdY32redtZOb7csWpBHt199+Xo
         DGDulDf4vglDReZfTlvExL7e6z/ArbJI/ut5UM82W+sc6sgmW7nArroClpSXh3elC7uz
         TPd0SHQkbeXMzTYtyHjvxt91++KMqY5sBCmZzjbBBKfsR4n2yLQ/gEBB81gfO5HXlRut
         cDJqR1CLofqFqJOmuwUBcbhH61z3tIXF5z/tbQ97FHw8fYU/9OUDiiv85DRPjRckYrST
         cWgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737969353; x=1738574153;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QBqjoTrsUdniKM56G4qXF9X4Og44OEoMJTzifBY6c9E=;
        b=uimyszQ4YnerKAbglXCiwg0S7uYBQ4MkdpVwmxWquUNxQykZNYDeFxB2L1ANCOuPjn
         xIBfJj7To3DITTuEcIvGWV/u9mnUbw0INAMPWbOz/AfudNgQGIIWNnEiHU5rxs2oQ2+l
         dl4xsrKCcUodBodOjWsPNhBXiC54QWkRngVa8X8JHSD9M5tVFQYFlNQk5saeiHm5USGK
         meaCur3cSm6xCF+Hn6Y41Qwg7xPk6ebH412MJAyyGrm+02pKunVdhfN2d3+5VLCzpdj8
         vJ7gSE1ZxBrSb0pN3gcjz8/5tlEs4HGmeAA/z8BOR0gWYbuNPVVGAuzGh5DISUARSS4q
         V+Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXb3Z5FEqfH9bKlsJ88rbBErPqz0xcJm6DrX6EvUO4aG6BO3E6gpjXhBcpFtxpSIcUSDvSQYJYr/pk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyljOR2dNdxdN8M+isUnVF0o49nejRfYdmDdG5owEKprX2/Tehi
	OiGHNEft0Idcz5w1BRf+IEBmWARVYBe9T1JKE4oWyMy/0NdTn8Ytl8Znv9TT8tA=
X-Gm-Gg: ASbGncuGtOaEqYcjNbxL5uauOOiIsPcfKSmgQFfUus6hTZrgKZ956XBXmhQDx0F9xHk
	4LYsEx/FIj89hNulXea2Ad0mRp1I3VOJOZe0wWF7vRt5FzvFfibQcXnS8hkIQNUJdcR1jsBFmm/
	lSK1Gm8AkCxB5VkMmABQBpTsgq3zLDqM0PB2rel0TFjKk5aOvtaYof4SYNAl896U6JklHOByXgq
	tppAGmI6HUKJ530BBY/HIcR8w1mSTvTeA9FVWzgexMCafH3IS4jtrG1imlKbbsmHjiqmKfHt8ZL
	WY4IbfMnyZ6N
X-Google-Smtp-Source: AGHT+IGH2u1eK/B2vFgK4fpD5Gq2Q6iaPMn6CotExrSV6h3jJObH/bOJSe5pLBi065ce7RjDuJEklA==
X-Received: by 2002:a05:600c:4710:b0:434:a59c:43c6 with SMTP id 5b1f17b1804b1-43891451388mr301531235e9.26.1737969352480;
        Mon, 27 Jan 2025 01:15:52 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd502007sm123494365e9.14.2025.01.27.01.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 01:15:51 -0800 (PST)
Message-ID: <3efa204f-ed98-42a4-a708-828bcf1f976a@tuxon.dev>
Date: Mon, 27 Jan 2025 11:15:49 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] thermal: renesas: rzg3s: Add thermal driver for the
 Renesas RZ/G3S SoC
To: Biju Das <biju.das.jz@bp.renesas.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jonathan Cameron <jic23@kernel.org>, "rafael@kernel.org"
 <rafael@kernel.org>, "daniel.lezcano@linaro.org"
 <daniel.lezcano@linaro.org>, "rui.zhang@intel.com" <rui.zhang@intel.com>,
 "lukasz.luba@arm.com" <lukasz.luba@arm.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-5-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUDKFRsZWsZG9DY4PHdxQEDoPqzfeRx8MNTreOpxdLvpw@mail.gmail.com>
 <20250125121826.6abbe7de@jic23-huawei>
 <3c7f5a92-254c-4ce1-9813-80c98c1f549e@tuxon.dev>
 <CAMuHMdUPPTyuJuWDEuHFT8EQCTVpy5=UtDh9GajdWUvZBNqy0g@mail.gmail.com>
 <TY3PR01MB113465C742C78714F7BC09D5786EC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <TY3PR01MB113465C742C78714F7BC09D5786EC2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Biju,

On 27.01.2025 11:11, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: Geert Uytterhoeven <geert@linux-m68k.org>
>> Sent: 27 January 2025 08:55
>> Subject: Re: [PATCH 4/6] thermal: renesas: rzg3s: Add thermal driver for the Renesas RZ/G3S SoC
>>
>> Hi Claudiu,
>>
>> On Mon, 27 Jan 2025 at 09:33, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>>> On 25.01.2025 14:18, Jonathan Cameron wrote:
>>>> On Wed, 22 Jan 2025 11:29:19 +0100
>>>> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>>>>> On Fri, Jan 3, 2025 at 5:38 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>>
>>>>>> The Renesas RZ/G3S SoC features a Thermal Sensor Unit (TSU) that
>>>>>> reports the junction temperature. The temperature is reported
>>>>>> through a dedicated ADC channel. Add a driver for the Renesas RZ/G3S TSU.
>>>>>>
>>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>
>>>>> Thanks for your patch!
>>>>>
>>>>>> --- /dev/null
>>>>>> +++ b/drivers/thermal/renesas/rzg3s_thermal.c
>>>>>
>>>>>> +static int rzg3s_thermal_probe(struct platform_device *pdev) {
>>>>>> +       struct rzg3s_thermal_priv *priv;
>>>>>> +       struct device *dev = &pdev->dev;
>>>>>> +       int ret;
>>>>>> +
>>>>>> +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>>>>> +       if (!priv)
>>>>>> +               return -ENOMEM;
>>>>>> +
>>>>>> +       priv->base = devm_platform_ioremap_resource(pdev, 0);
>>>>>> +       if (IS_ERR(priv->base))
>>>>>> +               return PTR_ERR(priv->base);
>>>>>> +
>>>>>> +       priv->channel = devm_iio_channel_get(dev, "tsu");
>>>>>
>>>>> Given there's only a single IIO channel, you could pass NULL
>>>>> instead of the name, and drop "io-channel-names" from the DT bindings.
>>>>> I don't know what's the IIO policy w.r.t. unnamed channels, though.
>>>>
>>>> It's supported, so fine as long as no future additional names show up.
>>>> Will just fallback to index 0 I think.
>>>
>>> If everyone agrees, I would keep the name, too, to avoid complications
>>> in case this IP variant will be extended on future SoCs.
> 
> If you are planning to extend this driver to other SoCs then may be update

I don't plan to extend it. My point here was to keep the driver as is for
any possible future extensions that might arise.

Thank you,
Claudiu

> KConfig with dependency on ARCH_RENESAS? see [1]
> 
> [1] https://lore.kernel.org/linux-renesas-soc/20250118-trout-of-luxurious-inquire-aae9aa@krzk-bin/
> 
> Cheers,
> Biju


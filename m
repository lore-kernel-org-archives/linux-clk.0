Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D375D280CF1
	for <linux-clk@vger.kernel.org>; Mon, 19 May 2025 14:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747664000; cv=none; b=Py8psafwF4RFarXcnXVrL0hH/erVoxZWOgaQG7gyj/AqdC2DroZj7b8aBeDJoyz7tEiJjOf4SNh4oSJ3tikxuhu9f0+3f6FgrA5K6dFX4OAzrH4Gveme8QHMw9Llp2kYAMaWH5tE9Hxpo0meXZbYzY6dssO7ShgK0oULl+jSVFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747664000; c=relaxed/simple;
	bh=xlUjVhdSM45iKhQBtkcvtC7cbQZstnoShLyP7suNvXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HAFH8k7av6coSMOUVejKkqhIAOfkyZMFCHu2n/5HCUXxOUTalLV0kKuS5Armgzc+0xoIMZfAFa/jrxzdbXZv38rrePOGJbkrwgLXULknuZ3yD8K/+BnHH/IdAhoRMFS/Vw8OoKyX9ZFIHQx1lhAD0g7sHJ0ni2BojRi6jS3Uz7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K7RCb3WZ; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K7RCb3WZ"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f6f86580ecso958472a12.1
        for <linux-clk@vger.kernel.org>; Mon, 19 May 2025 07:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747663997; x=1748268797; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qzrFKt65Uy0OGyAb2qmvvRs7v5X4OUoqBgOsMXxAJ8w=;
        b=K7RCb3WZ12fA6M+fmAhi4EGy5JOItFegEEM+Wda8LrRx/sni3CWv+BT3oltZU9ZO0U
         aBPZEm/cK1fKsD4lf1PgDdemDyfhCJVdPOqt97P+CMtPz8C9Hq0q6esQu7QFxlx9hSDu
         nhrub0lQnQXKRFqYjjgYIVJAxe6SCqieotomuWM1T6EBIahd15sDGuQkiQ69xJsuyUSs
         E9/FK33NCXTStSOK18bzaMXusRpifhZ+fR7+FLIiUvhhg5z9ATRKYSdL1QvyNni3+aGq
         p86Sf2TJxYzX63V6njZRjZfRX4QjhKakJCuQItZYQz0PKY801NiUBX8qd5wGW8gKEMAy
         gePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747663997; x=1748268797;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzrFKt65Uy0OGyAb2qmvvRs7v5X4OUoqBgOsMXxAJ8w=;
        b=QifofsHQhf9/Vlvhky8thbnloMBzihx+s2Wyx2YvEZKb2y2Lj+wCxLbTkTvYz+ootq
         cAxUJbBky8zT0Ehf5ZrGKbcR432LlZZwxRDWFHvbBJXb+E41qJmER485AyYUHQrUhngq
         SMQKaKNm/7chNJoHOUbbg/kExzcNN5rSClJfzEmGzkjugD9lwOe7UKZ4o/2od7kknDWT
         OaRuG/9ZphQI46WIFM7GdmEAvntY2VuRB0r2TSE8o4Tc4zCc7pJ85B1Rq9eg6bpCPWmR
         Nmqm2Y3XUOFIjwp0EUQGDHHdEP8usPqfhKn2zyq2mXpNnm4Jcl8hOeH6CqiWr1VP06bm
         AiXg==
X-Forwarded-Encrypted: i=1; AJvYcCWkaqU3GNfG3CLtPVCzTRCMlEfhcLeICJA1bU56zPPJU6tS8B/oJla8OKmZ7AY2VvOM7fRH038RDps=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAzXoa3yoA7RrP2BQh6fOCXNMTWK1FMPzbn6zBgX+e2BFr7r0v
	uCz7N0bQ2RG6lt4Nd1cCxLugpCd9UPlp028kR/IwCDL6f3rm/Mhe/eiOJuOsKeprZnI=
X-Gm-Gg: ASbGnctV7t/GNy3MT+msdK5R88iNpiEOvs7SQo+eU4jugx0qaRRzS4szGMun+o0FLBU
	8SCJbrraIYJsTm05+8R0gbNByzJe51yBA0rA7QSgEex+Gd+t0ZZ0ElwSVCP3QufqYsD+ubZu3ET
	LvLUGifWtbu/n56DhkXT03/yr57OqcCgW1ejZNymAteFMV1hSXXkJALbBitEColSfvuVw1k61BM
	3//tin7l+MrB9+8n8Qsta/TifOp3vHNGxokvJUqpknnS9LOcU4epo1WhXzwvrnxQYCP54I2gQM/
	D/tMd3PGhsQO+AfA8Zdp/AsiyoBQ3N+XLoSrR1TLYZg0AnCRxJrMx7TWHpgwpKQWt/r77c8=
X-Google-Smtp-Source: AGHT+IFCaQiB8HEcyuZfumBWFJUguzUHV0h/caqGhqdgCvM9YIWgVpFLJ8uSJg1mzgD1udFMqMDz/w==
X-Received: by 2002:a17:906:8a7a:b0:ad2:3c44:2a3d with SMTP id a640c23a62f3a-ad52d49a064mr325055566b.4.1747663997023;
        Mon, 19 May 2025 07:13:17 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4cc5dbsm592231766b.169.2025.05.19.07.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 07:13:16 -0700 (PDT)
Message-ID: <c929b7d8-6348-4978-824e-6902d0364a00@linaro.org>
Date: Mon, 19 May 2025 16:13:14 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next, 1/1] clk: imx: imx8mm-anatop: probe only on i.MX8MM
 platforms
To: Peng Fan <peng.fan@nxp.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-amarula@amarulasolutions.com"
 <linux-amarula@amarulasolutions.com>, Mark Brown <broonie@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
References: <20250516134945.14692-1-dario.binacchi@amarulasolutions.com>
 <PAXPR04MB8459312B18CBAEDF9192A188889CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <PAXPR04MB8459312B18CBAEDF9192A188889CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/05/2025 14:58, Peng Fan wrote:
>> Subject: [linux-next, 1/1] clk: imx: imx8mm-anatop: probe only on
>> i.MX8MM platforms
> 
> DT Maintainer Krzysztof NACKed [1] because of ABI break.
> 
> Are we continuing breaking the ABI? 
> 
> [1] https://lore.kernel.org/imx/6a28f9bb-05fa-45ff-8c0b-790c0caf3252@kernel.org/T/#u
> 
> Regards,
> Peng.
> 
>>
>> Commit 9c1e388af87c ("clk: imx: add support for i.MX8MM anatop
>> clock
>> driver") breaks boot on i.MX8M{P,N} platforms.
>>
>> Here's the log for a board based on the i.MX8MP platform:
>>
>> [    1.439320] i.MX clk 1: register failed with -2
>> [    1.441014] i.MX clk 2: register failed with -2
>> [    1.445610] imx8mm-anatop 30360000.clock-controller: NXP
>> i.MX8MM anatop clock driver probed
>> [    1.455068] Unable to handle kernel paging request at virtual address
>> fffffffffffffffe
>>
>> ...
>>
>> [    1.634650] Call trace:
>> [    1.637102]  __clk_get_hw+0x4/0x18 (P)
>> [    1.640862]  imx8mp_clocks_probe+0xdc/0x2f50
>> [    1.645152]  platform_probe+0x68/0xc4
>> [    1.648827]  really_probe+0xbc/0x298
>> [    1.652413]  __driver_probe_device+0x78/0x12c
>>
>> In the imx8mp.dtsi device tree, the anatop compatible string is:
>>
>> compatible = "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";
>>
>> So, in configurations like arm64 defconfig, where
>> CONFIG_CLK_IMX8MP and CONFIG_CLK_IMX8MM as well as
>> CONFIG_CLK_IMX8MN are enabled, the driver for the i.MX8MM
>> anatop is incorrectly loaded.
>>
>> The patch fixes the regression by ensuring that the i.MX8MM anatop
>> driver only probes on i.MX8MM platforms.
>>
>> Fixes: 9c1e388af87c ("clk: imx: add support for i.MX8MM anatop clock
>> driver")
>> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>>
>> ---
>>
>>  drivers/clk/imx/clk-imx8mm-anatop.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/clk/imx/clk-imx8mm-anatop.c b/drivers/clk/imx/clk-
>> imx8mm-anatop.c
>> index 4ac870df6370..90ff11a93fe5 100644
>> --- a/drivers/clk/imx/clk-imx8mm-anatop.c
>> +++ b/drivers/clk/imx/clk-imx8mm-anatop.c
>> @@ -37,6 +37,19 @@ static const char * const clkout_sels[] =
>> {"audio_pll1_out", "audio_pll2_out", "
>>  static struct clk_hw_onecell_data *clk_hw_data;  static struct clk_hw
>> **hws;
>>
>> +static int is_really_imx8mm(struct device_node *np) {
>> +	const char *compat;
>> +	struct property *p;
>> +
>> +	of_property_for_each_string(np, "compatible", p, compat) {
>> +		if (strcmp(compat, "fsl,imx8mm-anatop"))
>> +			return -EFAULT;

EFAULT does not seem like proper error code for ignoring probe. I am
pretty sure it leaves you with dmesg regression.

Probably you wanted to fix driver matching. Otherwise your compatibles
are just wrong.

You claim with this:

	compatible = "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";

That 8mp is fully compatible with 8mm, yet here you claim that 8mm is
not handled. So it is both compatible and not compatible.

There is some gross misunderstanding what the compatibles mean. Please
look at DT spec. Shortly explaining: fallback (8mm) means new device
will work somehow correctly, but maybe with limited features, with the
driver when bound by the fallback.

Other meanings are most likely wrong.

I consider that "Support spread spectrum clocking for i.MX8M PLLs"
patchset broken (to which I was pointing on early discussions) and
should be dropped. Don't fix broken stuff with more broken code.

Best regards,
Krzysztof

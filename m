Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B293227A462
	for <linux-clk@vger.kernel.org>; Sat,  6 Sep 2025 18:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757184730; cv=none; b=pzgmd8cmJQKMqg5eLozBAxiw8dSG5WOvhT9fV1Lfhw0zd6AQ5fBwo9p0n6KJkZhJMa03YtPJjYqO5I+QLmCCWOP7fXLFUtJYlW9RWUmMOiwsd8DYg4STWA3MZGDhInWExKFq+CrZQCIVZnVf8Y72ebURQwowCf8IkYCrdojId/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757184730; c=relaxed/simple;
	bh=AXwT0kHloCdjCQXQT0QNKgsw9c361exmwtf2WiUe9g0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LmIflyP73iyNPLvHiLNonezE4XCs0RiETAtgspQE3jndxKsrXpqvm3CMlvUwKA9y9zk+pq+x6Fg8b5Boo2twZ4M8+2rNDkMepuM57dWsr24xCe/HkuT2GfWOEZu1XS0uIfr9IArv6gvgkTl+sFQRIuMGOgRDDg/134pU+shxsZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=J2jc4APL; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="J2jc4APL"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45b7722ea37so16448665e9.1
        for <linux-clk@vger.kernel.org>; Sat, 06 Sep 2025 11:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757184726; x=1757789526; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nYHy1RYaZz8qwqLoCLiBztSqW0ycyPrtnmbrVy9V3QA=;
        b=J2jc4APLfQCD64LPpYHb6WczF4Fgr2TY99RQ3r19ljesYTCj4je7CqkL/Kodvq1Ta/
         e4M0Y6bNmdhHhZ0/d5BhmVWmjDvpMJtH+HlErJ//Uj49H6fO7xogW4AB2ujDCn2otE3t
         4Ali7b2iEl3WdDe7W4IlDWOgoZe5UQ3oQjWO0k1wKdnS7+KouDZFqaJlycIBeRVO+haf
         WvRk7iDPIPKeT4ipuEuvGRNyyz085BeRrERidt3D6+TM0qV4W45aBKyT6h4e2vDpmy04
         q/7IIwEKdbU5y9KISHtzalk6faUweEfXNQtpRjo/8ioL6VvRAiQWKzbFhLRQ13UDek4K
         CDnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757184726; x=1757789526;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nYHy1RYaZz8qwqLoCLiBztSqW0ycyPrtnmbrVy9V3QA=;
        b=W5crQ7fLZ4e25mPEzFmAbXtmiFoV30UdUAW4JiBEkvfFYZbbrriBgNj119Jk1/ktvA
         iH6+dfK+zl1/paZ4Qntwd7QD7A2OqdE78R/ewjXGfncBq2i2edxXsktNURe803yIgE+I
         sb5elNexN6AiDTjMWAU0hQ6ija96gjbzuJ09WgQOwhhM5OH+57jlkXsT3ZmWmvgW5Cl4
         Ydvv58m2l93wiPI0a/oUIevD3zzDh9rX/3SpmpbmMo35tU05iWv+FIcVDr09IJCv+Pus
         vbPhFbRcFHAPxNn22VfnEQrQas0O3bIUM0ViuxLLrRyE6LmxJvrjXkbiA0PwuPvWWnnB
         g09w==
X-Forwarded-Encrypted: i=1; AJvYcCV0/F0sx1NzFdPEplw8qwWPxcfcaWyggs4M7rEP+HfFu9MwHgA6KjeUepBrIMpfH/T8xD+KgQmcKSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgWrFtpya0YrZ1kA9DN86L9mEa3CytIuVlfQWa9P6WscBUfTR+
	yR3MIkD6PPme4R9p3S3uKX42agCJU9+mPt8Hv96Q90jFG03kuKMrZK4r/mcq82BZYjH/oRnjKyt
	0k17c
X-Gm-Gg: ASbGncu6HsvuUvYjVcpzzt9Olb58PgcJhKOSXV7wrNJ2f+CG4m/xwUDFCO6B3i8zaH4
	zdwNmAkR78yaj5iuMaPvXc5SW6Up7meHhBBgdtUR36hOjHeejI0zo6/ol6dRn1xcJhjnQED1lR5
	rzWlwA2N46Lu9zG7A0yZfBtvLjlm5fz1ZldYyVbEYU+zdP2pbvFiHyvr30cFlnft3AwVkge4KTu
	h73ZR2zKZuD9hCaqQOsCco4CHaw8IpY1ahqVEv9CrHPmwrrSsHCxIYLfave3Gq0N/z0nZ7ImM6P
	Dz6+IhDgPGI55m6sP/Aveo05key5QhquE9goMAlLh9MLZWVedjmgDDMnKW7+63ppUcmW6M3dPG+
	W/1v3/OgzPWrcpuA36hrr52F5uWpJuZh6UjtQu/herA==
X-Google-Smtp-Source: AGHT+IEpMP6ACL8oRBA8hTz9DJ0XgNVlGBZlDBNrI3mU0DI00pLaSesHNRCSOeWsnURabXbOB6R20Q==
X-Received: by 2002:a05:600c:8b5c:b0:45b:9b9f:88cb with SMTP id 5b1f17b1804b1-45dd5b78584mr60223555e9.16.1757184725986;
        Sat, 06 Sep 2025 11:52:05 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45cb687fe4esm150076175e9.23.2025.09.06.11.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:52:05 -0700 (PDT)
Message-ID: <41cf6626-ce6f-408f-bcbd-299866d70fe0@tuxon.dev>
Date: Sat, 6 Sep 2025 21:52:04 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 26/32] clk: at91: at91sam9x5: switch to parent_hw and
 parent_data
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <95cbe3653752bc3c0b6f068949706313e3778fe5.1752176711.git.Ryan.Wanner@microchip.com>
 <10f016fd-2ceb-40b0-a81d-9c5663f65191@tuxon.dev>
Content-Language: en-US
In-Reply-To: <10f016fd-2ceb-40b0-a81d-9c5663f65191@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 9/3/25 18:16, claudiu beznea wrote:
> 
> 
> On 7/10/25 23:07, Ryan.Wanner@microchip.com wrote:
>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>
>> Switch AT91SAM9X5 clocks to use parent_hw and parent_data. Having
>> parent_hw instead of parent names improves to clock registration
>> speed and re-parenting.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>> ---
>>   drivers/clk/at91/at91sam9x5.c | 125 ++++++++++++++++++----------------
>>   1 file changed, 65 insertions(+), 60 deletions(-)
>>
>> diff --git a/drivers/clk/at91/at91sam9x5.c b/drivers/clk/at91/at91sam9x5.c
>> index 13331e015dd7..f6138622ab50 100644
>> --- a/drivers/clk/at91/at91sam9x5.c
>> +++ b/drivers/clk/at91/at91sam9x5.c
>> @@ -38,9 +38,9 @@ static const struct clk_pll_characteristics
>> plla_characteristics = {
>>       .out = plla_out,
>>   };
>>   -static const struct {
>> +static struct {
>>       char *n;
>> -    char *p;
>> +    struct clk_hw *parent_hw;
>>       unsigned long flags;
>>       u8 id;
>>   } at91sam9x5_systemck[] = {
>> @@ -48,12 +48,12 @@ static const struct {
>>        * ddrck feeds DDR controller and is enabled by bootloader thus we
>> need
>>        * to keep it enabled in case there is no Linux consumer for it.
>>        */
>> -    { .n = "ddrck", .p = "masterck_div", .id = 2, .flags =
>> CLK_IS_CRITICAL },
>> -    { .n = "smdck", .p = "smdclk",   .id = 4 },
>> -    { .n = "uhpck", .p = "usbck",    .id = 6 },
>> -    { .n = "udpck", .p = "usbck",    .id = 7 },
>> -    { .n = "pck0",  .p = "prog0",    .id = 8 },
>> -    { .n = "pck1",  .p = "prog1",    .id = 9 },
>> +    { .n = "ddrck", .id = 2, .flags = CLK_IS_CRITICAL },
>> +    { .n = "smdck", .id = 4 },
>> +    { .n = "uhpck", .id = 6 },
>> +    { .n = "udpck", .id = 7 },
>> +    { .n = "pck0",  .id = 8 },
>> +    { .n = "pck1",  .id = 9 },
>>   };
>>     static const struct clk_pcr_layout at91sam9x5_pcr_layout = {
>> @@ -133,25 +133,16 @@ static void __init at91sam9x5_pmc_setup(struct
>> device_node *np,
>>                       const struct pck *extra_pcks,
>>                       bool has_lcdck)
>>   {
>> +    const char *slow_clk_name = "slowck", *main_xtal_name = "main_xtal";
>> +    struct clk_hw *main_rc_hw, *main_osc_hw, *hw;
>> +    u8 slow_clk_index = 0, main_xtal_index = 0;
>>       struct clk_range range = CLK_RANGE(0, 0);
>> -    const char *slck_name, *mainxtal_name;
>> +    struct clk_parent_data parent_data[6];
>> +    struct clk_hw *smdck_hw, *usbck_hw;
>>       struct pmc_data *at91sam9x5_pmc;
>> -    const char *parent_names[6];
>>       struct regmap *regmap;
>> -    struct clk_hw *hw;
>> -    int i;
>>       bool bypass;
>> -
>> -    i = of_property_match_string(np, "clock-names", "slow_clk");
>> -    if (i < 0)
>> -        return;
>> -
>> -    slck_name = of_clk_get_parent_name(np, i);
>> -
>> -    i = of_property_match_string(np, "clock-names", "main_xtal");
>> -    if (i < 0)
>> -        return;
>> -    mainxtal_name = of_clk_get_parent_name(np, i);

Same here, and same for the rest of conversion patches.

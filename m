Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D913B19C
	for <linux-clk@vger.kernel.org>; Mon, 18 Mar 2024 20:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710793072; cv=none; b=FcCm04XLIyXRio3NEjMpFyoLGcoYOfxbzMtH7lQyHPh9JKuzymakVZ4GPtgrl86enywfLYMZ4Qk7JDPnAxti5gMyddFZGMp4+XNt6x1kWNxuHkQdMea10Ea0eANRFC+cECunmorVOC2B4dQY9wIdhCS11Nw2iJlCxfUhGvxtY4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710793072; c=relaxed/simple;
	bh=2a/s7mDDRqYelu3/00RIsORLQ/R2WRP9RJNEVPTqkgg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RmvMIJUpliNW8LLoLu5zu3iAT0f1VvxJA+5yCC2fFtYcyRo+NGhcWbZKXkjmeEmK1xQIzBsOiH9+ym0bEAjsvzBvOFz4GGkoFxcrZoaXVgGjprPFaGU68QaMzgA+Vl8Cwo5UWsgMuACN+GP3OHwqNo+9nL3ue2TfRw+tIel+5aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Z3UVBVCZ; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Z3UVBVCZ"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so5556304a12.0
        for <linux-clk@vger.kernel.org>; Mon, 18 Mar 2024 13:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1710793069; x=1711397869; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u1VK2UrvRK1GqfS+jZTcmyrPbAehgKhpyQhy7X6GkE8=;
        b=Z3UVBVCZnDJ9Zvrv9Ei/oBLg+jd0/t7RdrbMVcUXIADSX+12Dvrv2GnDbIwme+9NtN
         gcrLhsTCXLGHCwqQUn42Z74vgImQjKGG6pd5edE11i3kVE5SVW7van+dVBMaLxLqc2QQ
         /Rapb3gGffmbxnFu7/9kz0Y37ssoFUoCxo517U4oM/GcWjmmp0rU1qa5kBmj3y3G0aki
         OrU0lyRRLpxZav+NG3jSw4mxyv/HajZFzAkOL/Avcmcvcs1SOnTeJ7FiJAuT3LHt/Pxn
         f0Gu5UmxKGBqP5AVoEuyozZWdUAgiNY8aq5IEQViOpoCMw48Ws2ESVxiLsS0ToNdCqdn
         McnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710793069; x=1711397869;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u1VK2UrvRK1GqfS+jZTcmyrPbAehgKhpyQhy7X6GkE8=;
        b=e0BZJF995mb6opYimrPE2sKDH2E6ESa6EIA9bBVPNNP5mOI0E9Ppfny2SpZdhm8Ya+
         NHZlaIewPTH3jNFbJcpOXNHid1id6biY4NVIL/jCn+M3uKId/LitVmYPM7AVWlEjYJy8
         9RxDgpOlENLDA+mZQ2b35Sgxxjyixrnk+ChNtYxGjEA94mVhPr34YK/3Bl7vYONb/ZKb
         d4RgsO48zstzDrT0buIsqhIc856PrPEo4Tp3+tl0LklP78l16vS2Wjab65X9F8tQeJ+1
         MR0UaCOw8MQVaeSlLCLYjkrS/JFnlMxJZftHMKfMmvYF5JNohhjE40okAueft09Y77ni
         /hrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFVogGLMfW4xG8AZGB/lHvXXXw5z5Y3zEOMe/guTdCBDOi9N/N1OLn5My1NjugNb3XGBSfpWpAb1/yt50p6+0/RQec6iFQ0YA5
X-Gm-Message-State: AOJu0YyKbyI1WVKuWfOf7ufEtkHSpcRYRuD4UzifUox6ySyavzmfAmYv
	6JDLgaBLJV1UphCYtktbs2MYEYVO4ePpQsmH/DYgVsN+G8AH7vWe1MNg8yhjdqo=
X-Google-Smtp-Source: AGHT+IF9T4xVGnEMDWOvmebwvh7RSH//MnjXmlytzIKhD9eeivlJmumrE3KnhdTbwCwawu0TsPm8Jg==
X-Received: by 2002:a05:6402:4347:b0:568:1882:651f with SMTP id n7-20020a056402434700b005681882651fmr276209edc.25.1710793069043;
        Mon, 18 Mar 2024 13:17:49 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id g18-20020a056402091200b00568b6f73491sm3513123edz.14.2024.03.18.13.17.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 13:17:48 -0700 (PDT)
Message-ID: <c6704551-dae1-4536-8da2-ad4764d34503@tuxon.dev>
Date: Mon, 18 Mar 2024 22:17:46 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 27/39] clk: at91: sam9x7: add sam9x7 pmc driver
Content-Language: en-US
To: Varshini.Rajendran@microchip.com, mturquette@baylibre.com,
 sboyd@kernel.org, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240223171342.669133-1-varshini.rajendran@microchip.com>
 <20240223172831.672953-1-varshini.rajendran@microchip.com>
 <01e96d4b-3038-498b-a9b2-2acac51f1d80@tuxon.dev>
 <e84994fc-7ec1-4d65-84f6-efc6a47b0c2f@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <e84994fc-7ec1-4d65-84f6-efc6a47b0c2f@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 18.03.2024 11:25, Varshini.Rajendran@microchip.com wrote:
> Hi Claudiu,
> 
> On 11/03/24 11:28 am, claudiu beznea wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 23.02.2024 19:28, Varshini Rajendran wrote:
>>> Add a driver for the PMC clocks of sam9x7 Soc family.
>>>
>>> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
>>> ---
>>> Changes in v4:
>>> - Changed variable name alloc_mem to clk_mux_buffer to be more
>>>    suggestive
>>> - Changed description of @f structure member appropriately
>>> ---
>>>   drivers/clk/at91/Makefile |   1 +
>>>   drivers/clk/at91/sam9x7.c | 946 ++++++++++++++++++++++++++++++++++++++
>>>   2 files changed, 947 insertions(+)
>>>   create mode 100644 drivers/clk/at91/sam9x7.c
>>>
>>> diff --git a/drivers/clk/at91/Makefile b/drivers/clk/at91/Makefile
>>> index 89061b85e7d2..8e3684ba2c74 100644
>>> --- a/drivers/clk/at91/Makefile
>>> +++ b/drivers/clk/at91/Makefile
[ ... ]

>>> +static const struct {
>>> +     const char *n;
>>> +     const char *p;
>>> +     const struct clk_pll_layout *l;
>>> +     u8 t;
>>> +     const struct clk_pll_characteristics *c;
>>> +     unsigned long f;
>>> +     u8 eid;
>>> +} sam9x7_plls[][PLL_ID_MAX] = {
>>> +     [PLL_ID_PLLA] = {
>>> +             {
>>> +                     .n = "plla_fracck",
>>> +                     .p = "mainck",
>>> +                     .l = &plla_frac_layout,
>>> +                     .t = PLL_TYPE_FRAC,
>>> +                     /*
>>> +                      * This feeds plla_divpmcck which feeds CPU. It should
>>> +                      * not be disabled.
>>> +                      */
>>> +                     .f = CLK_IS_CRITICAL | CLK_SET_RATE_GATE,
>>> +                     .c = &plla_characteristics,
>>> +             },
>>> +
>>> +             {
>>> +                     .n = "plla_divpmcck",
>>> +                     .p = "plla_fracck",
>>> +                     .l = &pll_divpmc_layout,
>>
>> You mentioned in "[PATCH v4 24/39] clk: at91: sam9x7: add support for HW
>> PLL freq dividers" that this has div2 but it is registered w/ a layout that
>> has .div2 = 0.
> 
> This is handled in the above plla_fracck fractional part as defined in 
> the plla_frac_layout.

Ah, right. I missed the changes in sam9x60_frac_pll_recalc_rate().


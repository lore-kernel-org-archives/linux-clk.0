Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0986825332E
	for <linux-clk@vger.kernel.org>; Sat, 10 Jan 2026 15:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768057405; cv=none; b=miAmd9Tc0AXLKaz/uG2MakiTmsNyzMZXXVhToTzM1F7zq/ZS84rX6oHfS+d2CP86+Sj5gqy407Q9Ft34neIrZhubdZHqvy4eUBzvXLFLeCb8hJlojMPmR2ThQff9N6yHkrArfnzPd99kV/DTy5jJa73NKRJaR/cX4jsAwgz8CqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768057405; c=relaxed/simple;
	bh=eXK4ig+LMC8/45Zm1sPkAIst0O35fg1hHP6hf/VGUMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XhsKDxRzNRfyjMvjdsHaumqK8MoX30Yz13W2f1cN1B+/YzS1njfOi3IZcKP9VjCIMIx2gAsbLYtnF7UTnSFgjnRGm9N5aYNKLEu6XRQtAjrXJGAylbTr43XG+FEb8C0Mm7rwI+E9Y45Y03IdXuP2Hd7L08nyb6vU5kxFfXpTHMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ZKay3EF3; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ZKay3EF3"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64d02c01865so8534022a12.1
        for <linux-clk@vger.kernel.org>; Sat, 10 Jan 2026 07:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768057402; x=1768662202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5N1miC9eVACfUePlD2aX/h3g2e1YcWNd2wzjqT16Zso=;
        b=ZKay3EF3DxcZm2l1XR7JtnXOW0kEg4Q+GrDxIvutp+f0FzQYshmE2veMlnlNr0bBdj
         iRnJ+9Z16CK5426NiVUYAxhcIUAJ+vpON195+oboJLM5mfewuHQ40e721vgV5tspa0ja
         zqNNvTsQeC98so1WaRTHsirTWHK4UzbCYz82974cvZMAQM7KuRZljni8Zm0E1tc7L489
         qrDnVA1z7GX00VUVFbOcwczo/LZvA4QQmeY+fCN2sUzb1asHGCho/QHHxpFNojoKs5kH
         ygQ3CMb0aD+8mCpXqUxabUkEkQtLuoNQ7JVQzx58PqQfpiQcRluDl0qs6SLhKgVLD5B1
         bfnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768057402; x=1768662202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5N1miC9eVACfUePlD2aX/h3g2e1YcWNd2wzjqT16Zso=;
        b=IkcL1As+V8zQ8ZbMpZ4voO9J1qhBlTfRyHP++i5Q2dGCi0Aw1xIXU3YOYkEGKKDC3K
         9o5eoFKD318wf6JCN1QWQonrkJADZBf3UI7Y+xffVA4BV7qZ/275sVzr1ATUd1HLStpI
         8G+ZFVsjLpt4luN116G9U/k//yyE+fz8LfN1KirlgZGYmhTUhKn+AxCUbmKa6lVE+z6q
         5jNqa+NWkEfFRP4LjzpLwPsBK04HqUL+wXrX/NVCcocECC19T8FlyJVZp8H4g14lNivb
         wFFBBQ9P3nZijKYQlUYBX0Ih9E9NbF2ESLa3/aiNQ6wLIXDcTXHYECZ4dEdu6VaVvG3z
         dgvg==
X-Gm-Message-State: AOJu0YykY+XMIAtUtcD/fZuaJtUOzj8GDMxcwnI03C+aKQerPQvWJwVn
	ucX0NWYjt9sihN8iY4gRddyuUgC0G4/H4weu+rMTehn2+iTJ90BHPKrhX9uJgPB4jL6P8ILiV/l
	LEkNE
X-Gm-Gg: AY/fxX42E03uv6zj+WZgYCt1xXsvaaItEMj9rezcnJpzzMLTqCCI0jSsf+BL09Y2RqQ
	xPm3qB3yDbxHmYPGiW9cSKkfXrm6WzO4qgZn4TGNy/5d0LNVyWq2hJ2BLSbowh1T8ezLdi8AO3d
	C5k3aXBPobCseuapMXBoY1gOQp+z2LCcsO+FxkXiSJHvEOtELL7eT0a2QfdrbYFqwMT/1Nrwce+
	FbkFuzJ4hHM1oY6WHekNNhwSZysnLua82/8d8qQC20BF6xE1jeekqryuP/xRCeXee016M17PXQm
	kfOeVjYayXNF9bpVm+6oTlPxAlmT5ufjukCldsBZI+yw35O8+tjvlDQxqHlBEHJt7D0Fmq8Y3Tz
	f9AxatiWNvoF8Q8aUSnCGjmgfkzdJLltkKJNHrp9eRYBP1Ue23yOMCiIDI7cs8rnfDCRcpDbKZD
	61z3I9hOnXj9nOohz88g==
X-Google-Smtp-Source: AGHT+IHaWhSM19cCp0YqzDorDOXvKVjCzix83PyP8GROo+XI/axIv7q7HlX7FUG1DTQizKZCY8BoIA==
X-Received: by 2002:aa7:df9a:0:b0:64b:9fa4:b586 with SMTP id 4fb4d7f45d1cf-65097e71207mr11073823a12.25.1768057402414;
        Sat, 10 Jan 2026 07:03:22 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf66214sm12929650a12.27.2026.01.10.07.03.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 07:03:21 -0800 (PST)
Message-ID: <81e9c0ea-ca06-4cb9-8f5f-08fec370812b@tuxon.dev>
Date: Sat, 10 Jan 2026 17:03:20 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/31] clk: at91: clk-usb: add support for
 clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, Nicolas.Ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Varshini.Rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <6979b3734462c97381159f3968a3f22b6193e04d.1758226719.git.Ryan.Wanner@microchip.com>
 <27aab227-01e3-4074-8aab-38623b4d9808@tuxon.dev>
 <14ea374c-2889-4bc5-b0c9-fb5b5498593e@microchip.com>
 <cb19cd94-7f81-4f75-a7db-bf25192986ed@tuxon.dev>
 <9b97b3b8-9e46-4482-8420-ebabe00254fe@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <9b97b3b8-9e46-4482-8420-ebabe00254fe@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi, Ryan,

Sorry for the late reply, I was off for a while.

On 1/5/26 19:58, Ryan.Wanner@microchip.com wrote:
> On 12/23/25 07:00, claudiu beznea wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know
>> the content is safe
>>
>> On 12/18/25 18:23, Ryan.Wanner@microchip.com wrote:
>>> On 10/20/25 12:17, Claudiu Beznea wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
>>>> know the content is safe
>>>>
>>>> Hi, Ryan,
>>>>
>>>> On 9/19/25 00:15, Ryan.Wanner@microchip.com wrote:
>>>>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>>>>
>>>>> Add support for clk_parent_data in usb clock driver.
>>>>>
>>>>> All the SoC based drivers that rely on clk-usb were adapted
>>>>> to the new API change. The switch itself for SoCs will be done
>>>>> in subsequent patches.
>>>>>
>>>>> Remove the use of __clk_get_hw() for the slow clocks.
>>>>>
>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>>>> [ryan.wanner@microchip: Add SAMA7D65 and SAM9X75 SoCs to the changes.
>>>>> Change how the main_xtal and slcks are initialized so they match the
>>>>> parent_data API]
>>>>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>>>>> ---
>>>>>    drivers/clk/at91/at91rm9200.c  |  2 +-
>>>>>    drivers/clk/at91/at91sam9260.c |  2 +-
>>>>>    drivers/clk/at91/at91sam9g45.c |  2 +-
>>>>>    drivers/clk/at91/at91sam9n12.c |  2 +-
>>>>>    drivers/clk/at91/at91sam9x5.c  |  2 +-
>>>>>    drivers/clk/at91/clk-usb.c     | 41 +++++++++++++++++++++
>>>>> +------------
>>>>>    drivers/clk/at91/dt-compat.c   |  6 ++---
>>>>>    drivers/clk/at91/pmc.h         | 11 +++++----
>>>>>    drivers/clk/at91/sam9x60.c     |  2 +-
>>>>>    drivers/clk/at91/sam9x7.c      | 21 +++++++++--------
>>>>>    drivers/clk/at91/sama5d2.c     |  2 +-
>>>>>    drivers/clk/at91/sama5d3.c     |  2 +-
>>>>>    drivers/clk/at91/sama5d4.c     |  2 +-
>>>>>    drivers/clk/at91/sama7d65.c    | 24 +++++++++++---------
>>>>>    14 files changed, 72 insertions(+), 49 deletions(-)
>>>>>
>>>>
>>>> [ ... ]
>>>>
>>>>> @@ -882,10 +885,10 @@ static void __init sam9x7_pmc_setup(struct
>>>>> device_node *np)
>>>>>
>>>>>         sam9x7_pmc->chws[PMC_MCK] = hw;
>>>>>
>>>>> -     parent_names[0] = "plla_divpmcck";
>>>>> -     parent_names[1] = "upll_divpmcck";
>>>>> -     parent_names[2] = "main_osc";
>>>>> -     usbck_hw = sam9x60_clk_register_usb(regmap, "usbck",
>>>>> parent_names, 3);
>>>>> +     parent_data[0] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_PLLA]
>>>>> [PLL_COMPID_DIV0].hw);
>>>>> +     parent_data[1] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_UPLL]
>>>>> [PLL_COMPID_DIV0].hw);
>>>>> +     parent_data[2] = AT91_CLK_PD_HW(main_osc_hw);
>>>>> +     usbck_hw = sam9x60_clk_register_usb(regmap, "usbck", NULL,
>>>>> parent_data, 3);
>>>>
>>>> sam9x60_clk_register_usb() could be converted to use parent_hws
>>>> member of
>>>> struct clk_init_data instead of parent_data.
>>>
>>> So this would mean that I would pass in an array of the plls as
>>> parent_hws, and use that to load the clk_init_data struct instead of
>>> filling the array of parent_data as it is changed to in this patch set?
>>>
>>> And this would be functionally the same since parent_data points to
>>> clk_hw?>
>>>
>>
>> It should be something like:
> 
> I see, I guess my question is why the usbclk system only? Is it just due
> to how little parents there are for the usbclk? Or is it because this is
> the only clock that only uses clk_hw for all of its parents?
Because this is the only clock that uses clk_hw for all of its parents.

Thank you,
Claudiu

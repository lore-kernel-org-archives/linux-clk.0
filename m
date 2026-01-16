Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AE234DCE6
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 06:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768546629; cv=none; b=epQBEQhw20YaqjSgwIxkB/YjBVDrGGccIsnz9e7fq/Elwf9JGmarqQLrZXX2WjRqSjh/miA/qyX8FDun7t2gbq7OjPeu8QCkCHZdWsRm4AfIerIV8bQS8pnIKwiWtFLrEmWFZ42eQ/vHxiGPK+K6zf5I7hmZLB7mujXZhn9Buj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768546629; c=relaxed/simple;
	bh=2Y1HPnj46YAjGA6FuYo/pmNgpCKSHqJUYSWyR6X1cyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ruh69IzMX9C13pHQOA6lICPVb9fAdwEc59kPtXH6s1fn5iYCZDKc2DlY5dbe3uWEPIw+sfqF1az94Cv3iDLA+3GDwm/pWkaGqQ5bI7/U0A7H54OB9AWMJYLg8xbKozzY4ool5GvhVhqczmmB32fJkmaNIVwSdwfxs3R34rA6PMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=cMysU+kT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="cMysU+kT"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee974e230so14803755e9.2
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 22:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768546626; x=1769151426; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QRmddyoOkqJyjv4Ewm0evYUf4rsoKHbvJSEbw2chVO0=;
        b=cMysU+kTBlmHlEhzR1XyGa6EMfkuqKclMLASslNdlut103r3kWaFbyaV0cE7GSJQe1
         o3Pa4Z94NIQIVCKeCtgzkWB+8wH4DOPDQ4300BEUEeeVrnWFK/Iwbtv+jWhU/MqTBSFe
         R6kSQE7TRMYO+nTxhSAHwXINiwQje+zDWHZOK4F3+28ETbr+6wLowC91rkMRbY/9J+//
         tZSY9gK7xXOKHYH8OFJ67vF46GcV9ThCqSeNeTth0UBn9C9dRHdUAQ9k9/mdusbSwcbJ
         SCRIURptW+xEHJodo/Au/PS+G0Brl5pySPFbZ81FaknlicPNdKqcD/20Q+X7CxdiZ0/C
         nVdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768546626; x=1769151426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QRmddyoOkqJyjv4Ewm0evYUf4rsoKHbvJSEbw2chVO0=;
        b=AGP7dX7cxkcWPWtzChbGhI60/UPJO1RJoYfna4hR5AmVHzsuSwFKjiyXw37Z02ARLE
         f+Q4btjqbJn+vLtzDQhjBAGyAhbLhB36wOcp84eph9lty3LjWC/fT1Qm+Jmu6Q+VJrgB
         nIxRCehCI0t9YKGLGWWEZ0n2c8ZWnkKqpyMsgUZ98ChKxDeKHaeLu7PtLY9CsEk0nL+r
         v/EUfkVAFTX4NLUM+4Bj2jo7mhFCiyXBIvTFnZrlK+BJrsvzrVEziLMPBD+Hv9bUt0LS
         kh4sxXaF9xtrxcVywjkwZrdLKhkkfMR84m9Io5dz4bfROIVSYf3O0B8Ny04h/erNHy5e
         z2tQ==
X-Gm-Message-State: AOJu0YxKyMXZiy6ZVuKvvntymjkMmnZoIOY+XUJ9Rq3TOdZ1jL+J9G/+
	Rj4E0BBiOh38ESe9WL3dCF/CPS+nhVnCf2pD2Z/O2tks/anZEXokAhmQogKPi1o4FTcpR6KvrhF
	lexeW
X-Gm-Gg: AY/fxX4smYBAMufMeL+G2Y2zlXy+J3ihbX6okaA7VYA3AJOl4iDUAiBalqLKHIvVziG
	nJ2oGRgJ/NPbhEe/Kk8WuKQ2yVVtS50YONcE+ydVR07/8H2FioJXeQEnbYPAKEVP+rtTfwsq6zY
	p2pRhlaVm1A70FjoX+HZ7lqQr9ow//4FAd/XctVon6Y+8RLs7MdA3CTjFZxHRd34kP0OIHCZc7U
	Hk7p+NCyf/1tmfZpXVKwIC9pNLzaWRLZcAZUvK5+XJO73RmVW6ciY13i9C4vwOM6UtCsRjCzt57
	n18JLYqe6H7wwkY8saJHEYE7nEj+7kcYAEzo7iRcjW7OFuQ0VU+9Qa5xUTf/S+SYWZtr3PwXgZl
	zc5ipyk3KzMveDq5IDhqg/7/7tG3WECxfz5QbND08+DTUTO+W2d8Nl70k45cKo0UbBg9uQCNVEq
	SV+H0HCRBmA25fFR1oYw==
X-Received: by 2002:a05:600c:35ce:b0:477:7658:572a with SMTP id 5b1f17b1804b1-4801e33c1b4mr19789625e9.20.1768546625736;
        Thu, 15 Jan 2026 22:57:05 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801fe78fcfsm9603945e9.19.2026.01.15.22.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 22:57:04 -0800 (PST)
Message-ID: <87ae0f02-6a76-4f54-b8d6-121244933b35@tuxon.dev>
Date: Fri, 16 Jan 2026 08:57:01 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/31] clk: at91: clk-usb: add support for
 clk_parent_data
To: Ryan Wanner <ryan.wanner@microchip.com>, mturquette@baylibre.com,
 sboyd@kernel.org, alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <6979b3734462c97381159f3968a3f22b6193e04d.1758226719.git.Ryan.Wanner@microchip.com>
 <27aab227-01e3-4074-8aab-38623b4d9808@tuxon.dev>
 <bf0c00b5-9e7d-47d1-b503-2d27d862a171@microchip.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <bf0c00b5-9e7d-47d1-b503-2d27d862a171@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/12/26 23:25, Ryan Wanner wrote:
> On 10/20/25 12:17, Claudiu Beznea wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Hi, Ryan,
>>
>> On 9/19/25 00:15, Ryan.Wanner@microchip.com wrote:
>>> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>>
>>> Add support for clk_parent_data in usb clock driver.
>>>
>>> All the SoC based drivers that rely on clk-usb were adapted
>>> to the new API change. The switch itself for SoCs will be done
>>> in subsequent patches.
>>>
>>> Remove the use of __clk_get_hw() for the slow clocks.
>>>
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
>>> [ryan.wanner@microchip: Add SAMA7D65 and SAM9X75 SoCs to the changes.
>>> Change how the main_xtal and slcks are initialized so they match the
>>> parent_data API]
>>> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
>>> ---
>>>   drivers/clk/at91/at91rm9200.c  |  2 +-
>>>   drivers/clk/at91/at91sam9260.c |  2 +-
>>>   drivers/clk/at91/at91sam9g45.c |  2 +-
>>>   drivers/clk/at91/at91sam9n12.c |  2 +-
>>>   drivers/clk/at91/at91sam9x5.c  |  2 +-
>>>   drivers/clk/at91/clk-usb.c     | 41 ++++++++++++++++++++++------------
>>>   drivers/clk/at91/dt-compat.c   |  6 ++---
>>>   drivers/clk/at91/pmc.h         | 11 +++++----
>>>   drivers/clk/at91/sam9x60.c     |  2 +-
>>>   drivers/clk/at91/sam9x7.c      | 21 +++++++++--------
>>>   drivers/clk/at91/sama5d2.c     |  2 +-
>>>   drivers/clk/at91/sama5d3.c     |  2 +-
>>>   drivers/clk/at91/sama5d4.c     |  2 +-
>>>   drivers/clk/at91/sama7d65.c    | 24 +++++++++++---------
>>>   14 files changed, 72 insertions(+), 49 deletions(-)
>>>
>>
>> [ ... ]
>>
>>> @@ -882,10 +885,10 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>>>
>>>        sam9x7_pmc->chws[PMC_MCK] = hw;
>>>
>>> -     parent_names[0] = "plla_divpmcck";
>>> -     parent_names[1] = "upll_divpmcck";
>>> -     parent_names[2] = "main_osc";
>>> -     usbck_hw = sam9x60_clk_register_usb(regmap, "usbck", parent_names, 3);
>>> +     parent_data[0] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw);
>>> +     parent_data[1] = AT91_CLK_PD_HW(sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw);
>>> +     parent_data[2] = AT91_CLK_PD_HW(main_osc_hw);
>>> +     usbck_hw = sam9x60_clk_register_usb(regmap, "usbck", NULL, parent_data, 3);
>>
>> sam9x60_clk_register_usb() could be converted to use parent_hws member of
>> struct clk_init_data instead of parent_data.
> 
> Looking more in depth sam9x60_clk_register_usb() calls
> at91sam9x_clk_register_usb() which like in 21/31 is called in dt-compact
> and only the clock name is passed into it. Should I make another
> function for sam9x60_clk_register_usb() that uses parent_hw?

OK! To not overcomplicate this series, let's keep it as is for now.

Thank you,
Claudiu



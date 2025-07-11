Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FF52D3725
	for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 12:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238687; cv=none; b=CTNKTRi3PNOHM1skceafXqZ9YwMtzqaeDoARFMJcc11jOzJX3Vqu9xmAr2Udsw4b/i7XpCTeKfqXUPEvWh+fTs4zdjENoc0hDrJDeXdLbqu2Aj+43zZpObj8zQUNiWmcmzPACbhHp/UTsj9mqakHuXO/KDVcfrKwxQKEUemwZGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238687; c=relaxed/simple;
	bh=ARQH5plKMm19kFZhc3GQAE5K+XVHhM3KOLEMyl/IL9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I4/fBpw5gK31mei3d+CaqgKA4xSIdN10lwbtnnFunRgHojmnchc0ZT2NUxrOjt8XYk0KCmb9Ep24mqMjyCgulgPn2moB8vAU+HKFxZqcedogaPq4GMCG6nsqs8Nh7d7alSGUUEqaSkK/QOZRPKz8hld7q4tHw+c4avHhGgxtCfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=SAa/5HEZ; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="SAa/5HEZ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-608acb0a27fso2937560a12.0
        for <linux-clk@vger.kernel.org>; Fri, 11 Jul 2025 05:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1752238682; x=1752843482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=92a1BMGAgSFSlfdbtWZOCIjPJqcTtzOvDqxTIQeL8pE=;
        b=SAa/5HEZPTSsUgjKnIaXQGT1DkCG+BHlNUYoL1DwBaQOCZObCHwqPrACnCw9QXnoGC
         JzfzNKpTP44J0gOvCPd5Kc1sq9D8x/0Tk3zCEnTYx8tbwGjaVZlVgwRjCR+9SZvuSLyW
         pGbPFSUh7Q+wQW3uvVLP+tQzQrC81cGNdEuMQkNI49JUFYsHUooXoYkWFriiotnU6b5c
         eZeLQvhYKHB9kfJX8fTY5PsrApiBumHnkKzvWY9kVpEMYEKwqbo1PDpej/hpvHcTfmiO
         14J4MoRffkbyaz32Wra2Ep6+Fu7BUtwZrbm4Ur0ScpNSY0/55DKP1l5REcI/Akmy9Z2x
         8z/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752238682; x=1752843482;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=92a1BMGAgSFSlfdbtWZOCIjPJqcTtzOvDqxTIQeL8pE=;
        b=hmA6UpMZPjyj22IlQatGhS3cv7F4Tlk13KJwpr+k5s8agdfH3EJPp90XZNirL1/Ooo
         EF9fVadC1takQimwQAuEx43lsK4lw35yTWXI+pqpcyWFQwNBlFHAnEuOxEEnR+3U0+YR
         rXrmZY4uTc/nEJ5f0WbY47zB5qdovxcax5KgIAhTY3FjSEzFvEEZ7FDq0nF3FwGJY4T/
         ZLH5ulp1ggYCSDfyZuGWEjl3Oi7pZ+hg6j3F2nPu4uLZmbPAn0Jrd2+7+rN3DuBvdzSz
         tdh8bWC+r4InR108P9kq8CgXE50iqGNxuRIj/vuvnxyui12NMFfboVLmSMnjsLwnU5Ut
         W5xA==
X-Forwarded-Encrypted: i=1; AJvYcCUPFbx/MYqdRdOK3N/GevOLrRKyVqKyJmqWkydKByf8R6Ykv9TedO+NXGddy5b+/pN4AM/ZvWrqlbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTkgxWRq6ndeH4qQAtt2QLhChsrJeDVKb4P8V7OdEpVlf9J4zt
	JTntxuCUgwvEug+TN0UNUddjUrQBKLwJpIJyafrDeqARIRT8z1875e2e4NJQG7+kS/s=
X-Gm-Gg: ASbGncsBfVZy2yC4Eyg0smaWgbj9D8H+FM/xFQ6s/N44FktenLOhfItKeKyoLeJ3/9N
	xwq6u0/+jIDKiGxjkEHmZhPhVoMJz4Wc4fdSrkcPFcwRgWmjyumAmNurjBKkvOimS/Yy6laFEUl
	NeXN97ykDnhmTyoJEs9kj0nZCOLh91x6zwm/0oSUN0McB259mM/lZNwtVqBlTtJzbeLdtUwZpdS
	J+8LeGvGKdzUw9wU2IiEborLV50mABpamm3baWAyasfKn7i9cM0liCmR4L7YhtljoZSqFXFhdxw
	lmuIyAqeNj09haaExmHCdt/V2kJo93yT0kSygbEK5JVwzyhiX/MrcchgptY1i0kn8pZ5fz9oA2J
	s1KzYz/unVX079p6Ah41upgD1BUxnAQ==
X-Google-Smtp-Source: AGHT+IGQ76WU0AB+rvk/zt28ZNRFOKV2e22kKyB0M5bcv4nzPUIbvT27s8Y8oQFLMrTvDQ/Em2YmUg==
X-Received: by 2002:a17:907:2684:b0:ade:36e4:ceba with SMTP id a640c23a62f3a-ae6fc3c4510mr344276566b.52.1752238682247;
        Fri, 11 Jul 2025 05:58:02 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8293ff2sm294908766b.111.2025.07.11.05.58.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 05:58:01 -0700 (PDT)
Message-ID: <38b14d24-534a-447e-a930-6a96c693b7e4@tuxon.dev>
Date: Fri, 11 Jul 2025 15:58:00 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: at91: sam9x7: update pll clk ranges
To: Varshini.Rajendran@microchip.com, mturquette@baylibre.com,
 sboyd@kernel.org, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Patrice.Vilchez@microchip.com
References: <20250610084503.69749-1-varshini.rajendran@microchip.com>
 <c51b2b64-24a7-4e14-bdd8-c4a356423100@tuxon.dev>
 <0652df01-13e8-4fb8-a2e0-35820d83ac3d@microchip.com>
 <d1a16315-8e17-446e-87f2-57f18046288c@tuxon.dev>
 <e59a1c94-e6b3-49c8-aa78-78d031e8a6ec@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <e59a1c94-e6b3-49c8-aa78-78d031e8a6ec@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Varshini,

On 11.07.2025 10:38, Varshini.Rajendran@microchip.com wrote:
> Hi Claudiu,
> 
> On 10/07/25 1:48 pm, Claudiu Beznea wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Hi, Varshini,
>>
>> On 24.06.2025 12:09, Varshini.Rajendran@microchip.com wrote:
>>> Hi Claudiu,
>>>
>>> On 24/06/25 12:34 pm, Claudiu Beznea wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> Hi, Varshini,
>>>>
>>>> On 10.06.2025 11:45, Varshini Rajendran wrote:
>>>>> Update the min, max ranges of the PLL clocks according to the latest
>>>>> datasheet to be coherent in the driver. This patch apparently solves
>>>>> issues in obtaining the right sdio frequency.
>>>>>
>>>>> Fixes: 33013b43e271 ("clk: at91: sam9x7: add sam9x7 pmc driver")
>>>>> Suggested-by: Patrice Vilchez <Patrice.Vilchez@microchip.com>
>>>>> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
>>>>> ---
>>>>>    drivers/clk/at91/sam9x7.c | 20 ++++++++++----------
>>>>>    1 file changed, 10 insertions(+), 10 deletions(-)
>>>>>
>>>>> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
>>>>> index cbb8b220f16b..ffab32b047a0 100644
>>>>> --- a/drivers/clk/at91/sam9x7.c
>>>>> +++ b/drivers/clk/at91/sam9x7.c
>>>>> @@ -61,44 +61,44 @@ static const struct clk_master_layout sam9x7_master_layout = {
>>>>>
>>>>>    /* Fractional PLL core output range. */
>>>>>    static const struct clk_range plla_core_outputs[] = {
>>>>> -     { .min = 375000000, .max = 1600000000 },
>>>>> +     { .min = 800000000, .max = 1600000000 },
>>>>>    };
>>>>>
>>>>>    static const struct clk_range upll_core_outputs[] = {
>>>>> -     { .min = 600000000, .max = 1200000000 },
>>>>> +     { .min = 600000000, .max = 960000000 },
>>>>>    };
>>>>>
>>>>>    static const struct clk_range lvdspll_core_outputs[] = {
>>>>> -     { .min = 400000000, .max = 800000000 },
>>>>> +     { .min = 600000000, .max = 1200000000 },
>>>>>    };
>>>>>
>>>>>    static const struct clk_range audiopll_core_outputs[] = {
>>>>> -     { .min = 400000000, .max = 800000000 },
>>>>> +     { .min = 600000000, .max = 1200000000 },
>>>>>    };
>>>>>
>>>>>    static const struct clk_range plladiv2_core_outputs[] = {
>>>>> -     { .min = 375000000, .max = 1600000000 },
>>>>> +     { .min = 800000000, .max = 1600000000 },
>>>>>    };
>>>>>
>>>>>    /* Fractional PLL output range. */
>>>>>    static const struct clk_range plla_outputs[] = {
>>>>> -     { .min = 732421, .max = 800000000 },
>>>>> +     { .min = 400000000, .max = 800000000 },
>>>>>    };
>>>>>
>>>>>    static const struct clk_range upll_outputs[] = {
>>>>> -     { .min = 300000000, .max = 600000000 },
>>>>> +     { .min = 300000000, .max = 480000000 },
>>>>>    };
>>>>>
>>>>>    static const struct clk_range lvdspll_outputs[] = {
>>>>> -     { .min = 10000000, .max = 800000000 },
>>>>> +     { .min = 175000000, .max = 550000000 },
>>>>>    };
>>>>>
>>>>>    static const struct clk_range audiopll_outputs[] = {
>>>>> -     { .min = 10000000, .max = 800000000 },
>>>>> +     { .min = 0, .max = 300000000 },
>>>>
>>>> Is this min value something valid?
>>>
>>> Yes. This is a valid value mentioned in the datasheet. This is the range
>>> that fixes the issue of not being able to set low frequency values for
>>> the SDIO interface for instance.
>>
>> Sorry for the late reply. This range is for audiopll. Can you please
>> explain in the commit message why this fixes issues with the SDIO interface.
> 
> I can do that, while doing so, I can rephrase it as well. SDIO is just 
> an example, It can potentially fix any range issues in any clock 
> associated with peripherals can have.
> 
>>
>> Also, having zero here as min rate would involve, as of my code inspection,
>> setting frac->mul = -1 for disabled PLLs on probe (I suppose audio PLLs are
>> among them). Please check:
>>
>> https://elixir.bootlin.com/linux/v6.15.5/source/drivers/clk/at91/clk-sam9x60-pll.c#L693
>>
>> Having frac->mul = -1 means frac->mul = 0xff meaning the HW registers will
>> be set with the maximum multiplier. If my assumption is right, for a
>> reference clock of 24MHz this will mean the Fcorepll will be 384MHz which
>> is not in range for Fcorepll specifications (described by
>> audiopll_core_outputs[]).
>>
>> This may be harmless if the PLL is unused at boot time, or reconfigured
>> later, but if the PLL is just enabled later (w/o setting again the
>> frequency) and the core output frequency is not in range (described by
>> audiopll_core_outputs[]) it will lead to PLL lock to take forever and the
>> execution to stuck.
>>
>> Can you please check this?
> 
> I inspected the code on my side and did the calculations and I didn't 
> quite get the part how you arrived at the value 384MHz, my bad. But I 
> did get your point.
> 
> What if I set the minimum AudioPLL output that can be obtained from the 
> coreclk output range which is 600MHz minimum, which gives us 2343750Hz 
> as the minimum AudioPLL frequency achievable from the divider part. If 
> that is okay I can send another version of this patch.
> 

I've rechecked this on my side and I concluded I was wrong. The call:

ret = sam9x60_frac_pll_compute_mul_frac(&frac->core,
                                       characteristics->core_output[0].min,
                                       parent_rate, true);

from sam9x60_clk_register_frac_pll() is using
characteristics->core_output[0].min as parameter but not
characteristics->output[0].min as I initially considered. So, the change
here should be OK.

Sorry for confusion! Please re-send with the patch description adjusted and
I'll apply it.

Thank you,
Claudiu


> Thank you for spending the time to review my patch and for the detailed 
> explanations.
> 
>>
>> Thank you,
>> Claudiu
>>
>>
>>
> 
> 


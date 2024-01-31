Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC49278B6B
	for <linux-clk@vger.kernel.org>; Wed, 31 Jan 2024 11:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706698851; cv=none; b=HXV8tNYxRFI38o6iQPpHsq12dzNzDVxiIMjWN7FD5QWrii1cP20T8qx940GXjqjfNrWY8pTKoflUI4r+/jB6K1rD447Z1AziFbJiXHHJwq0NH31RzHB7sPZDnVEdaNvDDN9KEKVuPpPyr61rGf05ovvIcMJECY/s/RrH5mSTjGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706698851; c=relaxed/simple;
	bh=bjERe05qxKVXjsl2QjzfDZ40aFgJZWBvqEXz0Ce7Uvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iS8HIa5PRq6wip98O4cjEre3tRjHnMxKUwYXlqx7CIaPmiEyHL3eSwsu0+hEBf/fKNSo6x35JjvQL1PuEDTwOVE0noHiilTZ6sEtyuOZNhLFG6XEak3/2w8+TsGw4D99MvuipBviZlkZkcPzPIv7PZ/Ztqn+1jvtyb2dppOeGBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QXzZLcWd; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QXzZLcWd"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-55f1102b300so3526126a12.2
        for <linux-clk@vger.kernel.org>; Wed, 31 Jan 2024 03:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1706698848; x=1707303648; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mki8kF5fnSqy+UjXOYRPoBciPZHH1BRCPEDqp3n5GHw=;
        b=QXzZLcWd9ttIZWAoUbDAzsIi+Or1Eipr2MPGZSim+7i1c2+YV5XiH2NT5DaLkyYjJ7
         mJNM8ttJjikFFWl0DJhN3FvtW8Do/g0ZoHfihkm6AtbCRVxYtYF5Lk3Syz4QYS4j9X6I
         oVWXpDcfHfvgzcTo2CqWNsqqd4rvhw7h69YekOhI/qlLsbdMXZHsD435GS2Gly/UGq83
         hLZP/hD0Doyi3uGZfzpSf0PBHbYs209M2KPVhKB4hQuMqcq21DnGKvpm5PeyN2jHd6BQ
         wM8eMuoXw/FZsnj0228u89X4mhYX44Xgy1qRt4U2//zMJ9XtiJqD1ObMUrTZ+6TJg2EA
         rsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706698848; x=1707303648;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mki8kF5fnSqy+UjXOYRPoBciPZHH1BRCPEDqp3n5GHw=;
        b=rmeiIWhh86Eo7HBF+DPAh4WPDmw/llmT4unhpcPWp50++rx5M2K8QxLFHjK1JuW9OD
         gtQ4jhxxCgFJe7Put9apsfLwU8FmYVCUcwme5LpQ10ySfLh6x0G0I9heGdcKhroj+apN
         k7+IMUSj9nkQvd96IOJ6WFXscWGxSERKFfQeoO3eJZdvlWlDrO77XpdbU2dG47bhvWdQ
         XkNDRrhhlXn8qp61GUA6psU606ji2QLnyucXUSyktSEu8v1SOijjINBdplw0Azowh1L4
         45rwwngDrRJsokfJlSBLIZWI56Z5X/1FDhVvh5VI1EKwZV46XG+MPiMpN7Ntr4f2YXRK
         jF9w==
X-Gm-Message-State: AOJu0YynZEnjJsDpla0NgDlgyt1AF0brBz0/hd2ZF6HuQU/2LnOFEED8
	oDC1RDg7bccu9j/QpRQP1alyKAFNKrv52jth/7miObQEE/9i2fO9P/GivthC/Yw=
X-Google-Smtp-Source: AGHT+IFRmT6v/6cXerO0/OAFdOhHJKFoh0MGqboAstAfrDj2BBcmb2IdzuSb4l+6XFc08T74J189bg==
X-Received: by 2002:a17:907:78da:b0:a36:884b:ed4f with SMTP id kv26-20020a17090778da00b00a36884bed4fmr450864ejc.38.1706698847830;
        Wed, 31 Jan 2024 03:00:47 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUv0jasSwb28HvHk79dUcCuLs48AUMAASuaJc0iiHkYbeIm9abGOnY+ZEwZC5dZlgkghomJDm/5b3lkYzZAQYBMFihSPVLIot0Wb81P31VF6RLpjvlgCBPvfbyo8emBw75JIyphRCIsFkgt9eUYzL0jIZjo9/QA8nPbllBonC0b8CDECzAEnmnHgPDd1RErKLSJm0Ukz5y10kKD26/pRem3otZTukaDXoj00d99zBF5VK3Vya4RtrBwtbNoLbOeMrQzLwgeecNtYQcTcTrIQGYThd+ydczx92MmJ/XpkXag98f5tPu6Z6fjkyQqqZYRlXWPRdpZkBA/dFF9QeWoTJv73vWxTr/63B763ADEZg9HytkcwljpmGCvKhfRRzs6V5EKQ2mnKMFKzo6CDGiV+wGMnerleAhI8Z/Om4efyrZRLuhTi8OdS0OMyjStcpVrbMvAs3b5j0IaMNop7fv5c47zfRFlfG7rzls845ZnehRqElMfoxRQEHG7iJkmZC22kZ9eCQpTiinXN0CMDeQ16kbtojgTbOybJjawzscCCDRG8cQi6ZQ51yDvEPHcmK8RWsTQ3czcoCsrLEOoBZUsvAvpLTOs7WqrJ8pOPxduxA==
Received: from [192.168.50.4] ([82.78.167.87])
        by smtp.gmail.com with ESMTPSA id vb1-20020a170907d04100b00a34c07816e3sm6043255ejc.73.2024.01.31.03.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 03:00:47 -0800 (PST)
Message-ID: <12f458b1-f963-43f4-afcf-715abf635e54@tuxon.dev>
Date: Wed, 31 Jan 2024 13:00:45 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/11] watchdog: rzg2l_wdt: Check return status of
 pm_runtime_put()
Content-Language: en-US
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
Cc: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240131102017.1841495-1-claudiu.beznea.uj@bp.renesas.com>
 <20240131102017.1841495-5-claudiu.beznea.uj@bp.renesas.com>
 <TYCPR01MB11269AD7463C9C7C0A09A43A9867C2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <ddc0b42c-bf88-4c0d-b938-8bd7ff7b329a@tuxon.dev>
 <TYCPR01MB11269BFC2DB457049A2B8C0C8867C2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <TYCPR01MB11269BFC2DB457049A2B8C0C8867C2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 31.01.2024 12:41, Biju Das wrote:
> Hi Claudiu,
> 
>> -----Original Message-----
>> From: claudiu beznea <claudiu.beznea@tuxon.dev>
>> Sent: Wednesday, January 31, 2024 10:36 AM
>> Subject: Re: [PATCH v2 04/11] watchdog: rzg2l_wdt: Check return status of
>> pm_runtime_put()
>>
>> Hi, Biju,
>>
>> On 31.01.2024 12:32, Biju Das wrote:
>>> Hi Claudiu,
>>>
>>> Thanks for the feedback.
>>>
>>>> -----Original Message-----
>>>> From: Claudiu <claudiu.beznea@tuxon.dev>
>>>> Sent: Wednesday, January 31, 2024 10:20 AM
>>>> Subject: [PATCH v2 04/11] watchdog: rzg2l_wdt: Check return status of
>>>> pm_runtime_put()
>>>>
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> pm_runtime_put() may return an error code. Check its return status.
>>>>
>>>> Along with it the rzg2l_wdt_set_timeout() function was updated to
>>>> propagate the result of rzg2l_wdt_stop() to its caller.
>>>>
>>>> Fixes: 2cbc5cd0b55f ("watchdog: Add Watchdog Timer driver for
>>>> RZ/G2L")
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> - propagate the return code of rzg2l_wdt_stop() to it's callers
>>>>
>>>>  drivers/watchdog/rzg2l_wdt.c | 11 +++++++++--
>>>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/watchdog/rzg2l_wdt.c
>>>> b/drivers/watchdog/rzg2l_wdt.c index d87d4f50180c..7bce093316c4
>>>> 100644
>>>> --- a/drivers/watchdog/rzg2l_wdt.c
>>>> +++ b/drivers/watchdog/rzg2l_wdt.c
>>>> @@ -144,9 +144,13 @@ static int rzg2l_wdt_start(struct
>>>> watchdog_device
>>>> *wdev)  static int rzg2l_wdt_stop(struct watchdog_device *wdev)  {
>>>>  	struct rzg2l_wdt_priv *priv = watchdog_get_drvdata(wdev);
>>>> +	int ret;
>>>>
>>>>  	rzg2l_wdt_reset(priv);
>>>> -	pm_runtime_put(wdev->parent);
>>>> +
>>>> +	ret = pm_runtime_put(wdev->parent);
>>>> +	if (ret < 0)
>>>> +		return ret;
>>>
>>> Do we need to check the return code? So far we didn't hit this
>> condition.
>>> If you are planning to do it, then just
>>>
>>> return pm_runtime_put(wdev->parent);
>>
>> pm_runtime_put() may return 1 if the device is suspended (which is not
>> considered error) as explained here:
> 
> Oops, I missed that discussion. Out of curiosity,
> What watchdog framework/consumer is going to do with a 
> Non-error return value of 1?

Looking at this:
https://elixir.bootlin.com/linux/latest/source/drivers/watchdog/watchdog_dev.c#L809

it seems that the positive values are not considered errors thus, indeed,
we may return directly:

return pm_runtime_put();

Guenter,

With this (and previous discussion from [1]), are you OK to change it like:

return pm_runtime_put();

Thank you,
Claudiu Beznea

> 
> Cheers,
> Biju

Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3050C1DE4CB
	for <linux-clk@vger.kernel.org>; Thu, 30 Jan 2025 17:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738258320; cv=none; b=mjDV9BljWe4dfmWA9h1YpFBj03xnpSvRT06SrSbv9hNZ2EgQdF5riHSoQcbGAEB0sV4YCdZsI7444mztJbnV/nuM9odRRIuil1qpFSOSfnRzWLIQ9nM2lfFzsLaYIqo5FSfobmd0b+kMcum49mRqFRvnMZDjht+acxBx175vDoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738258320; c=relaxed/simple;
	bh=xuMqgfxSwdbvy3i+zP5z3UiMW6qWNT7u1ikBE5pPpQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nZ1PvFP8+nZU2vwsb4WI0k5fWPvLIoAsRQXFv44QzZd5GfzrF/+s0hyYdDhROp6AvqlVCt6VxtRYGsmlmqLK+ZOaDKZbaQv6/rSgsdDI5tFmzA1Hxnow58qi+AGwlfp1auHO6GX4+LNEHkdBuezUgUnSPFT1c5IzGsKy8tcy4Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xU9ISn5Y; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xU9ISn5Y"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385eed29d17so584834f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 30 Jan 2025 09:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738258317; x=1738863117; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oGFJ/SZJyjcLl8OPYBdzU/HVC+kA3jQp0maWZ+GZ/dM=;
        b=xU9ISn5YNM4PqXbcJdH+FDjWnqWiOO2PrgINE+YWbNLMyn81xSu6eY9s3xB+W8R6Of
         jHz4bHNsu9tpHZJ6oRuR1pNu8cHFWyu9e50qVAGcOtEr6ru6xWJRDwvD1K+MTS8wp46P
         JA74pOza82yBz5pGO0ccrHb6xVhHb4TCzL7wa8ji5C6PXBHWTK6ZCRAlhDCMbb5u4H7o
         G51RTBDbbVN2ThBRwKBb/Wz+g03vOatiihFwMVHFqRqNStobnMtKTQPe84BQLg8Ft1t2
         uawCMv83M1vQVYpdDH3RcsjhUANOXPIBmnFStIDklbWw1xk5fCJ3PnfyS3nNwLoW4fxZ
         w/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738258317; x=1738863117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oGFJ/SZJyjcLl8OPYBdzU/HVC+kA3jQp0maWZ+GZ/dM=;
        b=XfCDwkybWFHTiaWGboTQoQraAzPhI6/5r8RyW0imAXkBfWmOFZsDl/WRdkvPlLTfoA
         hgtLc5wNXZDfPWDPcvzGiVAhPdAdg0Z/pwMC/frty4N5RSkPjLsWEx3v2xlDqTdsc9fS
         9xJulcmXRpC8w7QV+5WVbtdZXu3mT1Ba/oCZq3iA33Pbx5MEg3n4uzgxgk8nsnOemni5
         48/a7f/mH0b/oRSgGd5qvCn8ZGFvrohEuC4uaBDxnbxWdj4Gscjv+rcBTEPX5vNqYHrr
         f3X4JHTHrN9AOKN2s02XQmYEyfyCe/MTd8aDLW/CnDUiArxQ6j88qhr9FgyiE65lsPTq
         37tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVXdPp/x6v2e+4vt1SP8WK8kvJQxLkiVHxxYoR3Q6nqlT9cs3tafFmETtAHhM8faVBcxucD0pr4y0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Tp4KH9gtckYcuLgCqtdKWbChGxf5LPSKLEsunxcSJIcSRlsQ
	yNUGG7XznbmTjnHcQgelT2RkROcH8obXGB+yFp7aL9Myeuzsff05f4Sy9jz1S6Q=
X-Gm-Gg: ASbGncuOmiwAEu0pR/WarLcLcehU59Lte4VTmuHL8g1kPt0w+e5X/We/i2u856QKPBu
	wYK83hOmvDHqCnaM7ZnjOJRQ4IxgJk9jWq5N8W7K7Agn5mKASBFDIOVlb7k7OB3rM6X11p9d1R1
	82CPUVSJ1FxfieggeWe2ij/+gilNrAfvZMHdwhOxRpwIi5SR+t6y+nhwiGI81Rkrz34Ma17XV/p
	9mZZbdhlMsImXkWvU4Z11uWs5KulaliVB6UgVib9yfjQLs3FOhJJIKvSv0DBp6o42M7UyyBZQE0
	w411wouIBKHJX63TrSWI0zPAbmgTANVUzPmQRSMfaPZnCZqeE+OxafE=
X-Google-Smtp-Source: AGHT+IEi5kedgLMkork5YJAKY/3aI2UDvYGuUStK46XPsuiG324UkAjxLQwuOm9AwPnUYK4o3lkp9Q==
X-Received: by 2002:a5d:64a1:0:b0:38a:86fe:52b5 with SMTP id ffacd0b85a97d-38c5195f256mr8386213f8f.14.1738258316013;
        Thu, 30 Jan 2025 09:31:56 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438e244f087sm29478855e9.29.2025.01.30.09.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 09:31:54 -0800 (PST)
Message-ID: <867eb310-11a7-48bd-b2fa-35e001875498@linaro.org>
Date: Thu, 30 Jan 2025 18:31:53 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] thermal: of: Export non-devres helper to
 register/unregister thermal zone
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>
Cc: "rafael@kernel.org" <rafael@kernel.org>,
 "rui.zhang@intel.com" <rui.zhang@intel.com>,
 "lukasz.luba@arm.com" <lukasz.luba@arm.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
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
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com>
 <Z5pkUNNvsWPjRQvy@mai.linaro.org>
 <65a16c3f-456e-40ec-91b0-afb57269ed46@tuxon.dev>
 <Z5tPR_tv7vWDkUI7@mai.linaro.org>
 <TY3PR01MB11346E087A4DFCC5BDCCB10B486E92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <TY3PR01MB11346E087A4DFCC5BDCCB10B486E92@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/01/2025 11:33, Biju Das wrote:
> Hi Daniel Lezcano,
> 
>> -----Original Message-----

[ ... ]

>>>> I've been through the driver before responding to this change. What
>>>> is the benefit of powering down / up (or clock off / on) the thermal
>>>> sensor when reading the temperature ?
>>>>
>>>> I can understand for disable / enable but I don't get for the
>>>> classic usage where a governor will be reading the temperature regularly.
>>>
>>> I tried to be as power saving as possible both at runtime and after
>>> the IP is not used anymore as the HW manual doesn't mentioned anything
>>> about accuracy or implications of disabling the IP clock at runtime.
>>> We use similar approach (of disabling clocks at runtime) for other IPs
>>> in the RZ/G3S SoC as well.
>>>
>>>>
>>>> Would the IP need some cycles to capture the temperature accurately
>>>> after the clock is enabled ?
>>>
>>> There is nothing about this mentioned about this in the HW manual of
>>> the RZ/G3S SoC. The only points mentioned are as described in the driver code:
>>> - wait at least 3us after each IIO channel read
>>> - wait at least 30us after enabling the sensor
>>> - wait at least 50us after setting OE bit in TSU_SM
>>>
>>> For this I chose to have it implemented as proposed.
>>
>> IMO, disabling/enabling the clock between two reads through the pm runtime may not be a good thing,
>> especially if the system enters a thermal situation where it has to mitigate.
> 
> Just a question, You mean to avoid device destruction due to high temperature?? Assuming disabling the clk happens
> when the temp reaches the boundary and re-enabling of the clk after a time(which involves monitoring the CLK ON
> bit after enabling it, or a run time enable failure happens), where it exceeds the threshold??


Well, I have some comments with the device tree thermal configuration 
which may answer your question but I'll wait for Claudiu to check the 
temperature read comparison without rounding to 0.5°C

What I meant is if the temperature read is inaccurate, the mitigation 
will be inaccurate too. It may not reach the critical temperature but it 
is possible the performance could be impacted negatively under thermal 
stress.



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

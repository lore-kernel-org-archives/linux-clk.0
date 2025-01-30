Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33621465A5
	for <linux-clk@vger.kernel.org>; Thu, 30 Jan 2025 22:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738276427; cv=none; b=t5iSSxbj49k9CGz6eEFan/Mi5HVlONcqlOKljZMVMw9RpvcpAZr+1pAQgNdg3ZY3C/jtXxDyJVfrmk2SZBTRqQTl8g7AgYWERrV4yJnnbByDzlO1PAa1G9QAL2kgKi1iuf8UjC0sK3vEsULbPCuULg31kwiM6Twl2PPXkbw0u2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738276427; c=relaxed/simple;
	bh=lTjFhNlU6GBCHRFRJM2vnQiERraPdQsSqotzJR2dc/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RzDj7m5LeDpquuVS7n0FyOxRHE60G95Qn/WSNxjLYAHXFX69tUUv19ldXN/fDvbcrO/aBLVTFAO5HppbgPwViMPozXgD2lM0EAn79RXfUbJbrifAsB6OA9WgjhUDypKEmVM3EM3nWxRatohzSKaD9m/1orJ5Ahlh3e6ArjZC6AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bV9dX0bV; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bV9dX0bV"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436202dd730so9788925e9.2
        for <linux-clk@vger.kernel.org>; Thu, 30 Jan 2025 14:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738276424; x=1738881224; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q4PhLkA2yH+xwVRJ4eRUYfsP78J3oAK3Sf/7oUAOMWE=;
        b=bV9dX0bV0r2UCDJ68EsBkPqO+064jFXKk4rVaity1QT3prOajBT0tTh0Edu0Dkeb73
         2uX2YeszYK/ZV35Pi769RDYvPcYqCr8cA3oHluZs0HCf9ibHXxsUJs18E18aVp2zkQgh
         3DiZ2RG1yxZrCRqn5bUcBl6hj2YeNJJJUT7L2NtqI3t0EA1mjwSJAc2GjstdHr89zSrD
         3vYStisWMnMVFsCWH2RNoqdN9K9xx4Zj/C0uxnzsJY0p0SRmlxUQHdrgdW91umf+HfFA
         JWKwbsOA7jnGTiD2b0/rplGkddHz3pK3xcs5Pey12R+v4YI4GCpZxfu/Z9GurMRsqXYT
         TYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738276424; x=1738881224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q4PhLkA2yH+xwVRJ4eRUYfsP78J3oAK3Sf/7oUAOMWE=;
        b=BxPSGO+Y5xNu6rwSbLtlCxNcHbE+Nhqs26+HamfxdW1VTg4nqTSL/JyLewbup069hy
         iTPt6wbpFKUOH0qyf5ZgCN8oDGPLaX7olkeYIlOjOgo8MhX4Op40pQs0VLt9P7tGCz8r
         GpLV3t1qrserRfsaTihzfhrByH11zBlU2fxguIFq2PrxxWPzYkGC5DEDZ+O98XSy5408
         jOBa9eEy/6X1y+ijEDWOFa6c0t+TaV23DfHSplNpofrx/JLh7HlPxpKM5I/VvjoazFox
         Gaa0H4puBEu9isdaJxhI8zYm4NMfBIDgh96khUkAmjpzVHIPY65lnouC92o8v1SRf1CD
         b8sw==
X-Forwarded-Encrypted: i=1; AJvYcCWVhFnEjr9VwWLzDVcO+vahErByw8AFtzgrEsKAiJe+ea1NWAc4Dj1GJPkwvDoREVMJt+eIMWvGSzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLfsyPuFwc0jUq8nhB5LX8GCPn8c5lapDrmzAd7ciYBvoMXQvr
	SlDXBGvmXWH5+MWuGUkQv9sJuyhZzkyNwQ9caKE/VkR6A/KB8TyHM1QNgDgWaoY=
X-Gm-Gg: ASbGnctTLNfWVsJHAdspNXe3P972ollBy/04UOa2Vk2Jf+b1pZIM6/Y24bzHLjOxs1p
	jeB+KIalA5nDd8MllYu8dcU+yauDlTGXbA1syeHBVCYxAXDo3SeM3lilzoXa/BrTRlr3AXqxHe6
	n568JhR9gHMcUItsG6oE8+PCTMTbr+BU+SH87NbsWCoW9RMN9Hk5o7S8QUtwp242nTWXy+KL/Nx
	95p1QpRWx2nQR5TMfRjWpHrvrwNFEm1LwfdwtlVFffHcFTZTt2V841O5TCi2Tk4f0U49h3swyAG
	PlF/hT30Ss1B2VZOlW1ylwQ+GEdpQ1S21V8svKwba9zmunl1WbhAMZk=
X-Google-Smtp-Source: AGHT+IEp+NL8KjaCqdJLkSqTmmab+u4WxdsC5LvvC6odn5b/wppdPeWMvLnufUZb2VnSyWDCxGmQVA==
X-Received: by 2002:a05:600c:3c98:b0:434:fb65:ebbb with SMTP id 5b1f17b1804b1-438dc3c38dcmr84375125e9.17.1738276423846;
        Thu, 30 Jan 2025 14:33:43 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-438dcc8a59dsm73532705e9.40.2025.01.30.14.33.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 14:33:42 -0800 (PST)
Message-ID: <7d1bf72b-183a-429d-9a0c-10e1936a9abe@linaro.org>
Date: Thu, 30 Jan 2025 23:33:41 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] thermal: of: Export non-devres helper to
 register/unregister thermal zone
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: rafael@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, ulf.hansson@linaro.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com>
 <Z5pkUNNvsWPjRQvy@mai.linaro.org>
 <65a16c3f-456e-40ec-91b0-afb57269ed46@tuxon.dev>
 <Z5tPR_tv7vWDkUI7@mai.linaro.org>
 <6ed7d545-82d7-4bca-95ec-95447586bb58@tuxon.dev>
 <b496d933-3c57-4b02-ab65-0582a30939af@linaro.org>
 <98ddf1b6-1804-4116-b4e2-f54a62c27966@tuxon.dev>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <98ddf1b6-1804-4116-b4e2-f54a62c27966@tuxon.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/01/2025 21:53, Claudiu Beznea wrote:
> Hi, Daniel,
> 
> On 30.01.2025 19:24, Daniel Lezcano wrote:
>> On 30/01/2025 11:30, Claudiu Beznea wrote:
>>>
>>>
>>> On 30.01.2025 12:07, Daniel Lezcano wrote:
>>>> On Thu, Jan 30, 2025 at 11:08:03AM +0200, Claudiu Beznea wrote:
>>>>> Hi, Daniel,
>>
>> [ ... ]
>>
>>>>>> Would the IP need some cycles to capture the temperature accurately
>>>>>> after the
>>>>>> clock is enabled ?
>>>>>
>>>>> There is nothing about this mentioned about this in the HW manual of the
>>>>> RZ/G3S SoC. The only points mentioned are as described in the driver code:
>>>>> - wait at least 3us after each IIO channel read
>>>>> - wait at least 30us after enabling the sensor
>>>>> - wait at least 50us after setting OE bit in TSU_SM
>>>>>
>>>>> For this I chose to have it implemented as proposed.
>>>>
>>>> IMO, disabling/enabling the clock between two reads through the pm
>>>> runtime may
>>>> not be a good thing, especially if the system enters a thermal situation
>>>> where
>>>> it has to mitigate.
>>>>
>>>> Without any testing capturing the temperatures and compare between the
>>>> always-on
>>>> and on/off, it is hard to say if it is true or not. Up to you to test
>>>> that or
>>>> not. If you think it is fine, then let's go with it.
>>>
>>> I tested it with and w/o the runtime PM and on/off support (so, everything
>>> ON from the probe) and the reported temperature values were similar.
>>
>>
>> Did you remove the roundup to 0.5°C ?
> 
> I did the testing as suggested and, this time, collected results and
> compared side by side. I read the temperature for 10 minutes, 60 seconds
> after the Linux prompt showed up. There is, indeed, a slight difference b/w
> the 2 cases.
> 
> When the runtime PM doesn't touch the clocks on read the reported
> temperature varies b/w 53-54 degrees while when the runtime PM
> enables/disables the clocks a single read reported 55 degrees, the rest
> reported 54 degrees.
> 
> I plotted the results side by side here:
> https://i2.paste.pics/f07eaeddc2ccc3c6695fe5056b52f4a2.png?trs=0a0eaab99bb59ebcb10051eb298f437c7cd50c16437a87392aebc16cd9013e18&rand=vWXm2VTrbt
> 
> Please let me know how do you consider it.

Thanks for taking the time to provide a figure

Testing thermal can be painful because it should be done under certain 
conditions.

I guess there was no particular work load on the system when running the 
tests.

At the first glance, it seems, without the pm runtime, the measurement 
is more precise as it catches more thermal changes. But the test does 
not give information about the thermal behavior under stress. And one 
second sampling is too long to really figure it out.

In the kernel source tree, there is a tool to read the temperature in an 
optimized manner, you may want to use it to read the temperature at a 
higher rate. It is located in tools/thermal/thermometer

Compiling is a bit fuzzy ATM, so until it is fixed, here are the steps:

(you should install libconfig-dev and libnl-3-dev packages).

cd $LINUX_DIR/tools/thermal/lib
make
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LINUX_DIR/tools/thermal/lib

cd $LINUX_DIR/tools
make thermometer



Then change directory:

cd $LINUX_DIR/tools/thermal/thermometer


Run the tool:

./thermometer -o out -c t.conf -l DEBUG -- <my_command>


The content of the configuration file t.conf is:

thermal-zones = (
	      {	name = "cpu[0_9].*-thermal";
		polling = 100; }
       )

All the captured data will be in the 'out' directory

For 'my_command', I suggest to use a script containing:

sleep 10; dhrystone -t 1 -r 120; sleep 10

If you need the dhrystone binary, let me know.

The thermal zone device tree configuration should be changed to use a 
65°C passive trip point instead of 100°C (and the kernel setup with the 
step wise governor as default).

The resulting figure from the temperature should show a flat temperature 
figure during 10 seconds, then the temperature increasing until reaching 
the temperature threshold of 65°C, the temperature stabilizing around 
it, then followed by a temperature decreasing when the test finishes.

If the temperature does not reach the limit, decrease the trip point 
temperature or increase the dhrystone duration (the -r 120 option)

At this point, you should the test with and without pm runtime but in 
order to have consistent results, you should wait ~20 minutes between 
two tests.

The shape of the figures will give the immediate information about how 
the mitigation vs thermal sensor vs cooling device behave.

Additionally, you can enable the thermal DEBUGFS option and add the 
collected information statistics from /sys/kernel/debug/thermal/*** in 
the results.


Hope that helps






-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

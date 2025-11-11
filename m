Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181C334BA28
	for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 10:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762856993; cv=none; b=gXjeJ98A3pH++iKqS+sc9kq0DxZWeZazJVyg/rNy8LozNVOfEsRKVKeHDA4KZPFB0OS4SHoNLb+gB2Z+UotXI/tRSZ0gmRgyyBsFB8im2M4WYuaulaa1daA1CNyN/EPTZCDtqMi21rGtLG8aYtsPcZswKkvcV3p3ZIucNoEjIXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762856993; c=relaxed/simple;
	bh=HLKGy0mKbpQ8h+3kSmFm7cUNZcoYemdFaDqBdUyA25s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qlLZI187VtSPjfdy9O+wPkyouSG38mWm+SxV5khVE8foqQWv2D3VeEGx/f1uBPmDV5ZwyvkA+p9uIv3Gf0UwWcJXT5MoXjURcZuF6e+ZBNVZG075Pq9rx3rs2EkHfxcuvVjR2WcQJE6V7UMIuQXDzbCxT4qONiNadjrDQOPiLJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TLCrMhPQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TLCrMhPQ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so30206665e9.3
        for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 02:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762856990; x=1763461790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mA4OYGuehEdlKuRHHZkCIxOoAid/iNBTle5X4sDzSO8=;
        b=TLCrMhPQRzB5j1v8TSW+sC6RojrdNXA+tcJLfzUaCy67lu0rwRNX671GZX7SEsO7VJ
         jf0LIWKMK6zabvAzsT9FcnEJpS6oZPVF50f5PsBDi6j0i4NxgYvSVGc5GgyIyO22tZRw
         TZwMmziLkzn5BPKWVbOdWRYwZjKSWuNpyjueKv7Kgatde6o7ePHyG5fcb/l9XGktgzlo
         tWmxMNqjOEMdG8BmqKjM3lqwtnxvbQQiAiDM8u6IllVDiwPnGDAykBzVQ3FkrHsLXxwo
         Yn/ZInsymFSXOIZiCtFurlKCJMRleUvC6//X8eCPEMGQYrLxeXbnQYNkF4S6ABIlVsLT
         +e1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762856990; x=1763461790;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mA4OYGuehEdlKuRHHZkCIxOoAid/iNBTle5X4sDzSO8=;
        b=s8f3wAdv459Xxga/dg1TBzbkxsFdwzNQyF9OJKYh3BVwlHKypE2dMbeHXbUUcFNEsP
         8zSQ6+HOrG+2GLWun5boBGC4m9PDdV5HuNhqVu1Glm95KAXOTzJgBsdTYEmRN7FVZ5tA
         jJ6ePQHte51Br/jtFFRILdlaNK+rcIylJur4b84hmiAkxo+s7C+D8VpTfVcuh2jdXLxs
         aXj/qRbNKWbeKvyQdaPTavcDHPUEcHQ5rHevj4w6WRoDqh6jzqKylhNW+i7rnukBqnaZ
         1Vr1/b3bCdYzmEYRc+Q0Qx/Qke7/Xp5YsBVWlPpEatdUL5R6O5AYoEY0/uc9QNXbWy5V
         SvLg==
X-Forwarded-Encrypted: i=1; AJvYcCU5YO91xkFefLIugpGYpGs8b7Ds32gBmXXqIKO07GgbWceRnFRllv0/atwp6ordrGkWFKH6tWWbkp0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFhd7Bty0wXkLZp3NXW0ax3fD2K8gDkfaZEMTTKb2+IKIg3rGd
	l+03OBT0pRy2bqLuri/NT49R7UACw+48MPgtlLtqQXun901hUFZkfhZh/DR5nQHu1uo=
X-Gm-Gg: ASbGncuHlUDkIvpw1aU7yAjIuecnozmBnpatHpLfikagOJ55k8qr8OQ1Q+jX+FoRYa7
	wHl1pQ0eI5ruNSmVvfnudbfyeSb7TQnZzN2GeAC/K/eYxh7xTsqZVJmMP3ZA4bJKWFwb0fCHswE
	DAsrT6MeylyrpYYzHFzIrk1vYCsvnYPiY4KDfYdfeXwLgbF3nLdgK77/iaANuWesLLnjErCD0uW
	2HB2n1bVcRPjZ2DwrQ8ICYzMOY7eWxOKBmUnpHKydIPYxRwSfKNbkS3blYAM+PmNLgCyRO75inO
	3+yGZeAcMA7NfzS7NX3M+oDluArp8wxuZkJWACAKAddTDTx1gmDtzESKgnaq/oISH3S1fOxb3gf
	eV/UmGTZaGIC6ZqEe/j2fp1njzfip8SLVFq6JyLaFY3gINt+uCDlsvrXRnHrtml86CE0IktJmVh
	enXGxqdePWOZkPMozrwN6FJFoZWps=
X-Google-Smtp-Source: AGHT+IEvLEjIZw4+8whQM79OrY00R9vJVyO1rxoxD4fhQm/KifAlq8r0yaMnGCz1oNKbvCj2h/xcDg==
X-Received: by 2002:a05:600c:c4a3:b0:471:1774:3003 with SMTP id 5b1f17b1804b1-47773290e9dmr106627935e9.29.1762856990270;
        Tue, 11 Nov 2025 02:29:50 -0800 (PST)
Received: from [10.11.12.107] ([5.12.85.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac675caecsm27313955f8f.30.2025.11.11.02.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Nov 2025 02:29:49 -0800 (PST)
Message-ID: <5eaaf3cf-a271-467f-b015-9cb9b49590f0@linaro.org>
Date: Tue, 11 Nov 2025 12:29:44 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] clk: samsung: add Exynos ACPM clock driver
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-4-321ee8826fd4@linaro.org>
 <92f1c027-bacc-4537-a158-2e0890e2e8ee@kernel.org>
 <17695fcf-f33c-4246-8d5c-b2120e9e03b1@linaro.org>
 <176282517011.11952.1566372681481575091@lazor>
 <c5db97fa-8789-447f-909a-edbdb55383f8@linaro.org>
Content-Language: en-US
In-Reply-To: <c5db97fa-8789-447f-909a-edbdb55383f8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/11/25 8:24 AM, Tudor Ambarus wrote:
> 
> 
> On 11/11/25 3:39 AM, Stephen Boyd wrote:
> 
> Hi, Stephen!
> 
>> Quoting Tudor Ambarus (2025-10-20 00:45:58)
>>>
>>>
>>> On 10/20/25 7:54 AM, Krzysztof Kozlowski wrote:
>>>>> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
>>>>> index 76a494e95027af26272e30876a87ac293bd56dfa..70a8b82a0136b4d0213d8ff95e029c52436e5c7f 100644
>>>>> --- a/drivers/clk/samsung/Kconfig
>>>>> +++ b/drivers/clk/samsung/Kconfig
>>>>> @@ -95,6 +95,16 @@ config EXYNOS_CLKOUT
>>>>>        status of the certains clocks from SoC, but it could also be tied to
>>>>>        other devices as an input clock.
>>>>>  
>>>>> +config EXYNOS_ACPM_CLK
>>>>> +    tristate "Clock driver controlled via ACPM interface"
>>>>> +    depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
>>>>
>>>> I merged the patches but I don't get why we are not enabling it by
>>>> default, just like every other clock driver. What is so special here?
>>>
>>> Thanks! Are you referring to the depends on line? I needed it otherwise
>>> on randconfigs where COMPILE_TEST=y and EXYNOS_ACPM_PROTOCOL=n I get:
>>>
>>> ERROR: modpost: "devm_acpm_get_by_node" [drivers/clk/samsung/clk-acpm.ko] undefined!
>>>
>>
>> I don't understand that part. The depends on statement "COMPILE_TEST &&
>> !EXYNOS_ACPM_PROTOCOL" is equivalent to COMPILE_TEST=y and
>> EXYNOS_ACPM_PROTOCOL=n, so are you trying to avoid
>> EXYNOS_ACPM_PROTOCOL=y when COMPILE_TEST=y?
> 
> My previous comment was misleading.
> The depends on line allows CONFIG_EXYNOS_ACPM_CLK to be selected in two
> main scenarios:
> 1/ if EXYNOS_ACPM_PROTOCOL is enabled the clock driver that uses it can
>    be enabled (the normal case).
> 2/ COMPILE_TEST is enabled AND EXYNOS_ACPM_PROTOCOL is NOT enabled. This
>    is the special scenario for build testing. I want to build test the
>    clock driver even if EXYNOS_ACPM_PROTOCOL is NOT enabled. For that I
>    also needed the following patch:
> 
> https://lore.kernel.org/linux-samsung-soc/20251021-fix-acpm-clk-build-test-v1-1-236a3d6db7f5@linaro.org/
> 

What I described in 2/ EXYNOS_ACPM_PROTOCOL [=n] && EXYNOS_ACPM_CLK [=y] 
can be achieved with a more relaxed:
depends on EXYNOS_ACPM_PROTOCOL || COMPILE_TEST
because of the stub (dummy method) that I referenced in the link above.

It's really what Krzysztof explained in his reply, I wanted to avoid
the link failure for COMPILE_TEST [=y] when
EXYNOS_ACPM_PROTOCOL [=m] && EXYNOS_ACPM_CLK [=y].

We have the following possibilities with:
depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
1/ CONMPILE_TEST=n
EXYNOS_ACPM_PROTOCOL=n EXYNOS_ACPM_CLK=n
EXYNOS_ACPM_PROTOCOL=m EXYNOS_ACPM_CLK=n,m
EXYNOS_ACPM_PROTOCOL=y EXYNOS_ACPM_CLK=n,m,y

2/COMPILE_TEST=y
EXYNOS_ACPM_PROTOCOL=n EXYNOS_ACPM_CLK=n,m,y
EXYNOS_ACPM_PROTOCOL=m EXYNOS_ACPM_CLK=n,m
EXYNOS_ACPM_PROTOCOL=y EXYNOS_ACPM_CLK=n,m,y

We have the following possibilities with:
depends on EXYNOS_ACPM_PROTOCOL || COMPILE_TEST
1/ CONMPILE_TEST=n
EXYNOS_ACPM_PROTOCOL=n EXYNOS_ACPM_CLK=n
EXYNOS_ACPM_PROTOCOL=m EXYNOS_ACPM_CLK=n,m
EXYNOS_ACPM_PROTOCOL=y EXYNOS_ACPM_CLK=n,m,y

2/COMPILE_TEST=y
EXYNOS_ACPM_PROTOCOL=n EXYNOS_ACPM_CLK=n,m,y
EXYNOS_ACPM_PROTOCOL=m EXYNOS_ACPM_CLK=n,m,y <- link failure when y
EXYNOS_ACPM_PROTOCOL=y EXYNOS_ACPM_CLK=n,m,y

Thanks,
ta

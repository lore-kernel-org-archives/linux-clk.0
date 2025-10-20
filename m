Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C787629DB6A
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 09:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760952005; cv=none; b=SqSk97RmoZWp82SewX5YihHVl3iu22fFij5GLMHWfPBkXW2mQuSNzTGm/hFhBkor2jkxrWBjWKuPno3c8LUCGdwiJNOOyN+e29TpNbLVpN7hUy0CCBFRjx0DkjPNBHrRm6ZI9caX4n+nd4GYwrFtFUASbHPKoubATylAbiXB+c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760952005; c=relaxed/simple;
	bh=iVDOlt8XyF/0gL57nFvuUrvv3rVY9GhGb/oEjhukzyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pNCQnqf8dLikrMegJHE0B5mdj2hDk4Yyo/Y7ecnfvVBeY6jH80UeYW2TI0xiOT6MZGWNcvin3jCvL292IDah7KhoATCcEEXqRr5NnlYywUiYTF4LjXjeCC0rt9OuY79UCSD27WZe+/NmzeD5l8x/oYPdoukbM54r1ljsQcxFJaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mF3rRDMQ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mF3rRDMQ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46b303f7469so31755815e9.1
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 02:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760952002; x=1761556802; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0XCJmz4HW13zmCaIQ84NTp39kjqei0obsLTQVEkJ9Dg=;
        b=mF3rRDMQXSm7smo7UWNVZCkAehPKg9jizKJO6E9LLRlH+/aLfAkrAICg5bBp9XbI+r
         5+AOUafKYfIOesscShW1dVhPeR0q+IvhHlxFv6hhIGKrv7gycWH0qeaWCMEzAWts+6++
         s2L06QgbJGZwA08HnnY6Ua5Z6FJXRciE2T766SI128rokZBlOcAYUGpQQ+y84LeVtZmj
         RMuO6YLqksZ4VujsPIO/7EOpy6mPh1Q/v0Oq3VzMSyZ5Ul/S/kn+Mvl0Js4Y1fR+D7vm
         K4NXlFwFg7A5Od9N+eGfpLcfnxmlKTFQi51LFqbmDO5TFKNGL3MSdjZfkaGQwsk+1o1i
         S5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760952002; x=1761556802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0XCJmz4HW13zmCaIQ84NTp39kjqei0obsLTQVEkJ9Dg=;
        b=F0i1vovYWZDgiUquntcrr6IKM3z5YtdD0g550p3sAT5REINrzRC9ZUHQdo3THYxkS2
         j5dy0ON0kobIpwZPA0Wu5UpG9yL0qrYi3EcmLM35ZmUNfAQwn/qLpajrRS+ING7zD1HY
         hRiihOJduPJvqjLNZnsC/gG6wHSrjL1tT6bB5dZkFXtiy0rfdtfBZE/vg3w5qSvoGfey
         vCwWxjZNLgjREk+IgDu82/nmzye2+52ALI8JDODPbvIw8LLfvoqEtvS0s+rWA1Hfbzbx
         WH/3g8sqC+fdZA1JXKNSnA8kMnGIFQeXQTQfJk7MPwleCBI3PfG5RqgliVV/NpScCQ4G
         QOaw==
X-Forwarded-Encrypted: i=1; AJvYcCUqvRVebWCyExttnBl/yRDeGLQhqUJmHDmvPjxtXKv8ieja2HSjIWS4B2ebQQAKiLsB6z5FbHrTm/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXJbEhU8CnKl7l6AE/sWE8pg09ZcuUZkAAdV1bPbRR5uf4F2mh
	4uaHGktxuTb/2vRFM74xQiWa8cJSZTLbfSnBk7dxCZghQorB6eN36U06ShuqWWnph8c=
X-Gm-Gg: ASbGncsflx1TEjhKRuqoE+r9h+C/NvIWwsgkpbmZlf9vv3ApYfNRj9blFEdSF29qQlj
	ma1vjRnFeoYM3CA6phU3NvGQboX1w1fUbypM/1HQ4btbCf26AuJi3IhSm404H7lqG1piCTwnPgb
	T3gbdLGS0uMjO89oTB7XkrwhYBdvRv0DNU0F0SbnvfHlLwvm3boUfEw4A4Y3lXC/zknMioyNi6z
	qvyDTNkEOGnWtUizBE36mhuEHEZ7XplijpH8AnE5KZ7kvRHiMoIsB4T2WxArsFuJZO3He9+mncQ
	C/k7x7Vb3wJnonMqIAUD4iybg+brDK+TRRKTbgIh/LuOcqfFrcHCwjGKf7sTwu4Mv7qqazviSOQ
	SbVVZL4HTnAMIwNaZe+s5ls8tTE7n0GE29Wh8HOHFviK7Ao6AZsLVbSObVjjaR7iI8C/twx+HUB
	6OFbyEPxi0LTE7ThILSU8=
X-Google-Smtp-Source: AGHT+IHDfUmNi5eqw691/M33t81cdCOV6g/HJdfYKSgYwXlWSNi3vurpVr1BkRRnhjmGHUqYcBuwxw==
X-Received: by 2002:a05:6000:4008:b0:428:3bf5:b3b8 with SMTP id ffacd0b85a97d-4283bf5b655mr5592745f8f.44.1760952002139;
        Mon, 20 Oct 2025 02:20:02 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce3e2sm14354917f8f.47.2025.10.20.02.20.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 02:20:01 -0700 (PDT)
Message-ID: <a03cd07f-8e9f-4b02-b301-f1bbb69eb7db@linaro.org>
Date: Mon, 20 Oct 2025 10:19:59 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] clk: samsung: add Exynos ACPM clock driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20251010-acpm-clk-v6-0-321ee8826fd4@linaro.org>
 <20251010-acpm-clk-v6-4-321ee8826fd4@linaro.org>
 <92f1c027-bacc-4537-a158-2e0890e2e8ee@kernel.org>
 <17695fcf-f33c-4246-8d5c-b2120e9e03b1@linaro.org>
 <2f8da425-63d9-4321-9cd3-976bbd29a52f@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <2f8da425-63d9-4321-9cd3-976bbd29a52f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/20/25 9:22 AM, Krzysztof Kozlowski wrote:
> On 20/10/2025 09:45, Tudor Ambarus wrote:
>>
>>
>> On 10/20/25 7:54 AM, Krzysztof Kozlowski wrote:
>>>> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
>>>> index 76a494e95027af26272e30876a87ac293bd56dfa..70a8b82a0136b4d0213d8ff95e029c52436e5c7f 100644
>>>> --- a/drivers/clk/samsung/Kconfig
>>>> +++ b/drivers/clk/samsung/Kconfig
>>>> @@ -95,6 +95,16 @@ config EXYNOS_CLKOUT
>>>>  	  status of the certains clocks from SoC, but it could also be tied to
>>>>  	  other devices as an input clock.
>>>>  
>>>> +config EXYNOS_ACPM_CLK
>>>> +	tristate "Clock driver controlled via ACPM interface"
>>>> +	depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
>>>
>>> I merged the patches but I don't get why we are not enabling it by
>>> default, just like every other clock driver. What is so special here?
>>
>> Thanks! Are you referring to the depends on line? I needed it otherwise
>> on randconfigs where COMPILE_TEST=y and EXYNOS_ACPM_PROTOCOL=n I get:
> 
> 
> No. I am referring to missing default and defconfig patch.
> 

default m or y would force compilation of EXYNOS_ACPM_CLK and
EXYNOS_ACPM_PROTOCOL for all ARCH_EXYNOS, even on Exynos platforms that
don't use ACPM. Since ACPM is not universally required by the Exynos
architecture, I thought to make it opt-in (default n).

Setting it as a module in arm64 defconfig makes it available on
compatible platforms.

Similar clock drivers do the same: CLK_RASPBERRYPI.
COMMON_CLK_SCPI, COMMON_CLK_SCMI - no defaults and set them as builtin
in the arm64 defconfig.

Cheers,
ta

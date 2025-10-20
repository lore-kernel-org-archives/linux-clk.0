Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703441F1517
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 07:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760946367; cv=none; b=WyJbJ2yBVmhgqr0ZTjoqQz3IL7po0nA41IdlylcS6uDjzqK7UychOR/8CwOiXQyihbdjnEjQ+xLYIltuWViW2mqVcucjFfl0ZbLwAioamcbJIY9JNH2mrcx2i+B3/2kpoALdhV703HmWUqMubbfEErBStJYGEdq6tM2f4TsxtdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760946367; c=relaxed/simple;
	bh=X7/0YOAqO5V2172ZrybLrIHVzwGVuhBmLKlylhJxm1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ozG9vkNOU5VBaClAw8KdHcB0J9WDSS22wMhK4O/YgHgbMwloU8y3A1oGLfLVszAINwQmjA0i62dbNSj2ZLUWVkFd/qq65zE4V8wT4Hfm1TpP/v3WNQZA+1ygyQgijnI0t42YwAiLike0vOdSnyillDrcJSghTMdep+ltdStNiuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BMjVIAXw; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BMjVIAXw"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42701aa714aso2410786f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 00:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760946362; x=1761551162; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NeEefsjDjBTzkWLJQXyP/5aObcnLAGWfiU+nORhhDXo=;
        b=BMjVIAXw/qb0mfPjoMsyfy6xPQmKl4Qu+YGY72C6YEByg7AIqSq5CCpHo5oiYK9GBG
         p7BYn32ak7gyLIWfxzqngx13/XzqxW8phpWGb0AYyyw6NK4/D/jf0J7x04Lz8u8CJdDG
         W4/QpjldgFiw16NfNAgRgzjGhXSLGhDKLjiR+EIzzFrYxcbziuZt+kgvsVoz3P6tBXza
         0Ms5y8Ch+ybQRN1eTTM8hej4h5yGz3Tye5c+iX+XGUuZQGAdUcN5HxtkszUH9wG3VCJq
         ZRKSCC8Xf43dGOdCTPZ/9vNyNx0I/DjQn+oqtW1yJXyyXNoPxLkorp1T1hqMiiDHxx6c
         h5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760946362; x=1761551162;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NeEefsjDjBTzkWLJQXyP/5aObcnLAGWfiU+nORhhDXo=;
        b=AAZxE7TbtpPwrYAXTqTm50iFprrZPy0G5LmM3LHlqXy/8vhse5r+S3QKf/ZcCvr1Kf
         eQ5j0YVuFganKrwZQskooXdjextlnOl7L8YkjvVbH11tJs4dNAbJSp0Xa7J1HujxRWZE
         MmMvU8FYerSSNb1VPqJ/0Yjc8XbndiOjMuLar5gJyQY0V3xjtSOTBW33iLCOxPDWX8vK
         UH8Jxhrn2f2hIwLOGFIOWuBj6vgMRVH9jd8IEYqI55DQR1AiZoWGVbGzFx1HbB+IVxKD
         E1ZeCyUU5z+95+gTZQrgLmJw5NpvM6HQz99s9epfhLMsDuiUemiLvPSy/MgxWlJ2IezT
         pY+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJz+v2qbnQSEOgzRI07IT/ESA4Ow7mMz+Z9L/TLbf07zRp/aqMOgfmSaIMlca+uZKKaSXOaJ7idoc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqvQq9eUPSJqrUqFckZIf3pbpvbYXapIVfEk1xkqhmRHztavLF
	fhpwq4Mwz0NG8FVGbYdAOkDIZeR7LY26/+oemjIj3raEH8jjVKqlBhcg/hlcXG0jCdY=
X-Gm-Gg: ASbGncuLHtG60daNAuPHiIt/hGVrh4Jj5YIDSkICtbYPwjT7H6DoLYaTBp68mYEVREf
	Nz88CIjnPJhkuu5ba7HsQo9pOAg0KUdKwLcy3Pqn30vz9g6zyh02Uaj9THCxvQtUUhoij0sd1xY
	saFCPlBTugyG+KOx8svW+FWIDtITXWG/Mw37SO+uFdGyevfGQNd9BSUHs2jxen2IJ76F4ZRKxoX
	BB9OcYWRMy0YihdtzgAPN+7kzEIaIvvaDfaCB6MTs6B9DY9lbvLFNKAgKr6Dy6SwZzkIaRERHds
	OgmIaO1Wv9sG9FfHJlen44iQGtU6brVPSw/s70cmTFeydtUIH8g2HEuKatXFtdDTK8pS2XWNdSy
	2KXji746f7pNFQFP4G3yFw8AumcrMNGbwFdpKd/sxwu2r2yx/smcxbapSbe5zwsT8P0QBtZhceL
	vQ2efX6nvjYWHdG2cLB20=
X-Google-Smtp-Source: AGHT+IElXYjtpSTA367NjPFbuT2cNOkeZqKtyb865DWWHqYMgZ9skD7DsDruCaof11OozJ+7TkNWCA==
X-Received: by 2002:a5d:5888:0:b0:426:d587:850d with SMTP id ffacd0b85a97d-42704d78d2amr6946088f8f.28.1760946361718;
        Mon, 20 Oct 2025 00:46:01 -0700 (PDT)
Received: from [10.11.12.107] ([79.115.63.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5a102fsm14122755f8f.1.2025.10.20.00.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 00:46:01 -0700 (PDT)
Message-ID: <17695fcf-f33c-4246-8d5c-b2120e9e03b1@linaro.org>
Date: Mon, 20 Oct 2025 08:45:58 +0100
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
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <92f1c027-bacc-4537-a158-2e0890e2e8ee@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/20/25 7:54 AM, Krzysztof Kozlowski wrote:
>> diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
>> index 76a494e95027af26272e30876a87ac293bd56dfa..70a8b82a0136b4d0213d8ff95e029c52436e5c7f 100644
>> --- a/drivers/clk/samsung/Kconfig
>> +++ b/drivers/clk/samsung/Kconfig
>> @@ -95,6 +95,16 @@ config EXYNOS_CLKOUT
>>  	  status of the certains clocks from SoC, but it could also be tied to
>>  	  other devices as an input clock.
>>  
>> +config EXYNOS_ACPM_CLK
>> +	tristate "Clock driver controlled via ACPM interface"
>> +	depends on EXYNOS_ACPM_PROTOCOL || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
> 
> I merged the patches but I don't get why we are not enabling it by
> default, just like every other clock driver. What is so special here?

Thanks! Are you referring to the depends on line? I needed it otherwise
on randconfigs where COMPILE_TEST=y and EXYNOS_ACPM_PROTOCOL=n I get:

ERROR: modpost: "devm_acpm_get_by_node" [drivers/clk/samsung/clk-acpm.ko] undefined!

Cheers,
ta

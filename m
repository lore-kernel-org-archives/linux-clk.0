Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848A611CA9
	for <linux-clk@vger.kernel.org>; Sat, 27 Jan 2024 04:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706328043; cv=none; b=TP9Fu64a+rLr9lovgYoE9lPhNx1+ZxLrsZew4B34NN8atHvCimShMa5auveYB6xCJO9wSl+yznTHXdoVtSpWnYajdLe7VvU5ax7ffEQZjzWsuxinyL8BkEwsQW93d85+rMCZ+c2YHE/y1Sz4R1ANL6aHdyf6GCZFZzADwry6QkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706328043; c=relaxed/simple;
	bh=c4VJ0B4mxoIpdJnEMi97WB2Qjg0nZxHgjlOXkfpsxZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZwAEU16CuQhWBFzOHXDF6j+t9vOF5RjLtwGl8od7iXf4zr6aFYzb9ZgyhUaZyCXvKUGP0fKli1kk1EQoUJMqe7gFzX0QXbXeSaMfODSqQ6X4kGOtj6pXJDa0b76IsNa4YakdgFVeodrFP2lc97MFUCAgE9fwNtdds5Phc6k9GB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ctPJlvFd; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ctPJlvFd"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so79366666b.2
        for <linux-clk@vger.kernel.org>; Fri, 26 Jan 2024 20:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706328040; x=1706932840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E6vAoSKcVZEBUOLTN2VvD/+wQsWvC7SbOauYoQxzp/g=;
        b=ctPJlvFds0SPRkRxO7LENcaopDd57yq30DzQLQJwe62UtxwZeut3lCu7b8uydFXisN
         wuI4KRSxGaRBncbSg//VA4x3h7x8szMqF4YINBrrp9tWpXS0BzEIZ1a/uXyTaYK/Q2gH
         p3WXUHhAJWVfHENvpPQIfa7j1uoHWFCYm1HNUf9cnNBHck29hmLgsZFg0d84iPKu6Go3
         X46Fgv/yKtjCiHsSIvpLosXMiJVPRxLYyDsmt7pDPbWvtTF+LGFB8HbXX7XnkebaEtTs
         9cMXC1h9L/3inq+YcWq3Jn6gwQolDuL726/7zcAFxWWAE9S0kpkenTAjv2zVX1lSMkY3
         ufIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706328040; x=1706932840;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E6vAoSKcVZEBUOLTN2VvD/+wQsWvC7SbOauYoQxzp/g=;
        b=De/X/PmpuPO6RAM2QlpXFXsXUpcCm4Y8Nh+N6sA+G7sLIwg0Zvjcj29iMwqIcSCpbQ
         x794bz/I5YGAMbH2ha0MjfUOt1rFoXTs7VCl51sFrI9ozuPQdmJGKBybTw12g5OiZNdi
         nUxruBZz7gJMGVTQyJ4HOzCxqXWJygAb1lrj7sjATw0x8hHKOjalpBJ8bW7PNy0HBzT4
         eQROGz4u9EBH8yTzdMJV5BR5EVH5V6rK9FyK6VaU+m0bla/bu+mNyHcaczG49KG6kgze
         MFL43Vt9w+esqLHLy8IiGb6NgrnK1lI9dEkc7szJQ31uIUe71DpPkKyMm9/bCigTzlaW
         4PYA==
X-Gm-Message-State: AOJu0YyokSr+vKaKTJp5coU1c/10yAcEisfmDI5rwNVSisCiF7XqznmO
	ByAGeHyzNwkXNOjYSlF6l74/+MLG6HbaTZsxmlZgusI8o96SJ/jkgk+AN58pq+8=
X-Google-Smtp-Source: AGHT+IG1ROllS+x7WVDG4FmWVzRopm2YC4hx4opvUqdN3dAMV36Uxl10zkTOlxrfe6UR2KP+eXiWXw==
X-Received: by 2002:a17:906:150c:b0:a35:3152:c46b with SMTP id b12-20020a170906150c00b00a353152c46bmr306989ejd.60.1706328039683;
        Fri, 26 Jan 2024 20:00:39 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id th7-20020a1709078e0700b00a30ed424e18sm1304565ejc.41.2024.01.26.20.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 20:00:38 -0800 (PST)
Message-ID: <b801e6b2-dfdf-4776-b90a-83780982b142@linaro.org>
Date: Sat, 27 Jan 2024 04:00:36 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: exynos: gs101: use correct clocks for
 usi8
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@android.com,
 willmcvicker@google.com, alim.akhtar@samsung.com, s.nawrocki@samsung.com,
 tomasz.figa@gmail.com, cw00.choi@samsung.com, mturquette@baylibre.com,
 sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240127003607.501086-1-andre.draszik@linaro.org>
 <20240127003607.501086-4-andre.draszik@linaro.org>
 <CAPLW+4m0137jfMROYE_Lv915U+y0CK7M4dieHULOG90Z8XctQQ@mail.gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAPLW+4m0137jfMROYE_Lv915U+y0CK7M4dieHULOG90Z8XctQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/27/24 03:22, Sam Protsenko wrote:
> On Fri, Jan 26, 2024 at 6:37 PM André Draszik <andre.draszik@linaro.org> wrote:
>>
>> Wrong pclk clocks have been used in this usi8 instance here. For USI
>> and I2C, we need the ipclk and pclk, where pclk is the bus clock.
>> Without it, nothing can work.
> 
> Empty line is missing here?
> 
>> It is unclear what exactly is using USI8_USI_CLK, but it is not
>> required for the IP to be operational at this stage, while pclk is.
> 
> From [1] it looks like DIV_CLK_PERIC0_USI8_USI is a common parrent for
> these two leaf gate clocks:
>   1. GOUT_BLK_PERIC0_UID_RSTNSYNC_CLK_PERIC0_USI8_USI_IPCLKPORT_CLK
>   2. GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_7
> 
> So IIUC, you replace clock #1 with clock #2 in this patch? If so, I

No, GOUT_BLK_PERIC0_UID_PERIC0_TOP0_IPCLKPORT_IPCLK_7 is already used by
IPCLK, the one that controls the clock frequency.

So I understand Andre' replaces a child of the USI8 with something else.

I don't think this works. We shall at least test it. I tested my usi8
patches with the eeprom that's populated on the battery connector. I'll
sync with Andre' offline and redo the tests on Monday.

> think that's a right move, because in my experience RSTNSYNC clocks
> shouldn't be used at all for consumer IP-cores. That's why I never
> added RSTNSYNC clocks in clk-exynos850 driver at all -- I only see
> them useful for store/restore ops during suspend/resume.
> 
> [1] https://android.googlesource.com/kernel/gs/+/refs/tags/android-12.0.0_r0.17/drivers/soc/google/cal-if/gs101/cmucal-node.c#2793
> 
>> This also brings the DT in line with the clock names expected by the
>> usi and i2c drivers.
>>
>> Update the DTSI accordingly.
>>
>> Fixes: 6d44d1a1fb62 ("arm64: dts: exynos: gs101: define USI8 with I2C configuration")
>> Signed-off-by: André Draszik <andre.draszik@linaro.org>
>> ---
> 
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> 
>>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> index bc251e565be6..e5b665be2d62 100644
>> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
>> @@ -380,7 +380,7 @@ usi8: usi@109700c0 {
>>                         ranges;
>>                         #address-cells = <1>;
>>                         #size-cells = <1>;
>> -                       clocks = <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK>,
>> +                       clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_7>,
>>                                  <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>;
>>                         clock-names = "pclk", "ipclk";
>>                         samsung,sysreg = <&sysreg_peric0 0x101c>;
>> @@ -397,7 +397,7 @@ hsi2c_8: i2c@10970000 {
>>                                 pinctrl-names = "default";
>>                                 pinctrl-0 = <&hsi2c8_bus>;
>>                                 clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_IPCLK_7>,
>> -                                        <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK>;
>> +                                        <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP0_PCLK_7>;
>>                                 clock-names = "hsi2c", "hsi2c_pclk";
>>                                 status = "disabled";
>>                         };
>> --
>> 2.43.0.429.g432eaa2c6b-goog
>>

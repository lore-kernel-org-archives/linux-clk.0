Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955DA381CC
	for <linux-clk@vger.kernel.org>; Tue, 30 Jan 2024 06:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706595071; cv=none; b=fE4WQsADPV5l26rbdfQH9d9xNxWzGBJdWPJIspMGRI3q+AdGA6mc97lfx/w1OUU75N7PiBPgOyagYq23+HuQ7p2+6sq44IEr0LpVFbjLmZlJa2mzx/4zg9Rbl4U3Be4e4q2HGoQljqWRAeYDkGnnfuTNdOBy11qfx971yhCKtV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706595071; c=relaxed/simple;
	bh=ijV34YZ0YCG5AOhUcoH9MBiyQi0Vb5QDkuuLffY1KNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ex0pKCug3EpXMUoB/0VtAroFKOW4ChHDeOMOwn5A9+mmSCIlWpmQ9j9t36TrMwO9o/4FRCNHim1qJisnMUbBfLAu0sIWuQ67+uLh7EkLLhxzAKuH+Ng/ezgBXOxWaOj36FeVM8nqRhyq7lnY2p2dxRSt+f5CZZxvhqz3EE6jXVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NYN75jZ5; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NYN75jZ5"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a28a6cef709so453764766b.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Jan 2024 22:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706595068; x=1707199868; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/w6ymI1BUhSUx1fiQjO+jJS2ASJQtR4AEE+cTThI3IY=;
        b=NYN75jZ5f7t//2dftsLcUIOzM0s0JqgcYuX6iipeSl05zwByMLH6BgOdBAZ9yNcmnx
         3oFZv7GBFtdYCdWb0/Fo+O3ebZ31nZLEJvjkMbznsTSNM+4eefVe25iQShvwjk+PmG6w
         PeMhb87YeM6BaJtdXSimoU6AVItiJSJZsjDZPJg8NgkNR61dZYZjt0f2IpymDOgLSyLM
         IdbVcIBp5ZSfzdmJfkq3+y+KLAhBpQ+H3/NR8soYrY6v8gnOnVGiw1KHehlG7QH/lL/p
         EIwSUxMlfCmVSZY/DzqNDX+4aK3xKAPxWlA3MSzlRG7hcPTgTzjh0sATxNKYPuwtzAc9
         cXCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706595068; x=1707199868;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/w6ymI1BUhSUx1fiQjO+jJS2ASJQtR4AEE+cTThI3IY=;
        b=daloCtzsay8/rWUOFpF9sj7TJ744LSpcQFfNNt5IvhnKSnsXT97sj7c6Y4/YkDBg7p
         lTEdbjC7LkhLQadPDsQjYcRZHT2+3KANhhFs+AfyG7W0WHMiKt78dHxgr8zEIE60/uzp
         YOeJd0Bw/ka+ZFdlekpbRMErHCX+Lu8UXyClf1fWOddUosYn+LUEw57+rb/J+A1A1U+V
         OCisb3GSar+Eh1uO1AD75gFdpxuxigFkJYFfA8UESSnW4xi9gcewM1D1cm5MAnSYr0YO
         mMW+bJPamuuBMSLYRxgMDHiImAg87UKoF+m1sLs6NGMyqMsW9/TY+mkkf9Hyzb8lwK52
         mS9g==
X-Gm-Message-State: AOJu0Yz8qFDazZpm23b4eZ/6dsjSTChn15YJoqyvLqy1Ag9e5jNGACjo
	bWblKwOFnUHKzqjEKplnAYfxsivR5luH+CchEnHfnwZ11ef2gyrTRW31oiOYrb8=
X-Google-Smtp-Source: AGHT+IFAA4vYU+oyhwGm+3xKksqN48uHtV+PRbhmg4xKKhjtQYVKwHHeRoQSq9kdWGBj5GgSXzGL9w==
X-Received: by 2002:a17:906:3009:b0:a36:b64:e0c0 with SMTP id 9-20020a170906300900b00a360b64e0c0mr768901ejz.67.1706595067750;
        Mon, 29 Jan 2024 22:11:07 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id ck5-20020a170906c44500b00a31930ffa7esm4698415ejb.153.2024.01.29.22.11.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 22:11:07 -0800 (PST)
Message-ID: <c9b01ae6-cc3f-4447-9b5a-261d234bc92a@linaro.org>
Date: Tue, 30 Jan 2024 06:11:05 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: exynos: Add SPI nodes for Exynos850
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240125013858.3986-1-semen.protsenko@linaro.org>
 <20240125013858.3986-4-semen.protsenko@linaro.org>
 <1b27fa0d-5dc8-497f-ab17-76d82c2aaf40@linaro.org>
 <CAPLW+4ntySsQVA5u4TNWuc0KCbhQY61XcsBqC=O8GRoXmS_NYA@mail.gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAPLW+4ntySsQVA5u4TNWuc0KCbhQY61XcsBqC=O8GRoXmS_NYA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/29/24 19:39, Sam Protsenko wrote:
>>> +                             samsung,spi-src-clk = <0>;
>> this optional property
>>
> The reason this property is provided here despite being optional, is
> to avoid corresponding dev_warn() message from spi-s3c64xx.c driver:
> 
>         if (of_property_read_u32(dev->of_node, "samsung,spi-src-clk", &temp)) {
>             dev_warn(dev, "spi bus clock parent not specified, using
> clock at index 0 as parent\n");
> 
> The same usage (samsung,spi-src-clk = <0>) can be encountered in
> multiple other Exynos dts in arch/arm/ and arch/arm64/, and it's also
> used in bindings example. Probably for the same reason explained
> above. Even if dev_warn() is removed in the driver, I guess the older
> kernels will still print it if spi-src-clk is omitted. So I'd like to
> keep it here.

Yeah, I know. I proposed a patch switching to dev_dbg. If it's so
annoying and implies adding superfluous properties to DT, maybe it is
worth to add a fixes tag to the dev_dbg patch and backport it to stable
kernels?

Your patch looks fine. I guess the vendor specific properties shall be
last if you keep them, see:
https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html#order-of-properties-in-device-node

If you remove the vendor properties or reorder them, one can add:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

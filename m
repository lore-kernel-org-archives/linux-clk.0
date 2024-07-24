Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E204E15689A
	for <linux-clk@vger.kernel.org>; Wed, 24 Jul 2024 11:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721819871; cv=none; b=mSxvCmxDpDx9r8BHN5decnEb4a/5orrbS5KO6/v6f6tUUjoeSj84uf7GLRmf+axNT/ZqtlfLO5Rb3d6H6eaz4o93uaYY3ahA+fOaorpV8rh+eLZ6ZVsc1+UqkkoY51eUDj72NIXH/ELXaHkJhh93uW7B/RkUmKyjr1FWPs9CdEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721819871; c=relaxed/simple;
	bh=u5P2XSotIVQI5KEmH6yp89E/OyUH7DW07t+T5awzKPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LwMF0Y5jOvbSY5aaNz7mBBDm1VeBGR2MistNv7wVQPxhAo/UtXxp0iGPQIUizljVCSK3lp3/Ocdq/CXAIuGI7LKhQDbNVYQTCDmczsxn+Lbsai8d1k3reiiaoor9CJF1mcN6deO4QoKvC2Q7zJFWxc7Xh6xSPtHUUvBE4TtvW2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mMVF6/UB; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mMVF6/UB"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7a9cc666b1so187734166b.2
        for <linux-clk@vger.kernel.org>; Wed, 24 Jul 2024 04:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721819867; x=1722424667; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=foZI0aGrKNowqh8dzhyfBF+tDAZgNn62ZX2djJJye+8=;
        b=mMVF6/UBx5lnuUU7+jafrv/WgmN6R9X0BrCfm9/R/rSIAmTGB7sKOKRszvG59olubm
         Q8AbTLOWlhBsufjg++kxoaRnwYYmL/nFYc8qcdun4oBNMmA0/FJ6M7BN9PD5MkXyv407
         1zp2eEtQ4bG0MJLlv7lIRDa+ssCZp2lAIr+KyS0zN0CxiC1V06TH5eTr9q8TapMeSAKJ
         DkHiD/QNYxza2dtp1txd7RnmZGpq7yqTBvMkDPtONRfhnpvdrXoj9pDEpCgObSsdM6Lf
         otG15772id6Xsvx0+X21GXWHl3vciq0plqdoWoMu1CZ0OUDnjp8/ME3hKmZgvr9urMfc
         tt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721819867; x=1722424667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=foZI0aGrKNowqh8dzhyfBF+tDAZgNn62ZX2djJJye+8=;
        b=hzW6BLIJz7qYz9dpzIvyu3Hk3przxEIyH+tcvWHLsqiXdDFXOtZbil52ALKGVb3nHh
         vldlPrPx/nO7PTZmbttsX04FyLc/dV4tSC2HPHO4QBnHOAI+aQyFOQxuEsqD9kqnEaNy
         pW84Aqp8yEype1sVQ9woDI68WJwPZvaqoZi9jV4vx8A3qbEssa9YyY6AP+N38ur57+kn
         PPXjQuBdnCnYalH0z2hLz5O++5lX5SenaZJFz0CZffDM+bFXuNHXRIVl9NvsaM75piz/
         8j7tMs+0VCOW/UOQFbKwTE+chKXx+kBeDkoLSPfO4QXLZOSjXyNZNfwi0Ryw62e8A7Jy
         wPtw==
X-Forwarded-Encrypted: i=1; AJvYcCUqdH7QD51MRUv+5uNmCxxwsweIwwUaXLn2XIO7cqxT3oON99g/BrCvPX1odx4lFZ2KhU3n3gWzLWQz1H764x2HfVy/INBhGIRb
X-Gm-Message-State: AOJu0YzhB48bF+x3xgk9wolaG+VyzLegBNm6lvNTmLALl/xlLPkTZRVt
	/KTt44gy7BXzAkGhgaw/nTxJ3vyDirY05oZjaT7A0PLgVyLdP+p0XKYq6J9c+QYgjYRT4OaMJRC
	v
X-Google-Smtp-Source: AGHT+IHVZNd88D6NET528Zgd6XV9jJ1tULhE5ZdXnc0lzEDfQWH4ANQji9eJWKRhji0xV1EABYWa2A==
X-Received: by 2002:a17:907:9714:b0:a79:7f94:8a73 with SMTP id a640c23a62f3a-a7ab0d818f7mr135486366b.20.1721819867290;
        Wed, 24 Jul 2024 04:17:47 -0700 (PDT)
Received: from [192.168.1.4] ([79.115.63.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7a97c0731dsm169457266b.19.2024.07.24.04.17.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jul 2024 04:17:46 -0700 (PDT)
Message-ID: <dd0449bc-f02a-4879-a7cd-e01fbea01d9f@linaro.org>
Date: Wed, 24 Jul 2024 12:17:44 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] arm64: dts: exynos: add initial CMU clock nodes in
 ExynosAuto v920
To: Sunyeal Hong <sunyeal.hong@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240722223333.1137947-1-sunyeal.hong@samsung.com>
 <CGME20240722223341epcas2p1b08b47cfefa981a2b31aad7878e3db64@epcas2p1.samsung.com>
 <20240722223333.1137947-3-sunyeal.hong@samsung.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240722223333.1137947-3-sunyeal.hong@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Sunyeal,

I quickly skimmed over the series and I fail to see where/how the HW
auto clock gating is enabled/configured. Would you please add more
details on how this works?

On 7/22/24 11:33 PM, Sunyeal Hong wrote:
> Add cmu_top, cmu_peric0 clock nodes and
> switch USI clocks instead of dummy fixed-rate-clock.
> 
> Signed-off-by: Sunyeal Hong <sunyeal.hong@samsung.com>
> ---
>  .../arm64/boot/dts/exynos/exynosautov920.dtsi | 40 +++++++++++++------
>  1 file changed, 27 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> index c1c8566d74f5..54fc32074379 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov920.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov920.dtsi


cut

> @@ -224,7 +237,8 @@ serial_0: serial@10880000 {
>  				interrupts = <GIC_SPI 764 IRQ_TYPE_LEVEL_HIGH>;
>  				pinctrl-names = "default";
>  				pinctrl-0 = <&uart0_bus>;
> -				clocks = <&clock_usi>, <&clock_usi>;
> +				clocks = <&cmu_peric0 CLK_MOUT_PERIC0_NOC_USER>,

isn't this MUX common to multiple GATEs? Wouldn't turning it off affect
other users than the serial?

Thanks,
ta

> +					 <&cmu_peric0 CLK_DOUT_PERIC0_USI00_USI>;
>  				clock-names = "uart", "clk_uart_baud0";
>  				samsung,uart-fifosize = <256>;
>  				status = "disabled";

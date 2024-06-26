Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD8715380A
	for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2024 06:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719384719; cv=none; b=UJVSEvzNwdFN+xp6qmS7HHpoX1Pfv2bvcHQU59Q4TMU1U7mXroYlYcAvzFCb1Xp80ciTxn5/Cq215nmVRcOiYS9RBwz4Ua5GuTBIkyDv1rWvG3hGUQeLV37a38ulpbJwo4Hw8xnZZ3eS9zml0Zcs9m0c1HzUFWaz2qn42bAojvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719384719; c=relaxed/simple;
	bh=ynqlRCWRsj3iwf/QWz3tSm58xMrYIOb+tFBeeWdwR1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GjuYkz7nv7Y/wDmxqsoDcDbDbvO6mdDu+mlb1+JyvJH/IzbnxpUKY+6KCbRpH55BiF3fPWTHCjD38MbVN6oeHRZm8yqbqrTSwzj3TH8DD/v5uwzvRrJEdQshcInpSO2IHlyzJciurR7NC8U7vwRd7pZ1lM5eSQP5ga6rQk7VI+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dJ0bXan3; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dJ0bXan3"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eaea28868dso83547491fa.3
        for <linux-clk@vger.kernel.org>; Tue, 25 Jun 2024 23:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719384716; x=1719989516; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V3uopRJtNOMBMWqQ1sVAqEAV1XHAWRxYPml/zB8ZcPs=;
        b=dJ0bXan3jyFLIfx5ue/LPWCGtLy11FRb1uH66z3d0uWClut3SnrKGsdmTkJ527NZ4E
         whasMI7q2cPOzMVWhwUkIE7m8w6Uc95LESAoJ01bMBMW/kg70VkL1S1E4kJMSjcZJpU6
         D/CFadMLjZx6QJ3BpcBA4CJckKXwJTqpxf00Xi4MZranybUWMfTDoblFKDOBnWNECQ+z
         AxF4JghnttgvYXGU2RusC77liKpGmu8cVg7q04nRj/PlpquNRzmO5Tw7qus8oXn39K2x
         5fTfYJFCMnr9siN/DqOG8X6tlklvIwZ6ybUq4BMYRV48Ppi3qFzpo7rK/RaanUzpCKSW
         El1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719384716; x=1719989516;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V3uopRJtNOMBMWqQ1sVAqEAV1XHAWRxYPml/zB8ZcPs=;
        b=pSPckJrfMFBAqB7behazG2glbW3MdqdcXGBd3w5vuyXFJcRqQ225J1nfBcIXypHnQw
         /X+jc7ACB0Fih914aMnLWQHz/1jd4KcxK8EZq9h+0FMUa9TPUW4Ollm8oEu9l/jZ39wu
         wHbfwk49xMtRK+Xs/IZElA2gUICYpglKOcDUPZa30zQHn5jL87A+xZv9b/F/CPHB/s51
         6eNb3lo7EVxLf26veCSNhkGp2m57nMQMJ2vaH/GMfsSeQch4lW0OFjZSd9Q/W795kOOq
         E8BbDl1XKD8aUyf42tj+Jx+1x8+qNz5V3y7CcPcvwPrKwlVKi4ww+lfvHpef/yvghf7+
         3Ucw==
X-Forwarded-Encrypted: i=1; AJvYcCXQSIHkYOwqy3conkzaqDjTuJ3T8B+4pdXrAeoA/u/HfUGW8oXJH+A0GS5YDW4E78XIi65fUhCjgiXJCh/s2Nbc4IYnrbzNXk/E
X-Gm-Message-State: AOJu0YwQiapSfv3+EJ0Sdd7RXizCcfvMXZggN9nspgAT8T2Ah3XSqmxc
	4Gttx7f2Ma4Xr1/NJ5ca7EWdLqXBjkmhC1ixahR8jMWJ+gvwkIq4Jgh/8LSDov0=
X-Google-Smtp-Source: AGHT+IFGGT3YphhculXUz1kiKx+zIWJ6mdQrn4bujuYnEj3vPo1Q8an8KCt9LuHs1xrWKLz4/0ZaSg==
X-Received: by 2002:a2e:a595:0:b0:2eb:eb96:c07d with SMTP id 38308e7fff4ca-2ec5f8fd33bmr76680151fa.14.1719384715402;
        Tue, 25 Jun 2024 23:51:55 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0? ([2a05:6e02:1041:c10:c49e:e1a5:3210:b8c0])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-424c838099esm13342605e9.40.2024.06.25.23.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jun 2024 23:51:54 -0700 (PDT)
Message-ID: <ebfc206c-748a-4741-9b5f-4facec985a5f@linaro.org>
Date: Wed, 26 Jun 2024 08:51:53 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: drop stale Anson Huang from maintainers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Dong Aisheng <aisheng.dong@nxp.com>,
 Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Frank Li <Frank.Li@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20240617065828.9531-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240617065828.9531-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/06/2024 08:58, Krzysztof Kozlowski wrote:
> Emails to Anson Huang bounce:
> 
>    Diagnostic-Code: smtp; 550 5.4.1 Recipient address rejected: Access denied.
> 
> Add IMX platform maintainers for bindings which would become orphaned.
> 
> Acked-by: Uwe Kleine-König <ukleinek@kernel.org>
> Reviewed-by: Fabio Estevam <festevam@gmail.com>
> Acked-by: Peng Fan <peng.fan@nxp.com>
> Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # for I2C
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


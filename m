Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5098A225A2
	for <linux-clk@vger.kernel.org>; Thu,  2 May 2024 07:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714633399; cv=none; b=VdXd+7dt/H57fFsi8MKf74upgN0joNEbZDpgedBRFgMqSi4pwbtoIFFRu2frZZxUXF/a9RVqiGAmD7EyLoMvXF54ApaXlO3Hj5sAhhXdoKzOsJqF1jsGlkjk5UbOeWVgPbUlCaElSofwmwXDVG0yxnDEfK2Tk0dibhL5ydObR4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714633399; c=relaxed/simple;
	bh=HioLiSxaTT3L9jLeBVE08Icv/6BMDP4b5Tqu4usekps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CcjSPu5DUophVXHGQ9xAZUAP5eZmkYhPMmHrMXEXVksqEIoMZmhqTVlD5+ugyClDzyxNba21FOM3iT7f+LHF2CY/k7cSvhX+ih+Rta3ZpGBBgj8Ld4ymFyetmuARvFZS6Uthhcx2F98kQ8GsJIhcdyh+rHYbj2QM0VJHsnHq5pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tC4XrcGp; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tC4XrcGp"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56e48d0a632so11716498a12.2
        for <linux-clk@vger.kernel.org>; Thu, 02 May 2024 00:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714633395; x=1715238195; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gT0wZEscSYeblV//UK2U7Db5HieDrFtfc03MYGL1w1I=;
        b=tC4XrcGpXLmDW5X+LEYIKp2hmfXHghh3p+yP+5Vm9YjUqNGm9MnPlBJWj1Qm45DsfW
         22dvCvctBtpXlV4AXA0e/o4z14zC5u+PgoZlDVfvG9IQr91DR96i+iG04yu67Y8TrNoQ
         8X06HRunxGrT1JX+XbFQnVRnwraavdNiN42w7v8V0jX29EO0Jl9jmufenxq+Yr5bfJ7F
         SZkqKSedGjdPPDA4Z9srZYKhAoGMMv6GruGsF6b2shZh0MLeJHJZVDOiWxgXgvhZfv3V
         wUWGSD0NKkW9q+NUU2kA+jIY4cWMda8uK4CySJO2grmS1jmfb1vDPsmtbe05MLW0m83k
         lVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714633395; x=1715238195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gT0wZEscSYeblV//UK2U7Db5HieDrFtfc03MYGL1w1I=;
        b=SYv+GW1BiUPqTUjGMNuPhLed1aGmTLEEweVrdLY09pIw3YhGDxON1zlL/XaxPCy9Gp
         dLTyZ2kXlpgkd1fSCLtaaYIAM75rTOfWW9oBPlOiAbUV2l5e9St89i3TyYWdRJQJfKKr
         pAJ7Y8Xclmd2iuZybziX2R7GxnMvi6U5gs3oTqsfw+oQwrsBj2ehUFT4t3c41+OT3XRl
         iTr5dVy9U/A6VXa2o1skIWl1N6cwVldtS1m+8FBTYDzLDWY6ynyMTUCQidnsDTDmx7fV
         /QdOV2KITwWTPRZVsREHcWegfxPM9rfOHMwDyQlPpq1C5IhpPFfIapkuYuokpYkOWoLc
         52Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXot6rnUj3yr9OkRYac/+TpPZPLteiVEWBMb3O9YmH50cpS6i7yUpBtDe2HV9Tqt1duBCUQL2kY49Ioygq60tKpl5lZlFtPKSjP
X-Gm-Message-State: AOJu0YybqJUu8hAJYP8LKQmGe/1pW2EW6fajMK+cAh6xtpukHXEVGwie
	lCjiOXlbL5ZTkGYldQAia4SJR9R2iKdudEQli9Qecv4cxW7k22NEeAmL/iYMK2w=
X-Google-Smtp-Source: AGHT+IHFpFEqlXM3zz6rJKm3I8vjCOOz+uryNLLCBIGYAJc6l96B5NrBVV8YYabtH9jAVna9mDuoZA==
X-Received: by 2002:a50:cc9b:0:b0:572:637b:c7e1 with SMTP id q27-20020a50cc9b000000b00572637bc7e1mr1146508edi.21.1714633395016;
        Thu, 02 May 2024 00:03:15 -0700 (PDT)
Received: from [172.20.10.10] ([213.233.85.172])
        by smtp.gmail.com with ESMTPSA id d25-20020aa7ce19000000b00572a7127cb0sm182422edv.50.2024.05.02.00.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 May 2024 00:03:13 -0700 (PDT)
Message-ID: <b3621642-485f-42d4-a9d2-0ccca63e219b@linaro.org>
Date: Thu, 2 May 2024 08:03:10 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: samsung: gs101: mark some apm UASC and XIU clocks
 critical
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com
References: <20240430-gs101-apm-clocks-v1-1-b2e2335e84f5@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240430-gs101-apm-clocks-v1-1-b2e2335e84f5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 4/30/24 10:54, André Draszik wrote:
> The system hangs when any of these clocks are turned off.
> 
> With the introduction of pinctrl clock support [1], the approach taken
> in this clock driver for the APM clocks to rely solely on the
> clk_ignore_unused kernel command line option does not work anymore and
> the system hangs during boot.
> 
> gout_apm_func is a parent clock to the clocks that are going to be
> handled by the pinctrl driver [2], namely
> gout_apm_apbif_gpio_alive_pclk and gout_apm_apbif_gpio_far_alive_pclk.
> It also is the parent to the clocks marked as critical in this commit
> here (and some others that aren't relevant for this commit)). This
> means that once the pinctrl driver decides to turn off clocks, the
> clock framework will subsequently turn off parent clocks of those
> pinctrl clocks if they have no (apparent) user. Since gout_apm_func is
> the parent, and since no drivers are hooked up to it or any of its
> other children, gout_apm_func will be turned off. This will cause the
> system to hang, as the clocks marked as critical in this commit stop
> having an input.
> 
> We might have to add a driver for these clocks, but in the meantime
> let's just ensure they stay on even if siblings are turned off.

It's sane, yes.

> 
> For the avoidance of doubt: This commit doesn't mean that we can boot
> with clk_ignore_unused.
> 

s/with/without. Because there are still other clocks that are not yet
handled/marked as critical where needed. There's still work to do.

With the typo addressed:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

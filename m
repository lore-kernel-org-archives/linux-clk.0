Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B714C428461
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 13:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777556418; cv=none; b=OgtG5i9gD/qGMbjHq2Iu6RRRibEnmG96aAzeh8KXagf8Xq9tGKq8iYbn4jvga1LRSgDSTst329c4QGWrB+Rp2uugQCaSMv3gIoJbrL97jHhOntPbptXVtU9oA0IbhAe49GzzlKoUd8EF1dhfrdbl5GVt+0g5lOTI9/zkZQrO7K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777556418; c=relaxed/simple;
	bh=66i8SiZie1Gm4LFg+caCbRColkgs0M0GxG5EPWDPZas=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bj1oLZ9SY2zUTHPV4kyq97qLzuE1mGWMuBN//2/3ffnDReAbcNjPe5M5LN7xzR8MCG/kEx7XrplBtGPJ9MmqFs7leWrGX39T9qUMhoSEHzD4YBmdR7Hp4at9M12JvBkvZnibLqtg8CCcyOYH44Dxu/WODrzivNbfNgq/nrtKU78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EKtLRtYg; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EKtLRtYg"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so658039f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 06:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777556415; x=1778161215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=meUp30gG/FVsgvAEeVESK01aKYB23yJUpx9wfRGIDWY=;
        b=EKtLRtYgX/Nl6Ve0ubV9vwpQaGqjSHwvQifUuHF5emo5B/cT8jFYqMwgASfY2b3o0N
         BqkoHpbMByB5Yj3zGcDYK8tg9VjxHViKYXcURXSTuSQZkOY6c867G/Gg2o6NsBDp9Jwr
         kTWTv7yw0ACdd+BH8YRYqe4YTepDEV/h5NT+AeK44PBx1qReR2EUwDDkz/U3mV71LdX+
         YWM5B3WDp9H1WALbDNEf/oxT3WIBT12kA7AyfrPF+OY/ew503qkFE3Bm/C+6ykIMZFJI
         XL7yoSBWHAPWHyctLFQCHNXr03YC0e7EVjtVnCr6WjFYDx9nSJWiRcqtvCR6GjKmrZaz
         QbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777556415; x=1778161215;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=meUp30gG/FVsgvAEeVESK01aKYB23yJUpx9wfRGIDWY=;
        b=bSBnk8XjTr2XMPySlcE3wLWyhjVCIE0JPOBDtmjm/Ji1L6+aMZ0zt+ZBcbRAhYkszI
         BD1QEPqBuAYYOLoudznpkt2t0nnYo9ZXf/FYiRGaSJE7E/xLnRVgEFam4GAUvERKW4iv
         X75B8GYR6A0IqeyHWPFAjZN7T2tuxTNdDm1TtGXbNOBM4pvUHPsigWQWhocsO3EQ+2BE
         xU1GzT0hFH+xIfKkqTIPOvZDdFTKYLY0y98IG9k1y/Ei7tTIU3p4txNj0H4tslSIdQqs
         em3GnYfS3LWe8mmhJb2lEHZco8OBJEMmAjuacYtn+KDgw5+vC3jwJeKsQPsiicALhifz
         iL2Q==
X-Forwarded-Encrypted: i=1; AFNElJ9BzUcWMhLuWhpqlgDsjJgBN6fQ3qP2JGgd7mRXHzf+eFhpipJAdPIuMByG+oOU3sOuBpJEzjHdBkg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyaz4rIDEVQ+MiQ2m7nlLU74Utr+DDMdCSrozMlcuuOuXVAh+iH
	WiFaJUe/UK2qNtVuDcODsoskvWdQ3q0Q2kqTIbXr0GH20x93zuWazw36L52EEoSkHJU=
X-Gm-Gg: AeBDiet/KZ4b6v6q9gi/H31hKTIySvfKhFx98Ko9Ktl5tFkdzdzMc8y4zHCeE0MUFqh
	eG9hN2e6xUsHyX8bDk+T7tsNIYZgyz4kzU17eEy4q80qm41wQLjlswdviPF/rAV/GrI5OPjHzxL
	HcmFVrLOMDb9mRzolZ1/BDDo1v0ipysUMLoj9vfakKzu4bSJ/Mklu7M8M29gdaADsT+9GZFcmon
	98iXhCSQyu5CKSjSqpsYHAgUkayVUyb/FgsuDeYGj8VIxbo3XeZ8Lbg4GQnZG5nMWdc2iwoBzX/
	5re8w2Y2MjnSrW59w+3B4yTZEUQBSJ+hrlrZ7AJJqBwVuElhzpjAD/snD2lXdG7Rxsvl/LtX7gr
	4TrNQucwlbLSp8ePn/5Mk9fuQI8Amn2Q+G/9vxVb8zGizSQJbJsf0lCZVV4zV5aLdcwpPJtyLIF
	xJnhSPGBAwRwId9ke5zI7iVOKBZ+uzRpvw6J1P71W5KjA=
X-Received: by 2002:a05:6000:1862:b0:43d:77c6:be78 with SMTP id ffacd0b85a97d-4493f42beb1mr5272265f8f.39.1777556415022;
        Thu, 30 Apr 2026 06:40:15 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca664csm13806106f8f.35.2026.04.30.06.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 06:40:14 -0700 (PDT)
Message-ID: <56c1bb6d-54e4-4977-bd88-9ce7a6086b1d@linaro.org>
Date: Thu, 30 Apr 2026 16:40:08 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/11] thermal: samsung: Add Exynos ACPM TMU driver
 GS101
To: Alexey Klimov <alexey.klimov@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: willmcvicker@google.com, jyescas@google.com, shin.son@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260423-acpm-tmu-v4-0-8b59f8548634@linaro.org>
 <20260423-acpm-tmu-v4-8-8b59f8548634@linaro.org>
 <DI6IGZIW2HZ8.OBLZIORMOH2F@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <DI6IGZIW2HZ8.OBLZIORMOH2F@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/30/26 4:07 PM, Alexey Klimov wrote:
>> +static struct platform_driver acpm_tmu_driver = {
>> +	.driver = {
>> +		.name   = "gs-tmu",
> What "gs" stands for in the name?

:) Google Silicon I think.

> Shouldn't it be called something more acpm-ish generic like acpm-tmu
> at least?

yes, it should! will update.

Thanks!
ta

Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E03818A6A9
	for <linux-clk@vger.kernel.org>; Thu, 22 May 2025 18:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747938775; cv=none; b=tPuadqts5en3d4t6WcsuDin5U7ACD/DJCc7q0Ekm8vJgUmA4uvsOj+mTd+RIGB2qU09mh1JhQNIMBaVC6ON3/Ephc7pWuQfPx2Y5sroTzRT6rLyZ/EEObtYE3BQZGhUNLpVCyI/4QrvxdKvbC5qGdIRlDRKghY/R0WezcPj8V54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747938775; c=relaxed/simple;
	bh=lMJ6tHz4tOW1eWeTG1Uc6/k5VF7JF9zmg/OfZNm2H1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xm1NcEEhJS0DjOm0KAGmflf7tC+cx7lmBzg7Ys3AsXBpf8IOXOadw5SzlgfinZpntjHoiSEqLSxpr5B2by6bxOnGsDXxQhv5IT2fq3bt9eD0vB6OVYLTgVvFJCqXe2Hcj8Bv7svcGHuBUCkxmHfD5I5KrI6CFDa/lGGTVB9CMAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KL3HxUfQ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KL3HxUfQ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a361a54454so1025942f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 22 May 2025 11:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747938771; x=1748543571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cJY9vehP2g7EGxYhkgZzcqCJWvR4zDkNLhtdKYt0bgU=;
        b=KL3HxUfQz5TBpNNfi9O71BW9phF3C+egioOQ67fgwuXJ/oZw9qhtav+7iaEN3DN26y
         LsyeIFwshFcYJZujWPAgdIhUoHnrGcDrPFyAxAA8oKHFVZitzyZL27G6lqy1oyrzcvJU
         Kww5Hnhc6tITl0QH5xUVVLzMlzzxdCl8ihbZ8ckC7kOntY1jQ9anCBMQg2JhpD92+Wg4
         0j2gQs7EfRschDmUkWX2YrA+Z+JEF/TMPxEu6/0PP54Ladm6lMyFHiKP0lota/8Z69ig
         U4dTbg4DLYNNcTE2WeQSzAYReSd5vSBlCU9QJ0QGlx5gPHJnnB8dTYyvF6/s1707egQ7
         iV1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747938771; x=1748543571;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJY9vehP2g7EGxYhkgZzcqCJWvR4zDkNLhtdKYt0bgU=;
        b=jDXlYnZRsHieEnUEvjKFwIJgdnviG5FqYjI6bYTWpUaxJJTpvm4o5r+7N6eOwU4P57
         p8VZmKKhhzFaWkFxjxaWvhobUUoEAuCZQpSCnDWEK1fOdrQWvDUeFa/f07ZaVVdHE4Ju
         nSuhrz3+qsnMBdnw2fLP3gFjNVT3vG72AgGZUiH+xClze+t9XDcqxmGIUypN3lC8ZsiV
         MyWUfv1KLcABdugUwN5Et0cZkzxGe7Tkk4MartkPJeTrYDBCyw8tczLeYeH4JW8D08N3
         57uU5/6srSRwNeZcwuL1hS3uHqmb1m9Aqu7Ljf/TX+d6uaG+/Ec5MB1Q3dBCU8BXnB97
         RLpg==
X-Forwarded-Encrypted: i=1; AJvYcCUeBexpZXGy+AueRjXn8khOmKNQHsklcPihw3sdZO4zFZuxtyLgByhcxn9DZC/lu+ydvgl8jXAjuDk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1ijvDcQmA0UwZuNaa6CeiL0glfghOA/1x8UAJrEUukACqVmGc
	eShf8X1ZbcWR9ESFPPyo8xgB9p3+JH5spTFRm4CBqX+13SnhkZbLQv9crjEmKA676dM=
X-Gm-Gg: ASbGnct4ZNHLSusylRmGT3hBLmaL8rTOD5wwub0t1IAxpcHgpCtHT5EXi8b02/4u8Xp
	/2dcILFC8nHVZ087incCO8ErrHSVl9gLjmkAWGlDC/I7cgN2fVuo9OdAfWwOVmZlAfmxSafaelL
	r2IQAUnxuO19fPs8akzBHDiMGg4I8Xg03eZnf4k2ikrSCbIv8jQeWdyYWQqXOOljgdnXufOWMkn
	XLlLnlJpNdUjJhMYuUrvOYtjV7eDursmiwQunIEeQ2GNHRngKdb3Lf1BGeYVTFAdgsW6l3RjVpV
	zzeMqYSWkdAyT4uthgTFnONfEAqWcY8l6IF/0Uahgdh9O5yUZHpM/G566R1rPZP912jmVBg=
X-Google-Smtp-Source: AGHT+IGLyHoeTc4HSvaXyg3+PQJQKiImY3KCxwct5wGRCFTjBfvCwUsuGdayZtCuy6sdlhDOtQDFIQ==
X-Received: by 2002:a05:600c:3587:b0:439:9a1f:d73d with SMTP id 5b1f17b1804b1-442fd68257fmr90763505e9.8.1747938771266;
        Thu, 22 May 2025 11:32:51 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3ce483bsm113545715e9.33.2025.05.22.11.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:32:50 -0700 (PDT)
Message-ID: <f3f2b57c-d745-40b4-8317-5f123e2ab018@linaro.org>
Date: Thu, 22 May 2025 20:32:49 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] clk: stm32: Do not enable by default during compile
 testing
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, =?UTF-8?Q?Emilio_L=C3=B3pez?=
 <emilio@elopez.com.ar>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
 <20250404-kconfig-defaults-clk-v1-3-4d2df5603332@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250404-kconfig-defaults-clk-v1-3-4d2df5603332@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/04/2025 13:56, Krzysztof Kozlowski wrote:
> Enabling the compile test should not cause automatic enabling of all
> drivers.  Restrict the default to ARCH also for individual driver, even
> though its choice is not visible without selecting parent Kconfig
> symbol, because otherwise selecting parent would select the child during
> compile testing.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/clk/stm32/Kconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Ping. Any feedback from maintainers? Stephen, are you picking up this
directly?

Best regards,
Krzysztof

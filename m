Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543671428F3
	for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 18:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736879005; cv=none; b=rIM3jqOxTp9CFthWIsKngzzpdLLUV5ZuyZrTa7hWUicyO3owXwOcOm1Hp43PdewEjhTw5cKxpYF2hP+YltAIae8Gjf6ThzHZ/KwickZGzYffC8WMYABS/tOptPvj1eoTB7o0cVmaVuqAT7bNkJnq8K8AMIhAOg0dTuxrFqomVnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736879005; c=relaxed/simple;
	bh=iJ2botgNorAHUDTTEM+60JBdoVOL8qdzy0R/kn3ucSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DfNrxzWSAFcj2BfvMP68RGcjZi4eT98zttzEJRJ4/MwLExIY9zuIyR+AarCcn7oqk5MQ2a5ZzlUpR6sqyEXXwcemFacfZ4xhPpCACpkzZNq9qwGkMxxIyDV8WJep0+9M3iE15HH2Xh7KzcrhIuzurk+nzjFVvzGgHqmXauAP628=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aThKnQAb; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aThKnQAb"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43620a5f81bso6285515e9.0
        for <linux-clk@vger.kernel.org>; Tue, 14 Jan 2025 10:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736879001; x=1737483801; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1zaEU+fKkHTSCeQzgeeLu51Lif3p8LXyFbHdtAfVVUM=;
        b=aThKnQAbZQ4HUbmGdRsuqgJQmZtuFT2BjRX5z9z2P98BHQPre/w8fTlTjrRauzFG/U
         hKFLcJeYYCixVzSp0xq70CLQ7Wkfni415wnVBQ1uu0ZTtyOhsW8VJjqNgzFe4cWxCLOY
         EKmLxwtdy2SzK9/nP9Eev35T9JFj0YfFVAK+N5Wo1BUY9KqAa3fCTcVDH3+kNa2YAJFO
         IXaywHBltN4J5AtC/oaReocFzfnI6rvAHEuwTU8tzDaw95IijglSafhC2oG3a92iQyQM
         VEKah54IFw2nKZYjiKl0PcAf2tuJJY6IZLj2jkQKJOTcqCEfvftEipdSJXHEBwp9Uugn
         9Uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736879001; x=1737483801;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1zaEU+fKkHTSCeQzgeeLu51Lif3p8LXyFbHdtAfVVUM=;
        b=WOdk7uiksEEWreTdiiRN512bEV1JQTgT94gQkq/lkSCt3biDd7aPoT/g0s4+E71jCs
         yP9lGMvZEM5FJvyo6UTzPWsFhXyV3Z4dN5FU3J+0bCQYRGA8CIc4iVEmehtPvqEJvYbg
         TT+f2mbMf313SMsln2j1i5JTOjx9aM5V/N31bY4DzWZ290iHksakNur1uoOmMTb+A0qm
         /t8Zqtl9D+OGOE/Y0mOj+lA5meoVyONRU+FFghBujtpj/Oyj/9GkqrrIMbNy4eXywTgB
         I1cpoiORzY47yUvTheg+oxX8MIuUpX0ThxVQxw4mir+SvTICe5v+UBlOuDhc07CLA1Md
         h6XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlVCldAUZzZRUOynnPt9D7s3K7dJPH5C1LN7F4FUODP7OwnIbRosiXaFCMdKQLxaplgNaUKifBlps=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGWPVzGmjB5jD72WQS2bHHFWI+BcUkD/ItQ5GmKGnBMYZLnXMD
	Muf0hJRoqGjUcKSAqZLK+0Vu4jX890RJbUI6xlKNKNiBcmuLMopemwzyBNZZdaQ=
X-Gm-Gg: ASbGnctBkdmtbJ0AyQ4WH1gxqFnWFY1aHOvv2fFUHCdkRQpnLRvwtaotc1xJlJjgfby
	LWMyZsmTmNom1vEw73ZDseGMRamJhjgao5x96U/9K1SXoJGbbWNOG+8Gvr5OoUNApBMUYhmTUFC
	A3+vcoOVSzpd60HMH/fnSJv9fBs9IuIqjUJwpW2ZD79W0bGQQFcJBXATWly0siXrptaQZD3WJ2R
	A4Jx5CsoLX9H7iFLrNMn+X9UjJ4ZUggqrjdBZGmotDOBV38t7mFiUY47UW3Z/81AneEYJdKpJ1K
X-Google-Smtp-Source: AGHT+IHmpm8WTgEywXZIsAcy/sxtVrD1zv/JWxGm2FtAPzOMwfxhoKqNhtJW9nfd9wo1LHaWdk9eLQ==
X-Received: by 2002:adf:e3c4:0:b0:38a:888c:6785 with SMTP id ffacd0b85a97d-38a888c69bcmr6627077f8f.6.1736879001448;
        Tue, 14 Jan 2025 10:23:21 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b8209sm15760756f8f.70.2025.01.14.10.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 10:23:20 -0800 (PST)
Message-ID: <c1147188-f179-41fd-bd53-2d1ebfc8d860@linaro.org>
Date: Tue, 14 Jan 2025 19:23:19 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: Use str_enable_disable-like helpers
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20250114105618.273302-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250114105618.273302-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/01/2025 11:56, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/clk/bcm/clk-kona.c  | 3 ++-
>  drivers/clk/clk-nomadik.c   | 5 +++--
>  drivers/clk/qcom/clk-rpmh.c | 3 ++-

I found one more place, so v2 is coming.

Best regards,
Krzysztof

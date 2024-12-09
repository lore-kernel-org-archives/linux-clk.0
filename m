Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61751BEF9B
	for <linux-clk@vger.kernel.org>; Mon,  9 Dec 2024 15:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733756523; cv=none; b=agAQiajR3K1rEAcc+brd6zJDNvewvwD/ZKRAZ4CtvGs2vQTzJ5l3d9JIHC2H6qDTKM0PWOIDjeUQp3rtQNSIARAeEiA6dyxCz3EnFy3Y763Yq7OuHuPeg3WEF9Hse4+MBQrWZC6LJ864inKSCXoFYiFIzrcsxKrtttnswhanmvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733756523; c=relaxed/simple;
	bh=gaS3F/AQeFd7VrSw3ZiPxomrJ5kbQNrmRNOjyFntjPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUWOe0eMwbOGv68UL94ja8Unhyj2v7eDvp2i8CfSNl27X3k9dRm3lcrv1lYcPazz4PNBklWVZK9XXF2JX375a2R8D7lX81Ank3M0PYSAYNyxXCSkqmbPHIjeG23MZfnGVWf4QfgsozZnbOibvA199ma/SnWIFNkURYnW4Yc6WLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E4RJQUFU; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E4RJQUFU"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-434e91ac3d4so1109425e9.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Dec 2024 07:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733756520; x=1734361320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Poqt7clq9YoBt3tHK/AIlc6WS0JoBH4g1M9GZwtdhqo=;
        b=E4RJQUFUNNK/xEXkYXrGetAx4bGEcokQpcrksoUCmd8/K4xh2lysPFAAdI4jf1OQ6t
         kzmbTPctiuwVOH/MLdX3NHd6bgyY3F4U1WKTaMx9NT2zxxtT1otXY5Mxkttbjpah82u5
         4bsJk6H2W9PPfr5rsJWmo/Oe/thuQCHwoVkwJ1KqsZgRSSYKbdfhdh4iAmQfAj7iFKuT
         rpVv1r3l5bj8JEEwekQZJl/Y6LFmUaoYkfhV+Ux8JJ3B+miZszFDhUoaThuJNK+cvP3u
         u+KO3JtGZZWhaYV8GOvXRcYDayLYUbRTBE+qpm3AkufHlOCMwueoPhVSeBq4LjtvIg4j
         GclQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733756520; x=1734361320;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Poqt7clq9YoBt3tHK/AIlc6WS0JoBH4g1M9GZwtdhqo=;
        b=s3z71+ZX6HDE4fq+GtOxjlNZzPWt1c589IF2W/ST3fzxIKYG+8mnmSHT36YI2LWO1E
         W6KkTlF0TOwUJmrqVEpwASeGhbJrwURKqycHFdo19nS5xELWyHVAEM5zri4jWsItxtDe
         l5ueuNbMgFBEepgbNBn5oNjcdUx+8QSJt1x/hh1Fy90h3vdziBd7w2x2KTlci9oi2fs3
         g8F8iCKBzQqxe9hghRhV7thr67Srw+Zr/zP6qvHzrauOg3AiU0IcU2vc2Vvf6pQs++SV
         Gu4YRtiO08NQDRnRcKb4nZiMsgvxs+ccRY26l/IRQk+/iPkxp/ro+JECDpqYpuoqvgjs
         c7Jw==
X-Forwarded-Encrypted: i=1; AJvYcCURKtId5oYJSLIJaS6d5UI7Al5bCx3A6N/uOMgUlmDzZk5f6U7+cmQSVqkX1neO9osjdiqyuCW5t4U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1fLmHaRAEXEj6Ze0273nP/Lyaryumivt9SyGsEOMhVeYBda5W
	lb3asjswlxxG02jsBmRyadyhDl3T9vRwZVe1Ndf0hcpzosXScSgYdXuhTcEx79b502OTYLCVb86
	Q
X-Gm-Gg: ASbGncvmVsrapeMClvoQwLa6yGkbynyPpphms+WV56VyleRCEIcLT8clgHnrP+5yuT4
	BM6YyL6WUVG4+5xeUxKS2xo6+euh5vdF5nd7iVxlVPxtvmxhf8h7HxT+FTnlVBR9Z1pMgZr6dMM
	fIpelBbIGQTGBbabpea0Dyf5oIWZF9y0i1ztvJ9M+PFxPbDwS3KtHKGeQLe+nNcHVPqjHXwLOSq
	iG2rz3LxSV+rPj2z3O00lOHKtfJHixBfpC0kNzzdBSahmk9Ewk0Jyi8C+bRBUecnJuyAw==
X-Google-Smtp-Source: AGHT+IG5wVQR5zn0qEech3PQk/RnOBKRD4dBMIi5KxVndIm/gYii/E5xHicvVJNvwfJrL+0LRQzBkg==
X-Received: by 2002:a05:600c:35ce:b0:42c:bb35:b6d0 with SMTP id 5b1f17b1804b1-4350197e966mr97995e9.1.1733756519724;
        Mon, 09 Dec 2024 07:01:59 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434fd8b84f0sm17714245e9.28.2024.12.09.07.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 07:01:59 -0800 (PST)
Message-ID: <0c6a20fc-113d-4113-87c4-7b97c041d2a2@linaro.org>
Date: Mon, 9 Dec 2024 16:01:58 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: qcom: Add missing header includes
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Taniya Das <quic_tdas@quicinc.com>
References: <20241209111315.60776-1-krzysztof.kozlowski@linaro.org>
 <20241209111315.60776-2-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241209111315.60776-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/12/2024 12:13, Krzysztof Kozlowski wrote:
> Include mod_devicetable.h for the 'struct of_device_id' and
> clk-provider.h for the 'struct clk_hw'.
> 
> Reviewed-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Rename subject (Include->Add)
> 2. Rb tag
> ---

...

> diff --git a/drivers/clk/qcom/dispcc-sm4450.c b/drivers/clk/qcom/dispcc-sm4450.c
> index 465725f9bfeb..cd8a284258b2 100644
> --- a/drivers/clk/qcom/dispcc-sm4450.c
> +++ b/drivers/clk/qcom/dispcc-sm4450.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/clk-provider.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>

That's a duplicate. I missed earlier LKP report. I will send a v3 tomorrow.


Best regards,
Krzysztof

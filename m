Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806C51B414D
	for <linux-clk@vger.kernel.org>; Wed,  4 Dec 2024 12:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733315855; cv=none; b=TVaTHN+bsq8siRU1KGgoBJoyO8HE+Fo/FQRwocWIqM+gGG1sZ+Qrx/pEXYcMWRaowFXybxmOd+8Te7U8kf+G3/iepkd2csO9khM/+ZMym9RJQrBn/tlJYgomRd/Ab2KT2ZFN9IXekiWnb1ZysSy9GbcvLcYD2C0QahUga53GLaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733315855; c=relaxed/simple;
	bh=f4JdU7Rzzmj+R1/OxrSn7f29PwCd20slBxMMB9kdPKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZOch321l+TMjdeYPX77eIhRphVNOkLvv5pt5szg+aQpLX+xiyUqyLxQogJzmC9M9SfPlXQeGyDzjwletABrygblnPw9GNxViyo9/Q6FQhY51HoUJ0xqEUwFqbKcpwEn0zZD8a4jWt/ASYzWNUTsxQJuMJzeDAg8vj/q+1ChydxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PQ7+584v; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PQ7+584v"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4349dea3e0dso6827255e9.3
        for <linux-clk@vger.kernel.org>; Wed, 04 Dec 2024 04:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733315851; x=1733920651; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5qn3ZnxaGnMmpvUaH/GWWsPm6fs0ctmSrJSJyOBSwzM=;
        b=PQ7+584vap2efqAj383P/ocERXP5pUqCVX37ySM/5PH4LNUSQIB5LGPFlCgDfTLMj4
         UGSJ5IcAsCxarP0dv78ry1H6KOR2MtcYA93RKAk2CCIuxJl0xLXe3f9DFEsTMQMUfEiE
         xCnsASuTe7PCCcaw59WSNEFCj9EDX87IdYgFxpZLo5LBsRzBZzAIGMoe7QjcAbcQrYDu
         N9v2k1fVZ0LmxX1DPgWbO12NTbqpjbcvrAo3YUN47GOr6VTj5Q1kUNkau52BTk7W7gAS
         jJ68aG4SK3bPW7TvZSNRcJ6BTu2wB+qFWCO4i17t/M4dKaYrEvz/7ecTQLO34HV/OlEU
         ygBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733315851; x=1733920651;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5qn3ZnxaGnMmpvUaH/GWWsPm6fs0ctmSrJSJyOBSwzM=;
        b=S7xdSYdq86yk67VLwimdcRZytqmFFnWpHAUAFtZ+SDa1d6O2EcnvbdgnTP94jvPmIX
         twD/MK58OK+uYX8kIToBP9DUPT9fp+zPnWTvy6YVgDmavqbLFLf+7lZwA+n1uVU9+0Ji
         TgAL/jab9ETqUQslW/OYCQUW3hntjCOU53/CbrRHiGSgzJPMDdbtZcT8nq8MMsAVZTO5
         GqlqWZ4MXKpbHvbJiYCwfGcHZnp9PuBBc7yjIVBibcNsa3gF27emYreZSnh9UoJoi+yl
         6250as3vn2B7cEpnImK/It/nmvxYFo1aSkQjbC+qimLpLL8nuY6uzbdQnVOt0IMiDjFe
         9hAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqI9b8UjqmpY0DpnR38XeNjkwvY2a1tV4mK98OcQ0iXeCGOfXFHyTlb0AYp5BTq+43yXEnFLAq78E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLk3RaKtLYD5HwH7sSbZB2H8wQXAIpcYgTrbFNz8hC0XOc2rn0
	2TulBSz/bDTIBc5wJR7E6I14X6hAVvCQ4yCwuiX9iaQmyM/TRetYT5T7dgdeN5E=
X-Gm-Gg: ASbGnctASNwuNtok2/OdHveVx9Et8bNkobwvE2cAVsqJSiZx/DPEQvDbzIggit6HYRv
	bSOFxPxEhbqckZRm8AoDuUgDlY/8mIVwuhAODW6PjYk3iwLEtQFE7rPWWsKdE9mBUY0GBR68atQ
	JScVD5Ys7gGHD89VBY6dXtugyV/iuX9cHa8MsntxVBmT5uFAtaZIyPvqdpcQBNN7sKsvPYx+5uE
	cASetl/JrJ1ipMG8KOU+xQ5G0IWprD1mj5Thiho3j/uVKi8/zIxWKtT/V/s6skNIfxLwQ==
X-Google-Smtp-Source: AGHT+IEeTkgOdeZUpGGaxGsdrx0QZvZ/CXigi7dcaDUgno+cC1CWkj77HFnwYP7ok2mKArIY6+M5Qw==
X-Received: by 2002:a05:600c:46cf:b0:42c:aeee:e603 with SMTP id 5b1f17b1804b1-434d0a1f397mr20263365e9.7.1733315850582;
        Wed, 04 Dec 2024 04:37:30 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52cbd72sm23817815e9.44.2024.12.04.04.37.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 04:37:30 -0800 (PST)
Message-ID: <03631258-545f-4f31-a849-9450a1a50ae7@linaro.org>
Date: Wed, 4 Dec 2024 13:37:28 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: Drop unused header includes
To: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241204110348.100841-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20241204110348.100841-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/12/2024 12:03, Krzysztof Kozlowski wrote:
> Drivers should include only headers they use so drop:
> 1. of.h and of_address.h: When no OF call is used (of_device_id is
>    coming from mod_devicetable.h).
> 2. clk.h, property.h and reset-controller.h: No calls to clock consumer
>    or reset framework, no fwnode/property calls.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/clk/qcom/camcc-sa8775p.c      | 1 -
>  drivers/clk/qcom/camcc-sc7180.c       | 1 -
>  drivers/clk/qcom/camcc-sc7280.c       | 1 -
>  drivers/clk/qcom/camcc-sm4450.c       | 1 -
>  drivers/clk/qcom/camcc-sm7150.c       | 1 -
>  drivers/clk/qcom/camcc-sm8150.c       | 1 -
>  drivers/clk/qcom/camcc-sm8250.c       | 1 -
>  drivers/clk/qcom/dispcc-qcm2290.c     | 1 -
>  drivers/clk/qcom/dispcc-sc8280xp.c    | 2 --
>  drivers/clk/qcom/dispcc-sdm845.c      | 1 -
>  drivers/clk/qcom/dispcc-sm4450.c      | 1 -
>  drivers/clk/qcom/dispcc-sm6115.c      | 1 -
>  drivers/clk/qcom/dispcc-sm7150.c      | 1 -
>  drivers/clk/qcom/dispcc-sm8250.c      | 1 -
>  drivers/clk/qcom/dispcc-sm8450.c      | 2 --
>  drivers/clk/qcom/dispcc-sm8550.c      | 2 --
>  drivers/clk/qcom/dispcc-sm8750.c      | 2 --
This file should not be part of this patchset. I'll wait for review and
send a v2 tomorrow.

Best regards,
Krzysztof

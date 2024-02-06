Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7662A13FE4
	for <linux-clk@vger.kernel.org>; Tue,  6 Feb 2024 19:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707246385; cv=none; b=mhww8Kh52SOnRL7V9MnvXFduvbQ/IihrUsSbQOWaC42GH5NdEYs5B6WM+6OziYUb2JUa39ffO/IPhXlXldlIyJEkBvJjIwrjIwNZmZ61An6/q4ZxzaZXs6XmrYpbbkQ5pXvmMQKJ6dEB2TYBXL8yDbVpRiWAkjCrUTJHkMUlSCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707246385; c=relaxed/simple;
	bh=G+lecByh6+XaG7NWfgkg7eNw8jSuoDSKyaz8z/tncB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l79TEwH7cKKqVcF1EGSktOv0Lk91/DQoPM8no0mh4nyHv0FkWYs0XHA7BR1LuVuz1J+eya8Ut2yj0u3eWXrMCTUyRNnrKyEg6AgY3iLte7+2D/NnkwSyZiRC/OjahQjFdgpRu7tuV+q6ZqvfbW2RgHQHUkqEpo2x2XBNStPclyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ggOdWcdC; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ggOdWcdC"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5101cd91017so7926638e87.2
        for <linux-clk@vger.kernel.org>; Tue, 06 Feb 2024 11:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707246381; x=1707851181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p2bnZENLiMyaQDcyMxphon9UHMO3Wmi+pEgHixUnYJY=;
        b=ggOdWcdC8pNRAImLnq4Bq4A71BVCLVXzHGHfDX0OsLZB/WioRYIfJjFEot0Fm3lsB2
         v1R8b5zBpDqzxZBNqVsH5WgHxsxgjhKMsmmyGbAKEGj93ywRK55njjuTiftvnzwhBs7J
         UZzEu+81GUnzhvRmN1uNo+zIjVi5FHTIcoCo8HlFA0kjH+rWEdxYWE9GBbLmO8xKkHr9
         YD42/dQW0BOB/TrJ/NPDvxBHFoVb3rbg6yF1HQnbbKOKrIkPvXgKerwgOC4ZazMYqVvF
         mmi7nPm1BNXASnHzKaLD1vHref79vCQU1q3rtvIBtm/vHuQ23f6TfQpN7wrf9VNQY54U
         PLqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707246381; x=1707851181;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p2bnZENLiMyaQDcyMxphon9UHMO3Wmi+pEgHixUnYJY=;
        b=HnfpL3fd6gYSqu6Cz6BN7BleNehqXGrBsllgdKUJTRap5veI0Lv55DxkX0gGh/kDvX
         AEpKBNhitG7dc+7qg41iOHqsRx4MCbi6z4NqZ8R23WN37hl22wUrlrkfHygfqYPN5M92
         IODkvQnW1dTsn2sJ3EPHzBMwAlC8xRb73/CbaGNN0D5zNM4DTu8+9Ws755CsbWKOTWLJ
         e6YGcNSOJSG3p7z8Uqblw+g0uDc6y2BKtjyF+J7iNmxN6RU+bHjDF0bomc0OcUwp6AAc
         j9wMRlshvjo20yma/l9aw4n5kmiGVcZDm2jPb4O+9mVuj3kbkr2yT75cou6Sx73JHKAF
         9emg==
X-Gm-Message-State: AOJu0Yw9fHYV4VWoT0kZEOGi+zK/mSW1uywV6EbC1yOpVjjDrY7lcIiH
	FAESUI5MHubIi9gNMz4gj2FAUIJxHnepNUJ7tYdMO+rXDxke0u58o9iu7G1uO4rJo2oqta2tmLE
	W
X-Google-Smtp-Source: AGHT+IF4yDvAhZAlz3Tz6MFHU+TgTL4H9q5w8HCqFF99MhkwnRA5ZUW6lNnJryNhNh9Xl3Mv5XS0OQ==
X-Received: by 2002:a05:6512:281c:b0:510:1b51:e431 with SMTP id cf28-20020a056512281c00b005101b51e431mr3375489lfb.4.1707246381385;
        Tue, 06 Feb 2024 11:06:21 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX7DCSPcm1/He8y5TGC7FntwthOW0EB8gRACxpw3pLR9P2hD9n6l3HFHYU0mAgHpRxUavKHga6u123i8R2VcFLA5kZ5Qo7R1J446+fS4NSiG50cSjWWCuzyLCVJjuR0yNfW2gY/VrQr+RmajKJh+cndUI6BdjjOJtHF/2xIQXmrChQecpeYpfTFYJiY/Xr3Whv1DgQtLxRhmiDPpWCq0kZDyQ==
Received: from [192.168.192.207] (037008245233.garwolin.vectranet.pl. [37.8.245.233])
        by smtp.gmail.com with ESMTPSA id h16-20020a17090619d000b00a385535a02asm224018ejd.171.2024.02.06.11.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 11:06:20 -0800 (PST)
Message-ID: <f94c1da6-7baf-4d41-b08b-24e0c58fd705@linaro.org>
Date: Tue, 6 Feb 2024 20:06:19 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: gpucc-*: switch to module_platform_driver
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20240206-clk-module-platform-driver-v1-0-db799bd2feeb@linaro.org>
 <20240206-clk-module-platform-driver-v1-3-db799bd2feeb@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240206-clk-module-platform-driver-v1-3-db799bd2feeb@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6.02.2024 16:25, Dmitry Baryshkov wrote:
> There is no need to register GPU clock controllers during subsys init
> calls. Use module_platform_driver() instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

But how will I play quake as my kernel loads!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F35269AFF
	for <linux-clk@vger.kernel.org>; Tue, 18 Feb 2025 15:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739893581; cv=none; b=qSb+axR/ZfGM4zQvrwELwq15hY39ieXIwafbHK/q8WEoYowRN+capVL2lOfLkBddjT34FV969Xpvi8VW6zfYznbtbN5AFS6Isq7XDf+RotpB3UjR7oLNY9fNj6MLfaV0eyT2XLbEpTZ8VxOWHIneTza5wkIgTit3ynDOQylgo2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739893581; c=relaxed/simple;
	bh=natQqwqvpTM4A8Kit7p6e55YJWa67GNvNJc5yP+W5xA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qpn2mUBezJ3cyac6ox0kwi+gIMUGGBtpmnBAVSUSjpKMh9mxF9f8LouUFAqEs5vt9UgAGiF+GUdLlk6n8vOMzywsbuWYGvCUet/tslP3h9zIIHWl8fRXkgO5VX+Yto3HQTQ7ejFDMs0qVaJy3PCfpbP5y0Xv7flSaPS5AIpF2wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jYcnuSx4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jYcnuSx4"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43996e95114so5185845e9.3
        for <linux-clk@vger.kernel.org>; Tue, 18 Feb 2025 07:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739893577; x=1740498377; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WzXPNVEIO0ktgw6x8v211u9KQdCOQpvJxEt97diBw0c=;
        b=jYcnuSx4Fx6djgpcR16YuqSPbz4DCFvhXtqBgl0h8hsIG4zZnZqnuzYvVb0c+0m0oj
         mz/h1WEtYQyrEmsj6zEV5RnzMD9V/33csitKZe7C9zaOBfCDpaVFXEAa2TZji3DOMHsC
         rNxLIVWZOeDCPO5T1qYjLxsqaGKqLo2mAT3Y1aBl6PBt9UHJNp0z/r3TSaIZZzNccaX4
         kF/bBCK5rd6tmPvvKOTe0ne+Vywi4xT4NHPMxSKAnEXl5YSN7G0zTLSmJwixakp2A1eT
         ZO0MB8AnAwkXD6aar0uaIVnl/M7t7aZg33R+GSGueSiHR3BrVcNQkOBc+VQEsB8WYEfm
         5Y6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739893577; x=1740498377;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WzXPNVEIO0ktgw6x8v211u9KQdCOQpvJxEt97diBw0c=;
        b=FKivBUI0UpRW+F/n1TG4m7VkvIlKnFUMdE6xlb3yNyWSYvdolTIQoX+WFtW06sBwyZ
         OFXDPQn2fhdpQzedq+D5TZKdFc8T7u5vmL1yOWC/U7hYchtCKGkhh4CTxhkQHfyjwGLA
         sejHvZyRXCzTucI/jw+vmaZo143v/3SCbTaiqCzMsMTr1wkbZL/gyPs7yYCT4NCu/8TZ
         UyRYUiHsR5GqFasLdtjBf81ksM5v+1/FjsbdlyTl9cSRwuEBb4hiU/o8y2E5D2NunheI
         6pkmeUfdVTwappFJQ0GphD9v76eCQ44bVl/fW4BoqP7ZK5hh3iVwoAr0VgexwkKf1J8D
         tKrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhqthyKE3rJ5yVZs7BKcruekFEk8sswxVWDxdNg8INnTvRHNYuXBNkmf13gj76NXLcClfHBqk/95Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUnZptZMnMEOQKKoqFAYYJgC6icLODqKMXK1cJmoAPyVCGykTV
	lCwFK+Yv/fvx04ewI+K3fKFOElmUiHnJNq1lE9jCqcWJrj/eLOuP1oRszzTDXOs=
X-Gm-Gg: ASbGnct9fQO1jktm7YWMPGteKm8g0FVqckhzyuo48OTqfFc8t27YeLDUm66ZUQQ70GC
	NE1BfnWhAlCL2wyKKoJFnJ9AM6DJo7+pvBOwBhikDJUK6U5g/ACpmckQALz0gT2ZUpEQWKrW2US
	LQfK61OcpW9KwGuEu/yobo37YESJ/qxv6BfkouSAPaugtdmaFvgx37AUVOp+IZsMfsfhj0aUGOf
	wONgBJeICAfJbv1VLToZ/xF5yu9ZKQYkDs8ilCC155Uxvn+yNqNOdiY1h6m/DmIvb7vKcUdD07I
	2ZmSRGxJDaECy234mssqXPHZJgx+FdMi/GOavmvxrybk4IyslIbQ9UBO
X-Google-Smtp-Source: AGHT+IElh5d3sTutspymotVQAtk9NGNlV45zvDe426ZYEjVuuh1cgCu7k0Gx3xBQRtNoHXBzuxtrCQ==
X-Received: by 2002:a5d:5f4d:0:b0:38f:31b5:b33e with SMTP id ffacd0b85a97d-38f33f43726mr15149054f8f.35.1739893577459;
        Tue, 18 Feb 2025 07:46:17 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f7fe6sm15067537f8f.86.2025.02.18.07.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 07:46:17 -0800 (PST)
Message-ID: <eec2869a-fa8f-4aaf-9fc5-e7a8baf0f864@linaro.org>
Date: Tue, 18 Feb 2025 15:46:15 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: videocc: Add support to attach multiple
 power domains
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
 <20250218-videocc-pll-multi-pd-voting-v1-4-cfe6289ea29b@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250218-videocc-pll-multi-pd-voting-v1-4-cfe6289ea29b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/02/2025 14:26, Jagadeesh Kona wrote:
> During boot-up, the PLL configuration might be missed even after
> calling pll_configure() from the clock controller probe. This can
> happen because the PLL is connected to one or more rails that are
> turned off, and the current clock controller code cannot enable
> multiple rails during probe. Consequently, the PLL may be activated
> with suboptimal settings, causing functional issues.
> 
> To properly configure the video PLLs in the probe on SM8450, SM8475,
> SM8550, and SM8650 platforms, the MXC rail must be ON along with MMCX.
> Therefore, add support to attach multiple power domains to videocc on
> these platforms.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>   drivers/clk/qcom/videocc-sm8450.c | 4 ++++
>   drivers/clk/qcom/videocc-sm8550.c | 4 ++++
>   2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/clk/qcom/videocc-sm8450.c b/drivers/clk/qcom/videocc-sm8450.c
> index f26c7eccb62e7eb8dbd022e2f01fa496eb570b3f..b50a14547336580de88a741f1d33b126e9daa848 100644
> --- a/drivers/clk/qcom/videocc-sm8450.c
> +++ b/drivers/clk/qcom/videocc-sm8450.c
> @@ -437,6 +437,10 @@ static int video_cc_sm8450_probe(struct platform_device *pdev)
>   	struct regmap *regmap;
>   	int ret;
>   
> +	ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8450_desc);
> +	if (ret)
> +		return ret;
> +
>   	ret = devm_pm_runtime_enable(&pdev->dev);
>   	if (ret)
>   		return ret;
> diff --git a/drivers/clk/qcom/videocc-sm8550.c b/drivers/clk/qcom/videocc-sm8550.c
> index 7c25a50cfa970dff55d701cb24bc3aa5924ca12d..d4b223d1392f0721afd1b582ed35d5061294079e 100644
> --- a/drivers/clk/qcom/videocc-sm8550.c
> +++ b/drivers/clk/qcom/videocc-sm8550.c
> @@ -542,6 +542,10 @@ static int video_cc_sm8550_probe(struct platform_device *pdev)
>   	int ret;
>   	u32 sleep_clk_offset = 0x8140;
>   
> +	ret = qcom_cc_attach_pds(&pdev->dev, &video_cc_sm8550_desc);
> +	if (ret)
> +		return ret;
> +
>   	ret = devm_pm_runtime_enable(&pdev->dev);
>   	if (ret)
>   		return ret;
> 

What's the difference between doing the attach here or doing it in 
really_probe() ?

There doesn't seem to be any difference except that we will have an 
additional delay introduced.

Are you describing a race condition ?

I don't see _logic_ here to moving the call into the controller's higher 
level probe.

Can you describe some more ?

---
bod

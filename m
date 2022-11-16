Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5225C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 16 Nov 2022 11:30:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233733AbiKPLap (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Nov 2022 06:30:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230280AbiKPLaR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Nov 2022 06:30:17 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F19D58013
        for <linux-clk@vger.kernel.org>; Wed, 16 Nov 2022 03:19:18 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id k2so43290089ejr.2
        for <linux-clk@vger.kernel.org>; Wed, 16 Nov 2022 03:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FeWum+jwtQ1whDFVKPUbXhMni0Nnturt1ejfH8g2XUA=;
        b=Qqhtjd0wMFC08wTkboksL7OgpGOC4XPKjdpBtfdOJazcGCOC3hR717WUS8Evw8B+Gm
         4NVR6m/Kl6X+ufVFaZotFT7+2cDUEVblaI7S5IdFD1bMpEs6FylKjJ7Rmr+A4u9c/HGy
         CEo9ETpXgBSptBrc3fRHLvFeLiXVA/qDmWIZY3bNstlX2+1Wlb1JTEHFb1Cy2yXF0hvw
         2Q4BPvs0UpBfav3cjascMJ3eXs9hoE8lVGuWHlkg2k1icV0b+YJCM4HNr6ALrPm6giJp
         CpGrwTX96PWN6mZ78a0lfzuFLmmRmMx4nPcHixyFuZbPwduX8DwWsgiI1XKX42BO1v4S
         /X+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FeWum+jwtQ1whDFVKPUbXhMni0Nnturt1ejfH8g2XUA=;
        b=j4NhdDdVLJz0LfN8j/Uiz+9dbgmK1Bhz9F9oQ8iA6VzjS4p1it1ncYOQ9+IurIjgY4
         CDwLpklxw5xcc/CdBadd64riy45K2Sgq1ZA0QHSOsNhe4jz2jjNxKoCJeEYKcKR4Rt1g
         Qa38XEnZC2YfZoAJZIPh+jk6XLVn5JrFg+/IQUtrDAiUVdRsBbl8US/+PDXo30Ds11lR
         b5ZhMqftJEdrhmHjI16jNGoUQQdXJLlQF5vG9CuDfMm++UBS8sZQin00X3sEaQiDM6kA
         dj0s72Q3wWD3+WpT9pYKy5rX8Y4hBCXOZU5ZLLBtZ17OjNCcZi9bpgGt39NndiXY/yPw
         L9nA==
X-Gm-Message-State: ANoB5plOSxqK1FBVPKg2z9ALEhb4Fy4kqiLtHOMBCZBT86BdDWo0zV8M
        kTk89Einqn6VSXbILdUOoBkQ1Q==
X-Google-Smtp-Source: AA0mqf681U9AgV666Qi+4jOYh3qpckamV0H/ufvxfCFBUHFvnsZvNwNmrGOEhO7G9pRV8fW+OmhrKg==
X-Received: by 2002:a17:906:43c2:b0:78d:8580:8e07 with SMTP id j2-20020a17090643c200b0078d85808e07mr17017198ejn.131.1668597556610;
        Wed, 16 Nov 2022 03:19:16 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id jt4-20020a170906dfc400b007a1d4944d45sm6827587ejc.142.2022.11.16.03.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 03:19:16 -0800 (PST)
Message-ID: <9c5b6037-c962-81d3-41c1-a9ec459c9adc@linaro.org>
Date:   Wed, 16 Nov 2022 12:19:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH 2/9] clk: qcom: gdsc: Add configurable poll timeout
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20221116104716.2583320-1-abel.vesa@linaro.org>
 <20221116104716.2583320-3-abel.vesa@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221116104716.2583320-3-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 16/11/2022 11:47, Abel Vesa wrote:
> Depending on the platform, the poll timeout delay might be different,
> so allow the platform specific drivers to specify their own values.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>   drivers/clk/qcom/gdsc.c | 5 ++++-
>   drivers/clk/qcom/gdsc.h | 1 +
>   2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 0f21a8a767ac..3753f3ef7241 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -107,7 +107,7 @@ static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
>   	do {
>   		if (gdsc_check_status(sc, status))
>   			return 0;
> -	} while (ktime_us_delta(ktime_get(), start) < TIMEOUT_US);
> +	} while (ktime_us_delta(ktime_get(), start) < sc->poll_timeout);
What about the second usage of TIMEOUT_US (in gdsc_toggle_logic)? Is it 
fine for that to be the default value?


Konrad
>   
>   	if (gdsc_check_status(sc, status))
>   		return 0;
> @@ -454,6 +454,9 @@ static int gdsc_init(struct gdsc *sc)
>   	if (ret)
>   		goto err_disable_supply;
>   
> +	if (!sc->poll_timeout)
> +		sc->poll_timeout = 500;
> +
>   	return 0;
>   
>   err_disable_supply:
> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> index 803512688336..9a1e1fb3d12f 100644
> --- a/drivers/clk/qcom/gdsc.h
> +++ b/drivers/clk/qcom/gdsc.h
> @@ -36,6 +36,7 @@ struct gdsc {
>   	struct generic_pm_domain	*parent;
>   	struct regmap			*regmap;
>   	unsigned int			gdscr;
> +	unsigned int			poll_timeout;
>   	unsigned int			collapse_ctrl;
>   	unsigned int			collapse_mask;
>   	unsigned int			gds_hw_ctrl;

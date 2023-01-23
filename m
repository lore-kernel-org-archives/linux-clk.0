Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 475E5C05027
	for <linux-clk@archiver.kernel.org>; Mon, 23 Jan 2023 20:22:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbjAWUWX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Jan 2023 15:22:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231739AbjAWUWR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Jan 2023 15:22:17 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B1C3668B
        for <linux-clk@vger.kernel.org>; Mon, 23 Jan 2023 12:22:09 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id q5so7297166wrv.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Jan 2023 12:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zYITkiaZ8ytlUcV4l/031JbueEwF+zfRSGoVHkvIcWI=;
        b=fMMEbVbOrVcrtHpMT7ik2324XPfsl3ualHk40JyQpcOjqTbLGEeKg8U4Ylx39Qdb28
         ACydUOSoHIlPXtZ2VA9ka1fDgV2F2yGiwaDDfEvpURBNFwNSR2ggEQcgaddcY64cV1ZU
         E79xRc6w5nThwHne6kD0sAsPBG8FMVD4Ud65DtnnYy4/6DO8Ivvp98qzkwm7QuzUTgtT
         TYkne39ygW4c8I6KDsyGyXzo1nbvy2RYP8glwTbQ4WbntCTbGgcbIyuo3gzH3B8n/ysu
         0Z2/f4+dW32dtbV29QblPSHhDbEl+Ig06TShpWY2Uhn7P2PrLOcfhBceLdBLOyws3Gfe
         10sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zYITkiaZ8ytlUcV4l/031JbueEwF+zfRSGoVHkvIcWI=;
        b=0asH4TyxDfR2MWcNl2LIOnHrFZxgfEQX6VEDvnHKSHgXqJEBAfhMbPa/ESOZ2l1lGS
         7DArj/VEHfBsFg3l3v32AZOJr6Y/ZlW1voUddO3sVa/5RE9RfGCKuxnxZpVOyA7bz1+L
         xUCG6HaYAdYHuFRWLjGpuDXd5teR+AYd9nyIZKnZK8SGN+g3pJw7MfSTDf9e9CwwB8AX
         9R1EwLXofGsKrl4QTzzEZNBSkdH89AyxyC1tNz9eLgNRX4n3vif6d58p8UyT93tipv8r
         WCtcI2bEm4lmRlC4JOfX1kWLKxXUkOke8pB6gLQzK6N3rL8drjcvSd7QrGR9O2BNmNbj
         J2xg==
X-Gm-Message-State: AFqh2kqlkXmdAO7cy8aTVhk2Vw2PNFeq95A2F93AJnPMbrjPDatpQCsh
        TQd3orogoYkiCwG/spqJYsRXjg==
X-Google-Smtp-Source: AMrXdXvu1SI6BHKBM8wLRde+OtEiil8gYwvsczO9Ss1JPjn6lseontz0HyWe0FmNgqJdPftYTq28Yg==
X-Received: by 2002:a05:6000:1e0f:b0:2bd:fe42:2b34 with SMTP id bj15-20020a0560001e0f00b002bdfe422b34mr23632293wrb.71.1674505327713;
        Mon, 23 Jan 2023 12:22:07 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id r9-20020a5d6949000000b002be36beb2d9sm188598wrw.113.2023.01.23.12.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 12:22:07 -0800 (PST)
Message-ID: <40b703cf-814e-1ac0-4c30-04888ee5bdbc@linaro.org>
Date:   Mon, 23 Jan 2023 21:22:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/2] clk: qcom: add compile test to MSM8996 CPU clocks
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230123094925.54824-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230123094925.54824-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/01/2023 10:49, Krzysztof Kozlowski wrote:
> Allow compile testing of MSM8996 CPU clocks for build coverage.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 1b6615fe1dba..1c360eed72d7 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -48,7 +48,7 @@ config QCOM_CLK_APCS_MSM8916
>  config QCOM_CLK_APCC_MSM8996
>  	tristate "MSM8996 CPU Clock Controller"
>  	select QCOM_KRYO_L2_ACCESSORS
> -	depends on ARM64
> +	depends on ARM64 || COMPILE_TEST

This is not correct. It is only buildable on arm64.

Best regards,
Krzysztof


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA64CEB64DD
	for <linux-clk@archiver.kernel.org>; Tue, 11 Jul 2023 10:49:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbjGKKs7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Jul 2023 06:48:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231186AbjGKKs6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Jul 2023 06:48:58 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B63C3E7E
        for <linux-clk@vger.kernel.org>; Tue, 11 Jul 2023 03:48:56 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fb761efa7aso8565491e87.0
        for <linux-clk@vger.kernel.org>; Tue, 11 Jul 2023 03:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689072535; x=1691664535;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k3hVozTzTK3YpKr6keu2WXQ1FFPISWGGNo2UDTZRi9Q=;
        b=nU/C676GyY21hAj+KRX6jRPDoXxBLxRpQ5tiHgw/ZMtBl1OUkqwjasHhY6RDZsyNVU
         4GGS4GTyrQTnU41lUp8zeu51RqkNmwwfawQanRriSSMpKrj1OBR1wz242jRO4aitsGxm
         //q83alAYwGQk7ekHZ9mvV7cYdsgwz7yUDg6jFW3ipXf/PZvu6CmDDbDWFiPM87pd0aH
         7vaQgg6rdWHH/klRgqVJX/bDS8XioTllvSejePpOsUADiYqtqkiD/wibaFzHSOYExBhM
         R5UOyVWk5IMkCml0yhWUgy5Uwro76it/Ax9LXJ8Ha40dqTjJYHwKRUckQmGb25/kn/xJ
         5uxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689072535; x=1691664535;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k3hVozTzTK3YpKr6keu2WXQ1FFPISWGGNo2UDTZRi9Q=;
        b=XJ3K7opvlWhY4irjAsPizYDBQEw0XVO8CMh7TI5tRXxrc24Usw8dczCkith4s3S/X/
         am/oFcN107SlgHTr9uuPGKDo6EEZ2FnuyZ6c+jHIBFk65MwAnN0CpsedqIjlHJ+VYmMK
         /NcZNThu8BN6ShiROXdzP1L5bYUlMkB1kfNPtWckGQRVclwkYZJC8PBsJuTJSq2B/pTs
         fAj2y7d0z8wW2t8OEMGxBYQ259yuY5Jkq7vtSeOaHhqlZ5z+rreAgHbIHGXydHqjkclc
         1Thg7MQXI1ZclfAK+6ExscHwXU9Gjs8/3c+oL9Zi+gr4utkYne/wGMOLvO65GVvn6I6p
         NRxg==
X-Gm-Message-State: ABy/qLbhuE7MgaUaCiVqJ80+N6mOyUIi1Ow7SF2UVU9Ty+8yJU9oi2h5
        XvXtpM0lZkqHo8qv0QX7gf2YTg==
X-Google-Smtp-Source: APBJJlHyMlnWO4airaDPNcfvE8dSS4VL8N9jsft2L9pAPDgY0hTH+0GFSvSQwhNkgEST/eS/lAkWyA==
X-Received: by 2002:a05:6512:3da1:b0:4f8:7781:9870 with SMTP id k33-20020a0565123da100b004f877819870mr14270790lfv.60.1689072534973;
        Tue, 11 Jul 2023 03:48:54 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id u12-20020a056512040c00b004fb57f28773sm264107lfk.285.2023.07.11.03.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 03:48:54 -0700 (PDT)
Message-ID: <f234891f-c508-20de-6d6b-c7b37f6adb2b@linaro.org>
Date:   Tue, 11 Jul 2023 13:48:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 6/6] arm64: defconfig: Build NSS Clock Controller driver
 for IPQ9574
Content-Language: en-GB
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        richardcochran@gmail.com, arnd@arndb.de, geert+renesas@glider.be,
        neil.armstrong@linaro.org, nfraprado@collabora.com,
        rafal@milecki.pl, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        netdev@vger.kernel.org
Cc:     quic_saahtoma@quicinc.com
References: <20230711093529.18355-1-quic_devipriy@quicinc.com>
 <20230711093529.18355-7-quic_devipriy@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230711093529.18355-7-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/07/2023 12:35, Devi Priya wrote:
> Build Qualcomm IPQ9574 NSSCC driver.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 9ce0f1554f4d..d10083da2401 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1180,6 +1180,7 @@ CONFIG_IPQ_GCC_5332=y
>   CONFIG_IPQ_GCC_6018=y
>   CONFIG_IPQ_GCC_8074=y
>   CONFIG_IPQ_GCC_9574=y
> +CONFIG_IPQ_NSSCC_9574=y

Can it work if it is built as a module? This defconfig is used on all 
variety of platforms, including even non-Qualcomm ones. We are trying to 
limit the built-in drivers list to the crucial-only ones.

>   CONFIG_MSM_GCC_8916=y
>   CONFIG_MSM_GCC_8994=y
>   CONFIG_MSM_MMCC_8994=m

-- 
With best wishes
Dmitry


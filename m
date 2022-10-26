Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 963DBC433FE
	for <linux-clk@archiver.kernel.org>; Wed, 26 Oct 2022 17:22:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233840AbiJZRWm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Oct 2022 13:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233971AbiJZRWi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Oct 2022 13:22:38 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 553169AFCB
        for <linux-clk@vger.kernel.org>; Wed, 26 Oct 2022 10:22:37 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id x3so3458663qtj.12
        for <linux-clk@vger.kernel.org>; Wed, 26 Oct 2022 10:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WITNKL8TR778dJFzrb3fUuwazYtuJjgYbXXyz70d1fw=;
        b=Q9g4aMLHh4haHKSLVlwmql4hCniJh2yOmQmkiOT3ApcE41Q1RMN07XEhrSF9ASY/L8
         ESsH61IjuInOuUfeVFMuuS/4DgSwP8KrkUzIRSucYTE73T7MNTkle73kFdrBb1+qzcAD
         sKTQL4EYQtyOMEU0oDaAKm9vVul/N3a0lYq4b9UmRJAOQXI3NUFLgAc8/jJTMO3Q8Iha
         LCRGv4f1zX/MiufSkzQX4Q9WwJJT/ADS3mVyIMwANspb01TvemN/4jkbS53oJX+PQ6nE
         T5u6YTrs5GuRHIeD61KZRl/xQ9wTF8DYvWOcY3GK4OXlFnssZR9hJ9MR2HTkzAw+qzFA
         yTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WITNKL8TR778dJFzrb3fUuwazYtuJjgYbXXyz70d1fw=;
        b=xafCZBGC1DPw6d+eL9MHzhlIqrlOWrrC+gJn8wTnKGbGfk+7Y3oPN/orjhi822Jn/i
         hx/ehc23WMiFy5dBa72fCahOpd8/Jp6wWgkqRfdyanbi21dRXtXN/NIF7EnSiS6x2w7P
         QXx06JD6lC1Pw/5meuvzt0DP4YYsvPHiO7t14cs7lWu7t3NntlmfZ4K5mkOVWa7e2xyG
         Djqrz0sQi7Wx9d7DT6EFxnUNap5aS0xTdiDbMq0moNPt1XVUKvSuqv/3z1pbPEsXzMhV
         MJPZVYI//YlunW+UBHojgs82urGsJ6bpsCuQokiVVhSmRv/aaiZOu/Y0oZUEx6Wi+hSe
         H8RQ==
X-Gm-Message-State: ACrzQf2ezRRLEhgK6Gf15Bjj+XvlY8+PiN87enfF/DIv3zynHV14Aefa
        6rCzc3Mau1/XeKNCVFdPJfX7uQ==
X-Google-Smtp-Source: AMsMyM4uF8CW1QJRvvl/zBwScOXvpSI80wscPzOw6/e00oUw96G5aWBfEfBOu+UzkSgYYyf5HKJMhQ==
X-Received: by 2002:a05:622a:cc:b0:39c:deab:1e33 with SMTP id p12-20020a05622a00cc00b0039cdeab1e33mr37763801qtw.496.1666804956500;
        Wed, 26 Oct 2022 10:22:36 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id s8-20020a05620a29c800b006ed99931456sm4419158qkp.88.2022.10.26.10.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Oct 2022 10:22:35 -0700 (PDT)
Message-ID: <5dda5517-4a50-56bd-0740-389d7948e160@linaro.org>
Date:   Wed, 26 Oct 2022 13:22:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] clk: imx8mp: Add audio shared gate
Content-Language: en-US
To:     Shengjiu Wang <shengjiu.wang@nxp.com>, shengjiu.wang@gmail.com,
        abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, marex@denx.de
References: <1666790761-4685-1-git-send-email-shengjiu.wang@nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1666790761-4685-1-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 26/10/2022 09:26, Shengjiu Wang wrote:
> From: Abel Vesa <abel.vesa@nxp.com>
> 
> According to the RM, the CCGR101 is shared for the following root clocks:
> - AUDIO_AHB_CLK_ROOT
> - AUDIO_AXI_CLK_ROOT
> - SAI1_CLK_ROOT
> - SAI2_CLK_ROOT
> - SAI3_CLK_ROOT
> - SAI5_CLK_ROOT
> - SAI6_CLK_ROOT
> - SAI7_CLK_ROOT
> - PDM_CLK_ROOT
> 
> And correct clock MX8MP_CLK_AUDIO_ROOT to be IMX8MP_CLK_AUDIO_AHB_ROOT.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  drivers/clk/imx/clk-imx8mp.c             | 11 ++++++++++-
>  include/dt-bindings/clock/imx8mp-clock.h | 11 ++++++++++-

No, bindings are separate patches.

Best regards,
Krzysztof


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A59A5ECAAA1
	for <linux-clk@archiver.kernel.org>; Thu, 27 Oct 2022 12:43:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234721AbiJ0Mni (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Oct 2022 08:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235715AbiJ0Mne (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Oct 2022 08:43:34 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BA90A0310
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 05:43:32 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id k19so1936209lji.2
        for <linux-clk@vger.kernel.org>; Thu, 27 Oct 2022 05:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=atHpyVeDvRSxK97x6ncdrfXkT0/3Udk1X2L2iSDbRWI=;
        b=mfT4BdhP9SUoj/74Ss/1RbrT+saz3w/uYz94FzaYqv9/gI9t3NG8VIyQpLAJEy/jRw
         UzwB5xV7gaNkqmjKZvkTJcXnu4zrztTKJBvDTCJT9PzS2emX3wRl9jaNGzh1oKNe4fI5
         OPO0bCr+2kZRbuNN9K0KbpbCXnycHiXff9Wwl2spQKkUWt9//l7yzUS6aCR9vUlLRKMH
         nuf5+BmldZxhwr48LCN460/Kp4F+MFS2IXn/Bpd29IWPJmqNoW5jBsbaUkWO3XmvUZ6Y
         /C/Ew6CeotdbDC0QThlsPM6MGVeHIv0DFFymvQ3M0anjq/6LF76yxrNxh2IINMgX+JRw
         2BKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=atHpyVeDvRSxK97x6ncdrfXkT0/3Udk1X2L2iSDbRWI=;
        b=cbfHRfVHm8C4ZstNy16ccS+roskSrCk7FhgbAxaiaonaUsAk8EmzfffkRaxxdqf0BS
         dSKlPzNTL4ukZ3bdi2y4SonHA4TY5j3UGU8+jJjzkqbVa5YOJ5ZjWgYRvR9UU345Oqp/
         IZ8SEi15/fJvyBejXfkOwLa1qjFx5PCSuzg8MoaGR1lh1Gc/wVwRdaKw5F6eKSDY+Hnc
         mkmKAN86ktu2cIKeWJ4dNDtuQz7m86PzI5McKBExzCvXsE1w0XZ6tdpQu8WDowcVdUB2
         okVYdhBE4dmixDWUyRaOuBjZPtgDFMwyBOY5+DLy1pG5qsi8hjeEtSv1s0mEG4p+z5um
         YRag==
X-Gm-Message-State: ACrzQf3c9N1/6mQFVgm9ilLXrRP1MEAhly4ZjI56cyQiP1pDhaG33Ouh
        RSizahk1zneZKVvklQBjdgnrng==
X-Google-Smtp-Source: AMsMyM6zRp9lukIKib2/jvNiSe8l+sxzPJvD16MdorWgPwYLJK8JlqoB7SJqTxLRPQXghF6b12xGJA==
X-Received: by 2002:a2e:be10:0:b0:26f:b35e:c29e with SMTP id z16-20020a2ebe10000000b0026fb35ec29emr19198877ljq.488.1666874610470;
        Thu, 27 Oct 2022 05:43:30 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id p18-20020a056512313200b004979ec19387sm167821lfd.305.2022.10.27.05.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 05:43:30 -0700 (PDT)
Message-ID: <cd5a049d-0ff4-bd61-1e0e-81b9ed5911fb@linaro.org>
Date:   Thu, 27 Oct 2022 15:43:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 2/5] clk: qcom: dispcc-sm8250: Add RETAIN_FF_ENABLE
 flag for mdss_gdsc
Content-Language: en-GB
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>
References: <20221027123432.1818530-1-robert.foss@linaro.org>
 <20221027123432.1818530-2-robert.foss@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221027123432.1818530-2-robert.foss@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/10/2022 15:34, Robert Foss wrote:
> All SoC supported by this driver supports the RETAIN_FF_ENABLE flag,
> so it should be enabled here.
> 
> This feature enables registers to maintain their state after
> dis/re-enabling the GDSC.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/clk/qcom/dispcc-sm8250.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry


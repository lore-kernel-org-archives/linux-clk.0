Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0E6C32771
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 15:27:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234088AbiI1P1f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 11:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234123AbiI1P0w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 11:26:52 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76BEBB487
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 08:26:50 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so1224575wmb.0
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 08:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:reply-to:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=4vRbbcHbcrOiR6go7yqFhgd/koQMW1xjrskbucXoscA=;
        b=LPI8ujC0MKnhB9g1VbZA3RhwaKjsnbLP0ZIYI3YYgLwnEl2fsJSEeF7hdnRgwTGpap
         LjoxG32ZgZNht4+7P6cduq16u+t98S/j1EABGQYKsPASlKJUub4WK3b8VB/MF/AlHBkx
         HnSeswNmSLqJZ4MZKAu6rCP1YcWdRHcgLwON6zruQqWdM6BOurz9h30PW0W9+wzCt8us
         EewkSY7ww++W+KUQOlTTj/Z8j7BnMcSmaoYzmxjpqiGMhT3lbJFDmpQBQiEeCEUzVfzZ
         Kf/2lt6fTWoLXQao0iVdzU7JlxuQelz/hyMb3qRCPM9oKrXzQf/mOGn1m3U1USXShev+
         pCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:reply-to:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=4vRbbcHbcrOiR6go7yqFhgd/koQMW1xjrskbucXoscA=;
        b=7h+Z8Shx6c32hFI9n+R7x5Vmp6rWWzNMvbeUNYpGzb6cnokShVJhUo21/yyZ5klIz2
         t0rA8McW1DkzB5bA3m8nezyuacKKTRfoHFcTZlwu9NLgJWl2zLaN2kYoEDRPUjOY174d
         PROMrvuVLpEYwOMkUUU+95zkCfIYF2RT7xME4COLMm0/6oe3kHya6AxtQqMy5CZ3P/bz
         m9Y82SCCZZcVo2+U46PaWM5UBbbGbgF/7SJ8iGCKCm2m7LqSc3KrMC8idWBJiIh3D0yK
         ku+eIFHEiD3+jcG51nYnjF3UXGZD5Yqsk1kXfi4kw3DQ9+ESdXWGjq0IElVg69dqKz9I
         BYAA==
X-Gm-Message-State: ACrzQf2OIdf2qobtFUnYh8jMkDiGwiTq24pcEtiCF4RDH99KHY9tUxu4
        PkJsvhR/ZFzXGrL+fvETUwiIdg==
X-Google-Smtp-Source: AMsMyM7ybmeJ8NO0Fn1CHOToWfRT8tDA7MClVCd0cvNeY/zHRkVJUPQFIEbyJwg8JODXANAi1JU+dg==
X-Received: by 2002:a05:600c:4f8d:b0:3b4:9f2f:4311 with SMTP id n13-20020a05600c4f8d00b003b49f2f4311mr7154611wmq.17.1664378809054;
        Wed, 28 Sep 2022 08:26:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:11d4:7c71:accf:6521? ([2a01:e0a:982:cbb0:11d4:7c71:accf:6521])
        by smtp.gmail.com with ESMTPSA id i11-20020a05600c354b00b003b4935f04a4sm2670412wmq.5.2022.09.28.08.26.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 08:26:48 -0700 (PDT)
Message-ID: <8294b620-7e41-cdf7-2c44-eddc1bc54cec@linaro.org>
Date:   Wed, 28 Sep 2022 17:26:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 07/11] clk: qcom: mmcc-msm8974: move clock parent tables
 down
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
 <20220928145958.376288-8-dmitry.baryshkov@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Organization: Linaro Developer Services
In-Reply-To: <20220928145958.376288-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/09/2022 16:59, Dmitry Baryshkov wrote:
> Move clock parent tables down, after the PLL declrataions, so that we
Typo:                                        s/declrataions/declarations/
> can use pll hw clock fields in the next commit.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/mmcc-msm8974.c | 170 ++++++++++++++++----------------
>   1 file changed, 85 insertions(+), 85 deletions(-)
> 

<snip>

Otherwise looks good, with typo fixed:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F03EC677F1
	for <linux-clk@archiver.kernel.org>; Wed, 18 Jan 2023 13:36:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbjARNgO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Jan 2023 08:36:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbjARNfq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Jan 2023 08:35:46 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D9059E4D
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 05:04:14 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id az20so63975709ejc.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 05:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C3XiU4lcjvPpYUL0GN4wD23MErDkSKSNYxAx5JGD5Q4=;
        b=tHqFThY4GOsD5Gpc1dHsQjloU9d0pmr7A116/MuiB2aMiiAil5FTwYpuBuV6b+Rv0T
         6uTNYNYztWwF7c5lh1/ZgLy3Vv0RW08IeNLbczF+k0XuSUQeQWgZovqkzeRhqhVchA8w
         TjSKHpOxBYa5VbLhV3QeLO+VslWZNX8Q9wGZuMHTepMu79zAiF0Gr11m89w8sUOVSdQQ
         T9bKlZ37NXnwNvdNyCM8gdaKTr0B2S6MrKIXq52Zki5Geqt9GQecfW4wIDEwe9swJ8YU
         DcBhbnjTkqrJ/MnwX8wFtHRo2fAHs730wcPLxFNKH9f7/0U62mP/YrdOYjm9XPVrfUPm
         HONw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C3XiU4lcjvPpYUL0GN4wD23MErDkSKSNYxAx5JGD5Q4=;
        b=WV4xcEksjO8TbZNFknbzs1BVdv/Gsjlomb8xEmr7Uv1X8bcGLif4wIuAuyM6QQnr0d
         EW8d+BXa9X2NkowcKXucPjdrpvoO8QNXm2TkF96fX7gXPMcfbWfYMVx4VLYLUKaK0Ngn
         EGOFoJFgqkIRfSJhYOSI1XgBC+rXll+F+lyvecQmiWclkSYxRuCM8iQBF4i8HhC3dnJA
         btWlAEGCT1X64Fn95AJd4vEjDK1/0ikxitdYNSV3Va0mrYh4pqy3ezii5NATsOhrMrYv
         H7We5aPacJ9SbBseCUIOjIRICiW04aOFOzpAu8v8OuKHzuTI2qMbf36OPKgbdVNZ1tl0
         Sliw==
X-Gm-Message-State: AFqh2krZeklCqIyPUqqRmhBufy/l3rxE/0OUjzW5ydzReEg5GyeDy8N4
        YgduL49HsyPPy9UXMDYSzYE1Bg==
X-Google-Smtp-Source: AMrXdXs7PzmtwcTxZlIS1VbKcgZO6Kv1k2a1T5U7XsdTOEmMypsPTsPeobg3pVYzS4TcuqnkSTGqxQ==
X-Received: by 2002:a17:906:c7cc:b0:7ae:bfec:74c7 with SMTP id dc12-20020a170906c7cc00b007aebfec74c7mr5839395ejb.72.1674047052745;
        Wed, 18 Jan 2023 05:04:12 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id k22-20020a17090632d600b00780982d77d1sm2892844ejk.154.2023.01.18.05.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 05:04:12 -0800 (PST)
Message-ID: <f575e888-b2ee-6568-7e63-708ad016ac5f@linaro.org>
Date:   Wed, 18 Jan 2023 15:04:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 3/6] dt-bindings: mailbox: qcom: correct the list of
 platforms using clocks
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230117223013.1545026-1-dmitry.baryshkov@linaro.org>
 <20230117223013.1545026-4-dmitry.baryshkov@linaro.org>
 <efd7df12-d94b-4850-728d-416bdbbc295a@linaro.org>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <efd7df12-d94b-4850-728d-416bdbbc295a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/01/2023 13:41, Krzysztof Kozlowski wrote:
> On 17/01/2023 23:30, Dmitry Baryshkov wrote:
>> Only three platforms require `pll' and `aux' clocks: msm8916, msm8939
>> and qcs404. Correct the list of platforms in the corresponding clause.
>>
>> Fixes: 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55 APCS")
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../mailbox/qcom,apcs-kpss-global.yaml        | 33 ++++++++++++++-----
>>   1 file changed, 25 insertions(+), 8 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
>> index ecc286ab49ef..7d8de7a16984 100644
>> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
>> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
>> @@ -72,15 +72,8 @@ allOf:
>>           compatible:
>>             enum:
>>               - qcom,msm8916-apcs-kpss-global
>> -            - qcom,msm8994-apcs-kpss-global
>> -            - qcom,msm8996-apcs-hmss-global
>> -            - qcom,msm8998-apcs-hmss-global
>> +            - qcom,msm8939-apcs-kpss-global
>>               - qcom,qcs404-apcs-apps-global
>> -            - qcom,sc7180-apss-shared
>> -            - qcom,sdm660-apcs-hmss-global
>> -            - qcom,sdm845-apss-shared
>> -            - qcom,sm6125-apcs-hmss-global
>> -            - qcom,sm8150-apss-shared
>>       then:
>>         properties:
>>           clocks:
>> @@ -124,6 +117,30 @@ allOf:
>>             items:
>>               - const: pll
>>               - const: xo
>> +
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - qcom,msm8953-apcs-kpss-global
>> +            - qcom,msm8976-apcs-kpss-global
>> +            - qcom,msm8994-apcs-kpss-global
>> +            - qcom,msm8996-apcs-hmss-global
>> +            - qcom,msm8998-apcs-hmss-global
>> +            - qcom,qcm2290-apcs-hmss-global
>> +            - qcom,sc7180-apss-shared
>> +            - qcom,sc8180x-apss-shared
>> +            - qcom,sdm660-apcs-hmss-global
>> +            - qcom,sdm845-apss-shared
>> +            - qcom,sm4250-apcs-hmss-global
>> +            - qcom,sm6115-apcs-hmss-global
>> +            - qcom,sm6125-apcs-hmss-global
>> +            - qcom,sm8150-apss-shared
> 
> Isn't this in multiple places now? This doesn't match what you remove
> either.

Yes, I addsd several platforms. I can split this into two patches: one 
moving the platforms and another one adding missing platforms. Would you 
prefer it?

> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry


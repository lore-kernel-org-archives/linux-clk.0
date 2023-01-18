Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D71C38147
	for <linux-clk@archiver.kernel.org>; Wed, 18 Jan 2023 13:39:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbjARNjP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Jan 2023 08:39:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbjARNio (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Jan 2023 08:38:44 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 778A9BAF0D
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 05:08:35 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id z5so32818863wrt.6
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 05:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MhcLCYviwxqI/VsqmLVJgx9rPgKwghAfrMXFXyiVeMM=;
        b=hrOFDURWILT2DqGWyL9qinjOdyZ41Inq585N9fqjmq4tMiNrg+7Aha4q8ZHKBnX9lH
         alBoOGJvlNF7suTvXFO5bD/db6HrxjibcCiS9Cw+SJEyouu5KnZTrz3iyG2x+TKs0lhh
         sjVN6TTkMIsyLFeNopOryUUDuAh68zZC3gZjXgnOkGr7eTw43nAAgE5l3Le2fXwxAf6c
         1yZmRUp8LEeaexLfDKPMYGtnLXyM/DSwYPLZ7iGzOg9xrSCrjDsmdd8D+lBChVSYmpqN
         PYLT27AbnmuiIUNtvyNKhkyr9A2hV0+v1QtEO7YIeOCLLx/PrpO7T1wcnomtoVLSM2cX
         NT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MhcLCYviwxqI/VsqmLVJgx9rPgKwghAfrMXFXyiVeMM=;
        b=DiMKewUPGvbP5T0E6o6XlPEJc6aXE+JL3C4ekJJNlEljVdl4AESZyejCkxBDrw74hc
         X7/6zwn/rgx1KEmn1ms9kYFgaP0qWwVfuxvKNBteody6wwlQTsgLgxIOMvmmDS5tUtWV
         wdqkQPcyklSCAFpD+L1PahB6ofym+9kcupHP7r0ukdTxRdgecA2EDELseKXeTA7PmLDB
         gCMErQzTNYimGrEISVAEM7isgK1gyVXOrrnrC3/CEh3Z9aiDnH5StUaHNyK5c8AEDut5
         fmUN0H2s1byiKXqBlLM5vuNWRWYxA3+e1xbPsV9Zhl+z3dJMuP6e3tpPCejh9QMpzYMY
         kq9A==
X-Gm-Message-State: AFqh2kqbyb+Fpxu53JetOBWDuU2fetuz4M6dXfGnxRBMd44AQhmNd3HF
        Npf9VEp4yif0d3+I1S/TYfRrwA==
X-Google-Smtp-Source: AMrXdXsbEtOlMUXBm6MGE3A8haF9JqMc8uZ+r0UYeA5e8mgWxLZc5suwqnbcl0ee96wZ9yHrk+JVEQ==
X-Received: by 2002:a5d:50c9:0:b0:2b4:790e:32f3 with SMTP id f9-20020a5d50c9000000b002b4790e32f3mr5709204wrt.68.1674047310799;
        Wed, 18 Jan 2023 05:08:30 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f2-20020adff982000000b002bde537721dsm13362962wrr.20.2023.01.18.05.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 05:08:30 -0800 (PST)
Message-ID: <a4a39197-a58b-df5b-1dc8-fa9fd520bbc2@linaro.org>
Date:   Wed, 18 Jan 2023 14:08:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 3/6] dt-bindings: mailbox: qcom: correct the list of
 platforms using clocks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
 <f575e888-b2ee-6568-7e63-708ad016ac5f@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f575e888-b2ee-6568-7e63-708ad016ac5f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/01/2023 14:04, Dmitry Baryshkov wrote:
> On 18/01/2023 13:41, Krzysztof Kozlowski wrote:
>> On 17/01/2023 23:30, Dmitry Baryshkov wrote:
>>> Only three platforms require `pll' and `aux' clocks: msm8916, msm8939
>>> and qcs404. Correct the list of platforms in the corresponding clause.
>>>
>>> Fixes: 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55 APCS")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   .../mailbox/qcom,apcs-kpss-global.yaml        | 33 ++++++++++++++-----
>>>   1 file changed, 25 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
>>> index ecc286ab49ef..7d8de7a16984 100644
>>> --- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
>>> +++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
>>> @@ -72,15 +72,8 @@ allOf:
>>>           compatible:
>>>             enum:
>>>               - qcom,msm8916-apcs-kpss-global
>>> -            - qcom,msm8994-apcs-kpss-global
>>> -            - qcom,msm8996-apcs-hmss-global
>>> -            - qcom,msm8998-apcs-hmss-global
>>> +            - qcom,msm8939-apcs-kpss-global
>>>               - qcom,qcs404-apcs-apps-global
>>> -            - qcom,sc7180-apss-shared
>>> -            - qcom,sdm660-apcs-hmss-global
>>> -            - qcom,sdm845-apss-shared
>>> -            - qcom,sm6125-apcs-hmss-global
>>> -            - qcom,sm8150-apss-shared
>>>       then:
>>>         properties:
>>>           clocks:
>>> @@ -124,6 +117,30 @@ allOf:
>>>             items:
>>>               - const: pll
>>>               - const: xo
>>> +
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          enum:
>>> +            - qcom,msm8953-apcs-kpss-global
>>> +            - qcom,msm8976-apcs-kpss-global
>>> +            - qcom,msm8994-apcs-kpss-global
>>> +            - qcom,msm8996-apcs-hmss-global
>>> +            - qcom,msm8998-apcs-hmss-global
>>> +            - qcom,qcm2290-apcs-hmss-global
>>> +            - qcom,sc7180-apss-shared
>>> +            - qcom,sc8180x-apss-shared
>>> +            - qcom,sdm660-apcs-hmss-global
>>> +            - qcom,sdm845-apss-shared
>>> +            - qcom,sm4250-apcs-hmss-global
>>> +            - qcom,sm6115-apcs-hmss-global
>>> +            - qcom,sm6125-apcs-hmss-global
>>> +            - qcom,sm8150-apss-shared
>>
>> Isn't this in multiple places now? This doesn't match what you remove
>> either.
> 
> Yes, I addsd several platforms. I can split this into two patches: one 
> moving the platforms and another one adding missing platforms. Would you 
> prefer it?

Yes, plus you now duplicated entries, didn't you? As I pointed - some of
them are in multiple places now.

Best regards,
Krzysztof


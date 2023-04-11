Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3DFDC77B6F
	for <linux-clk@archiver.kernel.org>; Tue, 11 Apr 2023 13:45:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbjDKNpR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Apr 2023 09:45:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbjDKNpQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Apr 2023 09:45:16 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8CAE48
        for <linux-clk@vger.kernel.org>; Tue, 11 Apr 2023 06:45:14 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id z8so12290828lfb.12
        for <linux-clk@vger.kernel.org>; Tue, 11 Apr 2023 06:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681220713;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i8j4IUlVj3riTiWQmjJ2d73DxaHhOYBTiZKwAU5TtVk=;
        b=Nmxt/npRMsGRl91Njy5uOxNJ5ZRJhRyCTrLxKD/Im/NDTaIgtmneBfPNbAruinun7N
         3xxyphT+PJ3k1wYimkETsSUmNMrA0nkqltYApc7EPmzqLqKmimOf3dDLFlTM4R7PT4fu
         JwYNREFqbZPPnfJlXWHla/k3hr1P9Dd98fOJpXLHwGlp/f6k42UgDXZzPyVcAPCswcWC
         e6LAjm9WFUKcS1GHS3AM9u2vteWpjLxasAlp4WhwJSeGA/5BFkp8BWklwpXInYHZRTxF
         lQfp2paWZX3THOc3prZdCfhTi3oWEwv6UR8hcziugtLy+siHknPG5CddfAhl364umhVU
         xadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681220713;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i8j4IUlVj3riTiWQmjJ2d73DxaHhOYBTiZKwAU5TtVk=;
        b=C5EcfF9vao2prftq6fYInLHNExnd60BbxLgxfFDMzz0V9eQWwH3Kpk/sjaMAhgL4ds
         GYP7/38bdVOm4rE5hduAPM/fVPC9c5w3+DBe8XpmdzxOO6YuUe565kkRx7pHgg+BugBK
         X2+Ow/71Wmtojz+TgM4BlLgCPodTitDMEPrfdtS+bnO97f4+oFmPk8sbM5ZHYVpGcHAr
         FW7T3/kS3ef3CHbsSDBnFtow4xy8Tn4Pmj7tUeR6AwVHt/24VVg+dVoFMUHqHm2vvd2v
         bUzCceAyKHNEU6y8Bcv7JoPk7dXyyudrrQYQHvexvj3txlxWcMx8CyrPygjbTSDObQG1
         wBkA==
X-Gm-Message-State: AAQBX9cGXTQF8agFl0vTAb57IhU20l1RXBZPYoUkB9B9QMm0pRvuosBs
        4X0Rys1qWFVvhd+qc3+W9HzhCg==
X-Google-Smtp-Source: AKy350adz8ggqqAG288YMHm5u14GdIex1vPv1WF39fLVqGlUbAg65w3Uv4Sc4D2fh9YQ6CmM4Vqpfw==
X-Received: by 2002:a05:6512:11ef:b0:4db:3847:12f0 with SMTP id p15-20020a05651211ef00b004db384712f0mr3366560lfs.50.1681220713146;
        Tue, 11 Apr 2023 06:45:13 -0700 (PDT)
Received: from [192.168.1.101] (abxj23.neoplus.adsl.tpnet.pl. [83.9.3.23])
        by smtp.gmail.com with ESMTPSA id r6-20020a056512102600b004e843d6244csm2569541lfr.99.2023.04.11.06.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 06:45:12 -0700 (PDT)
Message-ID: <6406469d-289b-af4e-83f8-8259f5dcaf00@linaro.org>
Date:   Tue, 11 Apr 2023 15:45:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 2/3] dt-bindings: clock: qcom,gcc-sc7180: document CX
 power domain
Content-Language: en-US
To:     Rajendra Nayak <quic_rjendra@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230408134820.76050-1-krzysztof.kozlowski@linaro.org>
 <20230408134820.76050-2-krzysztof.kozlowski@linaro.org>
 <4757c33c-7e71-262d-a51a-c5f9fb53ff41@linaro.org>
 <d4a8054c-443e-d9ba-9641-ff721254d254@quicinc.com>
 <c70c1a4d-50c5-2b50-18c9-7c46c3803cd4@linaro.org>
 <2f9f9cdd-cfbe-ca22-7308-d6b1f0c1c455@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <2f9f9cdd-cfbe-ca22-7308-d6b1f0c1c455@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 11.04.2023 15:31, Rajendra Nayak wrote:
> 
> On 4/11/2023 4:57 PM, Konrad Dybcio wrote:
>>
>>
>> On 11.04.2023 06:56, Rajendra Nayak wrote:
>>>
>>>
>>> On 4/8/2023 7:33 PM, Konrad Dybcio wrote:
>>>>
>>>>
>>>> On 8.04.2023 15:48, Krzysztof Kozlowski wrote:
>>>>> The GCC clock controller needs CX power domain, at least according to
>>>>> DTS:
>>>>>
>>>>>     sc7180-trogdor-pompom-r3.dtb: clock-controller@100000: Unevaluated properties are not allowed ('power-domains' was unexpected)
>>>>>
>>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>> ---
>>>> +CC Rajendra (author of 5d6fc6321db1 ("arm64: dts: qcom:
>>>> sc7180: Add required-opps for USB"))
>>>>
>>>> Rajendra, shouldn't SC7180 GCC have PM ops to make sure a vote
>>>> is only there when AP is active?
>> So IIUC, CX is never supposed to be shut down?
> 
> Atleast sc7180 and sc7280 do not support full CX shutdown (or power
> collapse as its called), it only transitions to a Retention state
> and even that in the system-wide suspend path only
And won't outstanding votes on that resource prevent the system
from entering a system-wide low power state?

Konrad
> 
>>
>> Konrad
>>>
>>> hmm, I am not quite sure why we would want the performance votes
>>> from peripherals dropped when CPUs go down in idle?
>>>
>>>> Are all GDSCs powered by CX?
>>>> If not, wouldn't this also need power-domain-names to
>>>> facilitate e.g. potential MX-powered ones?
>>>
>>> For sc7180 GCC, yes.
>>>
>>>>
>>>> Konrad
>>>>>    .../devicetree/bindings/clock/qcom,gcc-sc7180.yaml         | 7 +++++++
>>>>>    1 file changed, 7 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
>>>>> index 06dce0c6b7d0..8bf9b6f49550 100644
>>>>> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
>>>>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
>>>>> @@ -32,6 +32,10 @@ properties:
>>>>>          - const: bi_tcxo_ao
>>>>>          - const: sleep_clk
>>>>>    +  power-domains:
>>>>> +    items:
>>>>> +      - description: CX domain
>>>>> +
>>>>>    required:
>>>>>      - compatible
>>>>>      - clocks
>>>>> @@ -45,6 +49,8 @@ unevaluatedProperties: false
>>>>>    examples:
>>>>>      - |
>>>>>        #include <dt-bindings/clock/qcom,rpmh.h>
>>>>> +    #include <dt-bindings/power/qcom-rpmpd.h>
>>>>> +
>>>>>        clock-controller@100000 {
>>>>>          compatible = "qcom,gcc-sc7180";
>>>>>          reg = <0x00100000 0x1f0000>;
>>>>> @@ -52,6 +58,7 @@ examples:
>>>>>                   <&rpmhcc RPMH_CXO_CLK_A>,
>>>>>                   <&sleep_clk>;
>>>>>          clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk";
>>>>> +      power-domains = <&rpmhpd SC7180_CX>;
>>>>>          #clock-cells = <1>;
>>>>>          #reset-cells = <1>;
>>>>>          #power-domain-cells = <1>;

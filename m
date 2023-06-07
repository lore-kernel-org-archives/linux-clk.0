Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5028EC77B7A
	for <linux-clk@archiver.kernel.org>; Wed,  7 Jun 2023 13:15:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240261AbjFGNPb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Jun 2023 09:15:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234809AbjFGNPa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Jun 2023 09:15:30 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B43B3173A
        for <linux-clk@vger.kernel.org>; Wed,  7 Jun 2023 06:15:27 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f7f543fe2fso466965e9.2
        for <linux-clk@vger.kernel.org>; Wed, 07 Jun 2023 06:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686143726; x=1688735726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L/XDMIe8IJ1TNLWHUR7TJpPgpdAL0coo33L6HePwpwU=;
        b=rgkSeyK6REC2K8CC46he6AXgrB7wYAPVS7LghjkP/5NhroHDJsZyo3DB67My1scX/g
         Lz4nqWPdD633J8XEMNb2H0l9FCmsSE7B/eWs6Z8qtPZfuJmRKCyuITdLl/uJ074oqOp9
         bDjMCEV8yQof+dBaGzqL71LH1tmm1CjzfI10AQXXVozrA2u39SmUcQn6Uth2sGa4rNS2
         4+Q20qygv1yQB68EM6RT6arNkr9gmrWABJMOO2+jOUDPHq/lXsTz6PkbbfGU3vzIYMBB
         n1myet4TbeqTycp4qKR9jipJJ2VgZKYScVMxrcmCfI6gfcPvPnCvSmtJ/cuYxj5Eo60w
         k8Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686143726; x=1688735726;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L/XDMIe8IJ1TNLWHUR7TJpPgpdAL0coo33L6HePwpwU=;
        b=M5/euVAotqeXTKMVi9oge14QtGROjbP2wfFT1WhGlUk4o0all6v8bzu3RE8sX84JGt
         LGzY2d5pk5d1kZ52eejY/KF8EOWpdsM+7QTWZJtpkuaFtGrf/YOP0MDxoAd9wuZuk9XU
         YCX+jP4e9wcR2hekgqHe34RsnJt0zSvbQ6PSYZ4fUTHYm6PnRl7D7hNLQJbDNH6rZ2QZ
         BYemsO4KvHIfZjHDp/7aIFNKJz6bl94V+2Bo6/CQFA05s/vTmR2kDftk8LAqzjyD+Rxl
         sXijV4PPOq9+xXlKXarIKmz/kQ8LRwox3WAxLSR071VMI+DJ/mmhpJvk3r+uYLraHbTg
         473A==
X-Gm-Message-State: AC+VfDyvFILzXy4Kk8/M9cj36uW6eWIsidqNPAS/INMAd9wpKupBoBSR
        8v1ARPbvtCp7/S5puUyixBtH8w==
X-Google-Smtp-Source: ACHHUZ5Jf7LWXz1e+RTA+nHiKsr62YMfGAjPeAgxWlws56ig+Je4GztBeAe/15TZdaZhLTX2F5iAbw==
X-Received: by 2002:a05:600c:2256:b0:3f4:2255:8608 with SMTP id a22-20020a05600c225600b003f422558608mr4593091wmm.31.1686143726096;
        Wed, 07 Jun 2023 06:15:26 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id m9-20020a7bcb89000000b003f72468833esm2163856wmi.26.2023.06.07.06.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 06:15:25 -0700 (PDT)
Message-ID: <7ff3ba78-2af3-5226-0289-6aff63f41060@linaro.org>
Date:   Wed, 7 Jun 2023 14:15:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 2/6] dt-bindings: clock: Add YAML schemas for LPASS
 AUDIOCC and reset on SC8280XP
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     johan+linaro@kernel.org, agross@kernel.org,
        konrad.dybcio@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230525122930.17141-1-srinivas.kandagatla@linaro.org>
 <20230525122930.17141-3-srinivas.kandagatla@linaro.org>
 <ebe8dc00-d937-240f-e9a5-e9049fd278ad@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <ebe8dc00-d937-240f-e9a5-e9049fd278ad@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 31/05/2023 20:59, Krzysztof Kozlowski wrote:
> On 25/05/2023 14:29, Srinivas Kandagatla wrote:
>> The LPASS (Low Power Audio Subsystem) Audio clock controller provides reset
>> support when it is under the control of Q6DSP.
>>
> 
> A nit, subject: drop second/last, redundant "YAML schemas for". The
> "dt-bindings" prefix is already stating that these are
> bindings/schemas/YAML/etc.
> 
> Same comment for first patch.
> 
Thanks, will fix in v3

--srini
> 
>> Add support for those resets and adds IDs for clients to request the reset.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   .../bindings/clock/qcom,sc8280xp-lpasscc.yaml         | 11 +++++++++++
>>   include/dt-bindings/clock/qcom,lpasscc-sc8280xp.h     |  5 +++++
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
>> index 08a9ae60a365..0557e74d3c3b 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sc8280xp-lpasscc.yaml
>> @@ -21,6 +21,7 @@ properties:
>>   
>>     compatible:
>>       enum:
>> +      - qcom,sc8280xp-lpassaudiocc
>>         - qcom,sc8280xp-lpasscc
>>   
>>     qcom,adsp-pil-mode:
>> @@ -45,6 +46,16 @@ required:
>>   additionalProperties: false
>>   
>>   examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,lpasscc-sc8280xp.h>
>> +    lpass_audiocc: clock-controller@32a9000 {
>> +        compatible = "qcom,sc8280xp-lpassaudiocc";
>> +        reg = <0x032a9000 0x1000>;
>> +        qcom,adsp-pil-mode;
>> +        #reset-cells = <1>;
>> +        #clock-cells = <1>;
>> +    };
> 
> No need for new example - it's basically the same.
> 
> Best regards,
> Krzysztof
> 

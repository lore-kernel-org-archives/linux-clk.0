Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63B3C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 20:24:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbiL1UYV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 15:24:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230460AbiL1UYT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 15:24:19 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1995C1573E
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 12:24:18 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id bn6so7609074ljb.13
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 12:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=snr2mEVbtvt9/YULF8dU82exFUSnK9OhTwPmhp5otFw=;
        b=Vj/327wSacVZUKPPkf/g75nxhiAVAYMinU5wAxHVRxeBLQ6mC4TAGIAq1onOZZIg0G
         O9oV5YvhTLazpPDOTyRSv/LUhA4rY3MFMBjpBXtbSuFs2G0uotAm+M1mGqCuMZzMeggf
         HSvBhrEZtnHDTHEwlW6lau0/+/2hDl2BoDfjMrrLnyqzeTzF0trNDSJNKStT57q/pSg0
         LMGibMV/OkR2bTrrP5fEG1oJjNXrxiex9t+8IJpqlFD9MtbvLY4DUHe3ID/kqu7ML5QI
         VIjlQ2Ao/V/0ugR9+8MWMKR0OU9OQ3Qppo2SgdgN3cva1ndQ5v/7kOH7b5rzkYsorVaT
         2FDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=snr2mEVbtvt9/YULF8dU82exFUSnK9OhTwPmhp5otFw=;
        b=rwm53Nq/wpzqXxp5njik4W/+GTroRyFQOscmmcXRkMZ+Hp5JsM1MGlzSIxSt3xJWjE
         p3ALZZ7SkdynWw2qxUlI6JbaePwr4dFwm2OCR39npPwrFQiGZ5+uSXfhDVJY8+cUtm6m
         ViKV+QIeKO176hlZ1eVS+4Jb2OSIXgHevLOw4DfopdBvGU7/PfWYflTMAQvoNxf/IXlD
         Te9xnTwvOXMfcVGWrxWB2xWLUjkzQTfVVZtlMHDh9jeVwPg1TKSN19nd4VGAzskOSGA8
         3lq/Ylaa+/HlctaXOrHqszos0Kh7D7Yg1Ra2hXnsnx5+nrlAX2SCd2R+tiqUhb6Nm6VD
         eOvA==
X-Gm-Message-State: AFqh2kqbj4TR7NuenjaF4okYHjFXRS+orpb04qqClMjTjFogVaBB61FH
        rSFebN5vQqVN6xhY0hpbqq2R8w==
X-Google-Smtp-Source: AMrXdXsgypinOeUbWGNon9W9+A8ZTrvB/pcXkb076Fan+JLA73XOIvGKp4+ftj0F8J22NgrYtqVUOw==
X-Received: by 2002:a2e:a311:0:b0:27f:b68e:9d99 with SMTP id l17-20020a2ea311000000b0027fb68e9d99mr4118205lje.32.1672259056362;
        Wed, 28 Dec 2022 12:24:16 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v11-20020ac258eb000000b004aa0870b5e5sm2791917lfo.147.2022.12.28.12.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 12:24:15 -0800 (PST)
Message-ID: <4b1c7bcd-b8e0-9405-c758-cc2294871b37@linaro.org>
Date:   Wed, 28 Dec 2022 22:24:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 03/12] dt-bindings: clock: qcom,mmcc: define
 clocks/clock-names for APQ8084
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
 <20221227013225.2847382-4-dmitry.baryshkov@linaro.org>
 <dfc193df-a3ca-e03e-9fcf-b9d3f9fe76f6@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <dfc193df-a3ca-e03e-9fcf-b9d3f9fe76f6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/12/2022 12:31, Krzysztof Kozlowski wrote:
> On 27/12/2022 02:32, Dmitry Baryshkov wrote:
>> Define clock/clock-names properties of the MMCC device node to be used
>> on APQ8084 platform.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../devicetree/bindings/clock/qcom,mmcc.yaml  | 40 +++++++++++++++++++
>>   1 file changed, 40 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
>> index e6d17426e903..fd926df80c64 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
>> @@ -137,6 +137,46 @@ allOf:
>>               - const: edp_link_clk
>>               - const: edp_vco_div
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              - qcom,mmcc-apq8084
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: Board XO source
>> +            - description: Board sleep source
>> +            - description: MMSS GPLL0 voted clock
>> +            - description: GPLL0 clock
>> +            - description: GPLL0 voted clock
>> +            - description: GPLL1 clock
>> +            - description: DSI phy instance 0 dsi clock
>> +            - description: DSI phy instance 0 byte clock
>> +            - description: DSI phy instance 1 dsi clock
>> +            - description: DSI phy instance 1 byte clock
>> +            - description: HDMI phy PLL clock
>> +            - description: eDP phy PLL link clock
>> +            - description: eDP phy PLL vco clock
> 
> This looks like exceeding constraints set in top-level (max 10).

Ack, I'll expand it for v2.

-- 
With best wishes
Dmitry


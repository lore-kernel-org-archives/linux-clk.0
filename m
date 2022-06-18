Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0CDC433EF
	for <linux-clk@archiver.kernel.org>; Sat, 18 Jun 2022 04:36:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbiFREf6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 18 Jun 2022 00:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiFREf5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 18 Jun 2022 00:35:57 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D061C2CCBA
        for <linux-clk@vger.kernel.org>; Fri, 17 Jun 2022 21:35:56 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id i29so9637260lfp.3
        for <linux-clk@vger.kernel.org>; Fri, 17 Jun 2022 21:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VpoARyskjrsl8rfLEbLTskbg6ji6qM2azTrmPXdEaqU=;
        b=FytwNuiMPbYIJincXBXYnOSJu6v/r2p942L4TJkUDUeuD/0DqSJyQ8kq7a+ZX7i00g
         A4/4DIXXmvGwyc9f/HU07lNQ1PYF6qGLqt7KOYvvKapcUqA+BvTdCQG7UkQPEAsShFF/
         cc3LknibrexPA6BUMf9W47z2ysq+sbuQt/2qLoZOwlCxEW0pHOUkmozpZRSFcb9AAxKf
         EcXtVYHwwPs1ZrMwHY5RvNZupzeqKH/uxOd8usfPnK6VzJe3So6uNp3oufifU7UtP0UW
         WlCqSDG0nTDERE4GXYOMZnnXRmbPXckt7byUhcJ19JMO64P/+u6+/Trr/SGLZHSVwxMA
         IJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VpoARyskjrsl8rfLEbLTskbg6ji6qM2azTrmPXdEaqU=;
        b=T3HgjnnbkaB3B//A0aYYZHpcyT1Mu2CtVLXj1D8ip7bB76WV9ylJ2rxrcLhB6I37uz
         2Exr7HTXpvTAfU/ylwGoviSF9wFNZtw+QEFz4Ebf52+3TXRoxElIPOv87ny2PQGCw2sC
         NcCS/gIVklFm2XLajFz9jV5/XgWeSmMI1fVvXoiIbBQWgN/VencAtV81VLTtwzX1DiXk
         chmnRbroy3ovexqQhFxHRbRCka8XwIGY9BSBnweU7hBBSY9A92K0fufP3/9EtC7Fcqev
         8yOFBZsnDDRq4BOlwsZjRmUwaOn1XeeRi9snBVhE+ZkCRzetBMU1EvJYTMJOxpnC3kS4
         3Lsg==
X-Gm-Message-State: AJIora9CxXvWDzcJmsF8fba5eNIgNSJBD8HUUKeYuLzBIuPeeqzcrVT2
        n/ga9IeEfoRYTaqRFrzNKdokig==
X-Google-Smtp-Source: AGRyM1sIMez5VxkVOnoLQm8sl13hrGx4EPWDtKb7FI64aoT8FGVfjTjOgllKZSGbswVBo/ED+Uj3xQ==
X-Received: by 2002:a05:6512:5d2:b0:47f:6270:cb54 with SMTP id o18-20020a05651205d200b0047f6270cb54mr244347lfo.358.1655526954287;
        Fri, 17 Jun 2022 21:35:54 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y15-20020a056512044f00b00478ebc6be69sm852584lfk.261.2022.06.17.21.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 21:35:53 -0700 (PDT)
Message-ID: <cd4eaead-4218-2de0-1929-7c8a2aafaff4@linaro.org>
Date:   Sat, 18 Jun 2022 07:35:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/7] dt-bindings: clock: separate bindings for MSM8916 GCC
 device
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220617144714.817765-1-dmitry.baryshkov@linaro.org>
 <20220617144714.817765-3-dmitry.baryshkov@linaro.org>
 <4a614c32-35c5-2dfa-3e15-d54c3c3c5836@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <4a614c32-35c5-2dfa-3e15-d54c3c3c5836@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/06/2022 04:40, Krzysztof Kozlowski wrote:
> On 17/06/2022 07:47, Dmitry Baryshkov wrote:
>> Separate bindings for GCC on Qualcomm MSM8916 platforms. This adds new
>> clocks/clock-names properties to be used for clock links.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/clock/qcom,gcc-msm8916.yaml      | 61 +++++++++++++++++++
>>   .../bindings/clock/qcom,gcc-other.yaml        |  1 -
>>   2 files changed, 61 insertions(+), 1 deletion(-)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
>> new file mode 100644
>> index 000000000000..564aa764b17b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
>> @@ -0,0 +1,61 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8916.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Global Clock & Reset Controller Binding for MSM8916
>> +
>> +maintainers:
>> +  - Stephen Boyd <sboyd@kernel.org>
>> +  - Taniya Das <quic_tdas@quicinc.com>
>> +
>> +description: |
>> +  Qualcomm global clock control module which supports the clocks, resets and
>> +  power domains on MSM8916.
>> +
>> +  See also:
>> +  - dt-bindings/clock/qcom,gcc-msm8916.h
>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,gcc-msm8916
>> +
>> +  clocks:
>> +    items:
>> +      - description: XO source
>> +      - description: Sleep clock source
>> +      - description: DSI phy instance 0 dsi clock
>> +      - description: DSI phy instance 0 byte clock
>> +      - description: External MCLK clock
>> +      - description: External Primary I2S clock
>> +      - description: External Secondary I2S clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xo
>> +      - const: sleep_clk
> 
> Just "sleep"

I was hesitating here as all other gcc drivers use 'sleep_clk'.


-- 
With best wishes
Dmitry

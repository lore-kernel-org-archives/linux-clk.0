Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB963C43217
	for <linux-clk@archiver.kernel.org>; Thu, 17 Nov 2022 10:27:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234813AbiKQK1d (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Nov 2022 05:27:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234765AbiKQK1b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Nov 2022 05:27:31 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E2F8532E1
        for <linux-clk@vger.kernel.org>; Thu, 17 Nov 2022 02:27:29 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id d3so2160966ljl.1
        for <linux-clk@vger.kernel.org>; Thu, 17 Nov 2022 02:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9kynY50ckiw0RzKQXKaPoaoAm91QSwXd4fLVfpMm4e0=;
        b=qei0nzvmfzHhFzvLpeh2XvFtLPoO3C6JaIH7olZAhujhgIhGDAtQWExPnqO4l6iQnt
         qJvZs+Rzv/EGieAd6m29GfntY34jMeKImzZJzvqyAKxdW1FAJauhGOtkXAYU2RxZDmYe
         ksukKt07+zeDvu/GEDBAakV6MOqm34dInbD79VFlPWxIvZKD2HJejvrAjZEKTgHbKie5
         kkjZapVNwX3dlIhHtgQ1VPNHDKb+QczHNW6ip9E4yPPC+8hDvnXKKf9KUovZkUksvB6/
         GpKoX5Zu6ADrNfHw8Zioi4h+SspRvNYSXXHN+HKErwPtM6Ga5WSf6i9v02UQ5YpuGF2y
         OXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9kynY50ckiw0RzKQXKaPoaoAm91QSwXd4fLVfpMm4e0=;
        b=RjXlmuZZkfH92FSBofrE8FLm7hXf+VSwwVjGlKjeh6HRqDe6Qcm1XXITwvh9lcWkDd
         VNYHQjb7tKOI8iB+uGMjAqd4DrJePkK4OpwUSPLjLl422YRnAmaWSnqiVaIPN6TQRsV+
         qOl9hCt0ctY9osxzVLpMxVbVpJQCh1tCFOPOuMtmEnYGArjrQyQsEe6aqiSlctk3Jq9n
         fFfz7kBJPQkt8epn/UE7KkFEpHNGqlCEmF1Jgk8jLbzgm6XQhcrkaqwlYVBtvrS/Spph
         AGpv+kt3StXtM0gvmSUhjsZmxrZC4L65WYIAJK4vfZ7L25vOiKRKD52EZVIgLxLNnaoU
         BVTQ==
X-Gm-Message-State: ANoB5pk7RbucVsH4SW8upJZIsl70NyOhz6P+Q2fmMssPxuGRjf+Z50k4
        s12BCrzUlIGfPNIAVMFARMexyIy2ftEZsWFF
X-Google-Smtp-Source: AA0mqf40gp0JWS9vrbYpcdERZdh+kArkyDdZuUk9mw4xv2UGpAVsutP2+H25Kj2gJE925TQqyDK/vw==
X-Received: by 2002:a2e:9f47:0:b0:277:1273:f3b8 with SMTP id v7-20020a2e9f47000000b002771273f3b8mr720385ljk.178.1668680847373;
        Thu, 17 Nov 2022 02:27:27 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id h1-20020a19ca41000000b0049476667228sm84417lfj.65.2022.11.17.02.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 02:27:26 -0800 (PST)
Message-ID: <a51164de-eb2b-497c-8f07-a5cd734e293d@linaro.org>
Date:   Thu, 17 Nov 2022 11:27:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/9] dt-bindings: clock: Add SM8550 GCC clock bindings
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20221116104716.2583320-1-abel.vesa@linaro.org>
 <20221116104716.2583320-2-abel.vesa@linaro.org>
 <c298fd71-22e9-98c5-14c6-88b078687b3d@linaro.org>
 <Y3YBpXIjDELtit0k@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y3YBpXIjDELtit0k@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/11/2022 10:40, Abel Vesa wrote:
> On 22-11-17 10:08:05, Krzysztof Kozlowski wrote:
>> On 16/11/2022 11:47, Abel Vesa wrote:
>>> Add device tree bindings for global clock controller on SM8550 SoCs.
>>
>> Subject: drop second, redundant "bindings".
> 
> Sure thing, will drop.
> 
>>
>>>
>>> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
>>> ---
>>>  .../bindings/clock/qcom,gcc-sm8550.yaml       |  88 +++++++
>>>  include/dt-bindings/clock/qcom,gcc-sm8550.h   | 231 ++++++++++++++++++
>>>  2 files changed, 319 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sm8550.yaml
>>>  create mode 100644 include/dt-bindings/clock/qcom,gcc-sm8550.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8550.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8550.yaml
>>> new file mode 100644
>>> index 000000000000..a2468167c8ab
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8550.yaml
>>> @@ -0,0 +1,88 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/qcom,gcc-sm8550.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm Global Clock & Reset Controller Binding for SM8550
>>
>> You need to base on recent bindings. See commit ece3c3198182a1.
>>
> 
> Yep, will do.
> 
>>> +
>>> +maintainers:
>>> +  - Bjorn Andersson <andersson@kernel.org>
>>> +
>>> +description: |
>>> +  Qualcomm global clock control module which supports the clocks, resets and
>>> +  power domains on SM8550
>>
>> Ditto
>>
>>> +
>>> +  See also:
>>> +  - dt-bindings/clock/qcom,gcc-sm8550.h
>>
>> Ditto
>>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,sm8550-gcc
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: Board XO source
>>> +      - description: Sleep clock source
>>> +      - description: PCIE 0 Pipe clock source (Optional clock)
>>
>> Drop "(Optional clock)"
> 
> Sure, will drop. I based this on SM8450, but maybe that also needs an
> update.
> 
>>
>>> +      - description: PCIE 1 Pipe clock source (Optional clock)
>>> +      - description: PCIE 1 Phy Auxiliary clock source (Optional clock)
>>> +      - description: UFS Phy Rx symbol 0 clock source (Optional clock)
>>> +      - description: UFS Phy Rx symbol 1 clock source (Optional clock)
>>> +      - description: UFS Phy Tx symbol 0 clock source (Optional clock)
>>> +      - description: USB3 Phy wrapper pipe clock source (Optional clock)
>>> +    minItems: 2
>>
>> This does not look correct. Why clocks of GCC are inputs clocks to GCC?
> 
> Well, it is not a GCC clock. It is a fixed-clock fed into GCC.
> The name is taken from downstream, but I'm pretty sure the HW clock is
> named so. So I think we should keep it as is.

I don't get it. The "PCIE 0 Pipe clock source" is defined here in this
header:
+#define GCC_PCIE_0_PIPE_CLK_SRC	41
so what do you mean it is not GCC clock?

Second thing, you have only one GCC, so how these clocks can be
optional? Either they are there or they are not. Optional means usually
that you have two devices having same compatible and they can operate a
bit differently or some pins are not connected. It's not the case here.

Best regards,
Krzysztof


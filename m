Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 149EEC433EF
	for <linux-clk@archiver.kernel.org>; Sun, 19 Jun 2022 12:02:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236968AbiFSMCi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 19 Jun 2022 08:02:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235114AbiFSMCh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 19 Jun 2022 08:02:37 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D33B12607
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 05:02:33 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id hj18so15691991ejb.0
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 05:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=gnMEBo8E/2r0RxcreeVzvdUJTnoTv3L/ZBGLWIasnvY=;
        b=PCcmfZ2UXsyas5h+S+YJ7e8bVGZCjvy4Kw3MTXJXovuJK74EkOG9NcHor/wiIAjpBq
         HFoKQlSFx9TH7qyu9nMb8KpXHOdDxjicINCTNfI3NkxpJW6EwlnoGykgA8fVg7pN4KB3
         TJl+bZrnt4Kl0BqsU5/ke4A3pxysDP6X5Kk6btfc+Pwn0ALp78VbidbHLD61XHoB13Yl
         PeILdhWuwDQWap/PsbaQNXJx/1rRuJ2UIs0XlMjNK8PuUSd03LB3kErvRaw910Z0VP+T
         xC2HkykfhXaGLAevEg8FUgFaAXo968PJdnkkNHW7aWHvieKnZAJXndnjvtqxdeVTo3DG
         PX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gnMEBo8E/2r0RxcreeVzvdUJTnoTv3L/ZBGLWIasnvY=;
        b=XaGhpzP4IhTuBb/7uAl0jZOo3jxxHPEQ/8phh0PWx/Xi6FI9tCPtjpgnU2dBJ0T/l4
         DAZEBNiuc2qBXeeN3hVosynV4hjnpxctr3oe6HkH6lDrocJfAN8GRNF6D6ZqnI17ZzGv
         aAezmTblSP/6Zim4NgC6rZJ85tpURL+pVnbCidZ2RDXhNkx9WM+ujhggqN9SG69bKVkg
         KIQA/PbrJSOAmIq7PSEoBz8nCsIAKVuWEUEjlx56qA3jz/XbKNukMBlbQL1XijWEUe+2
         cFjHRB2FoEUeB5ek8tDCUzpQ+HP7Is/5iWJhdOFS14sOGBstXt8Y0tZJb3NEVKVgLrls
         OSSg==
X-Gm-Message-State: AJIora94Jufzn/HkdncNiYOlLwAZvEDNanK0ZdSDzu1VLi33yTacIPop
        I5oKEGwrxwI410x6VdCPw9NPGg==
X-Google-Smtp-Source: AGRyM1tThOHHQzHhG4kStaX1uXtl/9l9Q2rfmoYpTL6ZRww/UFC78vwuas+bzy1S2m5Muc3nuPUm2Q==
X-Received: by 2002:a17:907:2d29:b0:70e:8b1c:c3f0 with SMTP id gs41-20020a1709072d2900b0070e8b1cc3f0mr16367652ejc.37.1655640151554;
        Sun, 19 Jun 2022 05:02:31 -0700 (PDT)
Received: from [192.168.0.206] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gi19-20020a1709070c9300b006febeb51cd5sm4528523ejc.174.2022.06.19.05.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jun 2022 05:02:30 -0700 (PDT)
Message-ID: <20c93477-f41d-69c2-5fa5-3640f24fee12@linaro.org>
Date:   Sun, 19 Jun 2022 14:02:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/7] dt-bindings: clock: separate bindings for MSM8916 GCC
 device
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
 <cd4eaead-4218-2de0-1929-7c8a2aafaff4@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <cd4eaead-4218-2de0-1929-7c8a2aafaff4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/06/2022 06:35, Dmitry Baryshkov wrote:
> On 18/06/2022 04:40, Krzysztof Kozlowski wrote:
>> On 17/06/2022 07:47, Dmitry Baryshkov wrote:
>>> Separate bindings for GCC on Qualcomm MSM8916 platforms. This adds new
>>> clocks/clock-names properties to be used for clock links.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   .../bindings/clock/qcom,gcc-msm8916.yaml      | 61 +++++++++++++++++++
>>>   .../bindings/clock/qcom,gcc-other.yaml        |  1 -
>>>   2 files changed, 61 insertions(+), 1 deletion(-)
>>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
>>> new file mode 100644
>>> index 000000000000..564aa764b17b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
>>> @@ -0,0 +1,61 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8916.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Qualcomm Global Clock & Reset Controller Binding for MSM8916
>>> +
>>> +maintainers:
>>> +  - Stephen Boyd <sboyd@kernel.org>
>>> +  - Taniya Das <quic_tdas@quicinc.com>
>>> +
>>> +description: |
>>> +  Qualcomm global clock control module which supports the clocks, resets and
>>> +  power domains on MSM8916.
>>> +
>>> +  See also:
>>> +  - dt-bindings/clock/qcom,gcc-msm8916.h
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,gcc-msm8916
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: XO source
>>> +      - description: Sleep clock source
>>> +      - description: DSI phy instance 0 dsi clock
>>> +      - description: DSI phy instance 0 byte clock
>>> +      - description: External MCLK clock
>>> +      - description: External Primary I2S clock
>>> +      - description: External Secondary I2S clock
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: xo
>>> +      - const: sleep_clk
>>
>> Just "sleep"
> 
> I was hesitating here as all other gcc drivers use 'sleep_clk'.

Eh, indeed, these are existing bindings and drivers. Let's keep sleep_clk.


Best regards,
Krzysztof

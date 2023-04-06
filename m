Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C70EC77B6C
	for <linux-clk@archiver.kernel.org>; Thu,  6 Apr 2023 07:42:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236210AbjDFHmr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Apr 2023 03:42:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236174AbjDFHmW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Apr 2023 03:42:22 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D12718A7A
        for <linux-clk@vger.kernel.org>; Thu,  6 Apr 2023 00:41:52 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id b20so147175264edd.1
        for <linux-clk@vger.kernel.org>; Thu, 06 Apr 2023 00:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680766911;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hpp+0JOz+FKGY7fsBLSsdfNUNXwCqAnXR6glr6qNRMw=;
        b=U9/EmzMV+No/XF5Nq4LYvmSGD7hlHQqob5/GLw7OH9v6PeKs+BIbVHC4yEqvo3zLIM
         ewwpZeEJXgJJICeVEqDaWdKohsl5KIMAZuYGR7CgDPjCq1y3vV8etQO+WiSNRj+qmNEW
         Rjf/rCSk22jFq/DmvYb2cnlASTRzytXbuTVClOVDAhm1CxAMtuLT6RgUnkxcSvKQj2Cn
         eV03fmlQsJ8QyuN+/0Ul+K5dZvyTx2+dhtU2prTABH4Bf/7VsuzHIEXHeW9mVABRH3fJ
         QK9U5oMPUAguypNu/vx3B8jF5ZlHBPKr9evFQieqkQKvQ0lHM3kaZNvm6ywNXt4uhuy5
         o3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680766911;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hpp+0JOz+FKGY7fsBLSsdfNUNXwCqAnXR6glr6qNRMw=;
        b=0H3vKc29ARy6xU3EGGVluY3QPvsZmq2GMjh1cBGrOzsUb1Nqypq59v3KF78gfX1B2F
         cx2CLK68dV1wS8kqC+FXHFZUH8mNESge6hOHnQ1IEnG9Pjv5KcR6kVyRMBkpmXZjQD0E
         C8VhJt5hGiO+M+uF4zvb3f9WkppBy3TaRXsMYcU62yqjgftwjKFynCpQ74fmse8XmUnP
         jMMIIV/ZBHo+DqU+8gL5GOEFVX29P61oMIE7q0Vs3/cZN4vZQHYAmNp43n5PPy60GsUd
         ai0En3/3E2SQkqFLq+QD4t2e9WVl7pzQtfNyBCJFo+iOx/efSBJ3+uOlgIEXJtBM296f
         ZV8A==
X-Gm-Message-State: AAQBX9fPtUVkOSDXi2+1Wn+UJyAZS2oX0lQZ61zVaLxcq8j4WlUt1JII
        Epso0KUW76tUeBg/62e2pV2Bxg==
X-Google-Smtp-Source: AKy350bkNdf5O2eZ4KmOp+DCXA33pjr3OARoKNaTAwi7CozBGDwR42LmdRmdeTHeYyrr7Aa+Kp1SBA==
X-Received: by 2002:a17:906:c014:b0:947:c8d5:bfab with SMTP id e20-20020a170906c01400b00947c8d5bfabmr5034771ejz.35.1680766910962;
        Thu, 06 Apr 2023 00:41:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id y11-20020a17090629cb00b00949173c1dcfsm455419eje.18.2023.04.06.00.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 00:41:50 -0700 (PDT)
Message-ID: <0a66e291-a86d-1ff9-e674-839b8cc8f1da@linaro.org>
Date:   Thu, 6 Apr 2023 09:41:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 2/8] dt-bindings: phy: qcom,qmp-usb: Add IPQ9574 USB3
 PHY
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1680693149.git.quic_varada@quicinc.com>
 <1efa9a64499767d939efadd0aef897ac4a6e54eb.1680693149.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1efa9a64499767d939efadd0aef897ac4a6e54eb.1680693149.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/04/2023 13:41, Varadarajan Narayanan wrote:
> Add dt-bindings for USB3 PHY found on Qualcomm IPQ9574
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  Changes in v8:
> 	- Update clock names for ipq9574
> 
>  Changes in v6:
> 	- Made power-domains optional
> 
> Note: In the earlier patch sets, had used the (legacy)
> specification available in qcom,msm8996-qmp-usb3-phy.yaml. Moved
> to newer specification in qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> ---
>  .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml        | 43 +++++++++++++++++++---
>  1 file changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> index 16fce10..e902a0d 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
> @@ -16,6 +16,7 @@ description:
>  properties:
>    compatible:
>      enum:
> +      - qcom,ipq9574-qmp-usb3-phy
>        - qcom,sc8280xp-qmp-usb3-uni-phy
>  
>    reg:
> @@ -25,11 +26,7 @@ properties:
>      maxItems: 4
>  
>    clock-names:
> -    items:
> -      - const: aux
> -      - const: ref
> -      - const: com_aux
> -      - const: pipe
> +    maxItems: 4
>  
>    power-domains:
>      maxItems: 1
> @@ -60,7 +57,6 @@ required:
>    - reg
>    - clocks
>    - clock-names
> -  - power-domains
>    - resets
>    - reset-names
>    - vdda-phy-supply
> @@ -71,6 +67,41 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:

As you can see in example-schema, allOf goes before
additionalProperties: false.

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq9574-qmp-usb3-phy
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 4

Don't need clocks here.

> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: ref
> +            - const: cfg_ahb
> +            - const: pipe
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc8280xp-qmp-usb3-uni-phy
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 4

Neither here.

> +        clock-names:
> +          items:
> +            - const: aux
> +            - const: ref
> +            - const: com_aux

Can anyone explain me why do we name these (here and other Qualcomm
bindings) based on clock name, not input? Just because different clock
is fed to the block, does not necessarily mean the input should be named
differently.

> +            - const: pipe
> +
>  examples:
>    - |
>      #include <dt-bindings/clock/qcom,gcc-sc8280xp.h>

Best regards,
Krzysztof


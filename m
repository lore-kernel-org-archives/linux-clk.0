Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A906C77B61
	for <linux-clk@archiver.kernel.org>; Tue, 28 Mar 2023 07:11:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjC1HLo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Mar 2023 03:11:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbjC1HLn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Mar 2023 03:11:43 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 160BD2D40
        for <linux-clk@vger.kernel.org>; Tue, 28 Mar 2023 00:11:41 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id b20so45662929edd.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Mar 2023 00:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679987499;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a5fyW1eX1RAR+NBmwPpWJ9Jn0eMpcCTBleyehK3tanw=;
        b=yUYRLQb9IVWEbo20PLorrGnjtm3zZiFX+UHX46vIe6ye583NOm04sdjQJF0ruYxHRO
         0wltvHNA3PsMmTaKV7r/wcnE5B0u/pExzwBFBABJtuSlm4nhbXQ58ZrrFMLU5E5KkfT4
         +De9QmNLjfzZ8c85rGnVqsW1mIiSXDoGYpRRDJt7tKagLlUPQ8jV9F33CCKtfUAx1p4T
         JFTUt/iPM5pVFebaNmS7U/DXABCDUyyN8GRG82xvSFPxE/LG7HfnK5YuoEkl5nqEscps
         j+7QIwwHdnLT5AF8F2VJRA2i9nJ34uekIaizThFaUCrtjrRvuZFZL7AlfnSVcaBCQnhF
         m79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679987499;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a5fyW1eX1RAR+NBmwPpWJ9Jn0eMpcCTBleyehK3tanw=;
        b=H4dewKL0jcVDqjrxQ7XKoSWRWH9nw2kGVi25ARbcNpPQIpoJB1VLC6a7Vz/EL+bmSM
         iKCtt6JuyE8zEtSlwfEfcVvDlo7IgrfFSzpjVnEPfQ4QREGx3S8TwAYu3V6m/I4ZrvA8
         ip6Yk00ejJ7Fj6ap1gWHMHqtfQkcoUuin/Yr6QTeSoTaiYfeUVP42bX/pJb/jl6WGMmP
         bRuULuD9v64QE2Uyr50lzss3KYgS5NzXhyhny9HLl0mI9A1/zAzT5hktQfefkuDtkugo
         W4uUdbgh59rtnZzHcwWnA1C0trQmR9ElshQ3Mx9E6n61w+qxdbDwhTHTmeAKNr/7/SOA
         r+ew==
X-Gm-Message-State: AAQBX9dSwyY+KbaLILParLpF3mo+5C0gIg2rCI0eK4MfTL6EEy5lCOuN
        ZSx8UHhB+eedzDzTiRdVvPxTFA==
X-Google-Smtp-Source: AKy350bYJuSxq8c07X8GOgM+6HypZc8my/E583ZMsjqpdiOYZOwxDATAJ8NU9HcdX0ogeGKLpjFyIA==
X-Received: by 2002:a17:907:c248:b0:931:ce20:db8e with SMTP id tj8-20020a170907c24800b00931ce20db8emr15303083ejc.51.1679987499545;
        Tue, 28 Mar 2023 00:11:39 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6? ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id o23-20020a170906289700b00922547486f9sm15222236ejd.146.2023.03.28.00.11.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 00:11:39 -0700 (PDT)
Message-ID: <a68c7693-9d43-0aa9-c77b-26183e5a0a06@linaro.org>
Date:   Tue, 28 Mar 2023 09:11:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 3/8] dt-bindings: usb: dwc3: Add IPQ9574 compatible
Content-Language: en-US
To:     Varadarajan Narayanan <quic_varada@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-clk@vger.kernel.org
References: <cover.1679909245.git.quic_varada@quicinc.com>
 <526f822a4d2397284f70ba632d92feaa3db0143e.1679909245.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <526f822a4d2397284f70ba632d92feaa3db0143e.1679909245.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/03/2023 11:30, Varadarajan Narayanan wrote:
> Document the IPQ9574 dwc3 compatible.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  Changes in v4:
> 	- Update other relevant sections
> 	- Remove constraints not applicable to IPQ9574

No, that's not way to go. These are required.

> ---
>  .../devicetree/bindings/usb/qcom,dwc3.yaml         | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index a2aabda..3fc8c3c 100644
> --- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> @@ -17,6 +17,7 @@ properties:
>            - qcom,ipq6018-dwc3
>            - qcom,ipq8064-dwc3
>            - qcom,ipq8074-dwc3
> +          - qcom,ipq9574-dwc3
>            - qcom,msm8953-dwc3
>            - qcom,msm8994-dwc3
>            - qcom,msm8996-dwc3
> @@ -132,11 +133,8 @@ required:
>    - "#address-cells"
>    - "#size-cells"
>    - ranges
> -  - power-domains
>    - clocks
>    - clock-names
> -  - interrupts
> -  - interrupt-names
>  
>  allOf:
>    - if:
> @@ -242,6 +240,24 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,ipq9574-dwc3
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 5
> +        clock-names:
> +          items:
> +            - const: sys_noc_axi
> +            - const: anoc_axi

Heh, do we really need entirely different clock names for each new variant?


Best regards,
Krzysztof


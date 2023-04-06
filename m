Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3783C77B6C
	for <linux-clk@archiver.kernel.org>; Thu,  6 Apr 2023 07:44:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234970AbjDFHof (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Apr 2023 03:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234958AbjDFHoJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Apr 2023 03:44:09 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37D2DE64
        for <linux-clk@vger.kernel.org>; Thu,  6 Apr 2023 00:43:52 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id i5so147371873eda.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Apr 2023 00:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680767030;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uaae/Gf1/6wg+LDa+ygkgJGlypxcIUaHAsaoRhlT34o=;
        b=oXPhlK+Jp0n/xdreEycT0BU+UJH6W9xVaby3EULDTFHAz2yHsR8lYbX8zW4k/44/7H
         GMVW8mvM+/g/uyhBGczPsO9l7u07KGv0QeMItpug//0pEAuiGM4IPWtekhOpZGn9TPmx
         nvpx0JHMZQFQFIp/mjEtPutTlrQFx9MvZnb6hCPJaQniZQu5sC1yOXJ8kJDMRyxjkSiQ
         T0Fwx6nxyQ/LYMsDppw5D0vfEh9+DCA3wTdIorI6tB4uf2wF8Pjy8PysVe6Dq3fSVAm6
         tnckOPPaimKZUKnnIma4C8oKxdM0jrqhhyf86omiQZnZmlMBU2wTTsGN4Tr8Z3KMfcs6
         3VoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680767030;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uaae/Gf1/6wg+LDa+ygkgJGlypxcIUaHAsaoRhlT34o=;
        b=nUBowwBRo6YgMb2oGWVaiKQRXns5rBkFHuPxokhyS2DJKARV/Ttihv1pQeMmeAOtaw
         ba4d78uEjwi0CHtlm7j89DuhRIX9xrcW3nwm9JZx9SSEDR7lOFFMiZTVoqnVVtxKUmF4
         cncusf4GvMM6jzaKJTumKO3JIAF+YVk7M09ozAJ8+ocXheh87LNo+AV4h5BIh2TmXXt/
         AaYb6Hz2k9oaHISG91tXkQlJ2xB1KI+TrudGRPJmIIa4wrQV8H8aky/Ywf1IXINnGDWF
         lvz0PROv33+p+5bPYHLcJzsNGelIcnEwUb51hRb5N71nBxXBsxWb0iDxmlSwJ2tqUXdZ
         ZEyA==
X-Gm-Message-State: AAQBX9cqv2cHx5LV5jRQkcVtSLlJww7mtmR4Gy8qjVKbFQ9vbe8oZzdb
        Qqt/+ZbKKIXJEMGYydainPCJIA==
X-Google-Smtp-Source: AKy350aoGvLE98pNqsudQV1mmoNS4KNifIl0+eEz3ycTrvouiOMXIacvp9zYbbwm8qYxno+2SD352A==
X-Received: by 2002:a17:907:118a:b0:948:aac6:7def with SMTP id uz10-20020a170907118a00b00948aac67defmr4854533ejb.19.1680767030731;
        Thu, 06 Apr 2023 00:43:50 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id h7-20020a50cdc7000000b004fa99a22c3bsm359770edj.61.2023.04.06.00.43.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 00:43:49 -0700 (PDT)
Message-ID: <533651bb-e72a-c899-5b64-16d000819e20@linaro.org>
Date:   Thu, 6 Apr 2023 09:43:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 3/8] dt-bindings: usb: dwc3: Add IPQ9574 compatible
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
 <3ee3163e6933b52e3eb4144c8041062dbd15e6c2.1680693149.git.quic_varada@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3ee3163e6933b52e3eb4144c8041062dbd15e6c2.1680693149.git.quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/04/2023 13:41, Varadarajan Narayanan wrote:
> Document the IPQ9574 dwc3 compatible.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
>  Changes in v6:
> 	- Made power-domains as optional
> 	- Resolved all 'make dtbs_check' messages
> 
>  Changes in v5:
> 	- Restore removed constraints
> 
>  Changes in v4:
> 	- Update other relevant sections
> 	- Remove constraints not applicable to IPQ9574
> ---
>  .../devicetree/bindings/usb/qcom,dwc3.yaml         | 22 +++++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
> index d842819..f5dd268 100644
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
> @@ -133,7 +134,6 @@ required:
>    - "#address-cells"
>    - "#size-cells"
>    - ranges
> -  - power-domains


Power domains are required. Commit msg does not explain why this should
be now optional.

>    - clocks
>    - clock-names
>    - interrupts
> @@ -197,6 +197,26 @@ allOf:
>              - const: iface
>              - const: sleep
>              - const: mock_utmi
> +      required:
> +        - power-domains
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,ipq9574-dwc3

You do not need new entry. Just open the file and file respective
existing if.

Best regards,
Krzysztof


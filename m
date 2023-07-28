Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4593EC41513
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jul 2023 11:38:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236010AbjG1Liu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Jul 2023 07:38:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234736AbjG1Lit (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Jul 2023 07:38:49 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A7493AAE
        for <linux-clk@vger.kernel.org>; Fri, 28 Jul 2023 04:38:47 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99bdcade7fbso225763866b.1
        for <linux-clk@vger.kernel.org>; Fri, 28 Jul 2023 04:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690544326; x=1691149126;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5leZAhUKQXLEIMkQy47KayEVsACGqcWVCey8ch/+RqI=;
        b=H/+mbj3uJ1by92bWHcMwOHA5sGECXyyOmXBxIimWgNXGoLJZtmEnfe7E7zQoBpSAP0
         VLhSKxdPffAlJXEyKTh8p6U2rgdGlpdseVlBrSn3tug2fJRygrYlwGzXWMNA8V7dXuiJ
         5+mX/+wAXXm8GFWKAixjN0LYxwDB402wTvc4VJ/Eg4GewTFX72CyWEjU0vsJ/57Ug+Dj
         JoxsZHBUV2wFI+waNOZUGHOKeAj+AHugG54wf63ve/ql562bUcVMWmgQGEndz4gqEppa
         ws3q+Xfi0lQhizT9MI0MxpFEQFcDUijMQlZJSsE/Wfux2WSqnmq6pOyDoc3Qi4O6CVDQ
         kReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690544326; x=1691149126;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5leZAhUKQXLEIMkQy47KayEVsACGqcWVCey8ch/+RqI=;
        b=iR/Pk7TUVZmBo9gzt4zmg1gVh2tktLDwE81EoJ0XZ0IRarINqc7M7VcqDy/m18YJRV
         3Q7KiUJa8QoWbVmBPxuWekjB8x6c1LBKC3pT9yynApElvifiYnXsYSS3wzNz7f9xlO2o
         kVk+BQjHVbIE6h6vvc8pzGAlVJzIcmfK9u1rrIPOGfNOBvwWcZVmf77EuC/DJOicNM0l
         W5kgfQoTpdg+UQ07aP+MWKSWvO5Ii+VXwkgXGRBZ42QBotmAlYz8nJ+GltShVrQwcYPE
         augpBIKkvIO06E0YQNunD8u+wLRg26RutSigHjqweEqazmpMPsWERs690jvqYGMx3OTq
         NBvw==
X-Gm-Message-State: ABy/qLYmT9cC0oZSt+n6JlY7iOdbW3X75OuuDSVMrOQZD0seit5ka9DS
        510AGbJ7ewtMNBvGNBT+3sgnkHeKFpDtflMalKPzBg==
X-Google-Smtp-Source: APBJJlG5PfJhIx4SHChUWn3WOKeHmv9ZxctbrGrtTHt3znYFmsGI+SpkABC24ihloGN/r3ccDFUb+Q==
X-Received: by 2002:a17:907:1dd3:b0:99b:bca6:cf90 with SMTP id og19-20020a1709071dd300b0099bbca6cf90mr1836790ejc.9.1690544325906;
        Fri, 28 Jul 2023 04:38:45 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id j20-20020a170906051400b00992b8d56f3asm1943015eja.105.2023.07.28.04.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 04:38:45 -0700 (PDT)
Message-ID: <fb18b855-94d4-77f4-bbf1-ca3167d3be7a@linaro.org>
Date:   Fri, 28 Jul 2023 13:38:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 04/50] dt-bindings: clk: at91: add sam9x7
Content-Language: en-US
To:     Varshini Rajendran <varshini.rajendran@microchip.com>,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@microchip.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20230728102337.265471-1-varshini.rajendran@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230728102337.265471-1-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/07/2023 12:23, Varshini Rajendran wrote:
> Add bindings for SAM9X7's slow clock controller.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/clock/atmel,at91sam9x5-sckc.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/atmel,at91sam9x5-sckc.yaml b/Documentation/devicetree/bindings/clock/atmel,at91sam9x5-sckc.yaml
> index 7be29877e6d2..94b83047c3cf 100644
> --- a/Documentation/devicetree/bindings/clock/atmel,at91sam9x5-sckc.yaml
> +++ b/Documentation/devicetree/bindings/clock/atmel,at91sam9x5-sckc.yaml
> @@ -20,6 +20,9 @@ properties:
>        - items:
>            - const: microchip,sama7g5-sckc
>            - const: microchip,sam9x60-sckc
> +      - items:
> +          - const: microchip,sam9x7-sckc

It should be enum with sama7g5.

Best regards,
Krzysztof


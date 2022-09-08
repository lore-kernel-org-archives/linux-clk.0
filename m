Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A5DC6FA82
	for <linux-clk@archiver.kernel.org>; Thu,  8 Sep 2022 12:33:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbiIHMdO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Sep 2022 08:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231476AbiIHMdK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Sep 2022 08:33:10 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E96841316DF
        for <linux-clk@vger.kernel.org>; Thu,  8 Sep 2022 05:33:07 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id bn9so19696220ljb.6
        for <linux-clk@vger.kernel.org>; Thu, 08 Sep 2022 05:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Qyru9SAfxdnNAoiz22FTxnAwNC5Cr+8SPNsc9ocSsIc=;
        b=f7wa2z+PB3fEAcSD3njThDARidFNQguSSunU6swdNpXzExqTrXH4PJgNHVhFxxvqct
         lYKOp2jWPUSJltKRlEsrvQexdKtaQT3i3dwr0iztMGW7jS+Jy927WOXT4DbmDQiFreKV
         wAFzs2TPxXf+6O0lIn3hJ0uB9wzGMAhxGSyuJqAFow8FmDkHjGTyCz33v9pZRtLLU8Bp
         iT+q+odD5f59VF/J/8iP35GYJflHIc0y0E8ANwCol0kCp0FhPGNJhjXrQdxmgI5UxSLS
         qhUTBv86bbgKwFlQZW7ELbvbwQ+MCIt2FPQpkGroIuea5QJ8BX/ZhbN4GghfQdEw8UZ1
         Qdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Qyru9SAfxdnNAoiz22FTxnAwNC5Cr+8SPNsc9ocSsIc=;
        b=a0u7phwo1bzdfpGBZSQ1RqkkzBYiP8ix3Rgp8f8+Js8qb3pIucgi8e63qNVJpbqFfj
         ARMLKstS7ApaFhqHC4wIa7zQux7sk3Hp8RCNgx/+brZnvZX6uoFO+TFk/xn/b6E5MKbK
         jKJVuNw5IQCAop3tLJuRKrGkXyhRXKpsyWQR1rlrXwZQl2h/SBwEb9XXcB5Aq7jQadQh
         LHcB9wQk7AEhSLwJqdEoCrXsIIbprPJoU6W9mxvP06y2J7Z0IbTpS+KQgJ+ctxad0C97
         ZIsV0X8XanN8cMhr094A/S9QIWUHvaMeYLL6+tlIIhCbpXY9eUlPmvxsd2h6WoZq7Gsr
         0DrQ==
X-Gm-Message-State: ACgBeo0sXnXIwoE1rO2SQwKK+rM+zHvG3vrd6qoCSY5cLz1JKeBbsZI4
        r1GbZ15f0M34N6tHbYARiU4XRg==
X-Google-Smtp-Source: AA6agR7V97zwiD9pYqVJ0dFEam4iMWv2WsE07yb8VQiXEY40nYMp8wnTZhtCr1GIsKgf9/LZQCcqVg==
X-Received: by 2002:a2e:b16d:0:b0:26a:d1da:db8 with SMTP id a13-20020a2eb16d000000b0026ad1da0db8mr1709534ljm.217.1662640385823;
        Thu, 08 Sep 2022 05:33:05 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s17-20020a056512215100b0048b17852938sm145414lfr.162.2022.09.08.05.33.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 05:33:05 -0700 (PDT)
Message-ID: <633c8aa3-cc05-b855-24db-110a4863ff75@linaro.org>
Date:   Thu, 8 Sep 2022 14:33:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 07/13] dt-bindings: mfd: atmel,sama5d2-flexcom: Add
 USART child node ref binding
Content-Language: en-US
To:     Sergiu Moga <sergiu.moga@microchip.com>, lee@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@microchip.com, richard.genoud@gmail.com,
        radu_nicolae.pirea@upb.ro, gregkh@linuxfoundation.org,
        broonie@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        jirislaby@kernel.org, admin@hifiphile.com,
        kavyasree.kotagiri@microchip.com, tudor.ambarus@microchip.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-clk@vger.kernel.org
References: <20220906135511.144725-1-sergiu.moga@microchip.com>
 <20220906135511.144725-8-sergiu.moga@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906135511.144725-8-sergiu.moga@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/09/2022 15:55, Sergiu Moga wrote:
> FLEXCOM, among other functionalities, has the ability to offer the USART
> serial communication protocol. To have the FLEXCOM binding properly
> validate its USART children nodes, we must reference the correct binding.
> To differentiate between the SPI of FLEXCOM and the SPI of USART in SPI
> mode, use the clock-names property, since the latter's respective
> property is supposed to contain the "usart" string.
> 
> Signed-off-by: Sergiu Moga <sergiu.moga@microchip.com>
> ---
> 
> 
> v1 -> v2:
> - Nothing
> 
> 
> 
>  .../bindings/mfd/atmel,sama5d2-flexcom.yaml      | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml b/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
> index 0db0f2728b65..b5fb509f07ec 100644
> --- a/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
> +++ b/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
> @@ -72,13 +72,21 @@ properties:
>  
>  patternProperties:
>    "^serial@[0-9a-f]+$":
> -    type: object
> +    $ref: /schemas/serial/atmel,at91-usart.yaml
>      description:
> -      Child node describing USART. See atmel-usart.txt for details
> -      of USART bindings.
> +      Child node describing USART.
>  
>    "^spi@[0-9a-f]+$":
> -    $ref: /schemas/spi/atmel,at91rm9200-spi.yaml
> +    allOf:
> +      - if:
> +          properties:
> +            clock-names:
> +              contains:
> +                const: usart

Devices are not different because they have or have not clock. Devices
are different... because they are simply different models, so this
should be different compatible.

Best regards,
Krzysztof

Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68895C4332F
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 14:56:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237228AbiDHO6Q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 10:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237227AbiDHO6P (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 10:58:15 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD376A995A
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 07:56:10 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id v15so306292edb.12
        for <linux-clk@vger.kernel.org>; Fri, 08 Apr 2022 07:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5HiRw4Vbmz1rrJh2dozRKVeZfGCAzISbQu8r7Z7QixE=;
        b=TXoWEV0RnLwLPtIPTm4lzG3zoNDm3YiWUjCw7wRjYTfTrFmkWqp+LdrZg0MSY5Avkv
         q7EJYQhW6ssnLt9w9Vbe6vrWBEZiXEjwAdHqUDm7N1hWkOSV7A1MtLjw9SpAvAtg3jiY
         LU74+guOMRM8Rqk6kmvWoyZmDQvWQkB8KXpt52/sPqAFqujQ8o4NyaHvtyGuLOgb5xIE
         s1bO1plHEn5j78tXuUN3xUGKnpcQ0dBkA4rfVq9v8wb/NiC/3s+y1lPR51CZV9VYjk2l
         pk8EF5kkkVIz+rrN9FHxCf4e+N2qNQdL0xIrWJf2z9qZGA+5/6vV0CtGmFuhIxYSvQJi
         P8Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5HiRw4Vbmz1rrJh2dozRKVeZfGCAzISbQu8r7Z7QixE=;
        b=rPWMvjIAjckJtPyzgr0x1LiN2IHIXKyH8CcqFfwHjyDM6Nux8PulRXe+404Zoo23rN
         qoc22oHK13OkaCvguibnmEbrfKohIOOQsPEZ00xgDxxwnJEiuJo9qCMbHcurV1+5GAQU
         e1gY48QbezA2fnWmPhEKlMcgI5hXBIAZ/znX0qgxeespGPISKpGTJCWTz9woaUMzEmws
         AssFAIN4/4IR1Hf9JJYb7hf3n47zZnHbXh7n6vnHWSAct29qQAVnkQGi7opQlN1/drcX
         bkBQHJtU5KctfKQEoSrdV/SLeC572bJ5tFA2/F05gCtfG/d3GGhDbjG8w1GVz8qxtoMm
         RnAA==
X-Gm-Message-State: AOAM533+koz/xktxOH5DIQsu/GyjDPydPHdD2bO5g/+j7mouaZ3Noluw
        JyJOQMxrghTPcTwrUpRJt8QNMg==
X-Google-Smtp-Source: ABdhPJxqNP+oRfi6jK3hfh9fSH7vhe1Rb/5oyPMUQ5ccKNJVzZTw0YRcPQZ6iCNpOHvO5UhXj0BfFw==
X-Received: by 2002:a05:6402:548:b0:41c:bf00:307 with SMTP id i8-20020a056402054800b0041cbf000307mr19591699edx.6.1649429769508;
        Fri, 08 Apr 2022 07:56:09 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id n13-20020a170906724d00b006cedd6d7e24sm8814562ejk.119.2022.04.08.07.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 07:56:09 -0700 (PDT)
Message-ID: <5edc7895-5e51-bf6e-e37a-26bdc2a5db9a@linaro.org>
Date:   Fri, 8 Apr 2022 16:56:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 3/7] dt-bindings: rtc: add refclk to mpfs-rtc
Content-Language: en-US
To:     Conor Dooley <conor.dooley@microchip.com>, mturquette@baylibre.com,
        sboyd@kernel.org, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
        palmer@rivosinc.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        krzk+dt@kernel.org
Cc:     daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20220408143646.3693104-1-conor.dooley@microchip.com>
 <20220408143646.3693104-4-conor.dooley@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220408143646.3693104-4-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/04/2022 16:36, Conor Dooley wrote:
> The rtc on PolarFire SoC does not use the AHB clock as its reference
> frequency, but rather a 1 MHz refclk that it shares with MTIMER. Add
> this second clock to the binding as a required property.
> 
> Reviewed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/rtc/microchip,mfps-rtc.yaml           | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> index a2e984ea3553..1ffd97dbe6b9 100644
> --- a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
> @@ -31,11 +31,18 @@ properties:
>            to that of the RTC's count register.
>  
>    clocks:
> -    maxItems: 1
> +    items:
> +      - description: |
> +          AHB clock
> +      - description: |

Same as your patch #1 - this breaks the ABI.

Best regards,
Krzysztof

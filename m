Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02035C41513
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jul 2023 11:46:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234466AbjG1Lq5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Jul 2023 07:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234911AbjG1Lq4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Jul 2023 07:46:56 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E06BD30FC
        for <linux-clk@vger.kernel.org>; Fri, 28 Jul 2023 04:46:54 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-99bd1d0cf2fso284955766b.3
        for <linux-clk@vger.kernel.org>; Fri, 28 Jul 2023 04:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690544813; x=1691149613;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4bicTEmA20kGYFXTbpbqy5uA1OeKR6hkby2ZwK7htZc=;
        b=bP9CWebw0nGNornjyAQacJRr0lD0PWRhFUu4NKQD6kJ6xR9eAFnPqEMkQUGJcpTHS5
         FvF65D3cZXKcR1q/qBnr9JWrDxg4qwbEQseYJvmAs+QgQB69PnrpzIYhwvWwbK5PjLen
         3GQkvvWyIV+7z9CMLlBVSF/NZEaga6fLuYgLbc0deePAdXbuRLhncr8ZxCUJmXsfSava
         rc6RODfUCfsgtW4EwWYNGgvCtExFFdan5QRenln+jvdoYjt0XSdtY50qyul04rUBmAzt
         DdbDruzn9N2fBykx+7h7xcMC0AL/2Xu4kh0jTeuMe7QfWTwobfJfiL7Xk3qV95rmKHbM
         cabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690544813; x=1691149613;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4bicTEmA20kGYFXTbpbqy5uA1OeKR6hkby2ZwK7htZc=;
        b=JI0O/KM6Z5RxLR+5aukgqkuZfuVK5O3QMinrkEnjmZCv1aW1DGPsan7kXjyrFQ8Nhu
         mxkg3BxdJFoZH2y7pJUPBqhx1qf4DJBNRfUFR+wBSO4/NaevlawsN7Hc6yWvcCIOpWFn
         kcJlILF6l2HLU9q9jxuqHTSNEvr30CSXp4z8o+hZPDfvFNyygcpqWYa2YnbLtnI1dzTo
         sXnKSHcfBCimzUsN7sXlBDWcDSDmH9lnPx8Wu/s8H3WiP1Jz4JdncMLEyuGCFhBRTpix
         eqTs7vHbHH57XWXM6xdWVKwhLsMJ1FYXoehjUoq+Hzf1Thrg3DCMeTcCUd4V5VddVzxL
         gcYg==
X-Gm-Message-State: ABy/qLavB1s60otz3FXMLBInyfhQJLqMI+MAUCREN7XfdoluoXIdmwux
        9wfChPRR3ZMX+QhkALLC6Wq0Rw==
X-Google-Smtp-Source: APBJJlF4wX6IOyDsRHCOEf58T3NtRs74ijHx4d1kMWbOieFVhht66Yi45FbbkoL1b1Xdk3CUf6XDfg==
X-Received: by 2002:a17:907:7628:b0:978:928:3b99 with SMTP id jy8-20020a170907762800b0097809283b99mr1826331ejc.46.1690544813353;
        Fri, 28 Jul 2023 04:46:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id lu20-20020a170906fad400b00993664a9987sm1961196ejb.103.2023.07.28.04.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 04:46:52 -0700 (PDT)
Message-ID: <46927d97-72a1-8815-38d3-828797c0f3dd@linaro.org>
Date:   Fri, 28 Jul 2023 13:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 05/50] dt-bindings: clk: at91: add sam9x7 clock
 controller
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Varshini Rajendran <varshini.rajendran@microchip.com>,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        claudiu.beznea@microchip.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20230728102350.265520-1-varshini.rajendran@microchip.com>
 <f7186a62-19a1-5d72-ee1b-255b81fb8abe@linaro.org>
In-Reply-To: <f7186a62-19a1-5d72-ee1b-255b81fb8abe@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/07/2023 13:40, Krzysztof Kozlowski wrote:
> On 28/07/2023 12:23, Varshini Rajendran wrote:
>> Add bindings for SAM9X7's pmc.
>>
>> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
>> ---
>>  .../devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml          | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
>> index c1bdcd9058ed..ce0d99503645 100644
>> --- a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
>> @@ -43,6 +43,7 @@ properties:
>>                - atmel,sama5d4-pmc
>>                - microchip,sam9x60-pmc
>>                - microchip,sama7g5-pmc
>> +              - microchip,sam9x7-pmc
>>            - const: syscon
> 
> Where is the change in allOf:if:then:? No need for it? Why? Where is the
> driver change?
> 
> Please do not send huge series to 50 different people and subsystems.
> With your lack of threading it is so difficult to review.

You already got this comment and not much improved:
https://lore.kernel.org/all/f2f8cabf-ca4d-c6f3-5561-b24334be89d1@linaro.org/

Best regards,
Krzysztof


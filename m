Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92031C7EE24
	for <linux-clk@archiver.kernel.org>; Thu, 18 May 2023 07:05:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbjERHFZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 May 2023 03:05:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbjERHFX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 May 2023 03:05:23 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83E811BD2
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 00:05:22 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-510d967249aso2166201a12.1
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 00:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684393521; x=1686985521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HB3cwJV0mSmYqqN+17Ku1gQOxvoolxHz8jVfs5CGGuY=;
        b=Br4iCjwDzrKp05ZAWSLABuiOx30EM3t05C8aD/R+b3Gt8cMco6WYrPIUrZu7MZe2LX
         gPPDa/BT9PCYVCekVhT1YVT2G5Rg/oEL6RLHEOhg+MCKLm/NhV4KZmmdTRg1qlex2oEX
         PjoU811j6UlBAalG1Qo6GGNx1eEJnwi/tRekUB/DrqpelPMuyI4KPx0qjt93tlO2Et7o
         qI1j6kK4bcaRzSEaw3NVP8b+28vN74iZ1WPb29O3PbTpmj6V51IjxB93v616prV+xo8i
         wM5SJr0FTRHp5EeLhdIv8IB2QH7OyvnRHHmxxBHQ05EspTwvh9SBrQkWU5RuxPmGSn+a
         CxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684393521; x=1686985521;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HB3cwJV0mSmYqqN+17Ku1gQOxvoolxHz8jVfs5CGGuY=;
        b=Ebkvni8dAGA4psY8Jjp1uFzqwEqOX2rBx+V7K3H3z9boQSRlurPQdsAd+vjFOFufki
         4y+bt/MkBKIsnrYs36DdTHGliMW14gapc/pHIxYtEElQKPT1YZxihpGp2b/Xgi/1ewyP
         ZwiR8L1WmIQ+7QhXvKhpwPKUaFh6Kga+goKGfdUSslxsVl9uag6UQbp8J+TmBCjd0YO/
         nhTSN4BOTRyt5JnPrehrM1RKymOdp2EUpph6EZ/rPUh6wQUsonsEOBXhuL2IK4z6YB3o
         BrDtYuJaqowpaaCFvcToaR4+yxtHlvze5fsaneQ38f0P5vradb5NZtvYbKSc9gFpV6V3
         rxHw==
X-Gm-Message-State: AC+VfDwMQ2vvyMEt604wnOD7B/VqUt4BmwfMs2CXkSUFUusiRJ1YyVDD
        Txl89u9ndIsi8OpUoHkdKg2oZA==
X-Google-Smtp-Source: ACHHUZ6YGHm2Ye48O/6ou6X1U2dvgx77S0q7J8MRBOF4Mz4C2w69aPtohxBn0ToX9DTg5Zgy77w+HA==
X-Received: by 2002:a17:907:6287:b0:94f:29f0:edc0 with SMTP id nd7-20020a170907628700b0094f29f0edc0mr42034234ejc.44.1684393520981;
        Thu, 18 May 2023 00:05:20 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a2b:c408:5834:f48e? ([2a02:810d:15c0:828:a2b:c408:5834:f48e])
        by smtp.gmail.com with ESMTPSA id l18-20020a170906a41200b00965a52d2bf6sm567990ejz.88.2023.05.18.00.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 00:05:20 -0700 (PDT)
Message-ID: <c969276f-9e29-9337-44f5-aac445e061eb@linaro.org>
Date:   Thu, 18 May 2023 09:05:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 2/5] dt-bindings: clocks: atmel,at91rm9200-pmc: convert
 to yaml
To:     Claudiu.Beznea@microchip.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, Conor.Dooley@microchip.com,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230517094119.2894220-1-claudiu.beznea@microchip.com>
 <20230517094119.2894220-3-claudiu.beznea@microchip.com>
 <83f484ff-f170-6f32-f4b4-9743eb6d0b4c@linaro.org>
 <d115cd4d-2a4f-552c-692c-c69ae49fe21e@microchip.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d115cd4d-2a4f-552c-692c-c69ae49fe21e@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/05/2023 08:03, Claudiu.Beznea@microchip.com wrote:
> On 17.05.2023 17:21, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 17/05/2023 11:41, Claudiu Beznea wrote:
>>> Convert Atmel PMC documentation to yaml. Along with it clock names
>>> were adapted according to the current available device trees as
>>> different controller versions accept different clock (some of them
>>> have 3 clocks as input, some has 2 clocks as inputs and some with 2
>>> input clocks uses different clock names).
>>
>> Thank you for your patch. There is something to discuss/improve.
>>
>>
>>> +
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - atmel,at91rm9200-pmc
>>> +              - atmel,at91sam9260-pmc
>>> +              - atmel,at91sam9g20-pmc
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          minItems: 2
>>> +          maxItems: 2
>>> +        clock-names:
>>> +          items:
>>> +            - const: slow_xtal
>>> +            - const: main_xtal
>>> +
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - atmel,sama5d2-pmc
>>> +              - atmel,sama5d3-pmc
>>> +              - atmel,sama5d4-pmc
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          minItems: 2
>>> +          maxItems: 2
>>> +        clock-names:
>>> +          items:
>>> +            - const: slow_clk
>>> +            - const: main_xtal
>>
>> This and previous if, should be squashed. You have exactly the same then:.
> 
> Clock names are different. Or do you propose to have a if for
> clocks:
>   minItems: 2
>   maxItems: 2
> 
> and 2 ifs for clock names?

Ah, I see, they have different names - xtal -> clk.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof


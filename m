Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5AB6C77B75
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 14:07:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232469AbjEEOHf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 10:07:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232059AbjEEOHe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 10:07:34 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B45511DA0
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 07:07:33 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-50bd2d7ba74so27371846a12.1
        for <linux-clk@vger.kernel.org>; Fri, 05 May 2023 07:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683295652; x=1685887652;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mfe37bhZKfVzu7XYhiq7AznCwFGYTw35W2iL7Bje62g=;
        b=YCZRcNQIJMtF4Q0VKYQKCmoy57PhoEcBAs+SZCUZu60gmjEh3QxcKeySIs1wdhFkBj
         hzgX+0f8QcwAO1WtttnkbEIkWvq4Bpl6KrThUjLMexgOcRIwju0IGRXO89ZieROPdZHQ
         UEFkRtaoCXp0HI4sfzlRtdX7wlJuS/MAE1dOfJVXu910/SzjQWvmYTbyeB0rEh2HjlUt
         iMsSyzLziqWjwiU94FTysbqQPw4RVcd+dv8qwLTp6hN9A7MqZcQzMAiC3ilYsLavk9uW
         nE9BNUwUOHfjU9b1yJYLXNjDD7RCv0sQf6TI5MKTtBe747XNSNaEF62lWM2kaxukIYkX
         uF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683295652; x=1685887652;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mfe37bhZKfVzu7XYhiq7AznCwFGYTw35W2iL7Bje62g=;
        b=GlpPgY0gWU/TNeQ4vAu93khBxhm3Oud6+HdFb2H6fWqa5QjsysCapPZhQZFC9iX/9J
         9lgBQmWW12/m/4GIlxyIwRWq0o8FBPF3lggoBWEJ37Z8xo0v88lkhmcUiB9PdQOXUJzZ
         VtZLF/5Jn0oYnkH6cVh161k075Hc1/ngS/qNiu8qBkah8dfIGM0Q5L4lDOVG9AOJ4xFL
         rHKXu3y5GHUfeOf+H7k4+Zl7nxDpYdd3RXWChlmd32cMDsLAUzQNUzgVm88kLW4ScS+r
         6ZacXl4C6YdYOq6bNQkzsbyO77ACg8M23jFudp7/yyX6c3cZjxt7miimW7RuHjVNrJic
         evFA==
X-Gm-Message-State: AC+VfDxf2xQ8HBUssnoYuxHm3O6KG6KpAGXxdWEIBpso0pOvuB2zq6pB
        s62TyY1oy4KPhHrO2/bZ6v5FZw==
X-Google-Smtp-Source: ACHHUZ4GoVgXpiweHDRZdftQNnAgyTrTOi5YGaMTAkEIzK3CS02eT0yzC3NW4C2X1xnIQTBfzsy0vQ==
X-Received: by 2002:a17:907:1690:b0:94f:6316:ce8d with SMTP id hc16-20020a170907169000b0094f6316ce8dmr1960135ejc.34.1683295651914;
        Fri, 05 May 2023 07:07:31 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:52e:24ce:bbc1:127d? ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
        by smtp.gmail.com with ESMTPSA id ze15-20020a170906ef8f00b0093a0e5977e2sm973932ejb.225.2023.05.05.07.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 07:07:30 -0700 (PDT)
Message-ID: <27f30e11-c9cf-2e21-bbea-c6f1cd504cfe@linaro.org>
Date:   Fri, 5 May 2023 16:07:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/5] dt-bindings: clocks: atmel,at91rm9200-pmc: convert to
 yaml
Content-Language: en-US
To:     Claudiu.Beznea@microchip.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, Nicolas.Ferre@microchip.com,
        alexandre.belloni@bootlin.com
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230504060729.689579-1-claudiu.beznea@microchip.com>
 <20230504060729.689579-3-claudiu.beznea@microchip.com>
 <a964eeef-1db0-0d8a-e2a5-9e4c5fd8b2f0@linaro.org>
 <a7a40eda-9487-833d-8b6a-788812e8b80c@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a7a40eda-9487-833d-8b6a-788812e8b80c@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/05/2023 14:46, Claudiu.Beznea@microchip.com wrote:
> On 04.05.2023 15:47, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 04/05/2023 08:07, Claudiu Beznea wrote:
>>> Convert Atmel PMC documentation to yaml.
>>>
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
>>
>> Thank you for your patch. There is something to discuss/improve.
>>
>>
>>> diff --git a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
>>> new file mode 100644
>>> index 000000000000..c4023c3a85f2
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
>>> @@ -0,0 +1,161 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: "http://devicetree.org/schemas/clock/atmel,at91rm9200-pmc.yaml#"
>>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>>
>> Drop quotes from both.
>>
>>> +
>>> +title: Atmel Power Management Controller (PMC)
>>> +
>>> +maintainers:
>>> +  - Claudiu Beznea <claudiu.beznea@microchip.com>
>>> +
>>> +description:
>>> +  The power management controller optimizes power consumption by controlling all
>>> +  system and user peripheral clocks. The PMC enables/disables the clock inputs
>>> +  to many of the peripherals and to the processor.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    oneOf:
>>> +      - items:
>>> +          - const: atmel,at91sam9260-pmc
>>
>> Why this is separate, not part of bottom enum?
> 
> Current device trees uses the following compatibles (among others):
> - "atmel,at91sam9260-pmc, "syscon" or
> - "atmel,at91sam9g20-pmc", "atmel,at91sam9260-pmc, "syscon"
> 
> I haven't found another way to make dtbs_check happy.
> Is there another way for this?

I mean the enum at the bottom of all compatibles.

>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>> +
>>> +    pmc: clock-controller@f0018000 {
>>> +        compatible = "atmel,sama5d4-pmc", "syscon";
>>> +        reg = <0xf0018000 0x120>;
>>> +        interrupts = <1 IRQ_TYPE_LEVEL_HIGH 7>;
>>
>> interrupt looks a bit odd. Are you sure it is correct?
> 
> This example is from SAMA5D4 SoC which uses a vendor specific interrupt
> controller (Atmel AIC) where:
> - 1st cell is the interrupt number
> - 2nd cell is the interrupt type (level/edge sensitive)
> - 3rd cell is the IRQ priority

ok

Best regards,
Krzysztof


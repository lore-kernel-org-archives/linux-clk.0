Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33540C77B7D
	for <linux-clk@archiver.kernel.org>; Wed, 10 May 2023 07:06:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236356AbjEJHGR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 May 2023 03:06:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236354AbjEJHGQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 May 2023 03:06:16 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8532DB
        for <linux-clk@vger.kernel.org>; Wed, 10 May 2023 00:06:14 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9661047f8b8so839934166b.0
        for <linux-clk@vger.kernel.org>; Wed, 10 May 2023 00:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683702373; x=1686294373;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Go8yaKpqgsZlAdvQI/LQWWwqe6KsP5Oli03iE2ooAcU=;
        b=vlzvrRWQ/avkhjSzeR6Hwe19uLhI3iXQ2snEqmaKMwkDupRqkp71nPLM7Vaaha2Mx1
         C/bQf/CKBb7bt36ofm4+mo9BAj424JRJpsIiKOREBuvonNqR6e4wa5tOT/Ey+Ierbf+p
         DdlmVUr4fNqUTOFaW0/e4S4qwc1EMjA4lmjkZO6HvvkDQSGlE6CpuPhbGubrpICMNPEK
         6KKTZsZcISyDiYIAUNchFkXcbpDnGTissj/huEe5hS8m1TyJtmYKcgt51y86j4GzHIKz
         T961xMnBihtk1HFAxmmvzb0ercUEcvKE5BUf5d8g08/NI+1L8g+ArTNyr8SIDttwOMhm
         1niA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683702373; x=1686294373;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Go8yaKpqgsZlAdvQI/LQWWwqe6KsP5Oli03iE2ooAcU=;
        b=UROjq60pvRWn5qtpCsMx5I8/n3jRN+y7qF86sEinDzj6ZMSuEphMsszNDhsz/OcUK2
         YQSJBZ2QF1T/gjU2pPvG4MIda+mu3XNqV1CObfEHJDS8E9N1HsJMPSobkesW+DmIZF/d
         bx88OsDZwU+hqw9qR4f4KFln1fpL3HPY7EvxAAQOvHUUbdlzN6XwBm3z4FWy5UmfYFMO
         U7O+dnclviiR3N9HS2qQksytXGvUrkLmiWsS2d4Yow9OoG7E/yjBW/M9Z4gd02S1RJxU
         XR8IVeprAf6q8z7fewGfFQAmkuTlLRZU0LY22VJcorTScoTEbOCO7CCmuo75j0XwkcwW
         Knkg==
X-Gm-Message-State: AC+VfDwzTa0Qn8Ftg2D9AOHXdCbJDftnaHdHlgz8sUdl2AqwWriAlsH5
        tIkCDpJwto4zQu/5pN7zzY/QtA==
X-Google-Smtp-Source: ACHHUZ7/mWKLyS9qQp7H1XFrxPQaVKT3NEeKOwHbG6K/TxPep062uNjq2+d+TylBYVFroSkWdUUTzg==
X-Received: by 2002:a17:907:1c9d:b0:966:3310:50ae with SMTP id nb29-20020a1709071c9d00b00966331050aemr10908657ejc.47.1683702373235;
        Wed, 10 May 2023 00:06:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d? ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id ig2-20020a1709072e0200b00965f31ff894sm2287926ejc.137.2023.05.10.00.06.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 00:06:12 -0700 (PDT)
Message-ID: <b3c7db03-6614-47d9-a9e0-a8e51c836d86@linaro.org>
Date:   Wed, 10 May 2023 09:06:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/5] dt-bindings: clocks: atmel,at91rm9200-pmc: convert
 to yaml
Content-Language: en-US
To:     Claudiu.Beznea@microchip.com, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, Nicolas.Ferre@microchip.com,
        alexandre.belloni@bootlin.com
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230509052757.539274-1-claudiu.beznea@microchip.com>
 <20230509052757.539274-3-claudiu.beznea@microchip.com>
 <e463eb68-3ea0-5230-76fd-4a2ee66bf397@linaro.org>
 <773d0d90-29c7-b1bd-bd16-898b435eafb6@microchip.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <773d0d90-29c7-b1bd-bd16-898b435eafb6@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/05/2023 09:00, Claudiu.Beznea@microchip.com wrote:
> On 09.05.2023 09:25, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 09/05/2023 07:27, Claudiu Beznea wrote:
>>> Convert Atmel PMC documentation to yaml. Along with it clock names
>>> were adapted according to the current available device trees as
>>> different controller versions accept different clocks (some of them
>>> have 3 clocks as input, some has 2 clocks as inputs and some with 2
>>> input clocks uses different clock names).
>>>
>>
>> Thank you for your patch. There is something to discuss/improve.
>>
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
>>> +          - enum:
>>> +              - atmel,at91sam9g15-pmc
>>> +              - atmel,at91sam9g20-pmc
>>> +              - atmel,at91sam9g25-pmc
>>> +              - atmel,at91sam9g35-pmc
>>> +              - atmel,at91sam9x25-pmc
>>> +              - atmel,at91sam9x35-pmc
>>> +          - enum:
>>> +              - atmel,at91sam9260-pmc
>>> +              - atmel,at91sam9x5-pmc
>>
>> I missed it last time - why you have two enums? We never talked about
>> this. It's usually wrong... are you sure this is real hardware:
>> atmel,at91sam9g20-pmc, atmel,at91sam9260-pmc
>> ?
> 
> I have 2 enums because there are some hardware covered by:
> "vendor-name,hardware-v1-pmc", "syscon" and some covered by:
> "vendor-name,hardware-v2-pmc", "vendor-name,hardware-v1-pmc", "syscon".

The enum does not say this. At all.

So again, answer, do not ignore:
is this valid setup:
atmel,at91sam9g20-pmc, atmel,at91sam9260-pmc
?

> 
> Many AT91 device trees compatibles were written in this way. Thus when new
> versions of the same IP has been introduced the drivers were not
> necessarily updated but the compatibles in device trees were updated e.g.
> with "vendor-name,hardware-v2-pmc" (the full compatible becoming
> "vendor-name,hardware-v2-pmc", "vendor-name,hardware-v1-pmc", "syscon") and
> let the drivers fall back to already in driver supported compatible
> "vendor-name,hardware-v1-pmc", "syscon". In general v2 comes with new
> features in addition to v1.
> 
> That way they AT91 ensures the ABI properties of DT and thus when the
> drivers were finally updated with the new features of the
> "vendor-name,hardware-v2-pmc" DT remained in place.
> 
> Please let me know if these could be handled better in YAML.


enum + const + syscon, like every binding that type does in all
bindings. Don't invent some new syntax.

Best regards,
Krzysztof


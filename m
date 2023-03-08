Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3487C678D5
	for <linux-clk@archiver.kernel.org>; Wed,  8 Mar 2023 18:47:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230181AbjCHSry (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 13:47:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbjCHSrw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 13:47:52 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DEA014EA1
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 10:47:51 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id s11so69618229edy.8
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 10:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678301269;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uA80yWA8eEWLznLMe4EE+8b9j50upIrt67T3ZZaG5tw=;
        b=Mu0/F1thAC8UYbFL1s3V/1W4vLKwYBTCpsJhsYTzmCPnVu9w5LgaEEXyuot/SHwR/j
         awJOH9Yit3V5z4Mcf0h4wUfVJoC9k61Ycw817b2/tZN40mWkiLfhQag4jf4N3AwJZrht
         GMnuEg3svejoCXluiuWgtX//kUEq6tn8cPYIlR+sLlfLLTVC6O4m6FyagJ5FcWO6ftBX
         k8kz76zoltbCEJly7coPkx3qtmyQntQAYd81r597Fwo0006pnpeQ0OS12Z0M4waHEb5r
         wB1PYJHlgKaFeCnaAz4oETFp/HkQd8a2CJJ8HrturcZIwEzN89BW5sIxJb8lfQRisYvJ
         Bpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678301269;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uA80yWA8eEWLznLMe4EE+8b9j50upIrt67T3ZZaG5tw=;
        b=hjMyCMsHKcMA/rz/aEg7Nt+3fWM6XBuUjX0ucgrrxsGdzwmd3ll1fjQPpbp+FdlDbO
         S+56TWjRX7CfA7b3ujjQZG8lBd/0qF+slMqd9GOs0PjsPbaZZlkLzK6P2FhBHioi32Oa
         0RMQRQKmlgEgrXgTKd1JO5X2cmKFr0vbp8xLv3qKvaWPQup1kTjEehcyAOcR+D48B+wl
         tgG50olKdnkOSekOYbL2KJxi0u/Q5pnc0BWqPaMTOf5xBW8wokxLIi42rfXMS8qAKaV0
         g/FMXcoP+kSNDhvdv+LBoE40C4w1P4s97p3TxCA5lMHNuwsa1k2OGu6jgtypmhEzQ6kM
         t1MA==
X-Gm-Message-State: AO0yUKU/sDwrO1f+KYJdjuDE8WC1YsBYOjF/E5n9MYDPsMPTKHfQ2S1R
        XdfsZ4WbeRsNq9Iwxr/f9Sh9pw==
X-Google-Smtp-Source: AK7set+DXq2QThKTdlFMUeySJzw8+Y3cNoFUCjWr17sjbq0QdQ42cbdhr/ceFs8uWvkiZjkQ/X2orw==
X-Received: by 2002:a17:906:4911:b0:8b8:c04f:c5f9 with SMTP id b17-20020a170906491100b008b8c04fc5f9mr20538842ejq.73.1678301269734;
        Wed, 08 Mar 2023 10:47:49 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id lo2-20020a170906fa0200b008e09deb6610sm7774683ejb.200.2023.03.08.10.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 10:47:49 -0800 (PST)
Message-ID: <36e06397-2189-4f1b-99cc-d39e720ebc71@linaro.org>
Date:   Wed, 8 Mar 2023 19:47:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock
 generator bindings
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20230220131307.269100-1-biju.das.jz@bp.renesas.com>
 <20230220131307.269100-2-biju.das.jz@bp.renesas.com>
 <e9e63c87-b491-b4d5-b226-0539ef0de2d0@linaro.org>
 <OS0PR01MB59221C8C937EF20347149E4886B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB59221C8C937EF20347149E4886B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/03/2023 15:39, Biju Das wrote:

>>> +++ b/Documentation/devicetree/bindings/clock/renesas,versaclock3.yaml
>>
>> Filename usually is based on the compatible. Why these two are so different?
> 
> Versa3 clock generator has the following variants.
> 
> 	5P35023, 5L35021, 5L35023 and 5P35021
> 
> RZ/G2L SMARC EVK uses 5P35023. So I used generic one as file name.
> And added compatible for specific one.

And what about other devices? Since you do not add them, just keep
compatible as filename.

>>
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  renesas,settings:
>>> +    description: Optional, complete register map of the device.
>>> +      Optimized settings for the device must be provided in full
>>> +      and are written during initialization.
>>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>>> +    minItems: 37
>>
>> maxItems instead... but I am not sure that we allow register settings in DT
>> in general.
> 
> Agreed. I guess it is allowed [1]
> [1] https://lore.kernel.org/linux-renesas-soc/833d3837892f0879233695636291af97a746e584.1643968653.git.michal.simek@xilinx.com/

I don't see Rob's review on this, so what do you prove exactly?

> 
>>
>>> +
>>> +  assigned-clocks:
>>> +    minItems: 6
>>
>> Drop.
> 
> OK.
> 
>>
>>> +
>>> +  assigned-clock-rates:
>>> +    minItems: 6
>>
>> Drop.
> 
> OK.
> 
>>
>>> +
>>> +  renesas,clock-divider-read-only:
>>> +    description: Flag for setting divider in read only mode.
>>
>> Flag? Then type: boolean.
> 
> Agreed.
>>
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +    minItems: 5
>>
>> This is broken...
> OK you mean maxItems. Based on Boolean type I will update this

I mean, it does not match the description. Maybe I just don't understand
here something, but flag is boolean. Anyway, minItems means you can have
million of items, so was it intended?

>>
>>> +
>>> +  renesas,clock-flags:
>>> +    description: Flags used in common clock frame work for configuring
>>> +      clk outputs. See include/linux/clk-provider.h
>>
>> These are not bindings, so why do you non-bindings constants as bindings?
>> They can change anytime. Choose one:
>> 1. Drop entire property,
>> 2. Make it a proper binding property, so an ABI and explain why this is DT
>> specific. None of clock providers have to do it, so you need here good
>> explanation.
> 
> I will choose 2 and will explain as user should be allowed to
> configure the output clock from clk generator, so that it has flexibility
> for
> 1) changing the rates (propagate rate change up one level)
> 2) fixed always 
> 3) don't gate the ouput clk at all.

User's choice is task for user-space, so not a good explanation for DT.

Best regards,
Krzysztof


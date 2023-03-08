Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CADFC742A7
	for <linux-clk@archiver.kernel.org>; Wed,  8 Mar 2023 19:17:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbjCHTRp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Mar 2023 14:17:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjCHTRn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Mar 2023 14:17:43 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B35CC2213
        for <linux-clk@vger.kernel.org>; Wed,  8 Mar 2023 11:17:35 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id cy23so69808864edb.12
        for <linux-clk@vger.kernel.org>; Wed, 08 Mar 2023 11:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678303054;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+j1A5nq879FGymtJIOLfCFQYA850/WCrr7kXX+qHOEs=;
        b=zeDS16/Gi9QUKLx1C5FpeQuIe+Zo3B/uvTM5nhSrXlAshjY4756tOpSY3Op1nqIaFX
         K0y6bZeOOfg+1PT1us8/Bmt08yrbJ8dLSc/Mln0Rd7AhteySFz9zOQnWY/jxTxPyI0f8
         2BWpEhuYeL6u5ruhFpiAMM97U7hgm8vs4ExjL7U76ewoF4aCKUc6Kw5L/hUNsUbMojG2
         Bqs17OYPJc49E08mcRtYZ8DltLAj79JyxdVdTfmYKDthqrTEVXv4shIsbCCsAilI1pxy
         qcbuc1a8pqrXhRAx/9fVcE+D0XuOwaAf5DLSuPZVKimPAu+ATMOqXtiMFNMpq6f8o86W
         IAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678303054;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+j1A5nq879FGymtJIOLfCFQYA850/WCrr7kXX+qHOEs=;
        b=k51CmFs4Twd2+XNGRfSQOUIuqdHERCed4RLYHnb/XTD029Z9mxxd5Ll6JGV2EPpngr
         a3DS8RNO3kQ5vId72AAinTE8iKpdZoNCH7YRVMWBaqzb26lpFFYwlTBq+sPPkJWQe9ty
         /vy+UA/35lezdZDwtBkG2Bmr3bhBXikTmO5YB3DH3YYek/MI9jgyVuDD4JfTQH+HCMN/
         7aUwH1m0K1Pn345QVh9bteDH6fJfcLF5GIsrjVgkxUYS5l1XN9UmwjW4HqzZ8UNgZOSI
         jWyhXS4GfClYjygvgG8voH4BdOmwfrxyZ3f2UzPoPVY5fi0QbDQKE65iUibLHGuRgiVy
         7Q6A==
X-Gm-Message-State: AO0yUKVTgWPScdcbsM3E9nc6/7gIe8+PiZf3f5jnD2xkbpgjk10mfENQ
        zp6OXo8HY1RfC6uXdgJL3bR2MQ==
X-Google-Smtp-Source: AK7set8nDlQWKilmK4zWDKyoqGuc9I13CYUVWS+rcxPqNRc2eW1ffTN01i4z+nPFgRiRZJlTA9wwXw==
X-Received: by 2002:aa7:d782:0:b0:4ad:8fc5:3d2a with SMTP id s2-20020aa7d782000000b004ad8fc53d2amr16722112edq.11.1678303053834;
        Wed, 08 Mar 2023 11:17:33 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id d27-20020a50f69b000000b004acb696a0f6sm8592200edn.91.2023.03.08.11.17.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 11:17:33 -0800 (PST)
Message-ID: <6cbe6c71-2d2d-0f79-1270-7f8ed2ddc1d6@linaro.org>
Date:   Wed, 8 Mar 2023 20:17:32 +0100
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
 <36e06397-2189-4f1b-99cc-d39e720ebc71@linaro.org>
 <OS0PR01MB5922BDA0632ACCCC0100EEBD86B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <OS0PR01MB5922BDA0632ACCCC0100EEBD86B49@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/03/2023 19:55, Biju Das wrote:
> 
> Renesas 8T49N241 has 4 outputs, 1 integral and 3 fractional dividers.
> The 8T49N241 accepts up to two differential or single-ended input clocks
> and a fundamental-mode crystal input. The internal PLL can lock to either
> of the input reference clocks or to the crystal to behave as a frequency
> synthesizer.
> 
> Signed-off-by: Alex Helms <alexander.helms.jy@renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Ah, indeed, fine then.

>>
>>>>
>>>>> +
>>>>> +  renesas,clock-flags:
>>>>> +    description: Flags used in common clock frame work for configuring
>>>>> +      clk outputs. See include/linux/clk-provider.h
>>>>
>>>> These are not bindings, so why do you non-bindings constants as bindings?
>>>> They can change anytime. Choose one:
>>>> 1. Drop entire property,
>>>> 2. Make it a proper binding property, so an ABI and explain why this
>>>> is DT specific. None of clock providers have to do it, so you need
>>>> here good explanation.
>>>
>>> I will choose 2 and will explain as user should be allowed to
>>> configure the output clock from clk generator, so that it has
>>> flexibility for
>>> 1) changing the rates (propagate rate change up one level)
>>> 2) fixed always
>>> 3) don't gate the ouput clk at all.
>>
>> User's choice is task for user-space, so not a good explanation for DT.
> 
> I don't think clock generator HW has any business with user space.
> 
> It is clk generator HW specific. Clk generator is vital component which
> provides clocks to the system. 

Every clock controller is vital...

> We are providing some hardware feature which
> is exposed as dt properties.
> 
> Like clock output is fixed rate clock or dynamic rate clock/

OK, I wait then for proper description which will explain and justify this.


Best regards,
Krzysztof


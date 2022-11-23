Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDFEC433FE
	for <linux-clk@archiver.kernel.org>; Wed, 23 Nov 2022 13:26:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237243AbiKWN0q (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Nov 2022 08:26:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237411AbiKWNZA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Nov 2022 08:25:00 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C5A5BEB5F
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2022 05:05:30 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id z24so21319383ljn.4
        for <linux-clk@vger.kernel.org>; Wed, 23 Nov 2022 05:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M6G1EumI7FZLI8e5i3/vnjgK7flMtfRUkVTQawLF8ZY=;
        b=vnjhnZcYZOSnL800CVahuhYmBNc7/C4VM+zLXePAG9oZ557PbOQaCNT/qd9DM5rd0X
         7jQFCm/KOFIiQSdRAOA8Hs2Sq5AEmg7uK4Xf0KfNwxTAAMkZ12EGDNfo/MOrNSVV7ZgA
         Pv7aNS7LXiNVZ/+EwFVmMWxHICksLY9CFyrlC1vTxs1AetYHpjQtWvTTnVXAfeKnRXfW
         kWH7Ns2l/A6+bQcb3k9ZVUvrupxwLJMxwN16xa6LR4aDMsizEcT0Mk8FvXPu8wd5SVKD
         wvzJUmmqFGQHA3L8Oo0QFzuHel/LnawDOozqRGTBQLtPV5XuzzXcR8DsGGj3gE7xvWIv
         T0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M6G1EumI7FZLI8e5i3/vnjgK7flMtfRUkVTQawLF8ZY=;
        b=GNGnd86r5UjVZn6EHN3jwVeqk6sTWqX0pLTmBd3THhEJ5wVZTCbHeFE9YvveJYEubg
         wikkNQdKpRMVSVg/Sy3Y0+K/3PTRXKqA4iLfPz1ujcLRBVyAusciB9kq7advPgmKMfct
         i5rtaIXKPCFHCb0QGbaTgAzLyi25VRJFH3hYR0NV3Z8KjLLqIT+UhgFcdA+nU72TO7U3
         sSf3Z3Oevhjts2Dne3h+6rP2JFCXvZEDPSY13YK99DCtx/9AgfDwEFWaNtcCeyp3n4yU
         sJq1CCQKVfmWvjtE0F+HaO6cMgGXhu3Nsqqcq6tiDeMyB38jRDWemMnGSaf16vjfERXH
         V4Lg==
X-Gm-Message-State: ANoB5pnGtxyGqt16uU3M2WRZaAse21Dw2Y/3UBL9bVew4LmeSraVS9e+
        zEuarK137EV/fPci+s70bB76XQ==
X-Google-Smtp-Source: AA0mqf6n/fSR8MwVcDjqufCotAGGQFmimX9GhxJ8X6nI8RJNkuZVynASdsA/m+MunzeilINIsiuhJw==
X-Received: by 2002:a05:651c:2123:b0:277:328:affb with SMTP id a35-20020a05651c212300b002770328affbmr4326766ljq.376.1669208728764;
        Wed, 23 Nov 2022 05:05:28 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id y25-20020a2e7d19000000b0026dd4be2290sm2181049ljc.90.2022.11.23.05.05.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Nov 2022 05:05:28 -0800 (PST)
Message-ID: <06fa6b50-bd69-c118-4c82-89d153fe049e@linaro.org>
Date:   Wed, 23 Nov 2022 14:05:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH V5 1/4] clk: meson: S4: add support for Amlogic S4 SoC PLL
 clock driver and bindings
Content-Language: en-US
To:     Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     kelvin.zhang@amlogic.com
References: <20221123021346.18136-1-yu.tu@amlogic.com>
 <20221123021346.18136-2-yu.tu@amlogic.com>
 <f03f331a-5666-298e-a1a2-bdb9bab11a48@linaro.org>
 <92b570ea-3ddc-8e91-5a7a-ed601bb7c02c@amlogic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <92b570ea-3ddc-8e91-5a7a-ed601bb7c02c@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/11/2022 12:16, Yu Tu wrote:
> Hi Krzysztof,
> 	Thank you for your reply.
> 
> On 2022/11/23 18:08, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On 23/11/2022 03:13, Yu Tu wrote:
>>> Add the S4 PLL clock controller found and bindings in the s4 SoC family.
>>>
>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>> ---
>>>   .../bindings/clock/amlogic,s4-pll-clkc.yaml   |  51 +
>>
>> This is v5 and still bindings are here? Bindings are always separate
>> patches. Use subject prefixes matching the subsystem (git log --oneline
>> -- ...).
>>
>> And this was split, wasn't it? What happened here?!?
> 
> Put bindings and clock driver patch together from Jerome. Maybe you can 
> read this chat history.
> https://lore.kernel.or/all/1jy1v6z14n.fsf@starbuckisacylon.baylibre.com/

Link does not explain me anything. It mentions series, which is totally
different than mixing it one patch!

Anyway you should have warnings from checkpatch.

Bindings are always separate patches.

(...)

>>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: amlogic,s4-pll-clkc
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: xtal
>>> +
>>> +  "#clock-cells":
>>> +    const: 1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - clocks
>>> +  - clock-names
>>> +  - "#clock-cells"
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    clkc_pll: clock-controller@fe008000 {
>>> +      compatible = "amlogic,s4-pll-clkc";
>>> +      reg = <0xfe008000 0x1e8>;
>>> +      clocks = <&xtal>;
>>> +      clock-names = "xtal";
>>> +      #clock-cells = <1>;
>>> +    };
>>
>>
>>> +#endif /* __MESON_S4_PLL_H__ */
>>> diff --git a/include/dt-bindings/clock/amlogic,s4-pll-clkc.h b/include/dt-bindings/clock/amlogic,s4-pll-clkc.h
>>> new file mode 100644
>>> index 000000000000..345f87023886
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clock/amlogic,s4-pll-clkc.h
>>
>> This belongs to bindings patch, not driver.
>>
>>> @@ -0,0 +1,30 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
>>> +/*
>>> + * Copyright (c) 2021 Amlogic, Inc. All rights reserved.
>>> + * Author: Yu Tu <yu.tu@amlogic.com>
>>> + */
>>> +
>>> +#ifndef _DT_BINDINGS_CLOCK_AMLOGIC_S4_PLL_CLKC_H
>>> +#define _DT_BINDINGS_CLOCK_AMLOGIC_S4_PLL_CLKC_H
>>> +
>>> +/*
>>> + * CLKID index values
>>> + */
>>> +
>>> +#define CLKID_FIXED_PLL			1
>>> +#define CLKID_FCLK_DIV2			3
>>
>> Indexes start from 0 and are incremented by 1. Not by 2.
>>
>> NAK.
> 
> I remember Jerome discussing this with you.You can look at this 
> submission history.
> https://lore.kernel.org/all/c088e01c-0714-82be-8347-6140daf56640@linaro.org/

You pointed to my arguments, so what is this proving? That you ignored
feedback? Or was there some other mail?

Best regards,
Krzysztof


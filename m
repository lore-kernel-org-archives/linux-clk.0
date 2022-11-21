Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC626C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 21 Nov 2022 13:24:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229558AbiKUNYK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Nov 2022 08:24:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbiKUNYJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 08:24:09 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09BAA2A969
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 05:24:08 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id g12so19806960wrs.10
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 05:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4LJ8G4Vlx63n7xBM1es556I3FKQ+mU4sDRzPoRdCeX0=;
        b=kd74NXQh18wXsJRyAWwjOEZo6k21PuwDdsL4ZmNCSg8eLPjALRuiX3ZSZ5RiPInHwR
         ObrJ3F6rZaax9BBwPZ/cvOeJc/ZhxFdPBuWApa+uEQBY4ySZcH21fNOOgG9TV+srlhDK
         sJY+fpmEVh/moUjqN9GhrBjkFat4UZ8IPCrZJcTuBV4VqYDooAI7toY9pkzEJnVlkZWj
         qUmdWlYDENIMiVkRQwvaCWjmxPhzMpVE2mkYaJ/24jawnIMbzkaIv0uj21BSneaHWECg
         gpmHNhIRtXHe3dnyAW2YWKDFkDqeOKdHhwnrRqZAbHOXP2OpS8mCCYsDgrBvNp1LaXvE
         p7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4LJ8G4Vlx63n7xBM1es556I3FKQ+mU4sDRzPoRdCeX0=;
        b=ZsbE6rwh+z9pmY1L51nsMks8b7qb+6GugAQgr3rqu7f2BsBqKkU1FYCiPVuJKKh5F1
         LqRTnuEdMabL/esYYZhZ/BgL5jotkpapXfq5GShwCCwf0goShyVPkkq7LCrN3/JRyXPo
         3uSvjqaZjz7t0IyPoe663HDoaZ2Bdb6FnFpTRt8/0jUnF84uawD0P91mRtpm75eTnXm6
         uhQet9WOZ7aWRKPWIwqr7tPVOHx2uaGfzn9/XYNaWRAVufiDxrfwNdZucStnwRt74Q8F
         PCTRd1kOmJHdMo8dIAHsnZFE8Si2KRWJfSI7ZLb49IWGy6jCejy0atRGZw4vu+cUQFur
         Bz+g==
X-Gm-Message-State: ANoB5pnZ8/VTvyyXOTmJMMbXMdQ5fbrQaa0upALe/GFQMX1E3eUcYrjp
        gMe50fsgsp282jHRH1OD8uTAuQ==
X-Google-Smtp-Source: AA0mqf751Fr4N3/875Urx0i7J1CeHvrpttXLjJgI9qnKrrIfoaIeZRF5J+hyjNgMQMilcVeGAzzvMw==
X-Received: by 2002:adf:e98b:0:b0:241:dbf1:dad with SMTP id h11-20020adfe98b000000b00241dbf10dadmr363012wrm.130.1669037046505;
        Mon, 21 Nov 2022 05:24:06 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f19-20020a05600c155300b003c6f3e5ba42sm20242257wmg.46.2022.11.21.05.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 05:24:05 -0800 (PST)
Message-ID: <7815f518-c764-a3d8-cde6-89c1f17c2329@linaro.org>
Date:   Mon, 21 Nov 2022 14:24:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 10/14] dt-bindings: clock: Add StarFive JH7110
 always-on clock and reset generator
Content-Language: en-US
To:     Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc:     Hal Feng <hal.feng@starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-kernel@vger.kernel.org
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-11-hal.feng@starfivetech.com>
 <8153973d-e8ad-e47a-3808-bbcdbfd169a5@linaro.org>
 <CAJM55Z9ouj=jD2Otx3fK4W1wgnPjecUgFuKksw5CmU6SraM_Nw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAJM55Z9ouj=jD2Otx3fK4W1wgnPjecUgFuKksw5CmU6SraM_Nw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/11/2022 12:38, Emil Renner Berthing wrote:
> On Mon, 21 Nov 2022 at 09:49, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 18/11/2022 02:06, Hal Feng wrote:
>>> From: Emil Renner Berthing <kernel@esmil.dk>
>>>
>>> Add bindings for the always-on clock and reset generator (AONCRG) on the
>>> JH7110 RISC-V SoC by StarFive Ltd.
>>>
>>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>>> ---
>>>  .../clock/starfive,jh7110-aoncrg.yaml         | 76 +++++++++++++++++++
>>>  1 file changed, 76 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
>>> new file mode 100644
>>> index 000000000000..afbb205e294f
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
>>> @@ -0,0 +1,76 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-aoncrg.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: StarFive JH7110 Always-On Clock and Reset Generator
>>> +
>>> +maintainers:
>>> +  - Emil Renner Berthing <kernel@esmil.dk>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: starfive,jh7110-aoncrg
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: Main Oscillator
>>> +      - description: RTC clock
>>
>> Real Time Clock clock? :) I don't think the input to clock controller is
>> the output of RTC...
> 
> The description is bad, but even the documentation calls it "clk_rtc"
> even though it's really an optional input from a 32k oscillator.

Then description should match reality, not documentation. Documentation
is often poor, so if possible better to extend it.

Best regards,
Krzysztof


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D20C0C352A1
	for <linux-clk@archiver.kernel.org>; Wed, 30 Nov 2022 15:19:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbiK3PTM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Nov 2022 10:19:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbiK3PTL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Nov 2022 10:19:11 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9ED27BF97
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 07:19:09 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id p8so27455260lfu.11
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 07:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NAnnNP3FJD8yHHEakUZDxebfp+jA14IglPNt9dTJ29Q=;
        b=EMlF8HMgqsdjrvzll7BrBDBmJmGihxjYLZCUiG/vbjBXUv6VDRSeCtSKRUpghAKck9
         e1qMnktaJ3RXB6PR/wskp8mO+CYurPrQ9AGb0sKTvmUj7bMvrSGVp24qhjYONMPnEmW6
         tb6m5LSsZBQzNQhVjpkI7rZDqyWTKO67l+o4ivPDI5iA1RNxvl2LI9kTZdi8TD+lf4Xb
         wMHG4MRFhQUP03Ws1uTQ12n5i6VXJuO/h9as3BKWVhC2IHpXvvfXhp7BnHuAqiSBR4hq
         R0FNpsKKgDpQ4YWMw9wI9qKrMj5KJhgBzO3pJ298tWVpbNKQAixfEnjkKrMSKuTmVoQX
         RqTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NAnnNP3FJD8yHHEakUZDxebfp+jA14IglPNt9dTJ29Q=;
        b=Z5Pyj8nkHCsTBwfsW2/r2YMvfTcN/V9nvQs52vR3lvHCvcOM6cJrW9Vm5Ypx0je9Na
         BeO2P0Ndpm4q+JWS68pgHPiZwxVrCz68Ztz2qzXp2OA1tFA7gosWrWOGlOg5rZfwl2Lp
         ABodOQYAnCcan81XpO5jaSDkGAMQonTmxVatFUDCLU2qL6TgCrv8iEEnIdbLycGYyrES
         QiBrDNLQVhaDruvfvKVPnqrmyejgzBAVSJW+OVa7Llccjh5sJFiixOekZe/5rAdBTBWI
         c8psKzavLmNMFehGZUIZifPg6+dbwzB2csDgVhgRNSP7Hr/r7Lx6Wjy/OmAs0nbEMcA+
         hiWQ==
X-Gm-Message-State: ANoB5plyJELtPhf1pna2I15pxm+W4PYbFi2AYKREk+kJViKamck9BUKD
        4p+/dMJzjzJEd3pONKsOri/5SQ==
X-Google-Smtp-Source: AA0mqf4mhWj9u/l0qavenny180wF5efk0eMx9EmZ4SdnUEoccoCC6OpQuOTQIvcaaTDGlXTeCgGtcw==
X-Received: by 2002:a05:6512:3b06:b0:4aa:8cd:5495 with SMTP id f6-20020a0565123b0600b004aa08cd5495mr14587966lfv.254.1669821548231;
        Wed, 30 Nov 2022 07:19:08 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s21-20020a056512203500b004ab98cd5644sm289679lfs.182.2022.11.30.07.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 07:19:07 -0800 (PST)
Message-ID: <9183bac6-121e-0027-a88b-d77d5c9a077e@linaro.org>
Date:   Wed, 30 Nov 2022 16:19:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 09/14] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Content-Language: en-US
To:     Hal Feng <hal.feng@starfivetech.com>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        linux-kernel@vger.kernel.org
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-10-hal.feng@starfivetech.com>
 <1d62f95f-0edc-afd4-abb4-37fadc0b6a47@linaro.org>
 <72b3d10e-5a8e-ed42-6808-f53773913422@starfivetech.com>
 <768c2add-4c1f-0b36-5709-dbcdd560f504@starfivetech.com>
 <1fb1474b-ec13-e83a-973e-bd9e9a86cb44@linaro.org>
 <98d1bac7-8af5-f481-59b2-d58ca4c228ee@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <98d1bac7-8af5-f481-59b2-d58ca4c228ee@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/11/2022 16:12, Hal Feng wrote:
> On Wed, 30 Nov 2022 12:48:30 +0100, Krzysztof Kozlowski wrote:
>> On 30/11/2022 10:47, Hal Feng wrote:
>>> On Fri, 25 Nov 2022 14:41:12 +0800, Hal Feng wrote:
>>>> On Mon, 21 Nov 2022 09:47:08 +0100, Krzysztof Kozlowski wrote:
>>>>> On 18/11/2022 02:06, Hal Feng wrote:
>>>>>> From: Emil Renner Berthing <kernel@esmil.dk>
>>>>>>
>>>>>> Add bindings for the system clock and reset generator (SYSCRG) on the
>>>>>> JH7110 RISC-V SoC by StarFive Ltd.
>>>>>>
>>>>>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>>>>>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>>>>>
>>>>> Binding headers are coming with the file bringing bindings for the
>>>>> device, so you need to squash patches.
>>>>
>>>> As we discussed in patch 7, could I merge patch 7, 8, 9, 10 and add the
>>>> following files in one commit?
>>>>
>>>> include/dt-bindings/clock/starfive,jh7110-crg.h
>>>> include/dt-bindings/reset/starfive,jh7110-crg.h
>>>> Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>>>> Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
>>>
>>> Hi, Krzysztof,
>>>
>>> Could you please give me some suggestions?
>>
>> You can keep aon and sys split. First add one of them with their own
>> headers. Then add second with their own defines.
> 
> You mean split patch 7 and patch 8 into sys part and aon part
> respectively? There are totally five regions (sys/aon/stg/isp/vout)
> for clocks and resets in JH7110. If we do that, there will be 5
> headers for JH7110 in either clock or reset directory finally. Is
> that OK if there are too many headers for just one SoC?


Sorry, I lost the track of what patches you have. The comment was -
bindings include both the doc and headers. You want to split some, some
merge, sorry, no clue. I did not propose splitting headers...

Best regards,
Krzysztof


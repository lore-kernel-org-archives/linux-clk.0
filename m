Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B65DC6FD19
	for <linux-clk@archiver.kernel.org>; Mon, 13 Mar 2023 07:51:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbjCMHvd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Mar 2023 03:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjCMHva (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Mar 2023 03:51:30 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8322128D1D
        for <linux-clk@vger.kernel.org>; Mon, 13 Mar 2023 00:51:23 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id y4so15423541edo.2
        for <linux-clk@vger.kernel.org>; Mon, 13 Mar 2023 00:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678693882;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ApcfsHN2wN7CiLQkpY6hRDWMeHf0lIJaK00DDrg5fNU=;
        b=kQPrGnxYvasHxYFYfGSGho1RYetKH4JyMKJ3ud5unTPePmdSRjZrRVQ2DDQprphbqa
         +r/m8bdt6bmvlyJDpEICv8tnMoRqoVjoSPb/VHJY+mR5PHDx5Ktfzcfsg4LRlK4ofQpO
         UlW+5VSH/eaEjDfdof4PmhhiDf5LsxDX3AyoauL/4xCkhXbCaNoBmLO0bsH48989iZdI
         10/GL6vzIfjDJvEgL9zKJnluIlENU3y5J8koECXzLnt00hCMy2OgIxN7WhgXAgqhfPg7
         gsivioYUOX8yzoZkH3CxeTHLIp4SkWd0F2piLS9zeaUFVH0oKf4PWk3e0Xz445cQOeNU
         I4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678693882;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ApcfsHN2wN7CiLQkpY6hRDWMeHf0lIJaK00DDrg5fNU=;
        b=Qo38a5N4buY033g0NNg35GGpplOEM++1zm7rQzr5N7sw2l5wep8F7Pz9Oq79sQVmKP
         sm2txr/DzKUdIi0gUvqTee8oYbCNY0DFcc2+FeUA9hF0bhEmtgluNq7CV59N7CGm3g72
         y7VVsdeSKeESRuYxjJl2b5dSVmAGSmjCUUMkkyMLqYOiZQEa4BbLp+pIXcN/Rx084Sh4
         KaPT/p1nDbznQqb7ucp0eLz5JEb1w9eAXtQDXpd420OEYyuZdeFdg3A9Lk5+tO6bxok2
         FA5L8ydI43t4mZFc2QEMtrKgPSQwONJ/3NVawRqyt5XXh2/MkY6bTyGOFsPgQdTmVvkt
         ++Jg==
X-Gm-Message-State: AO0yUKWm1KD9URGWO86qEdrt/3NdPC3mz3TcFvqD373vWT+guZdZ7umw
        V+hpAomk4efG6LN9s6dMx4cmrw==
X-Google-Smtp-Source: AK7set/Wdx3mz3K2b03zcdbLEh+zTAXkriPquRH3CNjv2VE6Bjjx7PkESjwthAp40ot+7EmKIeFxmg==
X-Received: by 2002:aa7:c54b:0:b0:4ac:b760:f07a with SMTP id s11-20020aa7c54b000000b004acb760f07amr33049256edr.19.1678693881955;
        Mon, 13 Mar 2023 00:51:21 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f052:f15:3f90:fcb3? ([2a02:810d:15c0:828:f052:f15:3f90:fcb3])
        by smtp.gmail.com with ESMTPSA id l22-20020a50d6d6000000b004fa19f5ba99sm2652296edj.79.2023.03.13.00.51.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 00:51:21 -0700 (PDT)
Message-ID: <834fb899-7a03-ba0a-8302-f64ea58c60dd@linaro.org>
Date:   Mon, 13 Mar 2023 08:51:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 11/21] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Content-Language: en-US
To:     Hal Feng <hal.feng@starfivetech.com>, Rob Herring <robh@kernel.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Ben Dooks <ben.dooks@sifive.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Palmer Dabbelt <palmer@dabbelt.com>
References: <20230311090733.56918-1-hal.feng@starfivetech.com>
 <20230311090733.56918-12-hal.feng@starfivetech.com>
 <167854282659.42837.5915012938593380363.robh@kernel.org>
 <80549148-1bad-9190-c4ea-a9555d15ca38@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <80549148-1bad-9190-c4ea-a9555d15ca38@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/03/2023 03:47, Hal Feng wrote:
> On Sat, 11 Mar 2023 08:17:00 -0600, Rob Herring wrote:
>> On Sat, 11 Mar 2023 17:07:23 +0800, Hal Feng wrote:
>>> From: Emil Renner Berthing <kernel@esmil.dk>
>>>
>>> Add bindings for the system clock and reset generator (SYSCRG) on the
>>> JH7110 RISC-V SoC by StarFive Ltd.
>>>
>>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>>> ---
>>>  .../clock/starfive,jh7110-syscrg.yaml         | 104 +++++++++
>>>  MAINTAINERS                                   |   8 +-
>>>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 203 ++++++++++++++++++
>>>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 142 ++++++++++++
>>>  4 files changed, 454 insertions(+), 3 deletions(-)
>>>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>>>  create mode 100644 include/dt-bindings/clock/starfive,jh7110-crg.h
>>>  create mode 100644 include/dt-bindings/reset/starfive,jh7110-crg.h
>>>
>>
>>
>> Please add Acked-by/Reviewed-by tags when posting new versions. However,
>> there's no need to repost patches *only* to add the tags. The upstream
>> maintainer will do that for acks received on the version they apply.
>>
>> If a tag was not added on purpose, please state why and what changed.
>>
>> Missing tags:
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
> 
> This patch has been changed a lot and I am not sure whether it's still
> the one you want. So I removed the Reviewed-by tag.

Then mention it in changelog, just like Rob asked:
"If a tag was not added on purpose, please state why and what changed."
I don't see any explanation in the changelog about it.

Best regards,
Krzysztof


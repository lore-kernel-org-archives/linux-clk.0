Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC41CC4320A
	for <linux-clk@archiver.kernel.org>; Thu,  5 Aug 2021 07:35:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EF32610A8
	for <linux-clk@archiver.kernel.org>; Thu,  5 Aug 2021 07:35:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237114AbhHEHgH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Aug 2021 03:36:07 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:43922
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237539AbhHEHfc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Aug 2021 03:35:32 -0400
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id D1DAA3F346
        for <linux-clk@vger.kernel.org>; Thu,  5 Aug 2021 07:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628148916;
        bh=kMB7D3FwR8aaeZ7GkcRhY+XNtv5mwLtm+gleHTDDxFM=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=YUqNGwxB2sfRpPGfjMGIm7ach6FFhCxsNEGQhIlnnHPHn+3CqL9DweUJXz1g/laNF
         ui2NDPRGizw07iH/hmOSs71wuLDKgcoEcFHjRynTqfxHn5kXFx6IMGJO5UOD4fmPFC
         iJ2RBo2yUZ8gp7NXdJb5d+VRJ8UGsVdHExTHkKkKxTVLCT3QSt7i60tM+uEp4VtNpb
         MSILd90gO/lzhJ4++E5e0MxM9Y+SD0qSO+E5aFVs/F1CitM4rtJab4c3ltoWqw17F5
         QdR6FXxZiEZvSGyseozINC4Ldjc+Xe2iIX8Sl8f5e5YP7bJMGhjrMdOmTBLaPN/iN9
         dz1+qmgv/QUMA==
Received: by mail-ej1-f70.google.com with SMTP id gg35-20020a17090689a3b0290580ff45a075so1706637ejc.20
        for <linux-clk@vger.kernel.org>; Thu, 05 Aug 2021 00:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kMB7D3FwR8aaeZ7GkcRhY+XNtv5mwLtm+gleHTDDxFM=;
        b=ZxyqOBH5DzdmSJKTlqjwnn3xTiqqnOdZ2cVtV7K2qPimQwpz/SkrxcJUSQ20lCxlNK
         76FUR8aY7e1vCA8ZEz54t0pYqvNBmrAYT1ZgdsGTe4ZDx/iah6LtVg8wSXRqvE4CEnar
         /zIUw97td6T4CpOsiijRkN1lRUBPcMZ3PUBee1TTlKxIX9WgQ/bKgUx+GZPbga0Yy/WF
         XRmvkRa6Sw/LtjhM/SKl5sO8kb5LkZpDq0WIRDwmmBqR8NdwnYWk92GQJ6a90gXUfYQo
         RxiW1KCEsbZBwIcivA8F8/U4n1kCJM9Ikro4TpjI+rjFyXubRMwMbrThOerarC0xKmIm
         k+dA==
X-Gm-Message-State: AOAM532AlVtLQbq/hiyiY3DuHm/exNLOkROsRC7K85njof247YHxY9W1
        xHqZyK9qBAGkrFAaNrCxcgiIzFCJuj2O+PvtT+ik0595N3rJsS9dxx+nh9NIFBWMGOKX4kCZD3Q
        4uEU8gGfzc9SVtRngpfkgfadgrfhXBoVASuyh4g==
X-Received: by 2002:a17:906:a0a:: with SMTP id w10mr3499006ejf.416.1628148915207;
        Thu, 05 Aug 2021 00:35:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPcQUWoeFo8Oc3RFUk7sBrXe1NGu+OxbWafCL6RAdlu//8RMlDAyb13M9QoYaDGHWGqoadKg==
X-Received: by 2002:a17:906:a0a:: with SMTP id w10mr3499000ejf.416.1628148915094;
        Thu, 05 Aug 2021 00:35:15 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id r16sm1886421edt.15.2021.08.05.00.35.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 00:35:14 -0700 (PDT)
Subject: Re: [PATCH 12/12] arm64: dts: exynos: Add Exynos850 SoC support
To:     Marc Zyngier <maz@kernel.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-13-semen.protsenko@linaro.org>
 <15871f8ced3c757fad1ab3b6e62c4e64@misterjones.org>
 <CAPLW+4=v4bDcuxGVqs06mobGj34At4cD+vg48b4dPujarS07Tg@mail.gmail.com>
 <bf21badb-804f-45f0-c02b-80ff57ab9931@canonical.com>
 <CAPLW+4nY=hozOR+B_0sPZODrk9PXaXg+NB-9pVhDbAjEy7yjhg@mail.gmail.com>
 <e264f96e-a230-456b-08a5-dbe3a31bdb43@canonical.com>
 <87zgtwbb6x.wl-maz@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <f9b233bb-628f-1a0f-468c-8a6c7d2b23a4@canonical.com>
Date:   Thu, 5 Aug 2021 09:35:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87zgtwbb6x.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/08/2021 09:30, Marc Zyngier wrote:
> On Thu, 05 Aug 2021 08:17:14 +0100,
> Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 04/08/2021 23:30, Sam Protsenko wrote:
>>>>>
>>>>> Nice catch! Actually there is an error (typo?) in SoC's TRM, saying
>>>>> that Virtual Interface Control Register starts at 0x3000 offset (from
>>>>> 0x12a00000), where it obviously should be 0x4000, that's probably
>>>>> where this dts error originates from. Btw, I'm also seeing the same
>>>>> error in exynos7.dtsi.
>>>>
>>>> What's the error exactly? The "Virtual interface control register"
>>>> offset (3rd region) is set properly to 0x4000 on Exynos7. Also one for
>>>> the Exynos5433 looks correct.
>>>>
>>>
>>> The issue is that 2nd region's size is 0x1000, but it must be 0x2000.
>>> It's defined by GIC-400 architecture, as I understand. Please look at
>>> [1], table 3-1 has very specific offsets and sizes for each functional
>>> block, and each particular SoC must adhere to that spec. So having
>>> 0x1000 for 2nd region can't be correct. And because exynos7.dtsi has
>>> GIC-400 as well, and 0x1000 is specified there for 2nd region size
>>> too, so I presume there is the same mistake there.
>>
>> I understand, the range length has indeed same mistake. However it does
>> not matter that much There are no registers pass 0x10C (so pass 0x1000).
>> This address space is not used.
> 
> I have no idea which spec you are looking at, but the GICv2
> architecture (of which GIC400 is an implementation) definitely has a
> register in the second 4kB page of the CPU interface. It contains the
> GICC_DIR register, which is used to deactivate an interrupt when
> EOIMode==1.
> 
> Linux actively uses it when started at EL2.

I was checking Exynos TRM and it seems it has one more bug... The ARM
datasheet [1] indeed mentions GICC_DIR at 0x1000. I'll add "Fixes" tag
to my fix for Exynos7.

https://developer.arm.com/documentation/ddi0471/b/programmers-model/cpu-interface-register-summary



Best regards,
Krzysztof

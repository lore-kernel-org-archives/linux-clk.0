Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85118C4332F
	for <linux-clk@archiver.kernel.org>; Tue, 22 Nov 2022 07:41:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232448AbiKVHlj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Nov 2022 02:41:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232449AbiKVHlb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Nov 2022 02:41:31 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B43230556
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 23:41:30 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id j4so22392746lfk.0
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 23:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vZgEuShZPFvGmlrbVu6jnnJSD8pbk7ahYnQJQ5wn0pk=;
        b=Mk8EUJ3Sx3oXYHl0xM9T+/JmMikNxAA2Jrijsah9gHwhOsarE7+/7rCOMgRVdAi7he
         gaBKk2R37J1zzOGVATS8wpJjoOveMvsWH54RGMYWhoN2mFEyUG9pEy/E/HzTVTiMoY05
         vPYpwi0km37F0pHzCWXY8b9paAgeF87jdox71Tildp7I8n1GDimBZ6+Plo0ymvElmMTZ
         41zSo/Gxf44sC1e41wOXEVJchH/l7efH/9D5Fu3bwhbGkcNaDtwjTENM0u/iKV8XCDZA
         pC4osLGbF0ZX1vfmVE+/163BmTggGjlGrnLQneRP5jYptizwJgIjFy8wPtl9fv5UsuYS
         clig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vZgEuShZPFvGmlrbVu6jnnJSD8pbk7ahYnQJQ5wn0pk=;
        b=BZKe+E2oPQAJ+9vxb2gYX49uu9NTxhYSlFYZADctSZntat8DKSRlficlS3PmM57d59
         Lbe7Y6BwqGcLKgFtSwv5QowEEiWIpVM+2ig5tlOSgjiXYlJWSJNHbER32AhLYjlffa5g
         z+tmCuuXwI7S86D96QL0Cnsy0Whu6DRV9kZ+8Lx/nREhOoDzDQx62/3DCcLEdJQDp4TI
         BvncFj22Ckyns237AlLhzHE45uij+SdrIzNe1C2iot+iAZnIvJStoGgRklE4G9mI8xny
         hFiCTbY3bdyPVeOb9U3StHzPvXdWrnoIRW8arKCo9De+BZk3F2il724mcRfM8j8AK+uW
         BK6Q==
X-Gm-Message-State: ANoB5pnYMJdg4iYRR6l1tpFrhOBYQ1Vw8GFxEH9vmxJ0mfaTroQkCy5U
        YSe9+AY0fta0FVJTJaQo6UkJkw==
X-Google-Smtp-Source: AA0mqf7TStaiGDTFZUcD6Pjywwt89ly9JYpeR/JJ6ptzRJUT6v6QpzUVC8GK8nCrwcmjKs0mJw01tw==
X-Received: by 2002:a19:4f52:0:b0:4a6:2ff5:ddd2 with SMTP id a18-20020a194f52000000b004a62ff5ddd2mr8167514lfk.166.1669102888604;
        Mon, 21 Nov 2022 23:41:28 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id y22-20020a2eb016000000b0026daf4fc0f7sm1758305ljk.92.2022.11.21.23.41.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 23:41:27 -0800 (PST)
Message-ID: <f59e53b0-0915-e8e9-7e49-05ca6a9eac95@linaro.org>
Date:   Tue, 22 Nov 2022 08:41:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 07/14] dt-bindings: clock: Add StarFive JH7110 system
 and always-on clock definitions
Content-Language: en-US
To:     Hal Feng <hal.feng@starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        linux-kernel@vger.kernel.org
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-8-hal.feng@starfivetech.com>
 <4d1fbddc-ee8b-1ab3-d1a9-8496bda3f668@linaro.org>
 <1db979d5-1fb6-f3c9-8ce0-e3e2e23e5d14@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1db979d5-1fb6-f3c9-8ce0-e3e2e23e5d14@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/11/2022 02:02, Hal Feng wrote:
> On Mon, 21 Nov 2022 09:45:11 +0100, Krzysztof Kozlowski wrote:
>> On 18/11/2022 02:06, Hal Feng wrote:
>>> From: Emil Renner Berthing <kernel@esmil.dk>
>>>
>>> Add all clock outputs for the StarFive JH7110 system (SYS) and
>>> always-on (AON) clock generator.
>>>
>>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>>> ---
>>>  MAINTAINERS                                 |   5 +-
>>>  include/dt-bindings/clock/starfive-jh7110.h | 234 ++++++++++++++++++++
>>>  2 files changed, 237 insertions(+), 2 deletions(-)
>>>  create mode 100644 include/dt-bindings/clock/starfive-jh7110.h
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index e6f1060e7964..e97dac9c0ee4 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -19598,12 +19598,13 @@ M:	Ion Badulescu <ionut@badula.org>
>>>  S:	Odd Fixes
>>>  F:	drivers/net/ethernet/adaptec/starfire*
>>>  
>>> -STARFIVE JH7100 CLOCK DRIVERS
>>> +STARFIVE CLOCK DRIVERS
>>>  M:	Emil Renner Berthing <kernel@esmil.dk>
>>> +M:	Hal Feng <hal.feng@starfivetech.com>
>>>  S:	Maintained
>>>  F:	Documentation/devicetree/bindings/clock/starfive,jh7100-*.yaml
>>>  F:	drivers/clk/starfive/
>>> -F:	include/dt-bindings/clock/starfive-jh7100*.h
>>> +F:	include/dt-bindings/clock/starfive*
>>>  
>>>  STARFIVE JH7100 PINCTRL DRIVER
>>>  M:	Emil Renner Berthing <kernel@esmil.dk>
>>> diff --git a/include/dt-bindings/clock/starfive-jh7110.h b/include/dt-bindings/clock/starfive-jh7110.h
>>
>> Filename based / the same as compatible (or bindings filename).
> 
> Should I split this file into two files for "SYSCRG" and "AONCRG", which
> maybe named as "starfive-jh7110-sys.h" and "starfive-jh7110-aon.h". Ditto
> for the patch 8.

Does not have to be, but anyway naming must follow compatible naming, so
vendor,soc-device.

Best regards,
Krzysztof


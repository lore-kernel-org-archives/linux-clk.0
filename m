Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8CE5C4321E
	for <linux-clk@archiver.kernel.org>; Thu,  1 Dec 2022 10:21:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbiLAKVX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Dec 2022 05:21:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbiLAKVS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Dec 2022 05:21:18 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00A7D98960
        for <linux-clk@vger.kernel.org>; Thu,  1 Dec 2022 02:21:07 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id r12so1793772lfp.1
        for <linux-clk@vger.kernel.org>; Thu, 01 Dec 2022 02:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJWC4EnSIdOHOak+Y01i6W7TmDZjyxRR2uPhy+FOZLk=;
        b=czOauT1/LL1bLcLrnxMZ7LyUIUmobSmtcydtd7PTiowxd5khBSoAy8Q5Jh0363tYBX
         mK6jk8DukOA5/cDl1CBuODKtFLZZ4KfXpQGGA5QLqsxFd8hb8DU8/pWLYe5lT8KxvPHX
         2+605fUYdZQDOI8zSJuqoHxbtfkc1czcwu19yr+IB2DL/MOcMz5r+65zOnMIyKXdmHjH
         RR9S+Bb+UGytEvll9EFZUpNH1RYOlvOsEomq0QEkxeStmNzb8RCAKaFyyayaLEcisv8A
         kD0BdlRMNBTNf3S8XK1Jsl6LMH5QKLS/hEAotw654okuI+vL/RhU4XWmIcVm5hAEREqj
         s+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yJWC4EnSIdOHOak+Y01i6W7TmDZjyxRR2uPhy+FOZLk=;
        b=lkwNe/SAH1ySIW9L0TubaY0AzGKfxwxVFDz3CMtdTjvdOA3WEasF63dGVRaUqeeqJC
         r1G6ylxvdrbBED0Z50QVOQlwBOiX+MJp04r4BKMfOD1XqJHTgbr6P+/AsIwFMITdn1UU
         86ByuccWria/p8XOAXdFOTinqZF4EJxAo9TsmYxFpm8SuFZiMC+9G9WpL8vT0vp2PnF/
         S2+oVPLZ/t12rDwMWMh/GKqHr4O8CX6w9k74o24V6vxz7BPfAnlO2e7cs7sktu81VkvJ
         KtU4QHH025iDxejkcq7/qbzA78bxe8FQdcUD3pg696yLueennD7MSfiSScmD925baggk
         s53A==
X-Gm-Message-State: ANoB5pm1jmJOMncn5LZjdbTMn43oatrBRhumeSQRTK6boxV9lTBHn+kD
        C57bcFi7MvknKEOy/3Tmu7QzTQ==
X-Google-Smtp-Source: AA0mqf6CUSYZrSFSc59I2YqsCSJOMbf+X1AkF2Fb2hvkfIrHoAJHah4FhaNgx3RzM/yZ3iPB9Yg2fA==
X-Received: by 2002:ac2:4316:0:b0:4b5:d8e:c12 with SMTP id l22-20020ac24316000000b004b50d8e0c12mr7626503lfh.665.1669890066328;
        Thu, 01 Dec 2022 02:21:06 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b4-20020a2eb904000000b00279cbcfd7dbsm290384ljb.30.2022.12.01.02.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 02:21:05 -0800 (PST)
Message-ID: <4e94c635-4cbb-449e-24af-f6fee47fb45e@linaro.org>
Date:   Thu, 1 Dec 2022 11:21:04 +0100
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
 <9183bac6-121e-0027-a88b-d77d5c9a077e@linaro.org>
 <e954511b-e74a-2c3a-95ec-d33c938b146f@starfivetech.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e954511b-e74a-2c3a-95ec-d33c938b146f@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/11/2022 19:05, Hal Feng wrote:
> On Wed, 30 Nov 2022 16:19:06 +0100, Krzysztof Kozlowski wrote:
>> On 30/11/2022 16:12, Hal Feng wrote:
>>> On Wed, 30 Nov 2022 12:48:30 +0100, Krzysztof Kozlowski wrote:
>>>> On 30/11/2022 10:47, Hal Feng wrote:
>>>>> On Fri, 25 Nov 2022 14:41:12 +0800, Hal Feng wrote:
>>>>>> On Mon, 21 Nov 2022 09:47:08 +0100, Krzysztof Kozlowski wrote:
>>>>>>> On 18/11/2022 02:06, Hal Feng wrote:
>>>>>>>> From: Emil Renner Berthing <kernel@esmil.dk>
>>>>>>>>
>>>>>>>> Add bindings for the system clock and reset generator (SYSCRG) on the
>>>>>>>> JH7110 RISC-V SoC by StarFive Ltd.
>>>>>>>>
>>>>>>>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>>>>>>>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>>>>>>>
>>>>>>> Binding headers are coming with the file bringing bindings for the
>>>>>>> device, so you need to squash patches.
>>>>>>
>>>>>> As we discussed in patch 7, could I merge patch 7, 8, 9, 10 and add the
>>>>>> following files in one commit?
>>>>>>
>>>>>> include/dt-bindings/clock/starfive,jh7110-crg.h
>>>>>> include/dt-bindings/reset/starfive,jh7110-crg.h
>>>>>> Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>>>>>> Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
>>>>>
>>>>> Hi, Krzysztof,
>>>>>
>>>>> Could you please give me some suggestions?
>>>>
>>>> You can keep aon and sys split. First add one of them with their own
>>>> headers. Then add second with their own defines.
>>>
>>> You mean split patch 7 and patch 8 into sys part and aon part
>>> respectively? There are totally five regions (sys/aon/stg/isp/vout)
>>> for clocks and resets in JH7110. If we do that, there will be 5
>>> headers for JH7110 in either clock or reset directory finally. Is
>>> that OK if there are too many headers for just one SoC?
>>
>>
>> Sorry, I lost the track of what patches you have. The comment was -
>> bindings include both the doc and headers. You want to split some, some
>> merge, sorry, no clue. I did not propose splitting headers...
> 
> It's ok. The problem was that the header
> 
> include/dt-bindings/clock/starfive,jh7110-crg.h
> 
> was used in both
> 
> Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> 
> and
> 
> Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml.
> 
> The same for include/dt-bindings/reset/starfive,jh7110-crg.h.
> So should I add these four files in one patch?

No. I think I wrote proposed flow of patches:
1. syscrg bindings with header
2. aoncrg bindings with changes to header

Why do you need to merge anything?

Best regards,
Krzysztof


Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3279DC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 21 Oct 2021 09:15:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E30C6112D
	for <linux-clk@archiver.kernel.org>; Thu, 21 Oct 2021 09:15:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbhJUJRP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Oct 2021 05:17:15 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:58060
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231321AbhJUJRP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Oct 2021 05:17:15 -0400
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DDB98402CE
        for <linux-clk@vger.kernel.org>; Thu, 21 Oct 2021 09:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634807698;
        bh=ytj9TJXPU/viRoBCe3czC/QnBbUOzUJFGdNTRHasgmo=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=LS9K0Kuf7ExyW4LUC+ea8tDNXFUtPOeRzmnSVTD9DmyjxM0XC4uLTNZO01NeO4aMF
         sQQUit4ezvB3W2K9VawoWD+bGWeNT5rUowAtlRNERSUGD2npQqW13aqHKyzc+x34+k
         yXX+qy5v07YHGa4P5gT7WFVF5xNn+4cMBYp8XR6wifjVtn61jC0pX7cAZoJ7f3SGwu
         Uh/q10j+rrWaRju2eyvTqgYyJpxvVxqDyWLOKggFZxUi2XwxR4kpcpgD2v1+oEe4xu
         bddl3fWdrVEabGMOE5aBeScZ/HCyUZ6bwd5X6MaEcFwsmfca63Un73pur2AxejO32Q
         LpG6Ftw/cfZBA==
Received: by mail-lj1-f197.google.com with SMTP id j12-20020a2e800c000000b00210c475e1aaso2564003ljg.15
        for <linux-clk@vger.kernel.org>; Thu, 21 Oct 2021 02:14:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ytj9TJXPU/viRoBCe3czC/QnBbUOzUJFGdNTRHasgmo=;
        b=Kw2jVCC9M3piqSP5VIsJsVIdTZMdRB2BQ877y3ke2FIOqwHB9nzy7Tm97BUFUjvJBE
         XcVXYvpWBUhloW0hvgZU4+b8nAgf7I2d6Ofr0rA157hW9sRqT2wkeMBs7RIbMKdATEsT
         m11aHV42C1x2GmF5M8XHmAw/HyHJ9pHVdwNaTQ3WN9Sqf5IdwxRLj9rFmT97AjQyIPP5
         3Egz8Mh/gZSUDwle5j7tyiGVdIgvFaL1CaS/x7dvOWPMjFO33nLs9mG7HothgNurTL47
         lBmuGwia+eQLKuUQ6fim0JLBgHdvpj9tif/n4gbQtI22Fyyom74Op7SjGWThQITv29Sw
         S5cQ==
X-Gm-Message-State: AOAM530HYqr/JXtTbuo8vIiO6UueZOZb9fpx1Fp/ED8cCcx+mcNw1vJt
        0+ChI9JXElZWckbZ7Rhepz6xVqFSiLyJ/THIyzfBWRNuav4USb+26RT/H0GOUjTE1ZbhZ+mKJT0
        diuzhJ0zt2EEA532mNvoiaTZMYYosXX/AvASQPA==
X-Received: by 2002:a05:651c:490:: with SMTP id s16mr4725356ljc.423.1634807698140;
        Thu, 21 Oct 2021 02:14:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE5YihtoWA04zZD9ZPDHafCjFehzdXEgiZoVPP8SOURpyYaWPBoivjMG+GOgyU+MxKUdNHag==
X-Received: by 2002:a05:651c:490:: with SMTP id s16mr4725334ljc.423.1634807697902;
        Thu, 21 Oct 2021 02:14:57 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id e12sm482150ljp.30.2021.10.21.02.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 02:14:57 -0700 (PDT)
Subject: Re: [PATCH v3 00/10] regulator/mfd/clock: dt-bindings: Samsung S2M
 and S5M to dtschema
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
 <YXA+GoTf6u/Y4qLX@google.com>
 <16c79986-03b2-b74b-0de8-4118e2c4419f@canonical.com>
 <b98bd487-6c55-d058-8073-689b9396b527@canonical.com>
 <YXEtuX5j9z8es0/i@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <4be10d9d-fbe5-3dd6-be0a-2b66a857a015@canonical.com>
Date:   Thu, 21 Oct 2021 11:14:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YXEtuX5j9z8es0/i@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/10/2021 11:07, Lee Jones wrote:
> On Wed, 20 Oct 2021, Krzysztof Kozlowski wrote:
> 
>> On 20/10/2021 18:08, Krzysztof Kozlowski wrote:
>>> On 20/10/2021 18:04, Lee Jones wrote:
>>>> On Wed, 06 Oct 2021, Krzysztof Kozlowski wrote:
>>>>
>>>>> Hi All,
>>>>>
>>>>> Changes since v2
>>>>> ================
>>>>> 1. Add Rob's tags.
>>>>> 2. Remove "regulator-name" from properties (all regulator dtschema).
>>>>> 3. Move "unevaluatedProperties" higher to make code easier to read (all regulator dtschema).
>>>>> 4. Add ref-type to op-mode property (patch 6: s5m8767 regulators).
>>>>>
>>>>> Changes since v1
>>>>> ================
>>>>> 1. Drop DTS patches - applied.
>>>>> 2. Fully remove bindings/regulator/samsung,s5m8767.txt .
>>>>> 3. Minor subject reformatting and few typos in text.
>>>>>
>>>>>
>>>>> Intro
>>>>> =====
>>>>> This patchset converts all devicetree bindings of Samsung S2M and S5M
>>>>> PMIC devices from txt to dtschema.
>>>>>
>>>>> It includes also two fixes because later conversion depends on it
>>>>> (contextually).
>>>>>
>>>>>
>>>>> Merging/dependencies
>>>>> ====================
>>>>> 1. Regulator related binding changes depend on first two commits (the
>>>>>    fixes), because of context.
>>>>> 2. The mfd bindings depend on clock and regulator bindings.
>>>>>
>>>>> The fixes and bindings changes (patches 1-10) should go via the same
>>>>> tree.  For example regulator or mfd tree.
>>>>>
>>>>> Another alternative is that regulator patches (1-2, 4-6) go via Mark who
>>>>> later gives MFD a stable branch/tag to pull. Then the clock and MFD
>>>>> bindings would go on top via MFD tree. Or any other setup you would like
>>>>> to have. :)
>>>>>
>>>>>
>>>>> Overview of devices
>>>>> ===================
>>>>> Essentially all Samsung S2M and S5M PMICs are very similar devices. They
>>>>> provide the same functionality: regulators, RTC, 2 or 3 clocks and main
>>>>> power management (e.g. power cut to SoC).
>>>>>
>>>>> The differences are mostly in registers layout and number of regulators.
>>>>>
>>>>> The drivers are built around one common part, mfd/sec-core.c, and share
>>>>> some drivers between devices:
>>>>> 1. MFD sec-core for all devices,
>>>>> 1. one clock driver for most of devices,
>>>>> 2. one RTC driver for all devices,
>>>>> 3. three regulator drivers.
>>>>>
>>>>> The regulator drivers were implementing slightly different features,
>>>>> therefore one regulator binding for all devices does not make much
>>>>> sense.  However the clock device binding can be shared.
>>>>>
>>>>> The final dtschema bindings try to implement this - share only the clock
>>>>> bindings.
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>>
>>>>> Krzysztof Kozlowski (10):
>>>>>   regulator: s5m8767: do not use reset value as DVS voltage if GPIO DVS
>>>>>     is disabled
>>>>>   regulator: dt-bindings: samsung,s5m8767: correct
>>>>>     s5m8767,pmic-buck-default-dvs-idx property
>>>>>   dt-bindings: clock: samsung,s2mps11: convert to dtschema
>>>>>   regulator: dt-bindings: samsung,s2m: convert to dtschema
>>>>>   regulator: dt-bindings: samsung,s2mpa01: convert to dtschema
>>>>>   regulator: dt-bindings: samsung,s5m8767: convert to dtschema
>>>>>   dt-bindings: mfd: samsung,s2mps11: convert to dtschema
>>>>>   dt-bindings: mfd: samsung,s2mpa01: convert to dtschema
>>>>>   dt-bindings: mfd: samsung,s5m8767: convert to dtschema
>>>>>   dt-bindings: mfd: samsung,s5m8767: document buck and LDO supplies
>>>>
>>>> Looks like these are ready to be pushed.
>>>>
>>>> However, I am not in receipt of patches 1-2.
>>>>
>>>> Am I okay to merge 3-10 right now?
>>>
>>> No. This is v3, but we need v4. Please:
>>> 1. Merge tag from Mark:
>>> https://lore.kernel.org/lkml/YWCT+YL%2F9qHbF9f0@sirena.org.uk/
>>>
>>> 2. Then apply patches 7-10 (MFD bindings).
>>
>> ... patches 7-10 from that v4 of course. They start here:
>> https://lore.kernel.org/lkml/20211008113931.134847-4-krzysztof.kozlowski@canonical.com/
> 
> ... and these can do in on their own?  With no inter-dependencies?
> 
> Or is Rob going to tell me off again?

The 7-10 depend on 1-6 from this set. 1-6 are in the tag provided by
Mark, so you have to base your work on Mark's tag.

Then you will get everything from this patchset (but v4, not v3 please).
The patchset itself does not depend on anything else, so I do not expect
Rob objecting. It was also reviewed by Rob.

To summarize: please merge tag from Mark and apply patches 7-10 from v4
on top of that tag.


Best regards,
Krzysztof

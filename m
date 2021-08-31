Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456F8C432BE
	for <linux-clk@archiver.kernel.org>; Tue, 31 Aug 2021 13:04:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A05F61041
	for <linux-clk@archiver.kernel.org>; Tue, 31 Aug 2021 13:04:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232838AbhHaNEy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Aug 2021 09:04:54 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:36124
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232933AbhHaNEx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Aug 2021 09:04:53 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 857794017B
        for <linux-clk@vger.kernel.org>; Tue, 31 Aug 2021 13:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1630415037;
        bh=qDh+jaB0np2Ma4qQPLUONgv0hkCk0/2/t0zPMqiZXPk=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=UzTEnwFsdJONS1Cp9/apf1twDjul36NWZFWPANsFja/7BB3ieYJ4H2MRWMwAI6Kbd
         kWdKk/eYLFKKBNlVdlTgFfx4VwkOwl3xDNHG1kdg2v57Ca9d6TIfglj1Y7vFTeRe/a
         E9TqVckQVBkfSBnlpH4xBSD69GTxcSdJq65BkmTp7tZXJuT6/+fh9KmijL4a7oMdxD
         hJupMgWd2rKK+VFr00jafqmgVNCZrXzcDF0ra1ACUuv6QXp1k7kYa1/rtuQ7Bk4UHu
         aeq967iV8q+k200kpmKUYUbxAM34d6Xyh1lqhwdf1htutDUCdwgrn7ld5BCmC6ffQG
         n4o8PMxzD5xkw==
Received: by mail-wr1-f72.google.com with SMTP id p1-20020adfcc81000000b001576cccf12cso4034590wrj.6
        for <linux-clk@vger.kernel.org>; Tue, 31 Aug 2021 06:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qDh+jaB0np2Ma4qQPLUONgv0hkCk0/2/t0zPMqiZXPk=;
        b=MyDyhN3doIB77YFp22cgocoeyVdmSHOar/gtOI8YZrqZrDxwksOpsCya5EIpeVEB8m
         qvLmoPskbud+pwQvjVEiN2/NgIVNB14mzR95KOw/pIUZlBU8u4Kx4oZKm1FEydhOZB/b
         egKsfggbtsw2OG6DJHbmkrMX8Y8Fc3I1PdtQroVnIXQSxA5Q/cyeO318104ShafSQsm/
         /4qrXlkUpKWcv8HCMgItkHFa8YCF9XmPWVsVerev3gaUwy4+rhXu2ISjmhfT8v/HNt7j
         7RickxxwciF7GvBM8YUEGEVaGOvLYiA6w0yyhd/FU/PRLytPohNmvZkjfqa1zS/kvlNY
         HoeA==
X-Gm-Message-State: AOAM530Zq4qn9a8oRZGuGcNdb4GNKCUO3QmKo7U8H6PoQuQm7VQ9g9mH
        Tn2pEGGjaIuxJccabW5d295C40Jvq46pbwHp54NM047/Fi3Uwbmh1pN2NOKr4AKyYoyvOFH0ZtI
        FgKVDxmwnE7ironXgh/ujFv6KoLNW9htZLAmHhQ==
X-Received: by 2002:a1c:98d2:: with SMTP id a201mr4148662wme.89.1630415037168;
        Tue, 31 Aug 2021 06:03:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeqlQimbRGjw6jejCDWBCWbWbg+R0a4qSrqXfxkK2pAyisDvv0rWZSb1NBFkB7+rE1teZl2A==
X-Received: by 2002:a1c:98d2:: with SMTP id a201mr4148639wme.89.1630415037010;
        Tue, 31 Aug 2021 06:03:57 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.113.63])
        by smtp.gmail.com with ESMTPSA id l15sm18300749wrv.84.2021.08.31.06.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Aug 2021 06:03:56 -0700 (PDT)
Subject: Re: [PATCH v3 5/8] dt-bindings: clock: samsung: convert Exynos4 to
 dtschema
To:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>
References: <20210825134056.219884-1-krzysztof.kozlowski@canonical.com>
 <20210825134056.219884-6-krzysztof.kozlowski@canonical.com>
 <CAL_JsqJvEgqvnTokdNjOR=XdY89TdZxUXR4--P1FXVj75z3tgA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <d5e75754-4724-9cbf-d07e-47c40cfa130f@canonical.com>
Date:   Tue, 31 Aug 2021 15:03:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJvEgqvnTokdNjOR=XdY89TdZxUXR4--P1FXVj75z3tgA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 31/08/2021 14:36, Rob Herring wrote:
> On Wed, Aug 25, 2021 at 8:41 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> Merge Exynos4210 and Exynos4412 clock controller bindings to existing DT
>> schema.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  .../bindings/clock/exynos4-clock.txt          | 86 -------------------
>>  .../bindings/clock/samsung,exynos-clock.yaml  |  3 +
>>  .../clock/samsung,exynos4412-isp-clock.yaml   | 64 ++++++++++++++
>>  3 files changed, 67 insertions(+), 86 deletions(-)
>>  delete mode 100644 Documentation/devicetree/bindings/clock/exynos4-clock.txt
>>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml
> 
> [...]
> 
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/exynos4412.h>
> 
> Where is this header? linux-next is now failing:
> 

Argh, it should be exynos4.h. Stephen mentioned it but I missed the
difference in number. I wonder how it passed dt_binding_check on my
machine...

Sorry for the mess, I'll send the fix.



Best regards,
Krzysztof

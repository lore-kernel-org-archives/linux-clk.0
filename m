Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41371C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 16:22:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239539AbhLOQW0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 11:22:26 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:55262
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244743AbhLOQWZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 11:22:25 -0500
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6BC8840C7B
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 16:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639585344;
        bh=Z23gqncjXTDma3MAGbF/ABiF38CqvJFbYLGLj7MCGK4=;
        h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
         In-Reply-To:Content-Type;
        b=D/vIzBYnViM+daYj8T2Wpck70quRWVl+yfW0AVgUcow9kWoPjmF/1l9/73JyHYPc3
         A638yMYwBOUzp4lngMGqB0zg0fYSG6gWN21w/k+d/m5ih5RPfZ7EpHIY7+LTN79JoT
         ElbbIHcFyN/rZHv+sgtgVlQDLqVioGd8kmhLr0dXoo5eSU/e7nBhlgnqNexYtPiKjx
         UlZ/7F4u3T01CuYRgYxUexuZpcPtchURcJFJ+XGPpwK+c8avt0XrAX+ueQZCQ5AsXs
         eGVtbm9zXld9nUTZ5JWXges5FuXitUepnSOkBSdGunzy1eES9K2sx1LJwjRibtwZb0
         fh67Cnz6Ehm8A==
Received: by mail-lj1-f200.google.com with SMTP id b3-20020a2ebc03000000b0021ffe75b14cso7200608ljf.5
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 08:22:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=Z23gqncjXTDma3MAGbF/ABiF38CqvJFbYLGLj7MCGK4=;
        b=uPVF6yGWj//x3oW5vz/FVPPJbYiLPd3Urmi8fu/KSiBx96uG48r1rXMlmE3xHzpjxB
         mu2aZ/0Vh8dOsspGyk+7jmqc9rgO3wEMza33W24c+fcn5nn650noMJRrlCRu+1NwW5Bj
         hlXya6n12hY+lq6yc3Rlstjm7mfUQxaoLECjFvyCmz2ETks45Zir2mPJuVckWHzRKYZR
         Xq5K1EnegIvww8i8in9N7GJNUymWdV/Du7ZjhMF5Y84TuIrTEd4i+tT9HTmaK7HBMTIf
         7rNb7eHRUUeEMR1C54uuG9wVT9Fko5rwx/wyyOMm3eC4BCCLfGBuL0g5PC2VmcnIAt6N
         LPxQ==
X-Gm-Message-State: AOAM531kRKWdAr9wgMFV++Mqf8a6RVjSW7q9NUKOaUW6HrpwQ7MXB4ps
        ssjPIiZcCwunucokJ06maSAjR38f+3ZxKC8cpKAyxeGHcWkF+SXc11gYwnlwIsEdt4SSh6Sjxpb
        Ptn8y5u5lAEiVPp+os/+DEuhB1zUyqxYYlY1g+g==
X-Received: by 2002:a05:6512:487:: with SMTP id v7mr10206242lfq.386.1639585343422;
        Wed, 15 Dec 2021 08:22:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9qgUSsoTZTEVQwfLvYImmD5LtPngqbyyxLpVI0FQzdKit4LPRNPEyh4OhT5jRHrAxhd9mLg==
X-Received: by 2002:a05:6512:487:: with SMTP id v7mr10206167lfq.386.1639585342645;
        Wed, 15 Dec 2021 08:22:22 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id b13sm388572lfv.200.2021.12.15.08.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 08:22:22 -0800 (PST)
Message-ID: <77ab7341-2311-da24-1128-b5775a71db1c@canonical.com>
Date:   Wed, 15 Dec 2021 17:22:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 4/7] dt-bindings: arm: samsung: Document E850-96 board
 binding
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20211215160906.17451-1-semen.protsenko@linaro.org>
 <20211215160906.17451-5-semen.protsenko@linaro.org>
 <55294fa1-9988-5c10-1fc1-c33f3ec9b231@canonical.com>
In-Reply-To: <55294fa1-9988-5c10-1fc1-c33f3ec9b231@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/12/2021 17:14, Krzysztof Kozlowski wrote:
> On 15/12/2021 17:09, Sam Protsenko wrote:
>> Add binding for the WinLink E850-96 board, which is based on Samsung
>> Exynos850 SoC.
>>
>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>> ---
>>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml     | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
>> index ef6dc14be4b5..00f122197476 100644
>> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
>> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
>> @@ -205,6 +205,12 @@ properties:
>>                - samsung,exynosautov9-sadk   # Samsung Exynos Auto v9 SADK
>>            - const: samsung,exynosautov9
>>  
>> +      - description: Exynos850 based boards
>> +        items:
>> +          - enum:
>> +              - winlink,e850-96                 # WinLink E850-96
>> +          - const: samsung,exynos850
>> +
> 
> Add it before Exynos Auto v9 entry, please.
> 

And also rebase on my latest for-next - I just applied conflicting
change for Exynos7885 boards.


Best regards,
Krzysztof

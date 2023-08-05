Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2B6C00528
	for <linux-clk@archiver.kernel.org>; Sat,  5 Aug 2023 19:10:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230283AbjHETKB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 5 Aug 2023 15:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbjHETKB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 5 Aug 2023 15:10:01 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8869B115
        for <linux-clk@vger.kernel.org>; Sat,  5 Aug 2023 12:09:58 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fe426b8583so25432485e9.2
        for <linux-clk@vger.kernel.org>; Sat, 05 Aug 2023 12:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691262597; x=1691867397;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AhM0nX24vtVjYSXmggbmwPwtE6IDQBa7yTOKVCY9Lqc=;
        b=i1+pyAYKBW4/QY4KSspsfj/nnye88FYeNW/UjTZk3/UzCDzUekF3J1E4qCNzxdyUmF
         wno3uyLLi/vAPH1h7oA6AnK3P0wlx50Jh6yHSYbmW054SzhQUpYcoSLs1G3shKMP7U+B
         Q/4K8FchPYG33D/yhT61eq6wkUQwzeG47y5r7W6TcY7VYmWBxMMRYGnF8136ggbnjw3n
         uAfovA9Tt1Fl5KRNGYcctHwoY7UtnEjZzWC9eXc7NNvCR7XrPTjxEsGRvklrsm42PsvP
         DjfNr3FwS1ewU37aQ39phfzLhr1ebI/ZoH+KKpHy5X5GOJr1MvWxUCOqALWahYNQwlsi
         gdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691262597; x=1691867397;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AhM0nX24vtVjYSXmggbmwPwtE6IDQBa7yTOKVCY9Lqc=;
        b=Avo+Fry6pe//lFsO2BOzK8a6R0XX5mcmmkfeskOPm0ylOPQ4XAygXjY8HxIwxF+O3a
         93KBnnyKOiUNim+W8UsjQpFds6XQS/cUK+0KKGRb7S8s0wnqznd5QB1il+sv07dY4LXN
         aRz3Pfrxxom0QaKp5nyoOjugkhBqmQKx2g3t7flQfjJWmx/zfFkDVy8O3CL1+PNygvpy
         Jbu3u42PeFk7jIPeVhCVOuMs5Dd8ZW8H6mdafFQjGkBsfmViJFyCTcAJUk/iT06iEfFH
         aFup0Er3dLWP3v5eVUyOjaPRjkZ4yL3k6BbwBgcmVHKYSHxJRT3DJEuyCLN34a5UKrf5
         sfbg==
X-Gm-Message-State: AOJu0YxltqV//30qQ6YDe9uBOsbJzH7qfjqGQVNrYYRAITOyy7i9fn+I
        08CMVwoK1TPozUp333D7PTn0jA==
X-Google-Smtp-Source: AGHT+IE7bQxCxZkrVaghNMtXufaZPEuRPVorinbNiH6AhTZhC4Mn2ki+qguWW5UUWTi6LY0KBrKMOQ==
X-Received: by 2002:a7b:cb95:0:b0:3fe:374f:f7fd with SMTP id m21-20020a7bcb95000000b003fe374ff7fdmr4214209wmi.33.1691262596826;
        Sat, 05 Aug 2023 12:09:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.245])
        by smtp.gmail.com with ESMTPSA id o12-20020a05600c378c00b003fd2e89620asm10047151wmr.40.2023.08.05.12.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Aug 2023 12:09:56 -0700 (PDT)
Message-ID: <0ab2f6c1-4f48-592e-1123-d89d5eb0d164@linaro.org>
Date:   Sat, 5 Aug 2023 21:09:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/2] dt-bindings: clock: intel,cgu-lgm: add
 mxl,control-gate option
Content-Language: en-US
To:     Florian Eckert <fe@dev.tdt.de>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, yzhu@maxlinear.com,
        rtanwar@maxlinear.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Eckert.Florian@googlemail.com
References: <20230731100349.184553-1-fe@dev.tdt.de>
 <20230731100349.184553-3-fe@dev.tdt.de>
 <780aa090-3a97-abab-271f-59790df29cc4@linaro.org>
 <11386dd27487075a9a0b1a2aa7794951@dev.tdt.de>
 <75cbeeed-84c9-7637-b2a7-b37d87f5872e@linaro.org>
 <2053f32f262911061e3e56540e4b51d4@dev.tdt.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2053f32f262911061e3e56540e4b51d4@dev.tdt.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 01/08/2023 10:09, Florian Eckert wrote:
> Hello Krzysztof,
> 
>>>> You described the desired Linux feature or behavior, not the actual
>>>> hardware. The bindings are about the latter, so instead you need to
>>>> rephrase the property and its description to match actual hardware
>>>> capabilities/features/configuration etc.
>>>
>>> You have correctly identified that this is not a hardware 
>>> configuration,
>>> but a driver configuration. Currently, the driver is configured so 
>>> that
>>> the gates cannot be switched via the clk subsystem callbacks. When
>>> registering the data structures from the driver, I have to pass a flag
>>> GATE_CLK_HW so that the gate is managed by the driver.
>>>
>>> I didn't want to always change the source of the driver when it has to
>>> take
>>> care of the GATE, so I wanted to map this via the dts.
>>>
>>> I have a board support package from Maxlinear for the Lightning 
>>> Mountain
>>> Soc
>>> with other drivers that are not upstream now. Some of them use the
>>> clock framework some of them does not.
>>>
>>> Due to missing documents it is not possible to send these drivers
>>> upstream.
>>
>> So when you upstream them, the binding becomes wrong or not needed?
>> Sorry, bindings are entirely independent of OS, so using this as an
>> argument is clear no-go.
> 
> Yes, that would probably be the case, as the maxlinear drivers are at
> an early stage and are not yet upstreamable in my opinion. If I had the
> documents, I would take a closer look. But they are developing behind
> closed doors. Nothing can be contributed. Not until the drivers are
> hopefully upstream at some point as the cgu-lgm.
> 
>>> Strictly speaking, this is about the gptc and the watchdog.
>>>
>>> Since it is a buildin_platform driver, it can also not work via
>>> module parameters.
>>
>> None of this explains any hardware related part of this binding. You
>> created now policy for one specific OS. Devicetree, which is OS
>> independent, is not for such purposes.
> 
> Yes this would be the case. Maybe I need to patch the cgu-lgm.c [1]
> and send it upstream to restore the old behavior.
> Because the following commit has changed the behaviour [2].
> Unfortunately, it is also included in 5.15 stable branch.
> Which in my opinion should not have happened!

Then unfortunately this is not a correct change.

Best regards,
Krzysztof


Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5780EC04A94
	for <linux-clk@archiver.kernel.org>; Thu, 10 Aug 2023 08:11:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbjHJILG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Aug 2023 04:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232212AbjHJILF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 10 Aug 2023 04:11:05 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05CBC269A
        for <linux-clk@vger.kernel.org>; Thu, 10 Aug 2023 01:10:55 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fbea14700bso5376055e9.3
        for <linux-clk@vger.kernel.org>; Thu, 10 Aug 2023 01:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691655053; x=1692259853;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=fg9G7GnbTJdewMNTEJgW8SVAuCvIfpPe9RrCKJ5D/9Y=;
        b=Cpqy3BQE7SssOGVas3hMwLeiIStGEE7Qe9/cLT8ypZtDwg0UG1Q+RyEi05SbHAh+Kv
         1QzfJlwk601kP+S1nO3a34c42TioVjLHU+kRMghX/F9PHtFWO6fPvR9IHidyqvgS8eg6
         UcGY6qARGxDkUv+y+wBD2Dxd6+dVEqvWHY2tOAeh+pwCxJnyLCqUrP8Ic+/oQkAOUJ7L
         pgtEDe5C2pnjSMaENbVVR7PeUbaNdtK7AqnMggRowEAXbRb8bInWYwpkZqAuLGlGsidy
         TUvGm3aTUc1nQ1ZjkZwXBQLwyVlugTwN0LwErZVSOZFLWW+t6BX5MJhNX2P3hghUEtIW
         ODhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691655053; x=1692259853;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fg9G7GnbTJdewMNTEJgW8SVAuCvIfpPe9RrCKJ5D/9Y=;
        b=H2eWOhIaQfPpmmSFXTHjsu6ART83u62Qu6joKkWEhne+CRycanX/wI6QX0ZpUf+mEB
         KJ1bIojsF3HPwq7ulKiAb3xHwGdJSApOVvl3qWAiu/8sbaL+yF65VfDHJtMiGciHo0/7
         1WvmLnHAg6NTxDh4GjCvZIcagScR1cSjAluTruopErkptvuPLem+MNPmB9fxzNOhhB9z
         a/ZpTq3sY02rfeOfBOl4Q9A/jpoy9HvLcEZsYzcUU9nFhhcK3T4ej/obbrZbnFsgmG0O
         xzV8D5BpRcfO2VRzr9zd2HCh//rEdMXSoK8MoKxb2k+c0w5IW13L1AdH/Qg+AzkVb3Ow
         5tzw==
X-Gm-Message-State: AOJu0YzbwxZM7YS0q7ZEzsX8hrRoih8BS7iYN7Le5p98btVZaxbkJz1h
        omH97ZOluYAmiNa+gQCdOiXKLQ==
X-Google-Smtp-Source: AGHT+IHHhqKUVDFFOmKZ02JBpZrS7ui+XZ8GK1HCkhmr+1iBQmxRUOM6/BB4osdTAuK20h4BxV3HbA==
X-Received: by 2002:adf:f08a:0:b0:316:f3f3:a1db with SMTP id n10-20020adff08a000000b00316f3f3a1dbmr1344948wro.32.1691655053267;
        Thu, 10 Aug 2023 01:10:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:6d73:1494:dad2:6a13])
        by smtp.gmail.com with ESMTPSA id k3-20020a5d6283000000b00317643a93f4sm1272988wru.96.2023.08.10.01.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 01:10:52 -0700 (PDT)
References: <20230808194811.113087-1-alexander.stein@mailbox.org>
 <1j5y5obt0u.fsf@starbuckisacylon.baylibre.com>
 <a48b1a97-2286-d2f9-742e-d718adcf1eed@linaro.org>
 <8294548.NyiUUSuA9g@kongar>
 <5c852193-9298-af2e-2b7d-dbba29768fec@linaro.org>
 <1jwmy39wfs.fsf@starbuckisacylon.baylibre.com>
 <d2225b8a-a622-3936-1e43-d5a9801c2cd7@linaro.org>
User-agent: mu4e 1.8.13; emacs 28.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alexander Stein <alexander.stein@mailbox.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Rokosov <ddrokosov@sberdevices.ru>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: clock: meson: Convert axg-audio-clkc
 to YAML format
Date:   Thu, 10 Aug 2023 09:51:05 +0200
In-reply-to: <d2225b8a-a622-3936-1e43-d5a9801c2cd7@linaro.org>
Message-ID: <1jsf8r9v1v.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu 10 Aug 2023 at 09:46, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 10/08/2023 09:32, Jerome Brunet wrote:
>>>>> Then why do you have this huge, apparently unnecessary, oneOf? If it's
>>>>> the same, then drop the oneOf and make number of clocks fixed.
>>>>
>>>> But as far as I understand the number of clocks is not fixed. As Jerome pointed 
>>>> out in the other post, it can have any combination of clocks and range from 1 
>>>> up to 11, where 'pclk' is always 1st clock.
>>>> I currently have no idea how to constraint that, despite limiting the number 
>>>> of clock-names.
>>>
>>> The same as in all other clock controllers (was also present on my list
>>> of useful patterns - Variable length arrays (per variant)):
>>> https://elixir.bootlin.com/linux/v5.19-rc6/source/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml#L57
>> 
>> In the example provided, the number and list of clocks required by each
>> controller variant is fixed, if I'm reading it correctly
>> 
>> Here the controller (regardless of the variant) accepts a maximum 29
>> clock inputs. Only pclk is required. It is valid to have any of 28
>> optional clocks at index 2, 3, etc ...
>
> I actually doubt that it is optional. These are valid clock inputs. I
> could imagine they are optional depending on the use-case, like some
> block being turned off or on... but then still the clock is there, just
> not actively used.
>
> Aren't you now describing existing Linux driver?

They are valid inputs but not required. It is valid (and expected) to
have a fair share of them not connected. The slave clocks just don't exist
most of the time, and the IP can totally accept unwired master clock
inputs on SoC variant. Nothing is going to break down if some are
missing.

From the controller perspective, the description given here is correct
and the inputs are optional.

The more generic question is how do we deal with multiple,
independent and optional ressources ? Because then, the order in which
they appear cannot be predicted.

>
>> I guess the question is how do you recommend to model that ?
>> I can think of 'Anyof' with all the optional clocks repeated 28 times
>> but that would be fairly ugly.
>
>
> Best regards,
> Krzysztof


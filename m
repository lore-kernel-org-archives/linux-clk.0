Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781A0C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 30 Sep 2021 10:33:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F1EF61267
	for <linux-clk@archiver.kernel.org>; Thu, 30 Sep 2021 10:33:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349980AbhI3KfR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Sep 2021 06:35:17 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38388
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349986AbhI3KfM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Sep 2021 06:35:12 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 45C1E3F325
        for <linux-clk@vger.kernel.org>; Thu, 30 Sep 2021 10:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632998009;
        bh=GOsn/2G+QDkwZL3ol+c1IzRmuz+gnJwlWT3R8gDjJFk=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=X1/egVgODvrJr/8E/EghHDVsU6fbZYWczteGY7EXgT2p7A8U1bwGq9vVHQCe0esKq
         vYNz0B9XExgP+/I33kKaOXbCxV/Q9rjNNp7WhaQ31A7aYYLjjNJKINF8LYql5SfWKU
         YO9gwcVy3ntJlAku3Nwj/gVfL3FxiIhTzC59WAkbstE9gbhO8c4LgO0lTntIewBM9b
         6a5e/MY3o6+KhttixoCqnBCEOsaBVDpXO7bG4tXtVlXdQtLbdzLP7kWGHHg1D3Cicr
         mQ511WBKI3QUxZAT5J1vHGxAwnkY6Y6UlRJtbmAlNEb31ZGKH1UVFT4z6jT78ASISa
         YzcC2bDHVGfCQ==
Received: by mail-ed1-f71.google.com with SMTP id j26-20020a508a9a000000b003da84aaa5c5so5767259edj.11
        for <linux-clk@vger.kernel.org>; Thu, 30 Sep 2021 03:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GOsn/2G+QDkwZL3ol+c1IzRmuz+gnJwlWT3R8gDjJFk=;
        b=GyfX3fYGf2WHseR1QTG4GOE7JksHR4Y3C2xExT6m4FvOEmLYqIOMEokiE0vysfKsaw
         4gllO/2PluwWgWqaAf8UUv/L7nHoqovlVP6xTmtLP+Qq0ret1RNJ/yquIS49cgYb1FAP
         eZxyM42maKJo6Nc1R6lv1cxipDk1L4nM4tZv2yu5A3OnB5QZ0j8zRatwD/PWCUQE9Igz
         TOw6Dm5D6tDN+zw/aDSw5JX4jA8u18hrqdlYDPZ/g2mx4f2Oz5DEn+meJAreqDL71Tye
         IFeaG2DJqE7SERkgcaWUzvcvrwd3NkPeQBA0Mjz0HJwudo7Eme1k54wOMcj5nN0YssVS
         hL8w==
X-Gm-Message-State: AOAM533GProRh61Md1TIZ5R0HHDFhBTFuQNJxfTAlggyZudm8jfikPST
        Hb01453x3gnETxvP6PYR5PX2KAhIPOEPVdgc6nWEOa1b+BUPy9O5O0hJ1oJ1/wq5Bo0r3khHIak
        4p9uxNG01O/O/R3rT+ioM+HtzdSqlZJ984G4s4A==
X-Received: by 2002:a05:6512:3e0d:: with SMTP id i13mr4920578lfv.163.1632997998210;
        Thu, 30 Sep 2021 03:33:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxETr3CaHtbnwBWgWoqOUI2YRgnTBmnRAzo89eooVW15+hZ/fIaabzddiJvzz02VweMmWN/VA==
X-Received: by 2002:a05:6512:3e0d:: with SMTP id i13mr4920553lfv.163.1632997997906;
        Thu, 30 Sep 2021 03:33:17 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id q1sm327976lfg.18.2021.09.30.03.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Sep 2021 03:33:17 -0700 (PDT)
To:     Lee Jones <lee.jones@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Cc:     Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org, Olof Johansson <olof@lixom.net>
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com>
 <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com>
 <CAK8P3a0zezKvexqvL29Oc44uQq-8QG7LwZy31VYJuYAYbh-Utw@mail.gmail.com>
 <YVWDsFE7qyH6AwxR@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select
 configs
Message-ID: <8928290c-73d9-0843-25ed-2a4817ad32f7@canonical.com>
Date:   Thu, 30 Sep 2021 12:33:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YVWDsFE7qyH6AwxR@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/09/2021 11:30, Lee Jones wrote:
> On Thu, 30 Sep 2021, Arnd Bergmann wrote:
> 
>> On Thu, Sep 30, 2021 at 8:15 AM Krzysztof Kozlowski
>> <krzysztof.kozlowski@canonical.com> wrote:
>>> On 29/09/2021 21:48, Will McVicker wrote:
>>>> On Wed, Sep 29, 2021 at 6:02 AM Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
>>>>> What is more, it seems you entirely ignored Geert's comments. I pointed
>>>>> attention to it last time and you just said you will send v2 instead of
>>>>> joining discussion.
>>>>>
>>>>> It's a NAK for this reason - ignoring what Geert brought: you just broke
>>>>> distro configs for Exynos.
>>>>
>>>> First off I did want to chime into the discussion from the previous
>>>> patchset, but I felt that Lee and Saravana addressed all your concerns
>>>> regarding the intent and feasibility. You also made it clear what the
>>>> next steps were that I needed to take.
>>>
>>> One of the steps was problem with distros using everything as modules.
>>> They should not receive these drivers as modules.
>>> Reminder: these are essential drivers and all Exynos platforms must have
>>> them as built-in (at least till someone really tests this on multiple
>>> setups).
>>
>> Agreed. I absolutely love the work of the GKI developers to turn more
>> drivers into loadable modules, but the "correctness-first" principle is
>> not up for negotiation. If you are uncomfortable with the code or the
>> amount of testing because you think it breaks something, you should
>> reject the patches. Moving core platform functionality is fundamentally
>> hard and it can go wrong in all possible ways where it used to work
>> by accident because the init order was fixed.
>>
>>>>> Please also explain why Exynos is so special that we deviate from the
>>>>> policy for all SoC that critical SoC-related drivers have to be enabled
>>>>> (built-in or as module).
>>>>
>>>> I am not actually changing ANY default build configurations here and
>>>> I'm not removing any existing configuration.
>>>
>>> You are changing not default, but selectability which is part of the
>>> enforced configuration to make platforms working. The distros do not
>>> always choose defaults but rather all as modules. Kernel configuration
>>> is huge and complex, so by mistake they could now even disable
>>> potentially essential driver. There is no need to disable for example
>>> essential clock driver on a supported Exynos platform.
>>
>> I'm not overly worried about the defaults. If the drivers work as loadable
>> modules, I'm happy with them being loadable modules in distros.
>> If they don't work this way, then the patches are broken and should
>> not get merged.
>>
>> I don't even mind having essential drivers that can be turned off,
>> since we already have a ton of those (e.g. serial ports on most platforms).
>> It's up to distros to know which drivers to enable, though having
>> either reasonable defaults or fail-safe Kconfig dependencies (e.g.
>> making it impossible to turn off but allowing modules) is clearly
>> best.
>>
>>>> I tried to make it pretty
>>>> clear in my original patch series commit messages that none of my
>>>> changes modify the default behavior. The .config is the same with and
>>>> without my patches. All of these drivers remain enabled as built-in.
>>>> So if there is a distro that requires all of these drivers to be
>>>> built-in, then they can continue as is without noticing any
>>>> difference. IOW, all of these changes are/should be backwards
>>>> compatible.
>>>
>>> I was not referring to default neither to backwards compatibility.
>>> Please explain why Exynos is special that it does not require essential
>>> drivers to be selected as built-in. For example why aren't same changes
>>> done for Renesas?
>>>
>>> Is that now a new global approach that all SoC drivers should be allowed
>>> to be disabled for ARCH_XXX?
>>
>> I wouldn't enforce it either way across platforms. I would prefer drivers
>> to be loadable modules where possible (and tested), rather than
>> selected by the platform Kconfig. If you want to ensure the exynos
>> drivers are impossible to turn into a nonworking state, that's up to you.
>>
>>>> You said that upstream supports a generic
>>>> kernel, but I argue that the upstream "generic" arm64 kernel can't be
>>>> considered generic if it builds in SoC specific drivers that can be
>>>> modules.
>>>
>>> Good point, but since having them as modules was not tested, I consider
>>> it as theoretical topic.
>>
>> I actually disagree strongly with labelling the kernel as "non-generic"
>> just because it requires platform specific support to be built-in rather than
>> a loadable module. This has never been possible on any platform
>> I'm aware of, and likely never will, except for minor variations of
>> an existing platform.
>>
>> Look at x86 as an example: there are less than a dozen SoC platforms
>> supported and they are incredibly similar hardware-wise, but the kernel
>> is anything but "generic" in the sense that was mentioned above.
>> Most of the platform specific drivers in arch/x86/platform and the
>> corresponding bits in drivers/{irqchip,clocksource,iommu} are always
>> built-in, and a lot more is hardwired in architecture code as PCI
>> quirks or conditional on cpuid or dmi firmware checks.
>>
>>>>> Even if there was, I think it is good to have dependencies like
>>>>> ARCH_EXYNOS, as they let us partition the (19000, as Arnd said recently)
>>>>> Kconfig symbols into better manageable groups.  Without these, we cannot
>>>>> do better than "depends on ARM || ARM64 || COMPILE_TEST".
>>>>
>>>> My patch series still keeps the dependencies on ARCH_EXYNOS. I am
>>>> totally fine with "depends on ARCH_EXYNOS" and totally fine with
>>>> "default ARCH_EXYNOS". The problem we have is that ARCH_EXYNOS
>>>> forcefully selects SoC specific drivers to be built-in because it just
>>>> adds more and more SoC-specific drivers to a generic kernel.
>>>
>>> The selected drivers are essential for supported platforms. We don't
>>> even know what are these unsupported, downstream platforms you want
>>> customize kernel for. They cannot be audited, cannot be compared.
>>>
>>> Therefore I don't agree with calling it a "problem" that we select
>>> *necessary* drivers for supported platforms. It's by design - supported
>>> platforms should receive them without ability to remove.
>>>
>>> If you want to change it, let me paste from previous discussion:
>>>
>>> Affecting upstream platforms just because vendor/downstream does not
>>> want to mainline some code is unacceptable. Please upstream your drivers
>>> and DTS.
>>
>> Agreed. I understand that it would be convenient for SoC vendors to
>> never have to upstream their platform code again, and that Android
>> would benefit from this in the short run.
>>
>> From my upstream perspective, this is absolutely a non-goal. If it becomes
>> easier as a side-effect of making the kernel more modular, that's fine.
>> The actual goal should be to get more people to contribute upstream so
>> devices run code that has been reviewed and integrated into new kernels.
>>
>>>> I know you are asking for me to only push changes that have proven to
>>>> work.
>>>
>>> Yep, tested.
>>
>> I'm generally fine with "obviously correct" ones as well, but it's up to
>> you to categorize them ;-)

Thanks Arnd!

> 
> Arnd,
> 
>   FWIW, I agree with all of your points.>
> Krzysztof,
> 
>   It sounds like a lack of testing is your main concern.
> 
>   How can I help here?  What H/W do I need to be able to fully test this?

The changes here need to be tested on affected platforms (ARMv7 and
ARMv8), when built as a modules on some types of regular distros (e.g.
Arch, Ubuntu). From each of such boot I would be happy to see number of
new dmesg warnings/errors plus number of probe deferrals.

Since the drivers could be switched to modules (and some distros might
do it), they might be hit by surprise regressions in boot performance
due to probe deferrals. This should be also checked on these platforms.
Geert pointed out before that clocks in many cases are not optional -
driver needs them and will wait defer.

Assuming of course that boot succeeds. Minor differences in boot speed
should not be a problem, I think, because distro anyway chosen
all-module approach so it accepts the penalty.

Best regards,
Krzysztof

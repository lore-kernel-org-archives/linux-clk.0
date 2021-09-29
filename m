Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF6BC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 29 Sep 2021 13:02:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A4DD613A6
	for <linux-clk@archiver.kernel.org>; Wed, 29 Sep 2021 13:02:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344028AbhI2NEh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Sep 2021 09:04:37 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:48492
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344025AbhI2NEf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Sep 2021 09:04:35 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9C52F3F4B9
        for <linux-clk@vger.kernel.org>; Wed, 29 Sep 2021 13:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632920573;
        bh=WQyoXTmGnA/i0/fq7CgN6IL65bEbPjXgHhQsmbo9nvw=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=rb2jGdjY2hoB2vleBfAxkFoqFvrnhgNGFt7FvwLRMSxP35xS9JUWU8jGu5cpDYthL
         h2IrDP+1nk0G/IdTY7wVIAXrXu18PkYyhy3iZcQq1Zslz2Dy8mhQWIbx0INYlfSe8R
         qHQdkZBuJhj4NsWXW+k7YFLRphmli3sx7w+Qo8cBJ5dPL/hUS5QPbcGpqm7I/PUE8a
         hLl0TLCmY4EF3iY2qIQ66OcWQosdaeF1XVIpKKEgeS3F7C1s0OWo2RkErAqPf1A1OA
         8yadHw59CEdNsXkwAxs64sm52I3EzWi9/rGtjEHRqI9dt70t1dx936Wv1CVkxCX/r3
         w20eHBatArpKQ==
Received: by mail-ed1-f71.google.com with SMTP id w8-20020a50f108000000b003da70d30658so2346975edl.6
        for <linux-clk@vger.kernel.org>; Wed, 29 Sep 2021 06:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WQyoXTmGnA/i0/fq7CgN6IL65bEbPjXgHhQsmbo9nvw=;
        b=31qXVE7GUfpbo5ySGba0/CKZ5zn/2U5iUlcib9c4j27f2KyaETzopE41oDUOXt7fWY
         WMmZf725KUJNLQp3pmt544l72/2XCRYoL9Gk5y8OETDUZNmw3MmSRQPKXT9J1/vR8aDg
         sw2lqFLWAy41zeR/+CIde5Sez+uBIdunwg0NdYa3kZj/mFFwq5PsuZf3f4ENtZDP+YtM
         nX+9w26uGB7EEKGmaYUf63qityXCTMX6zu6jzsWh0f4gzy2r3YR6bWayOM/SW7fOrnV6
         tui8LR3zUIMtK20R5yGCVrfTyAQyVH3K76NmrwYiNoi17MEbFMQ5ws91S654TVYOX8mZ
         aXqw==
X-Gm-Message-State: AOAM531Apmkxj3H+7bSQ0LoeHPxnS6QGt1seg1ikJSu8wU4HeZe9nV1u
        fuBO9kdvLzaPfOjhE9nODkC4nAok6ezAQgif7wsJuBY2qKyw9PO8sz4ckt5pm4GoCIFRZi67MFN
        16Ua+by8M14BJ2B9JGCUCbX08MUo9t2qVeXvqIw==
X-Received: by 2002:ac2:5978:: with SMTP id h24mr11376877lfp.426.1632920562751;
        Wed, 29 Sep 2021 06:02:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0mrG6dmWb7waqTSD14bTgiM+wUm0WGoJ0bh+iZA1uG9aiIPJT8ie5QjhcT5bRPUqMJ0Rmww==
X-Received: by 2002:ac2:5978:: with SMTP id h24mr11376781lfp.426.1632920562152;
        Wed, 29 Sep 2021 06:02:42 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id q30sm158216lfb.108.2021.09.29.06.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 06:02:41 -0700 (PDT)
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select
 configs
To:     Will McVicker <willmcvicker@google.com>,
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
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20210928235635.1348330-1-willmcvicker@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com>
Date:   Wed, 29 Sep 2021 15:02:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210928235635.1348330-1-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/09/2021 01:56, Will McVicker wrote:
> This is v2 of the series of patches that modularizes a number of core
> ARCH_EXYNOS drivers. Based off of the feedback from the v1 series, I have
> modularized all of the drivers that are removed from the ARCH_EXYNOS
> series of "select XXX". This includes setting the following configs as
> tristate:
> 
>  * COMMON_CLK_SAMSUNG
>  * EXYNOS_ARM64_COMMON_CLK
>  * PINCTRL_SAMSUNG
>  * PINCTRL_EXYNOS
>  * EXYNOS_PMU_ARM64
>  * EXYNOS_PM_DOMAINS
> 
> Additionally, it introduces the config EXYNOS_PMU_ARM64 and EXYNOS_PMU_ARM
> which was previously EXYNOS_PMU and EXYNOS_PMU_ARM_DRIVERS respectively.
> The reason for these new configs is because we are not able to easily
> modularize the ARMv7 PMU driver due to built-in arch dependencies on
> pmu_base_addr under arch/arm/mach-exynos/*. So the new configs split up
> the ARM and ARM64 portions into two separate configs.
> 
> Overall, these drivers didn't require much refactoring and converted to
> modules relatively easily. However, due to my lack of exynos hardware, I
> was not able to boot test these changes. I'm mostly concerned about the
> CLK_OF_DECLARE() changes having dependencies on early timers. So I'm
> requesting help for testing these changes on the respective hardware.
> 

These are all not tested at all? In such case, since these are not
trivial changes, please mark the series as RFT.

I will not be able to test these for some days, so it must wait.


Best regards,
Krzysztof

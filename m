Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92513C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 29 Sep 2021 14:00:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7221D6140F
	for <linux-clk@archiver.kernel.org>; Wed, 29 Sep 2021 14:00:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245076AbhI2OCg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Sep 2021 10:02:36 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:57304
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245078AbhI2OCf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Sep 2021 10:02:35 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CBD83402F6
        for <linux-clk@vger.kernel.org>; Wed, 29 Sep 2021 14:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632924053;
        bh=WjyM9zf1nCEYn+RK+0ge3r02uUICdD54a8plMbZb68M=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=vv3Rrt8YyQ1dvYwWxYyLPXKvALKBSpkoRh4+dLT/a8o1ZCpkDiAZKCRHJEUQKrDgn
         Aet/UDbTcIGroVlzCgqjz2jHqvA4NSN8aAmJnA/9wRKRfw1o4SHnXV/cv/0wHAyPzD
         +u3iAvT/yHxZRWM1XFFEHQQTN6eJJbSIxGfBXVk2GMaFWLyDW/fYqAJ492QRjJjXH/
         oHNp9E1nO284XHali3zgYJrW9brrmYEQpgJO3QihvWylTGHDTAdUdePh16tyNDT7Oc
         aspp1NwbNSuxZU+Maq65IoW+6G1OQ1VarATh8fhVO9As5CD4ygcs9f7x0RR/zMUd1c
         s5bc6Lt/4EceQ==
Received: by mail-lf1-f72.google.com with SMTP id d22-20020a0565123d1600b003fd0097d747so2495113lfv.2
        for <linux-clk@vger.kernel.org>; Wed, 29 Sep 2021 07:00:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WjyM9zf1nCEYn+RK+0ge3r02uUICdD54a8plMbZb68M=;
        b=q7WO3YW3jUaeTqfrBFMX0+p4NdQ0TUNcIkArm5L2CIn9dZL1CjJl++5Ub92v92+/0x
         bDnR6oAXBo91x9S+Se078/ztq8/+ba9XV7f791YyXHrwA6LJRRsKLwM89rGh1LZjyWeE
         RyB35+fVoCzf+FDbbj5aPxRpJnNID3jEgWqqjGZg5c43cPwlHKpknuBW7HMEZhEs7iqU
         tNw9+4SijrJ1l7elNY1QYyiH1BNFAYUid3Biwt8ea7dWbD05fsHfdDR7wO90k2C7D2DU
         i1iWbg/P1yv0JIHgJuP1nquHot5HHYbF1uruGhjEA/U1VETiofn+MPZgiN/yWJL5aaGE
         GNfQ==
X-Gm-Message-State: AOAM531LuBa3VGMeaOBDO0SmqxbxC91utPpUWGhybpRg01ImLXep5PCv
        kyjuBVGN8V7STvh5kwC7cKMOmAe122VojDNXE1d5eupDTOU8Pspewehvcb7UHk4CuShRwU/Xc+R
        CPTF7m6e3FE9Bv74Y79r/8iqzeE7u/RuPtpZgOw==
X-Received: by 2002:a05:6512:220f:: with SMTP id h15mr11115751lfu.398.1632924051595;
        Wed, 29 Sep 2021 07:00:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcRnIuhOY7CK9oDbVjvF9edjRx8oUhEpxRb6E1YojrS2Sfi3b7BVTyNWXrzfXxMSAityt0PQ==
X-Received: by 2002:a05:6512:220f:: with SMTP id h15mr11115725lfu.398.1632924051401;
        Wed, 29 Sep 2021 07:00:51 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id 8sm763ljr.10.2021.09.29.07.00.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 07:00:50 -0700 (PDT)
Subject: Re: [PATCH v2 01/12] arm64: don't have ARCH_EXYNOS select
 EXYNOS_CHIPID
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
 <20210928235635.1348330-2-willmcvicker@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <3274ed53-6058-323f-be3b-a90de479183c@canonical.com>
Date:   Wed, 29 Sep 2021 16:00:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210928235635.1348330-2-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/09/2021 01:56, Will McVicker wrote:
> Now that EXYNOS_CHIPID can be a module and is enabled by default via
> ARCH_EXYNOS, we don't need to have ARCH_EXYNOS directly select it. So
> remove that.
> 
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  arch/arm64/Kconfig.platforms | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index b0ce18d4cc98..90c5cf4856e1 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -92,7 +92,6 @@ config ARCH_BRCMSTB
>  config ARCH_EXYNOS
>  	bool "ARMv8 based Samsung Exynos SoC family"
>  	select COMMON_CLK_SAMSUNG
> -	select EXYNOS_CHIPID
>  	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
>  	select EXYNOS_PMU
>  	select HAVE_S3C_RTC if RTC_CLASS
> 

This actually should be part of my series converting ChipID driver to a
module:
https://lore.kernel.org/linux-samsung-soc/4aee1b0d-91a1-75ac-d2b7-6dab3d7a301f@kernel.org/T/#t

Applied it, thanks.

Best regards,
Krzysztof

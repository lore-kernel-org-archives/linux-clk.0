Return-Path: <SRS0=s02A=5V=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F28C2BA1A
	for <linux-clk@archiver.kernel.org>; Sun,  5 Apr 2020 06:21:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CBC25206F5
	for <linux-clk@archiver.kernel.org>; Sun,  5 Apr 2020 06:21:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WZL2MMJ6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgDEGVB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 5 Apr 2020 02:21:01 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:34863 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbgDEGVB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 5 Apr 2020 02:21:01 -0400
Received: by mail-pj1-f65.google.com with SMTP id g9so5036042pjp.0
        for <linux-clk@vger.kernel.org>; Sat, 04 Apr 2020 23:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ya6XsWj9NJlCl87tgEzDyRyY4BP+TOaWrz6fIMrtsg0=;
        b=WZL2MMJ6gJmt7tq4wu4jI3b7GPgBtjhebgM4Gu+1Wot9A8TwfkNBQV1rJlNN3nB8Ce
         SVeiTsgM6Jw+2eMVrCW7k7cfRCSqmu3BJC5UzXouoo/e3SiIXhhKIOJl9k9GPrWfCsMV
         YmTj4F4pOd8ApAH+yB9e22dBKB+ix0/PmYmYj5/721pLUj1BhVSmjSt5om1M0k1uB8vE
         bf3koF2N1kcVXYh7nOyCDudonsxt7Ml8A5rkk3Q2dTwOr5yY1tfCFh0ys58nTIU4LPZ3
         BOw6FTVxlXRcfLtNbgSvmYTVcrmJTf4JIyFBYWgUJi8iuWcwRmCrK4A2tqhDimaY4Y29
         3U4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ya6XsWj9NJlCl87tgEzDyRyY4BP+TOaWrz6fIMrtsg0=;
        b=R5RsIpiP08FdHpWmWYcfIuBEpytPSJ9unB9833Bjye6isk+KBWZM+fR8NcM+tQZtZ6
         NCKC6CjQr4MczUVboyjm4xQ+QRe+mjMxgz/vaDruhmMqTR8QqfAaVrqmiSxQTkhHzDLi
         /riiCXwJaANGfasZ4bRT/4q6NfmADgPTuEzGd7I2W3CErsJLwoS91desZmRxZGLntMwL
         0lid1G7HEkODyKMYiNboQiZnI0aNSb5cZgQ4SkD71mSJvtg1+BaKLWALYE73Rn4Kydp4
         gfBlXfkTYiV4QsT1eAEQyRWCfPMMSTLV2RZQvoyEtVj1oamBq/14BFAHQL1QY30FUatw
         m6RQ==
X-Gm-Message-State: AGi0PubrtmyXRn1QDiHJiHjCucUs18a+epwvxdsLW9getBnO9l4/Qrix
        JRY1Udrxxiwc4gdtPABQ2Ca8
X-Google-Smtp-Source: APiQypKyVUSoA5hVmEgmvyZtMgtFGtP92aUvtJEdMPoBWsBbQf9V2HDKN8yBW0KQ1qIWyTVEL9UTVg==
X-Received: by 2002:a17:902:8a88:: with SMTP id p8mr8006943plo.134.1586067658497;
        Sat, 04 Apr 2020 23:20:58 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6e83:b2ab:75aa:fbdc:e9da:9d96])
        by smtp.gmail.com with ESMTPSA id a2sm9271081pja.44.2020.04.04.23.20.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Apr 2020 23:20:57 -0700 (PDT)
Date:   Sun, 5 Apr 2020 11:50:50 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Russell King <linux@armlinux.org.uk>,
        Alexander Shiyan <shc_work@mail.ru>,
        Lubomir Rintel <lkundrak@v3.sk>,
        linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/9] ARM: Remove redundant COMMON_CLK selects
Message-ID: <20200405062050.GA8912@Mani-XPS-13-9360>
References: <20200405025123.154688-1-sboyd@kernel.org>
 <20200405025123.154688-2-sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200405025123.154688-2-sboyd@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Apr 04, 2020 at 07:51:15PM -0700, Stephen Boyd wrote:
> The mulitplatform config already selects COMMON_CLK, so selecting it
> again is not useful. Remove these selects from ARM platforms that are
> part of the multiplatform build.
> 
> Cc: "Andreas Färber" <afaerber@suse.de>
> Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Alexander Shiyan <shc_work@mail.ru>
> Cc: Lubomir Rintel <lkundrak@v3.sk>
> Cc: <linux-arm-kernel@lists.infradead.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>

For Actions,

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  arch/arm/mach-actions/Kconfig  | 1 -
>  arch/arm/mach-clps711x/Kconfig | 1 -
>  arch/arm/mach-mmp/Kconfig      | 1 -
>  3 files changed, 3 deletions(-)
> 
> diff --git a/arch/arm/mach-actions/Kconfig b/arch/arm/mach-actions/Kconfig
> index b5e0ac965ec0..00fb4babccdd 100644
> --- a/arch/arm/mach-actions/Kconfig
> +++ b/arch/arm/mach-actions/Kconfig
> @@ -7,7 +7,6 @@ menuconfig ARCH_ACTIONS
>  	select ARM_GLOBAL_TIMER
>  	select CACHE_L2X0
>  	select CLKSRC_ARM_GLOBAL_TIMER_SCHED_CLOCK
> -	select COMMON_CLK
>  	select GENERIC_IRQ_CHIP
>  	select HAVE_ARM_SCU if SMP
>  	select HAVE_ARM_TWD if SMP
> diff --git a/arch/arm/mach-clps711x/Kconfig b/arch/arm/mach-clps711x/Kconfig
> index fc9188b54dd6..ba497a2032e9 100644
> --- a/arch/arm/mach-clps711x/Kconfig
> +++ b/arch/arm/mach-clps711x/Kconfig
> @@ -5,7 +5,6 @@ menuconfig ARCH_CLPS711X
>  	select AUTO_ZRELADDR
>  	select TIMER_OF
>  	select CLPS711X_TIMER
> -	select COMMON_CLK
>  	select CPU_ARM720T
>  	select GENERIC_CLOCKEVENTS
>  	select GPIOLIB
> diff --git a/arch/arm/mach-mmp/Kconfig b/arch/arm/mach-mmp/Kconfig
> index b58a03b18bde..6fe1550f43ec 100644
> --- a/arch/arm/mach-mmp/Kconfig
> +++ b/arch/arm/mach-mmp/Kconfig
> @@ -110,7 +110,6 @@ config MACH_MMP_DT
>  	depends on ARCH_MULTI_V5
>  	select PINCTRL
>  	select PINCTRL_SINGLE
> -	select COMMON_CLK
>  	select ARCH_HAS_RESET_CONTROLLER
>  	select CPU_MOHAWK
>  	help
> -- 
> Sent by a computer, using git, on the internet
> 

Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9BDC433EF
	for <linux-clk@archiver.kernel.org>; Fri,  1 Oct 2021 04:52:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 586DA61A57
	for <linux-clk@archiver.kernel.org>; Fri,  1 Oct 2021 04:52:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351900AbhJAEyj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Oct 2021 00:54:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351905AbhJAEyh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Oct 2021 00:54:37 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A09BC06176F
        for <linux-clk@vger.kernel.org>; Thu, 30 Sep 2021 21:52:54 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id qe4-20020a17090b4f8400b0019f663cfcd1so1947606pjb.1
        for <linux-clk@vger.kernel.org>; Thu, 30 Sep 2021 21:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T/qKUUlPcO5jBn9PHfjOxUZa++jNZ68/8dyyluYsQ6I=;
        b=SFpNgAz4vSiM3ARiDajcSQr0TKO05MfoSjhDEl0dNbBQ22GXNHs/Gbn0VIe/IZO1Gx
         0mvlSEcedN+B6RYvKpaM14aMTlqEBcWdHxScWUJHH6i1QgkVOt3BFpVGvjxVPlwTmp+c
         SwgN3MHeoql0HUhx567xi5JSb3O3w19km8Vy2PWg40AJym4NZEiyoeVr4BkCXrWm3Vfj
         aWS+EUcNCuTBz5pALK+u1qqjHh2W/fA8XGefyeEg7I2gD+Pil2CwA23pj2ZjIAWNiMCE
         YAp0c+wWHAQ988Su5ul5lIQ1unoxN0KvVrn+Fc4NnJpQmWY3NJV7XFpEP4+H2PIVIl60
         TlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T/qKUUlPcO5jBn9PHfjOxUZa++jNZ68/8dyyluYsQ6I=;
        b=I6UFeXJbYkvhd5KKYEJFfLC4yXPVDQCms82BpiD7DDWYPcUa+Gg3DI6y9B6H1hLO1R
         NgTgPc9Vo6HAeffZdy88xVr2y8Li3YCrT/pUqfj2pvVH5tr8WcGV6S1jQ8pX4sETjLwS
         BNj/5hXJAgcFEIslVAGzLUa7d9w5HSxkihd7mpoU7+YTETUvo3P2cmzrrrmlXSKy827I
         f67I23LNuEmWEbGKMlHKkenrx86yDk+5oUJcxh1WYJapOzlaYPs1zjN5k1rV8dnwfOl9
         KiAeQ+8gjBPMsGktT+x+dEISN+B3uxEauSWUG6vE2B+svhqU/QxlTT8XezUvU78C6KG7
         2A3Q==
X-Gm-Message-State: AOAM531LF5fkEFmC5o//LhPHr2Yr2d0KC/lqUhASYiE+nS+DH6oqtohF
        iJhztyvjM5ddGp8Us4gA1L1+6S1gd4yl4nIy+UD1dA==
X-Google-Smtp-Source: ABdhPJwyDuSYn50SoZKJeDGysebL1KegCUYgJzQ+N9q7lt7AKrkKENr4nKYZpsgIWpt+hHpR+FlO6CE3PbMOGP+MwLA=
X-Received: by 2002:a17:902:9a83:b0:13e:5b1e:aa40 with SMTP id
 w3-20020a1709029a8300b0013e5b1eaa40mr7732223plp.41.1633063973758; Thu, 30 Sep
 2021 21:52:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
In-Reply-To: <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Thu, 30 Sep 2021 21:52:42 -0700
Message-ID: <CAOesGMgSt_mYvRzF0rC=fnjMYGO9EX0_Ow2cD1d8XKLD5pHsZA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Will McVicker <willmcvicker@google.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
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
        Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Sep 29, 2021 at 12:48 PM Will McVicker <willmcvicker@google.com> wrote:
>
> On Wed, Sep 29, 2021 at 6:02 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
> >
> > On 29/09/2021 01:56, Will McVicker wrote:
> > > This is v2 of the series of patches that modularizes a number of core
> > > ARCH_EXYNOS drivers. Based off of the feedback from the v1 series, I have
> > > modularized all of the drivers that are removed from the ARCH_EXYNOS
> > > series of "select XXX". This includes setting the following configs as
> > > tristate:
> > >
> > >  * COMMON_CLK_SAMSUNG
> > >  * EXYNOS_ARM64_COMMON_CLK
> > >  * PINCTRL_SAMSUNG
> > >  * PINCTRL_EXYNOS
> > >  * EXYNOS_PMU_ARM64
> > >  * EXYNOS_PM_DOMAINS
> > >
> > > Additionally, it introduces the config EXYNOS_PMU_ARM64 and EXYNOS_PMU_ARM
> > > which was previously EXYNOS_PMU and EXYNOS_PMU_ARM_DRIVERS respectively.
> > > The reason for these new configs is because we are not able to easily
> > > modularize the ARMv7 PMU driver due to built-in arch dependencies on
> > > pmu_base_addr under arch/arm/mach-exynos/*. So the new configs split up
> > > the ARM and ARM64 portions into two separate configs.
> > >
> > > Overall, these drivers didn't require much refactoring and converted to
> > > modules relatively easily. However, due to my lack of exynos hardware, I
> > > was not able to boot test these changes. I'm mostly concerned about the
> > > CLK_OF_DECLARE() changes having dependencies on early timers. So I'm
> > > requesting help for testing these changes on the respective hardware.
> > >
> >
> > These are all not tested at all? In such case, since these are not
> > trivial changes, please mark the series as RFT.
> >
> > I will not be able to test these for some days, so it must wait.
> >
> >
> > Best regards,
> > Krzysztof
>
> +Cc Arnd and Olof,
>
> Hi Krzysztof,
>
> To avoid the scrambled conversation from the first patchset, I'm going
> to address all your general questions here in the cover letter thread
> so that it's easier for everyone to follow and reference in the
> future.

This patchset shouldn't go in.

GKI is a fantastic effort, since it finally seems like Google has the
backbone to put pressure on the vendors to upstream all their stuff.

This patcheset dilutes and undermines all of that by opening up a
truck-size loophole, reducing the impact of GKI, and overall removes
leverage to get vendors to do the right thing.

It's against our interest as a community to have this happen, since
there's no other reasonably justifiable reason to do this.


-Olof

Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FA2C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 09:12:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9722C238E7
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 09:12:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728381AbhAUJMg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Jan 2021 04:12:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728418AbhAUJMF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Jan 2021 04:12:05 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7516AC061794
        for <linux-clk@vger.kernel.org>; Thu, 21 Jan 2021 01:11:15 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id s11so1567628edd.5
        for <linux-clk@vger.kernel.org>; Thu, 21 Jan 2021 01:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WLXeWIIoAu3UvtfUefXR9qcSia3PjDVI/Fbc5zrav74=;
        b=L0WyjqaHw0/lRmseCIJJbm0McdMQpzOm/7kVIAnPv9TUdDWiA0dMSeUtNdBHKJD+3t
         r0JwbHmd5Z23dT9lioDVG2jgdlTOM1lnbmB4M7fNcvygWoRf8krfXnzPP0Bcz/z8YG9p
         FoDZz5hLYSFh1bTyeIepXRlh+VS5k0TBAaqcd4YWIaptS0i7CTeFPH8AveyFs/enFj1P
         OHCA72zAkf80LvVLIQqekwMPMD+DUJbmTNB00ALDKuauYkRB+TNZyk05sSSRqMcNgHrZ
         C2u//DcTUii2Oca69dD2DvQW8RLLX0XHRjaWUJsF6j0FEFs8BxSteQAwpCOBtdqdti64
         qMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WLXeWIIoAu3UvtfUefXR9qcSia3PjDVI/Fbc5zrav74=;
        b=D/AU/+u9Y/PWgvJ2WqjUmt8byf/qrxRNdJwNSE4Tjzlnv9Y2V15YQw7PzJILGcjaJJ
         FetvnYDKHKk625WmtL8IZMeWvX5v8xYq9uwWxbevVH1Wbm77CLFUgI607C06kxtPcmGr
         1RThJHoqYOn2SdoBKJp2XGxwoZAjQ63eGKYe3+UoFMAJ2QV9gZGfETVbZli5NZXtitjs
         b4bkQB652NqojWstGIJz7SV7bPOeQ8NDLNN6UE8WHjfLEs+6+Fbi3UjoebZsVnB1Ck0t
         iWgZMbMLz+cmA/quGdGgSyZbxwEtuV+45o5Wvmmxv4zansprKxhyTU3JxPBFbyt6jST2
         h+Xw==
X-Gm-Message-State: AOAM533W9KOmhR32K7CFur8sDjixAjg0vmfU4ax0+Tby27JpH/yi3TN1
        HjhbL4kB0QAlvDQ1loVp4MB8udiXryZs3Q7D24KTs2z6fuIjQf2I
X-Google-Smtp-Source: ABdhPJzCxyeIcXGOlc4+TBm6gMHiw/i/Y7fx9SBhhCx7//bBXwiSd+CK8jbzA4TdALgfZUw3o+e89xwXFxeHzE+WiQA=
X-Received: by 2002:aa7:c384:: with SMTP id k4mr10130943edq.23.1611220274094;
 Thu, 21 Jan 2021 01:11:14 -0800 (PST)
MIME-Version: 1.0
References: <17nqrn25-rp5s-4652-o5o1-72p2oprqpq90@onlyvoer.pbz>
In-Reply-To: <17nqrn25-rp5s-4652-o5o1-72p2oprqpq90@onlyvoer.pbz>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 21 Jan 2021 14:41:02 +0530
Message-ID: <CA+G9fYsyXsNSXGy6BWZ6mgpAP=+7r6Xy9jQ2xxb9mXyHdRoBCg@mail.gmail.com>
Subject: Re: [PATCH] PM / clk: make PM clock layer compatible with clocks that
 must sleep
To:     Nicolas Pitre <npitre@baylibre.com>
Cc:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Linux PM <linux-pm@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Nicolas,

On Tue, 5 Jan 2021 at 08:48, Nicolas Pitre <npitre@baylibre.com> wrote:
>
> The clock API splits its interface into sleepable ant atomic contexts:
>
> - clk_prepare/clk_unprepare for stuff that might sleep
>
> - clk_enable_clk_disable for anything that may be done in atomic context
>

<trim>

>
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
>
> diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_ops.c
> index ced6863a16..a62fb0f9b1 100644
> --- a/drivers/base/power/clock_ops.c
> +++ b/drivers/base/power/clock_ops.c

<trim>

> @@ -64,17 +166,20 @@ static void pm_clk_acquire(struct device *dev, struct pm_clock_entry *ce)
>                 ce->clk = clk_get(dev, ce->con_id);
>         if (IS_ERR(ce->clk)) {
>                 ce->status = PCE_STATUS_ERROR;
> +               return;
> +       } else if (clk_is_enabled_when_prepared(ce->clk)) {

arm-linux-gnueabihf-ld: drivers/base/power/clock_ops.o: in function
`pm_clk_acquire':
drivers/base/power/clock_ops.c:170: undefined reference to
`clk_is_enabled_when_prepared'

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

This build error was noticed on arm architecture on linux next 20210121 tag.
Following builds failed.
 - arm (omap1_defconfig) with clang-10 - FAILED
 - arm (omap1_defconfig) with clang-11 - FAILED

 - arm (omap1_defconfig) with gcc-8 - FAILED
 - arm (omap1_defconfig) with gcc-9 - FAILED
 - arm (omap1_defconfig) with gcc-10 - FAILED

Steps to reproduce:
---------------------------
1)

# TuxMake is a command line tool and Python library that provides
# portable and repeatable Linux kernel builds across a variety of
# architectures, toolchains, kernel configurations, and make targets.
#
# TuxMake supports the concept of runtimes.
# See https://docs.tuxmake.org/runtimes/, for that to work it requires
# that you install podman or docker on your system.
#
# To install tuxmake on your system globally:
# sudo pip3 install -U tuxmake
#
# See https://docs.tuxmake.org/ for complete documentation.

tuxmake --runtime docker --target-arch arm --toolchain gcc-8 --kconfig
omap1_defconfig

2)
tuxbuild build --git-repo
https://gitlab.com/Linaro/lkft/mirrors/next/linux-next --git-sha
bc085f8fc88fc16796c9f2364e2bfb3fef305cad --target-arch arm --toolchain
gcc-8 --kconfig omap1_defconfig

-- 
Linaro LKFT
https://lkft.linaro.org

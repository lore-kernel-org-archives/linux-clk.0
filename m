Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09EEDC433E0
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 12:11:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A37272395A
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 12:11:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730048AbhAUMLD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Jan 2021 07:11:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729802AbhAUMKf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Jan 2021 07:10:35 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 836A5C061575
        for <linux-clk@vger.kernel.org>; Thu, 21 Jan 2021 04:09:52 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id gx5so2254248ejb.7
        for <linux-clk@vger.kernel.org>; Thu, 21 Jan 2021 04:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PN3btH2euqDWyhj/RgcRNFuB9aKArS6y5Lw17W2vYDw=;
        b=IgbtXQTlXCqlMx1bhQT61oVPyORIlcntQML0JND/eFe+uUvSN5sY1aXbkodkKJCWaL
         K8kIf0LbHE0ZkQzfc5e4CNqDfn2Qbn5xdlHcU0XS4CGLp8hSJZjmF5fAsHA1BRG172K4
         Z+YDVEXIqaYY+cFgY//pVpftKSH/OYHJiwCSgA8Jj9fyufeNDQQ7JhhQqfxQA7FrPC7U
         4D2//SjPqoK5PRE3E7WVgDSSreA8+JTGPYbyeHJJmr9vxGI5IM0ud9Hncuotj9gMI9We
         zu+lsj/iJBcgzUo4DljRo9Jc0Tat5+a3sFh/hXFfREWFhUfkwNOYkDZ8Ze7aoklspji3
         xLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PN3btH2euqDWyhj/RgcRNFuB9aKArS6y5Lw17W2vYDw=;
        b=rsVk8y25U4IZwJBAX+EiMQjWU/Mt05DPhdbxkEr7URMmwv5/zCV77cKha1kXOUfwXV
         O+j+58i6QvuNOaDC3B/VJi5n7pt6Uv8ro1Xns7Gly4WWGUc1YO6UQlDKWiZ7wnsn/SWv
         0cg4QO/ZCSgAA3ekVXaugq+t+XzaWMHLH5Zumrt8DTNAkBCVydFSPJzdfy8NfRR6g3d7
         bkBB/B6RXuiWMssLAJpuYMXrVLmwpFJXmZveyIt/t+BtG/tb7EeFuA2EYK2Kz6aGNT/P
         QuGSR2SG3Lj80QllCNN5AdQmF1MN/ANpIphb2Lvtgz42PU/xnZ1gxw0pXvoIfmRD8Eqd
         OnIw==
X-Gm-Message-State: AOAM531V3TBe3U+1Ycz1UHeN4jkwryMsI+rp5lrdqobWYKqyHole3pn3
        WXd6IjkS4PjY+B/jsIASHW2VwTcw070VDKdVkpybfLKF1GcLJjY5
X-Google-Smtp-Source: ABdhPJzTY9DkBjOJ9FCRi7TMtReV9fqcjGv4rohvAiFeHBoODFkHjE9QiHmMHZBcFgBuQcn6aCZ0pbxKF4S16PGwwDg=
X-Received: by 2002:a17:906:4c85:: with SMTP id q5mr8849525eju.375.1611230991153;
 Thu, 21 Jan 2021 04:09:51 -0800 (PST)
MIME-Version: 1.0
References: <17nqrn25-rp5s-4652-o5o1-72p2oprqpq90@onlyvoer.pbz>
 <CA+G9fYsyXsNSXGy6BWZ6mgpAP=+7r6Xy9jQ2xxb9mXyHdRoBCg@mail.gmail.com> <CAMuHMdULW4bnb0Jc0+ZaF9P2VNgnYsvEks7y8WYCk045BHqh7A@mail.gmail.com>
In-Reply-To: <CAMuHMdULW4bnb0Jc0+ZaF9P2VNgnYsvEks7y8WYCk045BHqh7A@mail.gmail.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 21 Jan 2021 17:39:39 +0530
Message-ID: <CA+G9fYvh0iSyEDQs7+0CX82FLPDCg5UmAt+1JuPsndmfmYF3kw@mail.gmail.com>
Subject: Re: [PATCH] PM / clk: make PM clock layer compatible with clocks that
 must sleep
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Nicolas Pitre <npitre@baylibre.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
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

On Thu, 21 Jan 2021 at 16:28, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> On Thu, Jan 21, 2021 at 10:13 AM Naresh Kamboju
> <naresh.kamboju@linaro.org> wrote:
> > On Tue, 5 Jan 2021 at 08:48, Nicolas Pitre <npitre@baylibre.com> wrote:
> > >
> > > The clock API splits its interface into sleepable ant atomic contexts:
> > >
> > > - clk_prepare/clk_unprepare for stuff that might sleep
> > >
> > > - clk_enable_clk_disable for anything that may be done in atomic context
> > >
> >
> > <trim>
> >
> > >
> > > Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> > >
> > > diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_ops.c
> > > index ced6863a16..a62fb0f9b1 100644
> > > --- a/drivers/base/power/clock_ops.c
> > > +++ b/drivers/base/power/clock_ops.c
> >
> > <trim>
> >
> > > @@ -64,17 +166,20 @@ static void pm_clk_acquire(struct device *dev, struct pm_clock_entry *ce)
> > >                 ce->clk = clk_get(dev, ce->con_id);
> > >         if (IS_ERR(ce->clk)) {
> > >                 ce->status = PCE_STATUS_ERROR;
> > > +               return;
> > > +       } else if (clk_is_enabled_when_prepared(ce->clk)) {
> >
> > arm-linux-gnueabihf-ld: drivers/base/power/clock_ops.o: in function
> > `pm_clk_acquire':
> > drivers/base/power/clock_ops.c:170: undefined reference to
> > `clk_is_enabled_when_prepared'
> >
> > Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> >
> > This build error was noticed on arm architecture on linux next 20210121 tag.
> > Following builds failed.
> >  - arm (omap1_defconfig) with clang-10 - FAILED
> >  - arm (omap1_defconfig) with clang-11 - FAILED
> >
> >  - arm (omap1_defconfig) with gcc-8 - FAILED
> >  - arm (omap1_defconfig) with gcc-9 - FAILED
> >  - arm (omap1_defconfig) with gcc-10 - FAILED
>
> Missing dummy clk_is_enabled_when_prepared() for the
> !CONFIG_HAVE_CLK case?

I see these configs enabled in failed builds config file,

CONFIG_HAVE_CLK=y
CONFIG_CLKDEV_LOOKUP=y
CONFIG_HAVE_LEGACY_CLK=y

ref:
https://builds.tuxbuild.com/1nN0vkpNP4qhvIuIJN12j7tTpQs/

- Naresh

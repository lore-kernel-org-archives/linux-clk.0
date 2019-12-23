Return-Path: <SRS0=2Ll0=2N=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F2C2C2D0C0
	for <linux-clk@archiver.kernel.org>; Mon, 23 Dec 2019 16:26:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4B21C2073A
	for <linux-clk@archiver.kernel.org>; Mon, 23 Dec 2019 16:26:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u0m+N1gZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726824AbfLWQ0I (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Dec 2019 11:26:08 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:47011 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726744AbfLWQ0H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Dec 2019 11:26:07 -0500
Received: by mail-lf1-f67.google.com with SMTP id f15so13014617lfl.13
        for <linux-clk@vger.kernel.org>; Mon, 23 Dec 2019 08:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xgjTeEG260m1CCCVRdrYw5FNp+3UxoH+k/l83TrvmvU=;
        b=u0m+N1gZrcN0OIaSt7XejzRaxrKSq3A+l18IIo4YF9a40pgVgGwfpifiNNMDANL5m5
         TntBQ+CwVxMzWKl9qARDuIydMO1WWsbzA5+vP5cV/3Kn3w0dpLRqLQtCgmFiIuVJ6Q+z
         u2C9n0rbJ9nXTyDpBMkZSoq1sxGC/9k4bB3EdzhS77qN/47uBjqdMsu61YB1IEmdO2BJ
         8B9QtEg9CiLB1uSzwkLOjWfZGgBiL9zaOojOEEDeZhDGFA1CRsMqJJ+j3kNSidJTOysS
         JuNB5K4iBDNUHNrsBGD+a4XiLqElQdkgD/j7lKVvXQKlI9B7C5L2pbDOHZ4rPS16nOPB
         6Xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xgjTeEG260m1CCCVRdrYw5FNp+3UxoH+k/l83TrvmvU=;
        b=r4F2+U2IWuQyqUPLsolJ9+DY9kZAVioiWuES18qOt+IPVacQMZv2Wwtewgvn3wSaxq
         JiTDc/ELkaeQkumVJWK2eDrzEGgTv2R8YDeJC2yzxXoZAekanRX0Eehryt8GvalDZ5Xg
         gNmX945nDfB9v5yqLAwYdpsv9TO1g17xO9yjGwq+YXK6AM41FIVN8TQFC/sKXtgOKHMO
         b49zCU0KP+hatWjx4HhUSeILkw5TPLXXlKfPFrVpTyhkMDA7k0YpTX9ZB0qd13Cf5u9y
         5dPAikDSu7gaYXzwji3lws/os6fM5Gpfm6dTNoyN0AH4voSuXEokXjO9c4kTM+Bpt2l7
         7rDw==
X-Gm-Message-State: APjAAAVnWcKmNMb51bS9HBeHj2BYzGFJ73KH4+eWwchdmbyGyQFVTY2X
        9WqAumvfG6DOvouZtfROdzQ/nqTFMwhH/uGCBbNOtA==
X-Google-Smtp-Source: APXvYqwOrb8+7qCguo3qsfr/QdizG5j7KbjqE0dDclRcaasBiQY8ghSg1jvs2xY3EV1ILYhlVbOcREA+n3SoPkaZHEE=
X-Received: by 2002:a19:c0b:: with SMTP id 11mr17638945lfm.135.1577118364685;
 Mon, 23 Dec 2019 08:26:04 -0800 (PST)
MIME-Version: 1.0
References: <20191222202928.14142-1-linus.walleij@linaro.org>
 <CACRpkdaE1T6yt4u5uO+SZB18KjrVp2_4Qd9gr_aN0v5GTJ2VGw@mail.gmail.com> <CAPDyKFrYZ3UHAaBdkO9+R+19hEp4yecgdxP=OzWD=VRJ1G4bEw@mail.gmail.com>
In-Reply-To: <CAPDyKFrYZ3UHAaBdkO9+R+19hEp4yecgdxP=OzWD=VRJ1G4bEw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 23 Dec 2019 17:25:53 +0100
Message-ID: <CACRpkdYvkwP6U6BtOF22yGUQtF45YR39M7TaFEZ4A=D0h4BBdw@mail.gmail.com>
Subject: Re: [PATCH] clk: ux500: Initialize DSI clocks before registering
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Viresh Kumar <vireshk@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Dec 23, 2019 at 10:16 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Sun, 22 Dec 2019 at 22:46, Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Sun, Dec 22, 2019 at 9:29 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > > The DSI clocks need to be initialized properly and cannot
> > > rely on boot defaults, this is especially important for the
> > > U8420 SYSCLK variant of the PRCMU firmware which requires
> > > that you poke these registers right before trying to use
> > > the HS DSI clock. Some vital setup such as the PRCM_TVCLK_MGT
> > > register will not happen unless we call this making some
> > > displays fail to work on the U8420.
> > >
> > > Cc: Ulf Hansson <ulf.hansson@linaro.org>
> > > Cc: Stephan Gerhold <stephan@gerhold.net>
> > > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Sorry I got lost in the macros for CLK_MGT_ENTRY
> > that does poke these registers including PRCM_TVCLK_MGT.
> >
> > I need to figure out what is actually going wrong with the
> > DSI clocks here.
>
> In the downstream kernel, I authored a patch that added a new per
> clock config flag "CLK_BOOT_NOGATE", which was set for DSI clocks and
> its friends. If this flag was set, the clock was prevented from being
> unprepared/disabled by the common clock core, even if unused.
>
> This was only needed during the boot process, when the bootloaders
> have turned on the clock, HW wise. As then those needed to stay on,
> else things would break, in one way or the other.

What I'm seeing after some tests is that the boot loader
(splash screen) sets PRCMU_DSI0ESCCLK to 9600000
(9.6MHz) and if I try to switch that to 19.2 MHz which the
component should be fine with (and a vendor kernel
is using it) things bug up.

A workaround that works is to set the clock to 9.6MHz
so it matches what the boot loader splash set it to,
the display works fine if I do this.

From what I can see the problem is maybe that the clock
framework is trying to re-initialize a PRCMU clock that was
already turned on, but I haven't looked closer.

Do you think that it could possibly be that the problem isn't
really that of disabling the clock, but actually that the code
re-enables a clock that is already enabled?

I.e. to switch the frequency of this clock we need to go
through a disable/set_rate/enable sequence, but as it is
now, we will issue set_rate() on a clock that is already
enabled, just that the framework isn't aware that is is
already enabled?

I.e. we would need something like regulator-boot-on
but for clocks, clock-boot-on;?

Yours,
Linus Walleij

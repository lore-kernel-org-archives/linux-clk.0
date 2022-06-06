Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA1EBC43334
	for <linux-clk@archiver.kernel.org>; Mon,  6 Jun 2022 06:09:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbiFFGJE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Jun 2022 02:09:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbiFFGJB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Jun 2022 02:09:01 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2B3D13F7D
        for <linux-clk@vger.kernel.org>; Sun,  5 Jun 2022 23:08:56 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id j6so11893738pfe.13
        for <linux-clk@vger.kernel.org>; Sun, 05 Jun 2022 23:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6k+dFc6Nvtrf/Msfd6+QxAADjHPGiS46041UYSZkIZk=;
        b=dxW5cCP1FrLBb9/TgPfH8DwjCuNLncZFxzqKunOy/zK6kbVHN4A3mkOf8Jck6fIwQk
         8t8q/V1iaQDYb6KqSKt1cCF8j4ZMBkeuJDkayx5qMQQgZyY6u2GhSuj/7NLjn5aUsGuf
         V4MA5v6r3orwM03Ru0u7BkMfS3b0InBPeYdxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6k+dFc6Nvtrf/Msfd6+QxAADjHPGiS46041UYSZkIZk=;
        b=lkHlqAaBdftsvViaf3AuSin4KkubHXInI8G2h8iLPMNbQYYr2/DVwxFkM2nqcCoXIl
         rFRI8JeYArcYJtbd1Teo6oykHiDXDwkqGMK0lh/UyAH90p2OWfesZizlS1uGgDTiDGgl
         ll/Hb/aN+Rsil6lGlRhRIQoCZ8UjBIe/eNFC+qeSlsGLK9QzWI6xjIdm2FIIb/6rL4TT
         gok5efzRgWHtEEDzEiQIyR+rQxcOJagj7ENJ1O0plTfq5rAwl0VEP9uao/LpufSYWboh
         xIkchEodLnvk+PomzL2HKqBC3eF6FTAW+1awmyh4a86kpq0HXzXCWf/qot6qJDhaYMeu
         qtXg==
X-Gm-Message-State: AOAM532IbnjAphIIyg0SslAAuIdZIfg3gDiAh1xE0e7GYo4D5RNbzkU2
        GCoFGELPNaVzBSTjjGGLZ7iFyYcBdakpOjpQKfWdlg==
X-Google-Smtp-Source: ABdhPJw9xSkNh+h+Vtbm/VSYma4/+gWmuvUVLv/xA+IhtOU0VNhBKtivOv4H2UfyOonUTfJfE/mvTCwzQk8h7UkWgPc=
X-Received: by 2002:a63:5610:0:b0:3f2:7e19:1697 with SMTP id
 k16-20020a635610000000b003f27e191697mr19540118pgb.74.1654495736443; Sun, 05
 Jun 2022 23:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220605165703.1565234-1-michael@amarulasolutions.com>
 <20220605165703.1565234-3-michael@amarulasolutions.com> <5f34b6d6-c2dd-44f9-c1bc-fe1deb336334@gmail.com>
In-Reply-To: <5f34b6d6-c2dd-44f9-c1bc-fe1deb336334@gmail.com>
From:   Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date:   Mon, 6 Jun 2022 08:08:45 +0200
Message-ID: <CAOf5uwn6_Tuh-r+8HpthMRDYYc50OnXp4m5TQi49heknfV5yWQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] clk: bd718x7: Enable the possibility to mark the
 clock as critical
To:     Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        linux-amarula@amarulasolutions.com, Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi

On Mon, Jun 6, 2022 at 7:26 AM Matti Vaittinen <mazziesaccount@gmail.com> wrote:
>
> Hi Michael,
>
> On 6/5/22 19:57, Michael Trimarchi wrote:
> > If the clock is used to generate the osc_32k, we need to mark
> > as critical. clock-critical has no binding description at the moment
> > but it's defined in linux kernel
> >
> > bd71847: pmic@4b {
> > ...
> >       rohm,reset-snvs-powered;
> >
> >       #clock-cells = <0>;
> >       clock-critical = <1>;
> >       clocks = <&osc_32k 0>;
> >       clock-output-names = "clk-32k-out";
> > ...
> > }
> >
> > Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> > ---
> >   drivers/clk/clk-bd718x7.c | 4 ++++
>
> //snip
>
> > @@ -100,6 +101,9 @@ static int bd71837_clk_probe(struct platform_device *pdev)
> >
> >       parent_clk = of_clk_get_parent_name(parent->of_node, 0);
> >
> > +     of_clk_detect_critical(dev->of_node, 0, &flags);
>
> Purely judging the kerneldoc for of_clk_detect_critical - you may have
> hard time getting this accepted.
>

This is the reason for RFC. I have already seen the usage of this in

ainline/master:drivers/clk/st/clk-flexgen.c:
of_clk_detect_critical(np, i, &flex_flags);
mainline/master:drivers/clk/st/clkgen-fsyn.c:
of_clk_detect_critical(np, fschan, &flags);
mainline/master:drivers/clk/st/clkgen-pll.c:
of_clk_detect_critical(np, 0, &pll_flags);
mainline/master:drivers/clk/st/clkgen-pll.c:
of_clk_detect_critical(np, odf, &odf_flags);

> I think you're working on a very valid problem though. Maybe you could
> see if you could align your effort with Marek?
>
> https://lore.kernel.org/all/20220517235919.200375-1-marex@denx.de/T/#m52d6d0831bf43d5f293e35cb27f3021f278d0564
>

I have seen the Marek patcheset now. I don't know if they works anyway
for a clock that is a part of MFD controller

Michael

> Best Regards
>         -- Matti
>
> --
> Matti Vaittinen
> Linux kernel developer at ROHM Semiconductors
> Oulu Finland
>
> ~~ When things go utterly wrong vim users can always type :help! ~~
>
> Discuss - Estimate - Plan - Report and finally accomplish this:
> void do_work(int time) __attribute__ ((const));



-- 
Michael Nazzareno Trimarchi
Co-Founder & Chief Executive Officer
M. +39 347 913 2170
michael@amarulasolutions.com
__________________________________

Amarula Solutions BV
Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
T. +31 (0)85 111 9172
info@amarulasolutions.com
www.amarulasolutions.com

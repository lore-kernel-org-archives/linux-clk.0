Return-Path: <SRS0=2Ll0=2N=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D993C2D0C0
	for <linux-clk@archiver.kernel.org>; Mon, 23 Dec 2019 09:16:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 10A8020709
	for <linux-clk@archiver.kernel.org>; Mon, 23 Dec 2019 09:16:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VngA5zq9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725974AbfLWJQj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Dec 2019 04:16:39 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:33999 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbfLWJQj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Dec 2019 04:16:39 -0500
Received: by mail-ua1-f65.google.com with SMTP id 1so5427605uao.1
        for <linux-clk@vger.kernel.org>; Mon, 23 Dec 2019 01:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dPsGFUM6RohQ0juW2QBcS4PzJMx1ZZfd3P3MRLSiEoc=;
        b=VngA5zq9FNMmF/gHOEniE6qSPGHMjfljMLr77mxN+wu/+hxCL/aiE6We7e3JDM1/E0
         HWiEUMZhW+Ru3yq/GDP4mbwKVJABrUChgG1QTBBfjjPNbiYM5Zjlnft/Niz5/dpoZ0N+
         12KZ1pWx8s09GZs1lsWZV937w9norR3hf5jfU9iyFfh+NKe+1SlRxvAy4UzzeoIjfJzY
         u25ziPwYBd281gDngf/ottBj+rhCY7sjPLhK0rqHhmhExk4siJS9uZa46LWBLQRSadpq
         xc4Iz3ppZK45lhKDYgQStbL662W2TuD6w1l6WhyKQLXmOFtwe7xUHjuLTyiuXtp2crA7
         mrmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dPsGFUM6RohQ0juW2QBcS4PzJMx1ZZfd3P3MRLSiEoc=;
        b=j1U2h/SdKngZg3ymtxtL66XBXGro0N10gFab9lQAs1ls2SNMIe9eP+9H83or+6gxc/
         Dj7FWvDD5zsuYeo+6wkBwA7swPnixkuUxR+ROPVNoWjy3rAMkX02PKf+knvXqMZ7EeaZ
         kE+YuhxZbtOr0JubIldA4KZoztvoqQc0RpJXW8C700Oq0UjU8P5n/loyu4beMCrzfpO6
         jsLhDpLqyeJI/6oVUhoCmYV9AOotw4oX8W1CrXgdqcVqpWyJ4Q5i7r0ZaPAEsfvRvKfj
         BEcN7P0p8UD8u5q5TqJLW+4Fna+eEBhaBhChF/AQOwYb1CUDyFCS4bcYiPzrKneWiQc3
         lTHg==
X-Gm-Message-State: APjAAAUlmAda/CsEJFZUErhSYwb8kAz3OdUEw4HMsIgW+pgzPBUEbCyo
        8D8v63W5AnrNsBsoW4ZURw6wAAIWeIdkQpbzB/2zPCz5lwc=
X-Google-Smtp-Source: APXvYqz27Jyv1K3ZwJapRg/PM5SNiuCDXuZ7PpbVpzhVWZI8nN7ELxDNdNiot7oUN7XzYn+2vhvIQyHRgJ9mPQIXXTs=
X-Received: by 2002:ab0:6894:: with SMTP id t20mr17645319uar.100.1577092598410;
 Mon, 23 Dec 2019 01:16:38 -0800 (PST)
MIME-Version: 1.0
References: <20191222202928.14142-1-linus.walleij@linaro.org> <CACRpkdaE1T6yt4u5uO+SZB18KjrVp2_4Qd9gr_aN0v5GTJ2VGw@mail.gmail.com>
In-Reply-To: <CACRpkdaE1T6yt4u5uO+SZB18KjrVp2_4Qd9gr_aN0v5GTJ2VGw@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 23 Dec 2019 10:16:02 +0100
Message-ID: <CAPDyKFrYZ3UHAaBdkO9+R+19hEp4yecgdxP=OzWD=VRJ1G4bEw@mail.gmail.com>
Subject: Re: [PATCH] clk: ux500: Initialize DSI clocks before registering
To:     Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

+ Viresh

On Sun, 22 Dec 2019 at 22:46, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Sun, Dec 22, 2019 at 9:29 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > The DSI clocks need to be initialized properly and cannot
> > rely on boot defaults, this is especially important for the
> > U8420 SYSCLK variant of the PRCMU firmware which requires
> > that you poke these registers right before trying to use
> > the HS DSI clock. Some vital setup such as the PRCM_TVCLK_MGT
> > register will not happen unless we call this making some
> > displays fail to work on the U8420.
> >
> > Cc: Ulf Hansson <ulf.hansson@linaro.org>
> > Cc: Stephan Gerhold <stephan@gerhold.net>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Sorry I got lost in the macros for CLK_MGT_ENTRY
> that does poke these registers including PRCM_TVCLK_MGT.
>
> I need to figure out what is actually going wrong with the
> DSI clocks here.

In the downstream kernel, I authored a patch that added a new per
clock config flag "CLK_BOOT_NOGATE", which was set for DSI clocks and
its friends. If this flag was set, the clock was prevented from being
unprepared/disabled by the common clock core, even if unused.

This was only needed during the boot process, when the bootloaders
have turned on the clock, HW wise. As then those needed to stay on,
else things would break, in one way or the other.

I looked at using CLK_IGNORE_UNUSED, but it doesn't help, when there
is another leaf clock using the same parent as the DSI clock (or
something along those lines). In principle, all "unused" clocks can
become disabled/unprepared, way before the late_initcall
clk_disable_unused() get called - if there is a leaf clock being
disabled.

Finally, to allow clocks that had the new CLK_BOOT_NOGATE flag set, to
be unprepared/disabled after boot, the flag was cleared for all clocks
in the path of the late_initcall path clk_disable_unused().

I can quickly re-base and submit these patches, if you like, but I am
guessing the clk maintainers may object to it, but I don't know.

That said, maybe the suggested "Boot constraint framework" [1], that
has been worked on by Viresh, is the proper solution for this.

Hope this helps!

Kind regards
Uffe

[1]
https://lore.kernel.org/lkml/cover.1519380923.git.viresh.kumar@linaro.org/

Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D3FC433DB
	for <linux-clk@archiver.kernel.org>; Wed, 10 Feb 2021 09:00:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8FD7964E57
	for <linux-clk@archiver.kernel.org>; Wed, 10 Feb 2021 09:00:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbhBJJAG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Feb 2021 04:00:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229654AbhBJI6X (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Feb 2021 03:58:23 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4FFCC061797
        for <linux-clk@vger.kernel.org>; Wed, 10 Feb 2021 00:57:42 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id v5so1272678ybi.3
        for <linux-clk@vger.kernel.org>; Wed, 10 Feb 2021 00:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=scQxYmOayJCxqkipRzwelnP3rgLpOPfi6yQE0CFXGt4=;
        b=utTRInOHf3wQQ00lEAy1Z2+9ZobAOBBGx521gTAelNYmRux98OKP3mYkpB2VIv4rhu
         eaNKY1BPoFuCI5p4yvT9++SJD96CaemRtREOq+kRoYJzJTvc7kWmCuAtcR6XYs0SMqfu
         4pkGc0J2OOD3fya+hvQuyFPz75AcAtZyfxhg/PbM+f2+0xneQIy8zkycVkb8HXqdNbwp
         /uyUnQGTkHhvPrUWmMJBGDcodx2I5KnDaLJNQGevtjrhx8Ul/Ko/K6KvS840pgmW3OBu
         En9qmpmldZRsTFwfYsNuikYr4dbPeWUPSnMKRd5CyvZKMB6eLwO6YiIffPKHBRlvmEGc
         z2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=scQxYmOayJCxqkipRzwelnP3rgLpOPfi6yQE0CFXGt4=;
        b=unThV4Lvej0wIhLGl90272tCsVZoaoS9vVl0FLiLrmuBO9FgX4qtmZ8DTa4YMn5/v3
         zZMawE1w4YbPvVt9KYTUErOyLBE9EhzdmAB7QUSNjhfNYGNe+W33fcH/LPhGTBgL7gH6
         Gvc91IXsZ5Vw0/xxvAwPpQte+xYfbXK6iOZlysHMG7cK95i2I7x6k7b2rA9v5sSICAeN
         5cUgt8YOC/U3l4xO83rCn96ckFCHXNGcVMHqHGSX65onfUYxK4ua0IzEcGnZWzIlo4o8
         sPdYdGVLpd1hzkQjpmd9Ujk54jczJKkybSF6e9vDrBhF5XFpFr8XEMrAN4bOLstUjOPu
         66GA==
X-Gm-Message-State: AOAM532nIQN7qbVrzP1562Hs5urxbAsmhbiBHh8eoNTM6QtRudEUVP2b
        eXZqec6rN1ilJ+9XXvYHIAhD7lfm2PTpUhRom9UByA==
X-Google-Smtp-Source: ABdhPJxmdcX25D9QXynwwn3GLgSJQ5DB2UMZPW8Naso2HcGTGdXytGeNWdkXJrkvGO56BGI3Ar59udSOpqSh1jr83po=
X-Received: by 2002:a25:af0b:: with SMTP id a11mr2711250ybh.228.1612947461913;
 Wed, 10 Feb 2021 00:57:41 -0800 (PST)
MIME-Version: 1.0
References: <20210203154332.470587-1-tudor.ambarus@microchip.com>
 <5bc4f5b7-5370-bdd5-143e-429c83447ce1@microchip.com> <161291845517.418021.17378265940034341908@swboyd.mtv.corp.google.com>
 <CAGETcx9fjRhNmEMF2QoerrzGctC6MMTy+_znVTgPEm1w-+ehqA@mail.gmail.com> <CAMuHMdWBZq8n6-8e-GYEEs0V9ZW--CSDCs=+u_bkr=aRW4y=ZA@mail.gmail.com>
In-Reply-To: <CAMuHMdWBZq8n6-8e-GYEEs0V9ZW--CSDCs=+u_bkr=aRW4y=ZA@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 10 Feb 2021 00:57:06 -0800
Message-ID: <CAGETcx--6Pm=KfgFi50Dzin0+760nd-t9w9VxZxcn2Che-G1nQ@mail.gmail.com>
Subject: Re: [PATCH] clk: at91: Fix the declaration of the clocks
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Ludovic Desroches <Ludovic.Desroches@microchip.com>,
        Nicolas Ferre <Nicolas.Ferre@microchip.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        mirq-linux@rere.qmqm.pl,
        Claudiu Beznea <Claudiu.Beznea@microchip.com>,
        a.fatoum@pengutronix.de, Krzysztof Kozlowski <krzk@kernel.org>,
        Codrin.Ciubotariu@microchip.com,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Feb 10, 2021 at 12:51 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Saravana,
>
> On Wed, Feb 10, 2021 at 1:57 AM Saravana Kannan <saravanak@google.com> wrote:
> > On Tue, Feb 9, 2021 at 4:54 PM Stephen Boyd <sboyd@kernel.org> wrote:
> > > Quoting Tudor.Ambarus@microchip.com (2021-02-08 01:49:45)
> > > > Do you plan to take this patch for v5.12?
> > > > If fw_devlink will remain set to ON for v5.12, some of our boards will
> > > > no longer boot without this patch.
> > >
> > > Is fw_devlink defaulted to on for v5.12?
> >
> > Yes.
>
> Have all issues been identified and understood?
> Have all issues been fixed, reviewed, and committed?
> Have all fixes entered linux-next?
> Have all fixes been migrated from submaintainers to maintainers?

I'm hoping Tudor has reported and the fixes that have gone in so far
addressed all his issues. Otherwise, they need to be reported so we
can fix them.

As of now, there's no pending fix that hasn't landed in maintainer
trees. So that's good.

-Saravana

>
> We're already at v5.11-rc7.
> Yes, we can get fixes into v5.12-rc7. Or v5.12-rc9...
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

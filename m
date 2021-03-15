Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4536C433E0
	for <linux-clk@archiver.kernel.org>; Mon, 15 Mar 2021 10:38:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90A2C64E12
	for <linux-clk@archiver.kernel.org>; Mon, 15 Mar 2021 10:38:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbhCOKhw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Mar 2021 06:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbhCOKh3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Mar 2021 06:37:29 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A917AC061574
        for <linux-clk@vger.kernel.org>; Mon, 15 Mar 2021 03:37:22 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id w65so33989048oie.7
        for <linux-clk@vger.kernel.org>; Mon, 15 Mar 2021 03:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tIUHHAcenroIvEJpuHJ1N4B0p9LpB+3EpzvdK6uZHLU=;
        b=VGCY1RrIQYA5o3kWefVDDAUInCKUd5fUF7S7yIkmUCScOL4fCVxtGkF2VqavDMvDA+
         g8dAAeFZcU9pdWS2pB7M0PBQi/QOjsjSQWcNA6CqNFvQoJkT4Ze9kP8lNd8THw/zfcco
         i5F0YcGH32pTi+PV3ffOTB4Nhg7pXZ3aBph6sPzcnawxm/x0zE24VyVLJyOtjEJEpJ0F
         qhqbpP7iHb6wxR1+JEZdn7a3mCtqmSSxZlRZTABbdGVefHuX3406oQ+dUxBye0oeZrzz
         LnV8BRv4vKjK3+1YR2RT2Rt36EcedPWKokmGTgiUB3imQVkP9DcVIHPyLaGr9BSgN679
         vmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tIUHHAcenroIvEJpuHJ1N4B0p9LpB+3EpzvdK6uZHLU=;
        b=h+iHUiDDs/aC1DLnHWui2FkYPdQr5zWll3cyeYIiq4i69IRRnx19AuBfKGYLJWg1IS
         Gk9rEhV3GR5XhcPeiSBCAoHwVKkgNYnTG14n1rWdB69q9tRflUj/YsfJpTurdcXHTY5d
         Bnu3wRDwQMcLzgwy8rzLSEjd4YDvYiPUczG5fNvNU68dd72HywOCkRYkq7VlQ3gRg2gx
         wNwnOQY0iMBV2L9VKxWooZRJESp+EZ8JpYsSw/mNIHsTsHajyyoAKgbtRlrM4OK303Dh
         W+ZK8wwnBYZEZ1P5T6X/vMW4J+O4QNG6eMOnMBhOC2as9k87HFSR2y9NjuCq111C5b4p
         Oe1g==
X-Gm-Message-State: AOAM533dXX4PRxKqNzfW5GHeX1YrE3WR7/K2mGgmgkOBk8by5qy0Q9fR
        n2zIcLKaGhM8T3U+pzRVbc8YAqGrEbxXw2yO7hO6
X-Google-Smtp-Source: ABdhPJxN7o2lXkx5VKrXXZnd48Qa7/xX8hgLPXmPPr0e3Cv22aAUthVSzJxQeo5WwDaPLYqpCDoTJK0hdXALXyRw0qk=
X-Received: by 2002:a05:6808:b14:: with SMTP id s20mr18746791oij.164.1615804642020;
 Mon, 15 Mar 2021 03:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210305191307.15915-1-lb@semihalf.com> <161566785522.1478170.3268340283624516294@swboyd.mtv.corp.google.com>
In-Reply-To: <161566785522.1478170.3268340283624516294@swboyd.mtv.corp.google.com>
From:   =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>
Date:   Mon, 15 Mar 2021 11:37:11 +0100
Message-ID: <CAK8ByeLEZJKZJ+5ajhO1LQbv6oSMny3WDQL9-e1fxYNR0eV8DQ@mail.gmail.com>
Subject: Re: [PATCH v1] clk: fix invalid usage of list_for_each_entry cursor
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

>
> Quoting Lukasz Bartosik (2021-03-05 11:13:07)
> > Fix invalid usage of list_for_each_entry cursor. When list
> > is empty then list cursor does not point to a valid entry
> > and therefore should not be used.
> >
> > The issue was dicovered when running 5.12-rc1 kernel on x86_64
> > with KASAN enabled:
> > BUG: KASAN: global-out-of-bounds in clk_notifier_register+0xab/0x230
> > Read of size 8 at addr ffffffffa0d10588 by task swapper/0/1
> >
> > CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.12.0-rc1 #1
> > Hardware name: Google Caroline/Caroline,
> > BIOS Google_Caroline.7820.430.0 07/20/2018
> > Call Trace:
> >  dump_stack+0xee/0x15c
> >  print_address_description+0x1e/0x2dc
> >  kasan_report+0x188/0x1ce
> >  ? clk_notifier_register+0xab/0x230
> >  ? clk_prepare_lock+0x15/0x7b
> >  ? clk_notifier_register+0xab/0x230
> >  clk_notifier_register+0xab/0x230
> >  dw8250_probe+0xc01/0x10d4
> > ...
> > Memory state around the buggy address:
> >  ffffffffa0d10480: 00 00 00 00 00 03 f9 f9 f9 f9 f9 f9 00 00 00 00
> >  ffffffffa0d10500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 f9 f9
> > >ffffffffa0d10580: f9 f9 f9 f9 00 00 00 00 00 00 00 00 00 00 00 00
> >                       ^
> >  ffffffffa0d10600: 00 00 00 00 00 00 f9 f9 f9 f9 f9 f9 00 00 00 00
> >  ffffffffa0d10680: 00 00 00 00 00 00 00 00 f9 f9 f9 f9 00 00 00 00
> >  ==================================================================
> >
> > Fixes: (b2476490ef11 clk: introduce the common clock framework)
>
> This fixes format is wrong. Use pretty format of 'Fixes: %h "%s"'
>

Just to clarify. Shouldn't the format be 'Fixes: %h (\"%s\")' as
described in https://www.kernel.org/doc/html/v5.11/process/submitting-patches.html
?

> >
>
> And this newline shouldn't be here.
>

I will remove the newline.

> > Reported-by: Lukasz Majczak <lma@semihalf.com>
> > Signed-off-by: Lukasz Bartosik <lb@semihalf.com>
> > ---
> >  drivers/clk/clk.c | 20 ++++++++++++++------
> >  1 file changed, 14 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 3412a7cc03fd..bd90de885392 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -4360,6 +4360,7 @@ int clk_notifier_register(struct clk *clk, struct notifier_block *nb)
> >  {
> >         struct clk_notifier *cn;
> >         int ret = -ENOMEM;
> > +       bool entry_found = false;
> >
> >         if (!clk || !nb)
> >                 return -EINVAL;
> > @@ -4367,12 +4368,15 @@ int clk_notifier_register(struct clk *clk, struct notifier_block *nb)
> >         clk_prepare_lock();
> >
> >         /* search the list of notifiers for this clk */
> > -       list_for_each_entry(cn, &clk_notifier_list, node)
> > -               if (cn->clk == clk)
> > +       list_for_each_entry(cn, &clk_notifier_list, node) {
> > +               if (cn->clk == clk) {
> > +                       entry_found = true;
> >                         break;
> > +               }
> > +       }
> >
> >         /* if clk wasn't in the notifier list, allocate new clk_notifier */
> > -       if (cn->clk != clk) {
> > +       if (!entry_found) {
> >                 cn = kzalloc(sizeof(*cn), GFP_KERNEL);
> >                 if (!cn)
> >                         goto out;
>
> How about using list_empty()?
>
>         if (list_empty() || cn->clk != clk)
>
> Then the diff is very small.

Good point. I will use list_empty(). Thanks

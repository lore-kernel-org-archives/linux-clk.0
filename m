Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 291EDC433DB
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 10:49:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E826B64F45
	for <linux-clk@archiver.kernel.org>; Wed, 17 Mar 2021 10:49:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbhCQKtT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 Mar 2021 06:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbhCQKtB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 Mar 2021 06:49:01 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44DDDC06174A
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 03:49:01 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 68-20020a9d0f4a0000b02901b663e6258dso1300888ott.13
        for <linux-clk@vger.kernel.org>; Wed, 17 Mar 2021 03:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XblsK37E+BEk27OLonHKWcEP3ZgNZEQaWfRzFuhVbTs=;
        b=mMvuHdjdmp1vsYx12xXsQFBmbzgZr9SXj4yt5TR+omqL7lH4oED04jaL4R3T9sRHLS
         fy497lQzP0QVqluKdqLcK0k/Yau6XUg39Q0+dV34jIFI+texPlDjbER+MQiEkR2y/Y5z
         N/tMHJKIz5hAkrz1CvkQ8Wt4QqJjB229AmZITxb4urvW3jzwTxv1SrB+suTpfA2gBx/Z
         M/0FduyFk+pXeipyyEtCfAmOp8YGhTlYbALw/kjo5CJzoHRzxff2nNZyNBipf+zaDdcL
         TdT/KtuSTYpbLl2wnwu4p7vLzpwDvBB35abwA6c7w8bxAHRhLSU5SAh/BePh4aBMpoyU
         nZbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XblsK37E+BEk27OLonHKWcEP3ZgNZEQaWfRzFuhVbTs=;
        b=o6NQlsf2qVGv2w1CTuL7xT03KLzbmM/nazlaOeoP08D10JqCCig0DiVpW7es7F4uZc
         kG0fwC7T3u7U+s5NEACR8r5+J3CLBFG2sEXuO5ufMD2g0IoTuM3sQQgE3qjku9ZsmfEF
         YFWK+V6dfAKjDdfcsZQyT9Ge7Fy3LyP34y9cEmlwfAbHz7QY+IyWMeO3GpZrk+RNXnU7
         MBCoPv0aBshqW8MbdukIFsQZv+JQlK1KVHPKltM8vXtSFfEz9PiRlTbA6Nd15p960wfA
         K+6Gr8yg+sYFeWZ0uoeASX6HohEDmt5ZSLfNVvbNmzMfBCYOXH5BdDxIHOau8OtGbVdw
         o/Uw==
X-Gm-Message-State: AOAM530gZ5/hywC5+HE/B2Jr6aWDAGir6854ylcuutoWiXE8IGGJkV/z
        PiHM/G0kZb0dU12NdS/7FLvF25tObr2XSRIi45Vnf1A7mg==
X-Google-Smtp-Source: ABdhPJw62D45Icwr5DvwZQTPtInc12zc2tj8zgF4qWrNYXipiEM+z0QV0oUxLXNJD/xSSJCeQQyMCnqIBZ4cA4skpc0=
X-Received: by 2002:a9d:17ca:: with SMTP id j68mr2970173otj.312.1615978140442;
 Wed, 17 Mar 2021 03:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210305191307.15915-1-lb@semihalf.com> <161566785522.1478170.3268340283624516294@swboyd.mtv.corp.google.com>
 <CAK8ByeLEZJKZJ+5ajhO1LQbv6oSMny3WDQL9-e1fxYNR0eV8DQ@mail.gmail.com>
In-Reply-To: <CAK8ByeLEZJKZJ+5ajhO1LQbv6oSMny3WDQL9-e1fxYNR0eV8DQ@mail.gmail.com>
From:   =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>
Date:   Wed, 17 Mar 2021 11:48:49 +0100
Message-ID: <CAK8ByeJv3iHPG77ix35QkgHsCpZnnwPkGT1_fYFEUeuj5i5noQ@mail.gmail.com>
Subject: Re: [PATCH v1] clk: fix invalid usage of list_for_each_entry cursor
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

>
> >
> > Quoting Lukasz Bartosik (2021-03-05 11:13:07)
> > > Fix invalid usage of list_for_each_entry cursor. When list
> > > is empty then list cursor does not point to a valid entry
> > > and therefore should not be used.
> > >
> > > The issue was dicovered when running 5.12-rc1 kernel on x86_64
> > > with KASAN enabled:
> > > BUG: KASAN: global-out-of-bounds in clk_notifier_register+0xab/0x230
> > > Read of size 8 at addr ffffffffa0d10588 by task swapper/0/1
> > >
> > > CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.12.0-rc1 #1
> > > Hardware name: Google Caroline/Caroline,
> > > BIOS Google_Caroline.7820.430.0 07/20/2018
> > > Call Trace:
> > >  dump_stack+0xee/0x15c
> > >  print_address_description+0x1e/0x2dc
> > >  kasan_report+0x188/0x1ce
> > >  ? clk_notifier_register+0xab/0x230
> > >  ? clk_prepare_lock+0x15/0x7b
> > >  ? clk_notifier_register+0xab/0x230
> > >  clk_notifier_register+0xab/0x230
> > >  dw8250_probe+0xc01/0x10d4
> > > ...
> > > Memory state around the buggy address:
> > >  ffffffffa0d10480: 00 00 00 00 00 03 f9 f9 f9 f9 f9 f9 00 00 00 00
> > >  ffffffffa0d10500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 f9 f9
> > > >ffffffffa0d10580: f9 f9 f9 f9 00 00 00 00 00 00 00 00 00 00 00 00
> > >                       ^
> > >  ffffffffa0d10600: 00 00 00 00 00 00 f9 f9 f9 f9 f9 f9 00 00 00 00
> > >  ffffffffa0d10680: 00 00 00 00 00 00 00 00 f9 f9 f9 f9 00 00 00 00
> > >  ==================================================================
> > >
> > > Fixes: (b2476490ef11 clk: introduce the common clock framework)
> >
> > This fixes format is wrong. Use pretty format of 'Fixes: %h "%s"'
> >
>
> Just to clarify. Shouldn't the format be 'Fixes: %h (\"%s\")' as
> described in https://www.kernel.org/doc/html/v5.11/process/submitting-patches.html
> ?
>
> > >
> >
> > And this newline shouldn't be here.
> >
>
> I will remove the newline.
>
> > > Reported-by: Lukasz Majczak <lma@semihalf.com>
> > > Signed-off-by: Lukasz Bartosik <lb@semihalf.com>
> > > ---
> > >  drivers/clk/clk.c | 20 ++++++++++++++------
> > >  1 file changed, 14 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index 3412a7cc03fd..bd90de885392 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -4360,6 +4360,7 @@ int clk_notifier_register(struct clk *clk, struct notifier_block *nb)
> > >  {
> > >         struct clk_notifier *cn;
> > >         int ret = -ENOMEM;
> > > +       bool entry_found = false;
> > >
> > >         if (!clk || !nb)
> > >                 return -EINVAL;
> > > @@ -4367,12 +4368,15 @@ int clk_notifier_register(struct clk *clk, struct notifier_block *nb)
> > >         clk_prepare_lock();
> > >
> > >         /* search the list of notifiers for this clk */
> > > -       list_for_each_entry(cn, &clk_notifier_list, node)
> > > -               if (cn->clk == clk)
> > > +       list_for_each_entry(cn, &clk_notifier_list, node) {
> > > +               if (cn->clk == clk) {
> > > +                       entry_found = true;
> > >                         break;
> > > +               }
> > > +       }
> > >
> > >         /* if clk wasn't in the notifier list, allocate new clk_notifier */
> > > -       if (cn->clk != clk) {
> > > +       if (!entry_found) {
> > >                 cn = kzalloc(sizeof(*cn), GFP_KERNEL);
> > >                 if (!cn)
> > >                         goto out;
> >
> > How about using list_empty()?
> >
> >         if (list_empty() || cn->clk != clk)
> >
> > Then the diff is very small.
>
> Good point. I will use list_empty(). Thanks

Although your comment was appealing to make the diff neat and small I
realized it won't work after making the changes.
Looking at the original code:
    /* search the list of notifiers for this clk */
    list_for_each_entry(cn, &clk_notifier_list, node)
        if (cn->clk == clk)
        break;

    /* if clk wasn't in the notifier list, allocate new clk_notifier */
    if (cn->clk != clk) {

The list cursor (cn) in the comparison above will not be pointing to a
valid entry not only when the clk_notifier_list is empty but also in
the case when clk_notifier_list list was completely traversed without
breaking from the list_for_each_entry loop on one of the entries.
Therefore making the comparison

    if (list_empty() || cn->clk != clk) {

will not help because if the list is not empty and there was no match
cn will not point to a valid entry. I have not noticed that before.
Based on that I propose to stay with my original fix.

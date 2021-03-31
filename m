Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A012EC433ED
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 15:58:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7871961005
	for <linux-clk@archiver.kernel.org>; Wed, 31 Mar 2021 15:58:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232372AbhCaP5a (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 31 Mar 2021 11:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233742AbhCaP5Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 31 Mar 2021 11:57:24 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27817C061574
        for <linux-clk@vger.kernel.org>; Wed, 31 Mar 2021 08:57:24 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id d10so17577067ils.5
        for <linux-clk@vger.kernel.org>; Wed, 31 Mar 2021 08:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fKoIIvncgu0zBkpFtPXWtF20Bz8nY6QMRK0IGlECmR0=;
        b=gRJktp1RdBknMEksedTeNw5cfT4jUuXl8dHN9ccghh2OydH3sKOFCubCtfKMcMWLf4
         4A2IlPOg+ThDcU3PirDlyOzxHC2TlAzdJ3M0PUd+GhG6EhQlewpRzQ3a0EsHpH9xEGOb
         8zf/PMICRZmjFQTOASy7bRtRTsogZ06c/Ao5HElE8XJSoZkHpwPgxdFfWKn4nGInYWi/
         AdRxwD0gzDfO5QXjAd4C5dPG3hA6nGPEak5BRFvczfexuQjmFlSjMYhOFcG5494Zy0aR
         LLdAs/3dSoVUaGBRp2Msrwajr8a0p6ZTc5JGat55C6Lu6dmhzpLCH2Ao5RpOR5x5QUbv
         xsCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fKoIIvncgu0zBkpFtPXWtF20Bz8nY6QMRK0IGlECmR0=;
        b=meb0CwAk56CA9QqFboLqZecmLsL6FT1os6xLz7jOUHRdKKYgku16KAAG5/HXDLLil5
         UYVnaoi4KjKOkD8vEjfnQxSI0klyddtpkxVIKjBm524SacDE/Mak3ylunIE31zVSyfz/
         kNNsM5rx+STmrvXjfjQ/5aYUbj34p09+TBjHMq5JPXTtvbK8QLgmnbT4BzLUE23+PwKm
         oSIYcVxnx7CTdwXeR/RB3bWrp2zttqJf2RpghIgN/lKKm54ooZ3HEVPdfwd8ma6GNjTa
         tMG29Fil/wVEfj+zA0JXOnM3qbttjCHdT+4mrsbjrK8aTIgBCLH3b3LSwXSZRVwhQ4F7
         wGeQ==
X-Gm-Message-State: AOAM532pgWalIU9VYGJZtZ3amNWXDdqHPMFUg8OsmsbGAez5VX//AjxE
        sfFwynQkLqWe5uRxnsfoo20npFqlJei2ficbe0wJO5stJXa1
X-Google-Smtp-Source: ABdhPJx00VthgGWCLCxVmSApNr58wEB0IwFwhOXC+Ch3f03QV+Uyh/NKJwtr0rOzaom2tH71GC7WB6PC+hslG05VaMg=
X-Received: by 2002:a05:6e02:1a2f:: with SMTP id g15mr3130803ile.176.1617206243564;
 Wed, 31 Mar 2021 08:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210305191307.15915-1-lb@semihalf.com> <161566785522.1478170.3268340283624516294@swboyd.mtv.corp.google.com>
 <CAK8ByeLEZJKZJ+5ajhO1LQbv6oSMny3WDQL9-e1fxYNR0eV8DQ@mail.gmail.com>
 <CAK8ByeJv3iHPG77ix35QkgHsCpZnnwPkGT1_fYFEUeuj5i5noQ@mail.gmail.com> <161704984972.3012082.1839219245014187895@swboyd.mtv.corp.google.com>
In-Reply-To: <161704984972.3012082.1839219245014187895@swboyd.mtv.corp.google.com>
From:   =?UTF-8?Q?=C5=81ukasz_Bartosik?= <lb@semihalf.com>
Date:   Wed, 31 Mar 2021 17:57:12 +0200
Message-ID: <CAK8Bye+6FEz69+c5q7qZQHKMeWuhCo_BiW-PMGLojk_kx249kw@mail.gmail.com>
Subject: Re: [PATCH v1] clk: fix invalid usage of list_for_each_entry cursor
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, upstream@semihalf.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

>
> > > >
> > > > How about using list_empty()?
> > > >
> > > >         if (list_empty() || cn->clk != clk)
> > > >
> > > > Then the diff is very small.
> > >
> > > Good point. I will use list_empty(). Thanks
> >
> > Although your comment was appealing to make the diff neat and small I
> > realized it won't work after making the changes.
> > Looking at the original code:
> >     /* search the list of notifiers for this clk */
> >     list_for_each_entry(cn, &clk_notifier_list, node)
> >         if (cn->clk == clk)
> >         break;
> >
> >     /* if clk wasn't in the notifier list, allocate new clk_notifier */
> >     if (cn->clk != clk) {
> >
> > The list cursor (cn) in the comparison above will not be pointing to a
> > valid entry not only when the clk_notifier_list is empty but also in
> > the case when clk_notifier_list list was completely traversed without
> > breaking from the list_for_each_entry loop on one of the entries.
> > Therefore making the comparison
> >
> >     if (list_empty() || cn->clk != clk) {
> >
> > will not help because if the list is not empty and there was no match
> > cn will not point to a valid entry. I have not noticed that before.
> > Based on that I propose to stay with my original fix.
>
> Ok, so then use 'goto found' approach?
>

I will use goto approach and send v3 patch.

> ----8<----
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 5052541a0986..16634d5912be 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -4357,20 +4357,19 @@ int clk_notifier_register(struct clk *clk, struct notifier_block *nb)
>         /* search the list of notifiers for this clk */
>         list_for_each_entry(cn, &clk_notifier_list, node)
>                 if (cn->clk == clk)
> -                       break;
> +                       goto found;
>
>         /* if clk wasn't in the notifier list, allocate new clk_notifier */
> -       if (cn->clk != clk) {
> -               cn = kzalloc(sizeof(*cn), GFP_KERNEL);
> -               if (!cn)
> -                       goto out;
> +       cn = kzalloc(sizeof(*cn), GFP_KERNEL);
> +       if (!cn)
> +               goto out;
>
> -               cn->clk = clk;
> -               srcu_init_notifier_head(&cn->notifier_head);
> +       cn->clk = clk;
> +       srcu_init_notifier_head(&cn->notifier_head);
>
> -               list_add(&cn->node, &clk_notifier_list);
> -       }
> +       list_add(&cn->node, &clk_notifier_list);
>
> +found:
>         ret = srcu_notifier_chain_register(&cn->notifier_head, nb);
>
>         clk->core->notifier_count++;

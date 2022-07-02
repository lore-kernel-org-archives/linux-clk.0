Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF9FC43334
	for <linux-clk@archiver.kernel.org>; Sat,  2 Jul 2022 02:55:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbiGBCzu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Jul 2022 22:55:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbiGBCzt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Jul 2022 22:55:49 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8693A2E9D8
        for <linux-clk@vger.kernel.org>; Fri,  1 Jul 2022 19:55:48 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id y141so4053207pfb.7
        for <linux-clk@vger.kernel.org>; Fri, 01 Jul 2022 19:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/gEIJQeUG/DtD2Co3d1FZkNf/aI1A4RTFu3yoiZ4dXM=;
        b=eZW1U2pxfK86GXKQvbuGqhO6mKZnvr+dOzc2jiZikOvUOxM/IgKaCb9poiEagqogbK
         SHgtSVqQh6XFHEADC59HZ/vzNouURn6SBiiZ2JkhLLBn8irOkBjMON8mXGXrd8KqXDm3
         ++oo/2zRfRhGpPzQj/b6HisHvUDUZ2E3OYAx0t82Kw7kltoGNUL1r9HGN0WHE4teTvmK
         sB+vboSDyxoVibKU6kM4mjLiJt5HARbOj3f+Jkst/wzf5n0hpRMFW3IFi2G7xPnAV30J
         J9r5EkUT/rzeiP+752/b0J95ITbrNC+XiFH5onRovLOky3nTrGicIeSZlhCZt3RRewMb
         p9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/gEIJQeUG/DtD2Co3d1FZkNf/aI1A4RTFu3yoiZ4dXM=;
        b=5aC42VnY9ttGykQhyA4wnmegKX/afDfgWcwix8WUyQ8KT72+eOHzs2F+OrblAq/jwW
         udSDN1T1X/Ajcwo09pZlIvC+8jj/bKfRHxcnErJHUKVajuhPGlBtLU3lD7FyD7mD7yXO
         PqZgvLdvHB/nxFvupSFo6ihGV3qS8mW+OdxQsMZoYiuvb3+MNtJ81/Vka3XMKRrlWdCx
         PBuBkS7NvHwHtDMd/QskmVwvDFMEvkEGC552CqO/p6r5rvb3F7VYB935K1SMBTxx2sIQ
         MF5Ax1ey7IswcT4Ke1lROuXphZL3Rcux7WmqvxXT/RCGDWcRDccNN/5DkJjI7/PlTfON
         3Q/w==
X-Gm-Message-State: AJIora95y6zStrQfBtgXuGXc3R9xR0C/salbWAkneiefFKH5JvtXxA/v
        m1KRMVQZ0qxFsbLBbHSNJbgL2NAhwgbav/21fZc=
X-Google-Smtp-Source: AGRyM1vkZNNv+Ym2Bb+II7fdA/nAXZ2sIeykOUaXWof/kSyXpLXpoLTO0ehWsK3Z+cZF6KfVZN2lu6gwzMKh8vAXRew=
X-Received: by 2002:a62:1647:0:b0:528:5e9:9d9d with SMTP id
 68-20020a621647000000b0052805e99d9dmr14753169pfw.55.1656730547904; Fri, 01
 Jul 2022 19:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220701024606.223438-1-windhl@126.com> <CAAfSe-vAuFK1qfCA9H_k3MDTa-7rP4FsfkMPMkR1+L60CU8iMg@mail.gmail.com>
 <5bb0d0ea.455b.181b885b569.Coremail.windhl@126.com> <CA+H2tpFhmYCbAX62Dta-Q7ER4Eh5cJwbc2uCQYQyzdVsM8Lvxg@mail.gmail.com>
 <30a4141c.68c.181bc86547d.Coremail.windhl@126.com>
In-Reply-To: <30a4141c.68c.181bc86547d.Coremail.windhl@126.com>
From:   Orson Zhai <orsonzhai@gmail.com>
Date:   Sat, 2 Jul 2022 10:55:36 +0800
Message-ID: <CA+H2tpF55f=9KBTOv3OsLDjzHM=NWe1aVSBh8ZbXaHHSWi6rAg@mail.gmail.com>
Subject: Re: Re: Re: [PATCH v4] clk: sprd: Hold reference returned by of_get_parent()
To:     Liang He <windhl@126.com>
Cc:     Chunyan Zhang <zhang.lyra@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Baolin Wang <baolin.wang7@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Liang,

On Sat, Jul 2, 2022 at 9:29 AM Liang He <windhl@126.com> wrote:
>
>
>
>
>
> At 2022-07-02 01:12:10, "Orson Zhai" <orsonzhai@gmail.com> wrote:
> >Liang,
> >
> >On Fri, Jul 1, 2022 at 2:50 PM Liang He <windhl@126.com> wrote:
> >>
> >>
> >>
> >> At 2022-07-01 14:39:53, "Chunyan Zhang" <zhang.lyra@gmail.com> wrote:
> >> >On Fri, 1 Jul 2022 at 10:46, Liang He <windhl@126.com> wrote:
> >> >>
> >> >> We should hold the reference returned by of_get_parent() and use it
> >> >> to call of_node_put() for refcount balance.
> >> >>
> >> >> Fixes: f95e8c7923d1 ("clk: sprd: support to get regmap from parent node")
> >> >> Signed-off-by: Liang He <windhl@126.com>
> >> >> ---
> >> >>  changelog:
> >> >>
> >> >>  v4: fix another bug in the same place, missing in v3
> >> >>  v3: (1) keep original 'if-else if-else' coding style adviesd by Orson
> >> >>      (2) fix typo in commit-log: of_node_out --> of_node_put
> >> >>  v2: minimize the effective range of of_get_parent() advised by Orson
> >> >>  v1: hold reference returned by of_get_parent()
> >> >>
> >> >>
> >> >>  drivers/clk/sprd/common.c | 9 +++++----
> >> >>  1 file changed, 5 insertions(+), 4 deletions(-)
> >> >>
> >> >> diff --git a/drivers/clk/sprd/common.c b/drivers/clk/sprd/common.c
> >> >> index d620bbbcdfc8..1b9c2aa0836f 100644
> >> >> --- a/drivers/clk/sprd/common.c
> >> >> +++ b/drivers/clk/sprd/common.c
> >> >> @@ -41,7 +41,7 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
> >> >>  {
> >> >>         void __iomem *base;
> >> >>         struct device *dev = &pdev->dev;
> >> >> -       struct device_node *node = dev->of_node;
> >> >> +       struct device_node *node = dev->of_node, *np;
> >> >>         struct regmap *regmap;
> >> >>
> >> >>         if (of_find_property(node, "sprd,syscon", NULL)) {
> >> >> @@ -50,9 +50,10 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
> >> >>                         pr_err("%s: failed to get syscon regmap\n", __func__);
> >> >>                         return PTR_ERR(regmap);
> >> >>                 }
> >> >> -       } else if (of_device_is_compatible(of_get_parent(dev->of_node),
> >> >> -                          "syscon")) {
> >> >> -               regmap = device_node_to_regmap(of_get_parent(dev->of_node));
> >> >> +       } else if (of_device_is_compatible(np = of_get_parent(node), "syscon")
> >> >> +               || (of_node_put(np), 0)) {
> >> >> +               regmap = device_node_to_regmap(np = of_get_parent(node));
> >> >
> >> >of_get_parent() one more time would cause another unbalance, why not
> >> >use 'np' directly here?
> >> >
> >> >I would also suggest to cc LKML (linux-kernel@vger.kernel.org)
> >> >
> >> >Thanks,
> >> >Chunyan
> >> >
> >>
> >> Hi, Chunyan,
> >>
> >> Thanks for reviewing this patch code.
> >>
> >> In fact, the 'np' has already  been |PUT| in the 'else if ( ...|| of_node_put(np)..)'.
> >>
> >> Based on the original code, there are two of_get_parent(), so we need the second
> >> one with the following second |PUT|.
> >
> >Sorry, I missed it. I think what Chunyan said is right.
> >
> >np is declared at the beginning, so it's ok to be referred to in all
> >places in  this function
> >after being assigned.
> >the first of_node_put() will not be called if
> >of_device_is_compatible() returns success.
>
> Hi, Orson,
>
> Now, I think this totally depends on the implementation of compilers.
>
Don't worry. Logical OR (||) is guaranteed in C standard.
Check [1] for more information, please.

-Orson

[1] https://www.geeksforgeeks.org/sequence-points-in-c-set-1/

> So, we should introduce this possible risk or use more conservative way I use before?
>
> do not put |PUT| in condition and move it to the 'else' branch?
>
> Thanks,
>
> Liang
>
>
> >So we can refer to np directly here.
> >
> >-Orson
> >
> >>
> >> Thanks,
> >>
> >> Liang
> >>
> >> >> +               of_node_put(np);
> >> >>                 if (IS_ERR(regmap)) {
> >> >>                         dev_err(dev, "failed to get regmap from its parent.\n");
> >> >>                         return PTR_ERR(regmap);
> >> >> --
> >> >> 2.25.1
> >> >>

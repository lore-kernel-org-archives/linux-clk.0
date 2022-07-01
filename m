Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E187EC433EF
	for <linux-clk@archiver.kernel.org>; Fri,  1 Jul 2022 17:12:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbiGARMZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Jul 2022 13:12:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230410AbiGARMX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Jul 2022 13:12:23 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F9EE201B5
        for <linux-clk@vger.kernel.org>; Fri,  1 Jul 2022 10:12:22 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id q140so2935998pgq.6
        for <linux-clk@vger.kernel.org>; Fri, 01 Jul 2022 10:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lhDjl+/N55zvWjy7fFJihLD9IH8iN7fCcLBSAJYRjl0=;
        b=TGB8iwjp3/4lHJmVG6Owq/wkQOMDkF1/0a739r3I47DAlpWY4O5ZABy64OQh+IA5mL
         Yi2Vj7IUoqWGjHCA3St+Xo4w6vDDpz6Wy7aCw3AS4XmFfEP1xZQyGhaQ8kUKCkZRUkeB
         5ug9tHQHP4njXqI1n82/ybihOhPz6vtdk56PLChLDhfo6DkwAhSXD/uVGiModOPaTmHp
         75W0xtXLDpdDUm3QUIqoevM94rFDeyPGtE8O29aQLX/D+aLz2+xRpTyZzHKvhJKivxIK
         7q+9aa5VF+Fj/WeEXpQ315nLV76tTLJaQrhwmijaObGl/9K4g0G0EMX68ANQExF+6Lkz
         kj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lhDjl+/N55zvWjy7fFJihLD9IH8iN7fCcLBSAJYRjl0=;
        b=MF5SqgEF7j25LUFTr3lrnweGCCkbh5jwE1DzbI9xufnShZboLQWQO5nBkqtg5bfdPB
         mplXEzEuuu5EL5BiKCZmlOkKeovHbsbYg31JC5B2/rlmIAxPstyRHMSTx3tdk3pjRJ/O
         TId/9Scfg0iCAo0I5WeXrnrT8YbPFSYo2bC/d8v3fjbKhazQhEHPaYQQmrGM1Vk02zNG
         anIeyhcxnB4Ggwh7oPw9apxAV5614dVnOh34JI9eouP8aVyZCCQzHSaqOdRpBzRDo8/o
         Upl7gLdn0o7CDooMft3FCVoL5LjI6t5/ivSoEgCz//8keXXMyjtc8ZN6ZcuWCgOkCNBy
         lVNg==
X-Gm-Message-State: AJIora8jIaw/6ysRpANNb0vT5FYU9y77qXDp6aQvodL9mAr4qo+6fQA3
        FP5mnRncYKW2ji8J0MkxQ2uQFcZkfrga6AsqKIs=
X-Google-Smtp-Source: AGRyM1uBVKAfWhtK0ls98NLWy2ez8dIZfA/sqU59Apr1PQRCjnaBOT/vhGcPid2aJmf5jtGUUDjuwpxPJ789deaqFo8=
X-Received: by 2002:a05:6a00:280f:b0:527:bb6f:ff34 with SMTP id
 bl15-20020a056a00280f00b00527bb6fff34mr20759063pfb.35.1656695542062; Fri, 01
 Jul 2022 10:12:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220701024606.223438-1-windhl@126.com> <CAAfSe-vAuFK1qfCA9H_k3MDTa-7rP4FsfkMPMkR1+L60CU8iMg@mail.gmail.com>
 <5bb0d0ea.455b.181b885b569.Coremail.windhl@126.com>
In-Reply-To: <5bb0d0ea.455b.181b885b569.Coremail.windhl@126.com>
From:   Orson Zhai <orsonzhai@gmail.com>
Date:   Sat, 2 Jul 2022 01:12:10 +0800
Message-ID: <CA+H2tpFhmYCbAX62Dta-Q7ER4Eh5cJwbc2uCQYQyzdVsM8Lvxg@mail.gmail.com>
Subject: Re: Re: [PATCH v4] clk: sprd: Hold reference returned by of_get_parent()
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

On Fri, Jul 1, 2022 at 2:50 PM Liang He <windhl@126.com> wrote:
>
>
>
> At 2022-07-01 14:39:53, "Chunyan Zhang" <zhang.lyra@gmail.com> wrote:
> >On Fri, 1 Jul 2022 at 10:46, Liang He <windhl@126.com> wrote:
> >>
> >> We should hold the reference returned by of_get_parent() and use it
> >> to call of_node_put() for refcount balance.
> >>
> >> Fixes: f95e8c7923d1 ("clk: sprd: support to get regmap from parent node")
> >> Signed-off-by: Liang He <windhl@126.com>
> >> ---
> >>  changelog:
> >>
> >>  v4: fix another bug in the same place, missing in v3
> >>  v3: (1) keep original 'if-else if-else' coding style adviesd by Orson
> >>      (2) fix typo in commit-log: of_node_out --> of_node_put
> >>  v2: minimize the effective range of of_get_parent() advised by Orson
> >>  v1: hold reference returned by of_get_parent()
> >>
> >>
> >>  drivers/clk/sprd/common.c | 9 +++++----
> >>  1 file changed, 5 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/clk/sprd/common.c b/drivers/clk/sprd/common.c
> >> index d620bbbcdfc8..1b9c2aa0836f 100644
> >> --- a/drivers/clk/sprd/common.c
> >> +++ b/drivers/clk/sprd/common.c
> >> @@ -41,7 +41,7 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
> >>  {
> >>         void __iomem *base;
> >>         struct device *dev = &pdev->dev;
> >> -       struct device_node *node = dev->of_node;
> >> +       struct device_node *node = dev->of_node, *np;
> >>         struct regmap *regmap;
> >>
> >>         if (of_find_property(node, "sprd,syscon", NULL)) {
> >> @@ -50,9 +50,10 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
> >>                         pr_err("%s: failed to get syscon regmap\n", __func__);
> >>                         return PTR_ERR(regmap);
> >>                 }
> >> -       } else if (of_device_is_compatible(of_get_parent(dev->of_node),
> >> -                          "syscon")) {
> >> -               regmap = device_node_to_regmap(of_get_parent(dev->of_node));
> >> +       } else if (of_device_is_compatible(np = of_get_parent(node), "syscon")
> >> +               || (of_node_put(np), 0)) {
> >> +               regmap = device_node_to_regmap(np = of_get_parent(node));
> >
> >of_get_parent() one more time would cause another unbalance, why not
> >use 'np' directly here?
> >
> >I would also suggest to cc LKML (linux-kernel@vger.kernel.org)
> >
> >Thanks,
> >Chunyan
> >
>
> Hi, Chunyan,
>
> Thanks for reviewing this patch code.
>
> In fact, the 'np' has already  been |PUT| in the 'else if ( ...|| of_node_put(np)..)'.
>
> Based on the original code, there are two of_get_parent(), so we need the second
> one with the following second |PUT|.

Sorry, I missed it. I think what Chunyan said is right.

np is declared at the beginning, so it's ok to be referred to in all
places in  this function
after being assigned.
the first of_node_put() will not be called if
of_device_is_compatible() returns success.
So we can refer to np directly here.

-Orson

>
> Thanks,
>
> Liang
>
> >> +               of_node_put(np);
> >>                 if (IS_ERR(regmap)) {
> >>                         dev_err(dev, "failed to get regmap from its parent.\n");
> >>                         return PTR_ERR(regmap);
> >> --
> >> 2.25.1
> >>

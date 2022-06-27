Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756C2C43334
	for <linux-clk@archiver.kernel.org>; Mon, 27 Jun 2022 07:55:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232434AbiF0Hzm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Jun 2022 03:55:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbiF0Hzl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Jun 2022 03:55:41 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCCF460D8
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 00:55:40 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id d14so8459999pjs.3
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 00:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P9RRDyIZZPhmtQKLtU4S2mPrA9i9fXwztxoq/BYCEKk=;
        b=N8xWEvTwwlIk09nrbezoXibXwu3ynvXgDkqJlVwIaOXbDz9q9JUqCjXFVUSMtVrbos
         bq2XtyA7F2agzJnsdnhFdb9LAqTyi4o67gL97ntNpEANBWTM9bcvFjjpiBiAAeahPo6I
         R5GJssiAOzJeklxELCYrkVsl7kFZOvFJONU1k4P8TkI6aVz6jZ7zyH6fh8kUHC1WRNXd
         eazVSUIfEdeeuvFx8Y/xctCjZgdGNxsfc3PCGpvlegKmXMmDbPDXdCOv5y6l7g80Eq80
         LPFKnUnbBRFe6inAQV/uhQ/B3yqYBhXV8qWDORlFnwVOnuE3EESWEkhh0PhLdHM5x5yL
         nnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P9RRDyIZZPhmtQKLtU4S2mPrA9i9fXwztxoq/BYCEKk=;
        b=asDO9VTi5CUElKoRKq0dqqXS2+KkNyjW2Ms3lA9SXbECFYPPttinI9Jpm9niE8hOdJ
         udjlb4DduJXOqh9yzUU5NTU0Df6Cj0TpehCIVb6M6o3AYAlht1xmfrq5KNaYcBKSHAuX
         3KEN67CNYts5gyaRXv5IlzZWq/zXjdA1ZBCnYpbPLPN/FSqlmkXn3cSCsHlz61gC88kT
         WU+o9ZOxO6Q6Ddf5Srv7BDSfSMJQgWntnDWL+gf9gMkgtbQDl2e5nUv5+xCqtwCTZwy5
         m4dxVET70aJEeGejT/r1Xpn1jTAlfZxjVSu7lrBMTuN8NayN0nkqPAC4x+PpcTQffcys
         sV2w==
X-Gm-Message-State: AJIora/5pWTgr9hYrnmopSJs73B6W7cnSBLuiP1mXR79TkpYt20xpeIP
        rtnZjpM8Rh+sgeNTJgtqWwf89VY+a16z1oIdauo=
X-Google-Smtp-Source: AGRyM1sJBj8PdpOP8IuDZ8MOZF8xqJYvILRifs7ip/R+y/BDpA3moETtxNoOsVuJ+tzT3jqC06RNlAX8XyHgd+oSZOI=
X-Received: by 2002:a17:903:18e:b0:16a:5f55:c4e with SMTP id
 z14-20020a170903018e00b0016a5f550c4emr13377513plg.33.1656316540167; Mon, 27
 Jun 2022 00:55:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220624103809.4167753-1-windhl@126.com> <CA+H2tpEZ6GNYjZ669w4yxK7EPm8bk_uRdq+6-5Z95FpPy4S8nA@mail.gmail.com>
 <7cb414e.2aa5.1819b7e699f.Coremail.windhl@126.com> <CA+H2tpHyXD1pr7G9nxU9tJPgtfE5MioFE+Dy+bUwz+z=ap-MXg@mail.gmail.com>
 <1a1ed744.abe.1819e2dd0bc.Coremail.windhl@126.com>
In-Reply-To: <1a1ed744.abe.1819e2dd0bc.Coremail.windhl@126.com>
From:   Orson Zhai <orsonzhai@gmail.com>
Date:   Mon, 27 Jun 2022 15:55:28 +0800
Message-ID: <CA+H2tpGASuT5nfXZzvV4r2DjPy+Wa6HejO6AXeUXKyYbwADoVw@mail.gmail.com>
Subject: Re: Re: Re: [PATCH] clk/sprd: Hold reference returned by of_get_parent()
To:     Liang He <windhl@126.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Lyra Zhang <zhang.lyra@gmail.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Jun 26, 2022 at 12:03 PM Liang He <windhl@126.com> wrote:
>
>
>
> At 2022-06-26 11:32:40, "Orson Zhai" <orsonzhai@gmail.com> wrote:
> >Hi Liang,
> >
> >On Sat, Jun 25, 2022 at 11:34 PM Liang He <windhl@126.com> wrote:
> >>
> >>
> >> At 2022-06-25 16:36:04, "Orson Zhai" <orsonzhai@gmail.com> wrote:
> >> >Hi Liang,
> >> >
> >> >On Fri, Jun 24, 2022 at 6:39 PM Liang He <windhl@126.com> wrote:
> >> >>
> >> >> We should hold the reference returned by of_get_parent() and use it
> >> >> to call of_node_out() for refcount balance.
> >> >>
> >> >> Fixes: f95e8c7923d1 ("clk: sprd: support to get regmap from parent node")
> >> >> Signed-off-by: Liang He <windhl@126.com>
> >> >> ---
> >> >>  these bugs are found in 5.19rc2
> >> >>  these bugs are confirmed not fixed by lore.kernel.org
> >> >>  these bugs are compiled tested in 5.19rc2 with at91_dt_defconfig
> >> >>
> >> >>  drivers/clk/sprd/common.c | 16 +++++++++++-----
> >> >>  1 file changed, 11 insertions(+), 5 deletions(-)
> >> >>
> >> >> diff --git a/drivers/clk/sprd/common.c b/drivers/clk/sprd/common.c
> >> >> index d620bbbcdfc8..08c1d7a9ec8b 100644
> >> >> --- a/drivers/clk/sprd/common.c
> >> >> +++ b/drivers/clk/sprd/common.c
> >> >> @@ -41,35 +41,41 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
> >> >>  {
> >> >>         void __iomem *base;
> >> >>         struct device *dev = &pdev->dev;
> >> >> -       struct device_node *node = dev->of_node;
> >> >> +       struct device_node *node = dev->of_node, *np;
> >> >>         struct regmap *regmap;
> >> >>
> >> >> +       np = of_get_parent(dev->of_node);
> >> >>         if (of_find_property(node, "sprd,syscon", NULL)) {
> >> >>                 regmap = syscon_regmap_lookup_by_phandle(node, "sprd,syscon");
> >> >
> >> >Why not to call of_node_put() in this function?
> >> >He returns an error and it is his responsibility to clean up
> >> >everything he used, right?
> >> >
> >> >-Orson
> >> >
> >> Hi, Orson,
> >>
> >> I only know we should use the pair of functions (of_get_parent(), of_node_put)
> >> to keep refcount balance.
> >>
> >> However, as I do not really know the semantic of other functions, so I cannot
> >> give other kinds of patch.
> >
> >Sorry, I didn't catch your point before.
> >You're right on this unbalance. But it has no direct relation to the
> >function here.
>
> Thanks for your understanding. And yes, it has no direct relation
>  to the function here.
>
> >I think it is better to minimize the effective range of of_get_parent()
> >
> >Could you refer to Pantelis's answer to the last question at [1].
> >
> >Thanks.
> >-Orson
> >
> >[1] https://www.spinics.net/lists/devicetree/msg122555.html
> >
>
> Thanks, Orson.
>
> Yes, I also wanted to make a better patch solution as the bug is only caused
> by the 'else if' branch.
>
> However, I cannot find a better solution to fix the bug in the middle of nested
> 'if-else if-else' brances unless we try to rewrite them, which is more difficult for me, now.
>
> But if you think it is (semantic) safe to rewrite these branches, I can try it.

No problem. Please do it as long as not to change its original logic.

Thanks.
-Orson

>
> Thanks again for your relpy.
>
> Liang
>
> >>
> >> By the way, if we chose to put of_node_put() in this function, I think it also need
> >> to put of_node_put() into 'device_node_to_regmap' as it also return error code in
> >> following path.
> >>
> >> Anyway, thanks very much for your reply and review on my patch code.
> >>
> >> Liang
> >>
> >>
> >> >>                 if (IS_ERR(regmap)) {
> >> >>                         pr_err("%s: failed to get syscon regmap\n", __func__);
> >> >> +                       of_node_put(np);
> >> >>                         return PTR_ERR(regmap);
> >> >>                 }
> >> >> -       } else if (of_device_is_compatible(of_get_parent(dev->of_node),
> >> >> -                          "syscon")) {
> >> >> -               regmap = device_node_to_regmap(of_get_parent(dev->of_node));
> >> >> +       } else if (of_device_is_compatible(np, "syscon")) {
> >> >> +               regmap = device_node_to_regmap(np);
> >> >>                 if (IS_ERR(regmap)) {
> >> >> +                       of_node_put(np);
> >> >>                         dev_err(dev, "failed to get regmap from its parent.\n");
> >> >>                         return PTR_ERR(regmap);
> >> >>                 }
> >> >>         } else {
> >> >>                 base = devm_platform_ioremap_resource(pdev, 0);
> >> >> -               if (IS_ERR(base))
> >> >> +               if (IS_ERR(base)) {
> >> >> +                       of_node_put(np);
> >> >>                         return PTR_ERR(base);
> >> >> +               }
> >> >>
> >> >>                 regmap = devm_regmap_init_mmio(&pdev->dev, base,
> >> >>                                                &sprdclk_regmap_config);
> >> >>                 if (IS_ERR(regmap)) {
> >> >> +                       of_node_put(np);
> >> >>                         pr_err("failed to init regmap\n");
> >> >>                         return PTR_ERR(regmap);
> >> >>                 }
> >> >>         }
> >> >>
> >> >> +       of_node_put(np);
> >> >>         sprd_clk_set_regmap(desc, regmap);
> >> >>
> >> >>         return 0;
> >> >> --
> >> >> 2.25.1
> >> >>

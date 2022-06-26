Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C39C43334
	for <linux-clk@archiver.kernel.org>; Sun, 26 Jun 2022 03:32:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233858AbiFZDcy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 25 Jun 2022 23:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230439AbiFZDcx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 25 Jun 2022 23:32:53 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E243113E8E
        for <linux-clk@vger.kernel.org>; Sat, 25 Jun 2022 20:32:52 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id go6so6299990pjb.0
        for <linux-clk@vger.kernel.org>; Sat, 25 Jun 2022 20:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fsCji8h2OBQXccEPQd6x3OQZrWuc68jPVr+XWuCiufw=;
        b=Ue77NtLF9xwtgT4blShM4MjmKB2WP4qK/HIPVM4TPLllPLj63CIAG7uhZhFXZHq8xj
         WD6Ya3K4gmDopYtDErjN+iWfHh9MWco58Gn4hF4vQ0GoY5rZWQccsMsjPb+6tRGTnYcM
         MVBvKfm3ZgB6GimoBZEQfaroz0bRky+OyQ+omnTXGEm2fX8cqpxgUukvq6fY1VZcqoG3
         1WaOvZAOfWx1Z17oIZfB8LrUKztIZSqY7rFrfo6mLd0MDqVZMGrSa4q+z2v41I18qgKk
         bbDywxSwpee/hKKIzVhUbgWPorXA/wJixSNghpUvnFNdNE5Iuf3uhsxP365nLojPCFWM
         ac4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fsCji8h2OBQXccEPQd6x3OQZrWuc68jPVr+XWuCiufw=;
        b=W7Im0Ns97VfdGo5xWJ6H54rtud1IyRHZULhQyNJphmmWjXRzi6KYMx3mdiKteIBGg1
         ZpjBg6SitE50uwBso56Cu4OnFe8ZcViix8VvlQZ1mq99S8Xb7jAo5lG5I8KGTDxN+J2j
         ZDVnlIJPm7KVgu5VgvNq767msWIRalssHqBDAXARMu5T6A8JgTU+M88kQvHcr26Nonxv
         epkc2GIizVHjy78EE66m/4q+8vle24ssYRctGzXC629mYytABq287NWjNtUau+HdL4bQ
         ak+sXLlm5tCdKdp6QdjlXwLesiE9ZA0Hl2DatlzpFUYeaTy3Ujf3NgMJj3p9w9jqxhcK
         rejg==
X-Gm-Message-State: AJIora8LB5CBjjEPkDx38UEDEaRbqb9/4LJaFldVYG3b8uEDYO1ATwcF
        aCm7xve9aOs4QXYGIK6jYKB1s8oYbRmfT//iVyM=
X-Google-Smtp-Source: AGRyM1vA/j9/xbaFjVxVk6wrjxGkchEwp+LB5GYD9cu0PMQ/amUsXGrL01Y1JRoDcZI3uCm96mqFf/rP1khORqwFeeI=
X-Received: by 2002:a17:902:e748:b0:16a:726e:7c9e with SMTP id
 p8-20020a170902e74800b0016a726e7c9emr7214294plf.12.1656214372290; Sat, 25 Jun
 2022 20:32:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220624103809.4167753-1-windhl@126.com> <CA+H2tpEZ6GNYjZ669w4yxK7EPm8bk_uRdq+6-5Z95FpPy4S8nA@mail.gmail.com>
 <7cb414e.2aa5.1819b7e699f.Coremail.windhl@126.com>
In-Reply-To: <7cb414e.2aa5.1819b7e699f.Coremail.windhl@126.com>
From:   Orson Zhai <orsonzhai@gmail.com>
Date:   Sun, 26 Jun 2022 11:32:40 +0800
Message-ID: <CA+H2tpHyXD1pr7G9nxU9tJPgtfE5MioFE+Dy+bUwz+z=ap-MXg@mail.gmail.com>
Subject: Re: Re: [PATCH] clk/sprd: Hold reference returned by of_get_parent()
To:     Liang He <windhl@126.com>
Cc:     mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Lyra Zhang <zhang.lyra@gmail.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Liang,

On Sat, Jun 25, 2022 at 11:34 PM Liang He <windhl@126.com> wrote:
>
>
> At 2022-06-25 16:36:04, "Orson Zhai" <orsonzhai@gmail.com> wrote:
> >Hi Liang,
> >
> >On Fri, Jun 24, 2022 at 6:39 PM Liang He <windhl@126.com> wrote:
> >>
> >> We should hold the reference returned by of_get_parent() and use it
> >> to call of_node_out() for refcount balance.
> >>
> >> Fixes: f95e8c7923d1 ("clk: sprd: support to get regmap from parent node")
> >> Signed-off-by: Liang He <windhl@126.com>
> >> ---
> >>  these bugs are found in 5.19rc2
> >>  these bugs are confirmed not fixed by lore.kernel.org
> >>  these bugs are compiled tested in 5.19rc2 with at91_dt_defconfig
> >>
> >>  drivers/clk/sprd/common.c | 16 +++++++++++-----
> >>  1 file changed, 11 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/clk/sprd/common.c b/drivers/clk/sprd/common.c
> >> index d620bbbcdfc8..08c1d7a9ec8b 100644
> >> --- a/drivers/clk/sprd/common.c
> >> +++ b/drivers/clk/sprd/common.c
> >> @@ -41,35 +41,41 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
> >>  {
> >>         void __iomem *base;
> >>         struct device *dev = &pdev->dev;
> >> -       struct device_node *node = dev->of_node;
> >> +       struct device_node *node = dev->of_node, *np;
> >>         struct regmap *regmap;
> >>
> >> +       np = of_get_parent(dev->of_node);
> >>         if (of_find_property(node, "sprd,syscon", NULL)) {
> >>                 regmap = syscon_regmap_lookup_by_phandle(node, "sprd,syscon");
> >
> >Why not to call of_node_put() in this function?
> >He returns an error and it is his responsibility to clean up
> >everything he used, right?
> >
> >-Orson
> >
> Hi, Orson,
>
> I only know we should use the pair of functions (of_get_parent(), of_node_put)
> to keep refcount balance.
>
> However, as I do not really know the semantic of other functions, so I cannot
> give other kinds of patch.

Sorry, I didn't catch your point before.
You're right on this unbalance. But it has no direct relation to the
function here.
I think it is better to minimize the effective range of of_get_parent()

Could you refer to Pantelis's answer to the last question at [1].

Thanks.
-Orson

[1] https://www.spinics.net/lists/devicetree/msg122555.html

>
> By the way, if we chose to put of_node_put() in this function, I think it also need
> to put of_node_put() into 'device_node_to_regmap' as it also return error code in
> following path.
>
> Anyway, thanks very much for your reply and review on my patch code.
>
> Liang
>
>
> >>                 if (IS_ERR(regmap)) {
> >>                         pr_err("%s: failed to get syscon regmap\n", __func__);
> >> +                       of_node_put(np);
> >>                         return PTR_ERR(regmap);
> >>                 }
> >> -       } else if (of_device_is_compatible(of_get_parent(dev->of_node),
> >> -                          "syscon")) {
> >> -               regmap = device_node_to_regmap(of_get_parent(dev->of_node));
> >> +       } else if (of_device_is_compatible(np, "syscon")) {
> >> +               regmap = device_node_to_regmap(np);
> >>                 if (IS_ERR(regmap)) {
> >> +                       of_node_put(np);
> >>                         dev_err(dev, "failed to get regmap from its parent.\n");
> >>                         return PTR_ERR(regmap);
> >>                 }
> >>         } else {
> >>                 base = devm_platform_ioremap_resource(pdev, 0);
> >> -               if (IS_ERR(base))
> >> +               if (IS_ERR(base)) {
> >> +                       of_node_put(np);
> >>                         return PTR_ERR(base);
> >> +               }
> >>
> >>                 regmap = devm_regmap_init_mmio(&pdev->dev, base,
> >>                                                &sprdclk_regmap_config);
> >>                 if (IS_ERR(regmap)) {
> >> +                       of_node_put(np);
> >>                         pr_err("failed to init regmap\n");
> >>                         return PTR_ERR(regmap);
> >>                 }
> >>         }
> >>
> >> +       of_node_put(np);
> >>         sprd_clk_set_regmap(desc, regmap);
> >>
> >>         return 0;
> >> --
> >> 2.25.1
> >>

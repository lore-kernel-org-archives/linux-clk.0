Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C65C43334
	for <linux-clk@archiver.kernel.org>; Fri,  1 Jul 2022 05:08:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233638AbiGAFIS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Jul 2022 01:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbiGAFIN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Jul 2022 01:08:13 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C9D8A453
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 22:08:12 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id w24so1520514pjg.5
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 22:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=q1p6z2VqJ8eJBl5X8+UBLAXrHgH+hVHSwOCiH4a1AAw=;
        b=cF08soJL8p35U2xHJ2VSmQI4h/sQFFEcZ/MpnEuC5/ttqn7sXe6dfCQXz60fTgr6rE
         ADnqLIMzlgJ1b81w8Ohy8vdskXI70DRc+IbW9iaRkLffX3E/ljYyYuDoZ4lwHGonodqb
         WCTK5eEAiq/OVdRhzi0hWhRhDpfUY2EvRBkPgoKtShN88NWr5V4230WIw2CR3Va7TB9e
         s1hGKsFg3bKjg2XZlLdLyGOsdNtPiQ9+yhTg+7RKIlO2V8Pzw60+YnEd80xiJicxaIyI
         0/CNAyH4F6EBs5YsiRmWz7yZK9P3QVOL6joiXuJsT/Z6apOuiri0Oj1kMwgqd0yGdA6+
         2cCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q1p6z2VqJ8eJBl5X8+UBLAXrHgH+hVHSwOCiH4a1AAw=;
        b=kTAruEKrosvfDD6DttT+D3xfQEQf9NKZf1fx/iVV4wkAirHM/YKcfwUlyJGpKbGky6
         Rm2wX2h730vB7DqFEcWRZAbZNAIN6/BjRNzVp2oNDNAycXIwnS4gGi1vCqk+EK9avtR9
         NZT8ApOoi48WjQmibGZfF8/DofAsfaf+hDuOMWo1tz/b8XTO8ukoKTPo/TeVVTPQ26Zv
         qTaiM2mydW0Ix66gehb5EL/YzIIFQEUR+VPwrB08OFA5XV430KESR/QM6eJCF6V9LWRn
         MEw521lk3vPK9jsfppllA0hWufgRnmKfi/iXI0Fk32KEN/T5MOZhcBty98wIj839i/Uv
         5M1w==
X-Gm-Message-State: AJIora8PsBK2qtDbLGgoaCsfemDhNwBilqL10A6ifxAcaQyeF1Mjzttl
        tzmkhzv3DG4Qneer9cWj9gnItz+DpZLkHwoBT9V3KLiD
X-Google-Smtp-Source: AGRyM1uNXp831x7kfnXlxv492Jtam8MtM6xFCIObbWz9w79T7Rcyto0S0M9A+D6YUk86QFUC/iS9CoXp7Cm8KpaKGA4=
X-Received: by 2002:a17:90a:ac04:b0:1ec:81d2:732 with SMTP id
 o4-20020a17090aac0400b001ec81d20732mr14611397pjq.45.1656652091633; Thu, 30
 Jun 2022 22:08:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220701024606.223438-1-windhl@126.com> <CA+H2tpH62BC3skFiL4kHk=cURniwZZGuPWXs0QqzU2kRSCGiaw@mail.gmail.com>
In-Reply-To: <CA+H2tpH62BC3skFiL4kHk=cURniwZZGuPWXs0QqzU2kRSCGiaw@mail.gmail.com>
From:   Orson Zhai <orsonzhai@gmail.com>
Date:   Fri, 1 Jul 2022 13:07:59 +0800
Message-ID: <CA+H2tpF6ZD5gBPanMe8ewuFWCLm5xnxR0RSdMLs5gTV=GmpgwA@mail.gmail.com>
Subject: Re: [PATCH v4] clk: sprd: Hold reference returned by of_get_parent()
To:     Liang He <windhl@126.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Lyra Zhang <zhang.lyra@gmail.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jul 1, 2022 at 12:57 PM Orson Zhai <orsonzhai@gmail.com> wrote:
>
> Hi Liang,
>
> On Fri, Jul 1, 2022 at 10:46 AM Liang He <windhl@126.com> wrote:
> >
> > We should hold the reference returned by of_get_parent() and use it
> > to call of_node_put() for refcount balance.
> >
> > Fixes: f95e8c7923d1 ("clk: sprd: support to get regmap from parent node")
> > Signed-off-by: Liang He <windhl@126.com>
>
> You are using the wrong patch number here.
> Please re-send this patch with subject that begins with [PATCH V4] ...

Sorry, the patch number is correct but it's collapsed with patch v2 in
my mailbox.
Maybe you are using the same message id for all these patches?
Anyway, the code change looks good to me.

Reviewed-by: Orson Zhai <orsonzhai@gmail.com>

Thanks.
-Orson

> and add Reviewed-by: Orson Zhai <orsonzhai@gmail.com>
>
> Thanks.
>
> -Orson
>
> > ---
> >  changelog:
> >
> >  v4: fix another bug in the same place, missing in v3
> >  v3: (1) keep original 'if-else if-else' coding style adviesd by Orson
> >      (2) fix typo in commit-log: of_node_out --> of_node_put
> >  v2: minimize the effective range of of_get_parent() advised by Orson
> >  v1: hold reference returned by of_get_parent()
> >
> >
> >  drivers/clk/sprd/common.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/clk/sprd/common.c b/drivers/clk/sprd/common.c
> > index d620bbbcdfc8..1b9c2aa0836f 100644
> > --- a/drivers/clk/sprd/common.c
> > +++ b/drivers/clk/sprd/common.c
> > @@ -41,7 +41,7 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
> >  {
> >         void __iomem *base;
> >         struct device *dev = &pdev->dev;
> > -       struct device_node *node = dev->of_node;
> > +       struct device_node *node = dev->of_node, *np;
> >         struct regmap *regmap;
> >
> >         if (of_find_property(node, "sprd,syscon", NULL)) {
> > @@ -50,9 +50,10 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
> >                         pr_err("%s: failed to get syscon regmap\n", __func__);
> >                         return PTR_ERR(regmap);
> >                 }
> > -       } else if (of_device_is_compatible(of_get_parent(dev->of_node),
> > -                          "syscon")) {
> > -               regmap = device_node_to_regmap(of_get_parent(dev->of_node));
> > +       } else if (of_device_is_compatible(np = of_get_parent(node), "syscon")
> > +               || (of_node_put(np), 0)) {
> > +               regmap = device_node_to_regmap(np = of_get_parent(node));
> > +               of_node_put(np);
> >                 if (IS_ERR(regmap)) {
> >                         dev_err(dev, "failed to get regmap from its parent.\n");
> >                         return PTR_ERR(regmap);
> > --
> > 2.25.1
> >

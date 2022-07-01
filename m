Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D16C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  1 Jul 2022 06:40:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbiGAGkb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Jul 2022 02:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232223AbiGAGka (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Jul 2022 02:40:30 -0400
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CF974D17C
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 23:40:30 -0700 (PDT)
Received: by mail-vs1-xe2d.google.com with SMTP id o13so1448120vsn.4
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 23:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M/fNktjGxwsRmJPS/CJcgvw2ulHC8WUiybpwIFZgLdo=;
        b=XgHfyPGGWMA57l9gIpkJ6rML+1kA08eurAwW3oG5FZWFSoilO+F8m65L5egXcyh1+R
         X+X/cTq31jizVdZi0sa5r7h26Xuw6oMg4vqSPKSWlS0bEd/yEQpR5Hxh29yxJ+1k5TH7
         c6pMHyJ4QJEtYyRxP/Eo7MX+TSnx2mYOV0wsW37aZqOx+6HpA2hLQM7MNJrfMpB/wQMQ
         fiEycPwrJp+9kM+g10w6QqN9Y3nVYGpzdn8CZ1cSV6EJnrwXOcvkTwYGeGMHmw0LtWB9
         ql0EAuszoFxxIKfQDcqcNp+pY8kKmks0a2B8hfCawdAwI5P3pLnrfd2Gg8A3OejUJfJS
         XdfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M/fNktjGxwsRmJPS/CJcgvw2ulHC8WUiybpwIFZgLdo=;
        b=SeHnW2kHiepNsLgFmcbyW4Td+rrqna/YWWN88+0+FYl/MgEYlXF2FC1IUBgHEb8CF7
         YTi5SWbFWQJDDZCn6cU1qqDwAnhS2F43Peb4mym79Qc9t14vC5dgpmAuPde6SGmlHZ/9
         o3ahdnzsUbRS0F1/WPm40qpXjkD2m3/cIy3pkB8D/Dtztb4LAM/tB9bZAK9bCLjRZv8G
         HMBNxWyMeqWwjnxUIwN4ZZkhgH1RKKoA+4CxEmaQdJtkQSX8Ne976P/lhCmh7SSZ7U+H
         04Xa0d0Mwg8b6VCjCiQe5jA9XNnkXW5m5fA8mwv+nwy6gTPsqNAkho6BwjJV23vXD524
         uXkg==
X-Gm-Message-State: AJIora+e8FnoV5Zd/VGtGrLjso6rHiNWQmoUK4nzTS/+5lDVD7hOvsPK
        6v0UVibVdq2JIRwjT0Gl1I7ktcBHIFVcBF5AOyU=
X-Google-Smtp-Source: AGRyM1u+ImQ20RcbFv6x1oLTjX/JLfn0LSaHy4D9t+8ywtgEpoBMdVtGylsm5yXKPrmMkSaTDFJhNGxmB4O0++EhHBg=
X-Received: by 2002:a05:6102:38c7:b0:356:4e2f:ae5b with SMTP id
 k7-20020a05610238c700b003564e2fae5bmr10198969vst.71.1656657629279; Thu, 30
 Jun 2022 23:40:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220701024606.223438-1-windhl@126.com>
In-Reply-To: <20220701024606.223438-1-windhl@126.com>
From:   Chunyan Zhang <zhang.lyra@gmail.com>
Date:   Fri, 1 Jul 2022 14:39:53 +0800
Message-ID: <CAAfSe-vAuFK1qfCA9H_k3MDTa-7rP4FsfkMPMkR1+L60CU8iMg@mail.gmail.com>
Subject: Re: [PATCH v4] clk: sprd: Hold reference returned by of_get_parent()
To:     Liang He <windhl@126.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 1 Jul 2022 at 10:46, Liang He <windhl@126.com> wrote:
>
> We should hold the reference returned by of_get_parent() and use it
> to call of_node_put() for refcount balance.
>
> Fixes: f95e8c7923d1 ("clk: sprd: support to get regmap from parent node")
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  changelog:
>
>  v4: fix another bug in the same place, missing in v3
>  v3: (1) keep original 'if-else if-else' coding style adviesd by Orson
>      (2) fix typo in commit-log: of_node_out --> of_node_put
>  v2: minimize the effective range of of_get_parent() advised by Orson
>  v1: hold reference returned by of_get_parent()
>
>
>  drivers/clk/sprd/common.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/sprd/common.c b/drivers/clk/sprd/common.c
> index d620bbbcdfc8..1b9c2aa0836f 100644
> --- a/drivers/clk/sprd/common.c
> +++ b/drivers/clk/sprd/common.c
> @@ -41,7 +41,7 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
>  {
>         void __iomem *base;
>         struct device *dev = &pdev->dev;
> -       struct device_node *node = dev->of_node;
> +       struct device_node *node = dev->of_node, *np;
>         struct regmap *regmap;
>
>         if (of_find_property(node, "sprd,syscon", NULL)) {
> @@ -50,9 +50,10 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
>                         pr_err("%s: failed to get syscon regmap\n", __func__);
>                         return PTR_ERR(regmap);
>                 }
> -       } else if (of_device_is_compatible(of_get_parent(dev->of_node),
> -                          "syscon")) {
> -               regmap = device_node_to_regmap(of_get_parent(dev->of_node));
> +       } else if (of_device_is_compatible(np = of_get_parent(node), "syscon")
> +               || (of_node_put(np), 0)) {
> +               regmap = device_node_to_regmap(np = of_get_parent(node));

of_get_parent() one more time would cause another unbalance, why not
use 'np' directly here?

I would also suggest to cc LKML (linux-kernel@vger.kernel.org)

Thanks,
Chunyan

> +               of_node_put(np);
>                 if (IS_ERR(regmap)) {
>                         dev_err(dev, "failed to get regmap from its parent.\n");
>                         return PTR_ERR(regmap);
> --
> 2.25.1
>
